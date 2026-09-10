import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: CalculatorPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final numbers = [
    -8, -1, 5, 1, -3, -9, -11, -13, -16, 16,
    -18, 19, 0, 3, -7, 7, 9, 11, 12, -12,
    -15, -17, -21, -26, -27, -39, -14, -10, -24, -29,
    18, -31, 27, -6, -33, -22, -36, 10, 22, 4,
    -6, -34, -5, 24, 8, -2
  ];

  final controller = TextEditingController(text: '10');
  Map<int, List<int>> results = {};

  @override
  void initState() {
    super.initState();
    calculate();
    controller.addListener(calculate);
  }

  void calculate() {
    final bases = <int>[];
    for (var p in controller.text.split(RegExp(r'[,，\s\n]+'))) {
      final n = int.tryParse(p.trim());
      if (n != null) bases.add(n);
    }

    final Map<int, List<int>> r = {};
    for (var b in bases) {
      final out = <int>[];
      for (var n in numbers) {
        final v = b + n;
        if (v >= 0 && v <= 49) out.add(v);
      }
      r[b] = out;
    }

    setState(() => results = r);
  }

  // ===== 新增：统计 =====
  String get statisticsText {
    // 1. 统计每个数字出现次数（合并所有基数）
    final Map<int, int> count = {};
    for (final list in results.values) {
      for (final num in list) {
        count[num] = (count[num] ?? 0) + 1;
      }
    }
    if (count.isEmpty) return '';

    // 2. 按次数分组
    final Map<int, List<int>> groups = {};
    for (final entry in count.entries) {
      final times = entry.value;
      groups.putIfAbsent(times, () => []).add(entry.key);
    }

    // 3. 按次数从多到少排序输出
    final sortedTimes = groups.keys.toList()..sort((a, b) => b.compareTo(a));
    final buffer = StringBuffer();
    for (final times in sortedTimes) {
      final nums = groups[times]!..sort();
      // 格式：01, 02, ...（两位补齐）
      final str = nums.map((n) => n.toString().padLeft(2, '0')).join(',');
      buffer.write('〖${times}次〗:$str,（共${nums.length}个）\n');
    }
    return buffer.toString().trim();
  }
  // ===== 统计结束 =====

  String get outputText {
    return results.values.map((list) => list.join(', ')).join('\n\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基数+n 计算器')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('输入基数（逗号分隔）：', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '例如：10, 20, 30',
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: outputText.isEmpty ? null : () {
                    Clipboard.setData(ClipboardData(text: outputText));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('结果已复制'), duration: Duration(seconds: 1)),
                    );
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text('复制结果'),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: statisticsText.isEmpty ? null : () {
                    Clipboard.setData(ClipboardData(text: statisticsText));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('统计已复制'), duration: Duration(seconds: 1)),
                    );
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text('复制统计'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text('统计结果：', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Container(
              height: 140,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: SelectableText(
                  statisticsText.isEmpty ? '等待输入...' : statisticsText,
                  style: const TextStyle(fontSize: 14, fontFamily: 'monospace'),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text('计算结果：', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Expanded(
              chil
