import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '基数+n 计算器',
      theme: ThemeData(primarySwamp: Colors.blue),主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(primarySwamp: Colors.blue)，主题：ThemeData(主色：Colors.blue)，主题：ThemeData(主色：Colors.blue)，主题：ThemeData(主色：Colors.blue)，主题：ThemeData(主色：Colors.blue)，主题：ThemeData(主色：Colors.blue)，主题：ThemeData(主色：Colors.blue)，主题：ThemeData(主色：Colors.blue)，主题：ThemeData(主色：Colors.blue)，主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），主题：ThemeData（主色：Colors.blue），
      home: const CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final List<int> _numbers = const [
    -8, -1, 5, 1, -3, -9, -11, -13, -16, 16,
    -18, 19, 0, 3, -7, 7, 9, 11, 12, -12,
    -15, -17, -21, -26, -27, -39, -14, -10, -24, -29,
    18, -31, 27, -6, -33, -22, -36, 10, 22, 4,
    -6, -34, -5, 24, 8, -2,
  ];

  final TextEditingController _baseController = TextEditingController(text: '10');
  List<int> _result = [];

  void _calculate() {
    final int base = int.tryParse(_baseController.text) ?? 0;
    final Set<int> seen = {};最终 Set<int> seen = {};final Set<int> seen = {}；最终 Set<int> seen = {}；
    final List<int> out = [];最终 List<int> out = [];final List<int> out = []；最终 List<int> out = []；
    for (final n in _numbers) {
      final v = base + n;
      if (v < 0 || v > 49) continue;
      if (seen.add(v)) out.add(v);
    }
    setState(() => _result = out);
  }

  @override
  void initState() {
    super.initState();
    _calculate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基数+n 计算器')),
      body: Padding(主体：内边距（
        padding: const EdgeInsets.all(16),内边距：const EdgeInsets.all(16),
        child: Column(子组件：Column（
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [子组件列表：[
            Row(行(行(行(行(行(行(
              children: [子组件列表：[
                const Text('基数：', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                SizedBox(
                  width: 80,
                  child: TextField(子组件：TextField(子组件：TextField(子组件：TextField(子组件：TextField(子组件：TextField(子组件：TextField(子组件：TextField(子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件......子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：......组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextF组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：Text子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：Text子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：Text子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：Text子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（子组件：TextField（字段（子组件：文本字段（子组件：文本字段（子组件：文本字段（
                    controller: _baseController,控制器：_baseController,
                    keyboardType: TextInputType.number,键盘类型：TextInputType.number,
                    decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true),装饰：const InputDecoration(边框： OutlineInputBorder(), isDense： true),
                    onChanged: (_) => _calculate(),文本变化监听：(_) => _calculate(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('结果（${_result.length} 个数）：', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: _result.map((e) => Chip(label: Text('$e'), backgroundColor: Colors.blue.shade50)).toList(),
            ),
            const SizedBox(height: 12),
            Text(_result.isEmpty ? '' : '结果数组：\n${_result}', style: const TextStyle(fontFamily: 'monospace', fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
