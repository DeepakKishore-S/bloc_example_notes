import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Example2Page(),
    );
  }
}

class Example2Page extends HookWidget {
  static const String routeName = "example2";
  const Example2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState("");
    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    },[controller]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(controller: controller,),
            Text("You Typed ${text.value}")
          ],
        ),
      ),
    );
  }
}
