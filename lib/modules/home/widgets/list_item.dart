import 'package:flutter/material.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/constants/constants.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 5.0,
          height: 5.0,
          margin: const EdgeInsets.only(top: 7),
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.NORMAL,
          ),
        ),
      ],
    );
  }
}
