import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 保留所有原始值（含重复），不做任何去重
  final List<int> numbers = [
    -8, -1, 5, 1, -3, -9, -11, -13, -16, 16,
    -18, 19, 0, 3, -7, 7, 9, 11, 12, -12,
    -15, -17, -21, -26, -27, -39, -14, -10, -24, -29,
    18, -31, 27, -6, -33, -22, -36, 10, 22, 4,
    -6, -34, -5, 24, 8, -2,
  ];

  final TextEditingController controller = TextEditingController(text: '10');

  // 每个基数的结果（允许重复值同时存在）
  Map<int, List<int>> allResults = {};

  @override
  void initState() {
    super.initState();
    calculate();
    controller.addListener(calculate);
  }

  void calculate() {
    final text = controller.text.trim();
    if (text.isEmpty) {
      setState(() => allResults = {});
      return;
    }

    // 解析多个基数（允许重复基数，保留输入顺序）
    final bases = <int>[];
    for (final raw in text.split(RegExp(r'[,\s\n]+'))) {
      final s = raw.trim();
      if (s.isEmpty) continue;
      final n = int.tryParse(s);
      if (n != null) bases.add(n);
    }

    final Map<int, List<int>> newResults = {};
    for (final base in bases) {
      // 关键：直接遍历，不加去重，算到啥留啥
      final List<int> out = [];
      for (final n in numbers) {
        final v = base + n;
        if (v < 0 || v > 49) continue;
        out.add(v); // ← 不判断重复，直接加入
      }
      newResults[base] = out;
    }

    setState(() {
      allResults = newResults;
    });
  }

  String get allResultText {
    final buffer = StringBuffer();
    for (final entry in allResults.entries) {
      buffer.write('基数${entry.key}：${entry.value.join(', ')}\n');
    }
    return buffer.toString().trim();
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
            const Text('基数（多个用逗号分隔）：', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '例如：10, 20, 30',
                isDense: true,
              ),
            ),
            const SizedBox(height: 16),
            Text('共 ${allResults.length} 个基数',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: allResults.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('基数 ${entry.key}（${entry.value.length} 个）：',
                            style: const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: entry.value
                              .map((e) => Chip(label: Text('$e'), backgroundColor: Colors.blue.shade50))
                              .toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 8),
            const Text('复制全部结果：', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: SelectableText(
                  allResultText,
                  style: const TextStyle(fontSize: 14, fontFamily: 'monospace'),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
