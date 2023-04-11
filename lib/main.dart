import 'package:bloc_example_notes/example4_main.dart';
import 'package:flutter/material.dart';

import 'example1_main.dart';
import 'example2_main.dart';
import 'example3_main.dart';
import 'example5_main.dart';
import 'example6_main.dart';
import 'example7_main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const Example7Page(),
      routes: {
        Example7Page.routeName: (context) => const Example7Page(),
        Example6Page.routeName: (context) => const Example6Page(),
        Example5Page.routeName: (context) => const Example5Page(),
        Example4Page.routeName: (context) => const Example4Page(),
        Example3Page.routeName: (context) => const Example3Page(),
        Example2Page.routeName: (context) => const Example2Page(),
        Example1Page.routeName: (context) => const Example1Page(),
      },
    );
  }
}

const String sampleImageUrl =
    "https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=644&q=80";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: const Text("Example 1"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(Example1Page.routeName),
            ),
            TextButton(
              child: const Text("Example 2"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(Example2Page.routeName),
            ),
            TextButton(
              child: const Text("Example 3"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(Example3Page.routeName),
            ),
            TextButton(
              child: const Text("Example 4"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(Example4Page.routeName),
            ),
            TextButton(
              child: const Text("Example 5"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(Example5Page.routeName),
            ),
            TextButton(
              child: const Text("Example 6"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(Example6Page.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
