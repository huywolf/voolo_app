import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/shared/utils/utils.dart';

class BlurryContainer extends StatelessWidget {
  const BlurryContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -300,
      bottom: -SizeConfig().screenHeight * 0.6,
      height: SizeConfig().screenWidth * 2,
      width: SizeConfig().screenWidth * 2,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.5, 0.6],
              tileMode: TileMode.mirror,
              colors: <Color>[
                const Color(0xff197DEE).withOpacity(0.3),
                const Color(0xffCE53AD).withOpacity(0.15),
                const Color(0xffF18F61).withOpacity(0.15),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
            ),
          ),
        ),
      ),
    );
  }
}
