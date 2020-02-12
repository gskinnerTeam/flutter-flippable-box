library flippable_box;

import 'dart:math';

import 'package:flutter/material.dart';

class FlippableBox extends StatelessWidget {
  final double clipRadius;
  final double duration;
  final Curve curve;
  final bool flipVt;
  final BoxDecoration bg;
  final Container front;
  final Container back;

  final bool isFlipped;

  const FlippableBox({Key key, this.isFlipped = false, this.front, this.back, this.bg, this.clipRadius, this.duration = 1, this.curve = Curves.easeOut, this.flipVt = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: (duration * 1000).round()),
      curve: Curves.easeOut,
      tween: Tween(begin: 0.0, end: isFlipped ? 180.0 : 0.0),
      builder: (context, value, child) {
        var content = value >= 90 ? back : front;
        return Rotation3d(
          rotationY: !flipVt? value : 0,
          rotationX: flipVt? value : 0,
          child: Rotation3d(
            rotationY: !flipVt? (value > 90 ? 180 : 0) : 0,
            rotationX: flipVt? (value > 90 ? 180 : 0) : 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(clipRadius ?? 0),
              child: AnimatedBackground(
                decoration: bg,
                child: content,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Rotation3d extends StatelessWidget {
  //Degrees to rads constant
  static const double degrees2Radians = pi / 180;

  final Widget child;
  final double rotationX;
  final double rotationY;
  final double rotationZ;

  const Rotation3d({Key key, @required this.child, this.rotationY = 0, this.rotationZ = 0, this.rotationX}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(rotationX * degrees2Radians)
          ..rotateY(rotationY * degrees2Radians)
          ..rotateZ(rotationZ * degrees2Radians),
        child: child);
  }
}

class AnimatedBackground extends StatelessWidget {
  final Container child;
  final BoxDecoration decoration;

  const AnimatedBackground({Key key, this.child, this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: child.constraints.maxWidth,
        height: child.constraints.maxHeight,
        decoration: decoration,
        duration: Duration(milliseconds: 700),
        curve: Curves.easeOut,
        child: child);
  }
}
