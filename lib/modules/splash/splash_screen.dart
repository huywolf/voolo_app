import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/shared.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: Center(
        child: SvgPicture.asset(Assets.iconVooloLogo, height: 150),
      ),
    );
  }
}
