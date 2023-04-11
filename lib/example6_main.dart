import 'dart:async';

import 'package:bloc_example_notes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Example6Page extends HookWidget {
  static const String routeName = "example6";
  const Example6Page({super.key});

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> controller;
    controller = StreamController<double>(
      onListen: () {
        controller.sink.add(0.0);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: StreamBuilder(
        stream: controller.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            final double rotation = snapshot.data ?? 0.0;
            return GestureDetector(
              onTap: () {
                controller.sink.add(rotation + 10.0);
              },
              child: RotationTransition(
                  turns: AlwaysStoppedAnimation(rotation/360.0),
                  child: Image.network(sampleImageUrl)),
            );
          }
        },
      ),
    );
  }
}
