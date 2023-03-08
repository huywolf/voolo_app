import 'package:flutter/material.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/constants/constants.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final Function() onTap;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 15),
            Expanded(
                child: Text(
              title,
              style: const TextStyle(color: ColorConstants.BLACK_TEXT, fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Montserrat'),
            )),
            Image.asset(Assets.ARROW_RIGHT, height: 11),
          ],
        ),
      ),
    );
  }
}
