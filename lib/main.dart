import 'package:bloc_example_notes/example4_main.dart';
import 'package:flutter/material.dart';

import 'example1_main.dart';
import 'example2_main.dart';
import 'example3_main.dart';
import 'example5_main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const Example5Page(),
      routes: {
        Example5Page.routeName: (context) => const Example5Page(),
        Example4Page.routeName: (context) => const Example4Page(),
        Example3Page.routeName: (context) => const Example3Page(),
        Example2Page.routeName: (context) => const Example2Page(),
        Example1Page.routeName: (context) => const Example1Page(),
      },
    );
  }
}

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
          ],
        ),
      ),
    );
  }
}
