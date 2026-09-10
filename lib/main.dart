import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override@重写
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override@重写
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> numbers = const [
    -8, -1, 5, 1, -3, -9, -11, -13, -16, 16,
    -18, 19, 0, 3, -7, 7, 9, 11, 12, -12,
    -15, -17, -21, -26, -27, -39, -14, -10, -24, -29,
    18, -31, 27, -6, -33, -22, -36, 10, 22, 4,
    -6, -34, -5, 24, 8, -2,
  ];

  final TextEditingController controller = TextEditingController(text: '10');
  Map<int, List<int>> allResults = const {};

  @override@重写
  void initState() {
    super.initState();
    doCalculate();
    controller.addListener(doCalculate);
  }

  void doCalculate() {
    final bases = <int>[];
    for (final p in controller.text.trim().split(RegExp(r'[,，\s]+'))) {
      final n = int.tryParse(p.trim());
      if (n != null) bases.add(n);
    }
    final Map<int, List<int>> r = {};
    for (final b in bases) {
      final out = <int>[];
      for (final n in numbers) {
        final v = b + n;
        if (v >= 0 && v <= 49) out.add(v);
      }
      r[b] = out;
    }
    setState(() => allResults = r);
  }

  String get txt => allResults.values.map((l) => l.join(', ')).join('\n\n');

  @override@重写
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基数+n 计算器')),
      body: Padding(主体：内边距（
        padding: const EdgeInsets.all(16),
        child: Column(子节点：列(子节点：列(子节点：列(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('基数（逗号分隔）：'),
            TextField(
              controller: controller,控制器：控制器，
              decoration: const InputDecoration(border: OutlineInputBorder()),装饰：常量InputDecoration(边框： OutlineInputBorder())，
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon( ElevatedButton.icon（ ElevatedButton.icon（ ElevatedButton.icon（
              onPressed: () => Clipboard.setData(ClipboardData(text: txt)), txt)), txt)), txt)),
              icon: const图标：const Icon(Icons.copy),图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，图标：常量Icon(Icons.copy)，
              label: const Text('一键复制'),标签：constText('一键复制'),
            ),
            const SizedBox(height: 12),
            Expanded(展开（展开（展开（展开（展开（展开（展开（展开（
              child: SingleChildScrollView(子组件：SingleChildScrollView(子组件：SingleChildScrollView(子组件：SingleChildScrollView(子组件：SingleChildScrollView(子组件：SingleChildScrollView(子组件：SingleChildScrollView(子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView(子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView(子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView（子组件：SingleChildScrollView(子组件：SingleChildScrollView(
                child: SelectableText(子组件：SelectableText(子组件：SelectableText(子组件：SelectableText(子组件：SelectableText(子组件：SelectableText(子组件：SelectableText(子组件：SelectableText(子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：SelectableText（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（子组件：可选择文本（
                  txt,
                  style: const TextStyle(fontFamily: 'monospace'),样式：常量文本样式(字体族：'等宽'),样式：常量文本样式（字体族：'monospace'），样式：常量文本样式（字体族：'等宽'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
                                      }
