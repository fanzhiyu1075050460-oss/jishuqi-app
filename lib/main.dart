import导入 'package:flutter/material.dart';
import 'package:flutter/services.dart';导入 'package:flutter/services.dart';

void main() => runApp(const MyApp());void main() => runApp(常量MyApp());

class MyApp extends StatelessWidget {类MyApp继承StatelessWidget {
  const MyApp({super.key});常量MyApp({super.key});
  @override@重写
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: const HomePage());
  }
}

class HomePage extends StatefulWidget {类HomePage继承StatefulWidget {
  const HomePage({super.key});常量HomePage({super.key});
  @override@重写
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {类_HomePageState扩展State<HomePage> {状态<HomePage> {类_HomePageState扩展State<HomePage> {
  final List<int> numbers = [-8, -1, 5, 1, -3, -9, -11, -13, -16, 16, -18, 19, 0, 3, -7, 7, 9, 11, 12, -12, -15, -17, -21, -26, -27, -39, -14, -10, -24, -29, 18, -31, 27, -6, -33, -22, -36, 10, 22, 4, -6, -34, -5, 24, 8, -2];最终列表<int> numbers = [-8, -1, 5, 1, -3, -9, -11, -13, -16, 16, -18, 19, 0, 3, -7, 7, 9, 11, 12, -12, -15, -17, -21, -26, -27, -39, -14, -10, -24, -29, 18, -31, 27, -6, -33, -22, -36, 10, 22, 4, -6, -34, -5, 24, 8, -2];

  final TextEditingController controller = TextEditingController(text: '10');
  Map<int, List<int>> allResults = {};
  bool copied = false;

  @override@重写
  void initState() {
    super.initState();
    doCalculate();
    controller.addListener(doCalculate);
  }

  void doCalculate() {
    final bases = <int>[];最终bases = <int>[];
    for (final p in controller.text.trim().split(RegExp(r'[,，\s]+'))) {
      final n = int.tryParse(p.trim());最终n = int.tryParse(p.trim());
      if (n != null) bases.add(n);
    }
    final Map<int, List<int>> r = {};最终Map<int, List<int>> r = {};
    for (final b in bases) {
      final out = <int>[];最终out = <int>[];
      for (final n in numbers) {
        final v = b + n;最终v = b + n;
        if (v >= 0 && v <= 49) out.add(v);
      }
      r[b] = out;r[b] = 输出;
    }
    setState(() => allResults = r);设置状态(() => allResults = r);
  }

  String get txt => allResults.values.map((l) => l.join(', ')).join('\n\n');字符串获取文本 => allResults.values.map((l) => l.join(', ')).join('  ');字符串获取文本 => allResults.values.map((l) => l.join(', ')).join('  ');字符串获取文本 => allResults.values.map((l) => l.join(', ')).join('  ');

  @override@重写
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基数+n 计算器')),
      body: Padding(主体：内边距（body：内边距（主体：内边距（
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('基数（逗号分隔）：'),
          TextField(controller: controller, decoration: const InputDecoration(border: OutlineInputBorder())),
          const SizedBox(height: 12),
          ElevatedButton.icon( ElevatedButton.icon（ ElevatedButton.icon（ ElevatedButton.icon（
            onPressed: () => Clipboard.setData(ClipboardData(text: txt)), txt)), txt)), txt)),
            icon: const Icon(Icons.copy),图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，
            label: const Text('一键复制'),标签：constText('一键复制'),
          ),
          const SizedBox(height: 12),
          Expanded(child: SingleChildScrollView(child: SelectableText(txt, style: const TextStyle(fontFamily: 'monospace')))),扩展（子组件：SingleChildScrollView（子组件：SelectableText(txt, style：常量TextStyle(字体族：'等宽字体')))),扩展（子组件：SingleChildScrollView（子组件：SelectableText(txt, style：常量TextStyle(字体族：'等宽字体'
        ]),
      ),
    );
  }
          }
