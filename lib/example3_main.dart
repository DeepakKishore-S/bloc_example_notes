import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Example3Page(),
    );
  }
}

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      ).where((e) => e != null).cast();
}

const String url = "https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=644&q=80";

class Example3Page extends HookWidget {
  static const String routeName = "example3";
  const Example3Page({super.key});

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(() => NetworkAssetBundle(Uri.parse(url))
        .load(url)
        .then((value) => value.buffer.asUint8List())
        .then((value) => Image.memory(value)));

    final snapshot = useFuture(future);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Column(
        children: [
          snapshot.data
        ].compactMap().toList(),
      ),
    );
  }
}
