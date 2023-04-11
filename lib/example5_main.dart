import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'main.dart';

extension Normalize on num {
  num normalize(num selfRangeMin, num selfRangeMax,
          [num normalizeMinRange = 0.0, num normalizeMaxRange = 1.0]) =>
      (normalizeMaxRange - normalizeMinRange) *
          ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) +
      normalizeMinRange;
}

const double imageHeight = 300.0;

class Example5Page extends HookWidget {
  static const String routeName = "example5";
  const Example5Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opacity = useAnimationController(
        duration: Duration(seconds: 1),
        initialValue: 1.0,
        lowerBound: 0.0,
        upperBound: 1.0);

    final size = useAnimationController(
        duration: Duration(seconds: 1),
        initialValue: 1.0,
        lowerBound: 0.0,
        upperBound: 1.0);

    final controller = useScrollController();

    useEffect(() {
      controller.addListener(() {
        final newOpacity = max(imageHeight - controller.offset, 0.0);
        final normalize = newOpacity.normalize(0.0, imageHeight).toDouble();
        opacity.value = normalize;
        size.value = normalize;
      });
      return null;
    }, [controller]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          SizeTransition(
            axis: Axis.vertical,
            sizeFactor: size,
            axisAlignment: -1.0,
            child: FadeTransition(
                opacity: opacity,
                child: Image.network(
                  sampleImageUrl,
                  height: imageHeight,
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("person ${index}"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
