import 'package:flutter/material.dart';
import 'package:voolo_app/shared/shared.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hourglass_bottom,
            color: Colors.purple,
            size: 35.0,
          ),
          const SizedBox(height: 15),
          Text(
            'Đang tải ...',
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
