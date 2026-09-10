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
  final List<int> numbers = [
    -8, -1, 5, 1, -3, -9, -11, -13, -16, 16,
    -18, 19, 0, 3, -7, 7, 9, 11, 12, -12,
    -15, -17, -21, -26, -27, -39, -14, -10, -24, -29,
    18, -31, 27, -6, -33, -22, -36, 10, 22, 4,
    -6, -34, -5, 24, 8, -2,
  ];

  final TextEditingController controller = TextEditingController(text: '10');
  List<int> result = [];

  @override
  void initState() {
    super.initState();
    calculate();
    controller.addListener(calculate);
  }

  void calculate() {
    final base = int.tryParse(controller.text) ?? 0;
    final Set<int> seen = {};
    final List<int> out = [];
    for (final n in numbers) {
      final v = base + n;
      if (v < 0 || v > 49) continue;
      if (seen.add(v)) out.add(v);
    }
    setState(() {
      result = out;
    });
  }

  String get resultText => result.join(', ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基数+n 计算器')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('基数：', style: TextStyle(fontSize: 18)),
                const SizedBox(width: 12),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('结果（${result.length} 个数）：',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: result
                  .map((e) => Chip(label: Text('$e')))
                  .toList(),
            ),
            const SizedBox(height: 20),
            const Text('复制结果：', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    resultText,
                    style: const TextStyle(fontSize: 15, fontFamily: 'monospace'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
