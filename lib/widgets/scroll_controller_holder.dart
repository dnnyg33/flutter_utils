import 'package:flutter/material.dart';

class ScrollControllerHolder extends StatefulWidget {
  final Widget Function(BuildContext context, ScrollController controller)
  builder;

  const ScrollControllerHolder({required this.builder, super.key});

  @override
  State<ScrollControllerHolder> createState() => _ScrollControllerHolderState();
}

class _ScrollControllerHolderState extends State<ScrollControllerHolder> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }
}
