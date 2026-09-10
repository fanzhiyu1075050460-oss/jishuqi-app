import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '基数+n 计算器',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> numbers = [
    -8, -5, -2, 1, 4, 7, 10, 13, 16, 19,
    22, 25, 28, 31, 34, 37, 40, 43, 46, 49
  ];

  final TextEditingController controller = TextEditingController();
  Map<int, List<int>> allResults = {};
  bool copied = false;

  @override
  void initState() {
    super.initState();
    controller.text = '10';
    doCalculate();
  }

  void doCalculate() {
    final text = controller.text.trim();
    if (text.isEmpty) {
      setState(() {
        allResults = {};
        copied = false;
      });
      return;
    }

    final List<int> bases = [];
    for (final part in text.split(RegExp(r'[,，\s]+'))) {
      final s = part.trim();
      if (s.isEmpty) continue;
      final n = int.tryParse(s);
      if (n != null) bases.add(n);
    }

    final Map<int, List<int>> results = {};
    for (final base in bases) {
      final List<int> out = [];
      for (int i = 0; i < numbers.length; i++) {
        final v = base + numbers[i];
        if (v >= 0 && v <= 49) {
          out.add(v);
        }
      }
      results[base] = out;
    }

    setState(() {
      allResults = results;
      copied = false;
    });
  }

  Future<void> copyAll() async {
    if (allResultText.isEmpty) return;
    await Clipboard.setData(ClipboardData(text: allResultText));
    setState(() => copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => copied = false);
    });
  }

  String get allResultText {
    return allResults.values.map((list) => list.join(', ')).join('\n\n');
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
              onChanged: (_) => doCalculate(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '例如：10, 20, 30',
                isDense: true,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text('共 ${allResults.length} 个基数',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: allResultText.isEmpty ? null : copyAll,
                  icon: Icon(copied ? Icons.check : Icons.copy, size: 18),
                  label: Text(copied ? '已复制' : '一键复制'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: copied ? Colors.green : null,
                  ),
                ),
              ],
            ),
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
            const Text('结果文本：', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(col
