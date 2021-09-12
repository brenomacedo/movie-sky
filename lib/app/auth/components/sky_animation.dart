import 'package:flutter/material.dart';

class SkyAnimation extends StatelessWidget {

  final AnimationController controller;
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const SkyAnimation({
    Key? key,
    required this.controller,
    required this.positionAnimation,
    required this.opacityAnimation
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Positioned(
          child: Opacity(
            opacity: opacityAnimation.value,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/sky.png')
                )
              ),
            ),
          ),
          left: -1*positionAnimation.value,
        );
      },
    );
  }
}