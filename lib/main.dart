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
            ElevatedButton.icon(
              onPressed: outputText.isEmpty ? null : () {
                Clipboard.setData(ClipboardData(text: outputText));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('已复制'), duration: Duration(seconds: 1)),
                );
              },
              icon: const Icon(Icons.copy),
              label: const Text('一键复制'),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: SelectableText(
                  outputText,
                  style: const TextStyle(fontSize: 14, fontFamily: 'monospace'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
