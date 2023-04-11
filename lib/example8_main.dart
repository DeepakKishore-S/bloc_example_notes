import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'main.dart';

class Example8Page extends HookWidget {
  static const String routeName = "example8";
  const Example8Page({super.key});

  @override
  Widget build(BuildContext context) {
    final state = useAppLifecycleState();
    print(state);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Opacity(
          opacity: state == AppLifecycleState.resumed ? 1.0 : 0.0,
          child: Image.network(
            sampleImageUrl,
            height: 300,
            fit: BoxFit.cover,
          )),
    );
  }
}
