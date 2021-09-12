import 'package:flutter/material.dart';
import 'package:movie_sky/app/auth/components/m_animation.dart';
import 'package:movie_sky/app/auth/components/sky_animation.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({ Key? key }) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> with SingleTickerProviderStateMixin {

  late AnimationController controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 800)
  );

  late Animation<double> positionAnimation = Tween<double>(
    begin: 250,
    end: 0
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Interval(
      0, 1.0,
      curve: Curves.elasticOut
    )
  ));

  late Animation<double> opacityAnimation = Tween<double>(
    begin: 0.1,
    end: 1.0
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Interval(
      0, 1.0,
      curve: Curves.ease
    )
  ));

  @override
  void initState() {
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SkyAnimation(
              controller: controller,
              opacityAnimation: opacityAnimation,
              positionAnimation: positionAnimation
            ),
            MAnimation(
              controller: controller,
              opacityAnimation: opacityAnimation,
              positionAnimation: positionAnimation
            )
          ],
        ),
      ),
    );
  }
}