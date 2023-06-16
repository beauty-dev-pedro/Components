import 'package:flutter/material.dart';

//this animation technically works for any widget that can send an action
class Bouncing extends StatefulWidget {
  final Widget child;
  final VoidCallback onPress;

  const Bouncing({required this.child, required this.onPress, super.key});

  @override
  BouncingState createState() => BouncingState();
}

class BouncingState extends State<Bouncing> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1.0 - _controller.value * 4; //Change constant value to affect how much the button scales
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        _controller.forward();
      },
      onPointerUp: (PointerUpEvent event) {
        _controller.reverse();
        widget.onPress();
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}