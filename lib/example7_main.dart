import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'main.dart';

enum Action { moreVisible, lessVisible, rotateRight, rotateLeft }

@immutable
class State {
  final double rotationDegree;
  final double alpha;

  const State({required this.rotationDegree, required this.alpha});

  const State.zero()
      : rotationDegree = 0.0,
        alpha = 1.0;

  State rotateRight() =>
      State(alpha: alpha, rotationDegree: rotationDegree + 10.0);

  State rotateLeft() =>
      State(alpha: alpha, rotationDegree: rotationDegree - 10.0);

  State increaseVisibility() =>
      State(alpha: min(1.0, alpha + 0.1), rotationDegree: rotationDegree);

  State decreaseVisibility() =>
      State(alpha: max(0.0, alpha - 0.1), rotationDegree: rotationDegree);
}

State reducer(State oldState, Action? action) {
  switch (action) {
    case Action.moreVisible:
      return oldState.increaseVisibility();

    case Action.lessVisible:
      return oldState.decreaseVisibility();

    case Action.rotateRight:
      return oldState.rotateRight();

    case Action.rotateLeft:
      return oldState.rotateLeft();

    case null:
      return oldState;
  }
}

class Example7Page extends HookWidget {
  static const String routeName = "example7";
  const Example7Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useReducer<State, Action?>(reducer,
        initialState: const State.zero(), initialAction: null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: [
                TextButton(
                    onPressed: () {
                      store.dispatch(Action.rotateRight);
                    },
                    child: const Text("Rotate Right")),
                TextButton(onPressed: () {
                  store.dispatch(Action.rotateLeft);
                }, child: const Text("Rotate Left")),
                TextButton(
                    onPressed: () {
                      store.dispatch(Action.moreVisible);
                    }, child: const Text("Increase Visibility")),
                TextButton(
                    onPressed: () {
                      store.dispatch(Action.lessVisible);
                    }, child: const Text("Decrease Visibility")),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Opacity(
              opacity: store.state.alpha,
              child: RotationTransition(
                  turns:
                      AlwaysStoppedAnimation(store.state.rotationDegree / 360.0),
                  child: Image.network(sampleImageUrl)),
            )
          ],
        ),
      ),
    );
  }
}
