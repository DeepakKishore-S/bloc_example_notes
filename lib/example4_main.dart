import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Example4Page(),
    );
  }
}

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;
  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(
      const Duration(seconds: 1),
      (v) => from - v,
    ).takeWhile((value) => value >= 0).listen((value) {
      this.value = value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    sub.cancel();
    super.dispose();
  }
}

class Example4Page extends HookWidget {
  static const String routeName = "example4";
  const Example4Page({super.key});

  @override
  Widget build(BuildContext context) {
    final countDown = useMemoized(() => CountDown(from: 20));
    final notifier = useListenable(countDown);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body:  Center(
        child: Text(notifier.value.toString()),
      ),
    );
  }
}
