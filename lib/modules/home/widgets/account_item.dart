import 'package:flutter/material.dart';
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
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Material(
        borderRadius: BorderRadius.circular(11),
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                icon,
                const SizedBox(width: 15),
                Expanded(
                    child: Text(
                  title,
                  style: const TextStyle(color: ColorConstants.blackText, fontSize: 16),
                )),
                const Icon(
                  Icons.chevron_right,
                  color: ColorConstants.darkGray,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
