import 'package:flutter/material.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/shared.dart';

import '../widgets/list_item.dart';

class HomeTab extends GetView<HomeController> {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppFocus.unfocus(context),
      child: Scaffold(
        backgroundColor: ColorConstants.LIGHT_GREY_SCAFFOLD_BACKGROUND,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimension.SCAFFOLD_HOR_PADDING),
                child: Center(
                  child: Text(
                    "Có VOOLO,\nmua sắm VÔ LO!",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, fontFamily: 'Montserrat'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Image.asset(Assets.HOME_SCREEN_FIRST),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimension.SCAFFOLD_HOR_PADDING + 10),
                child: Column(
                  children: const [
                    ListItem(title: 'Mua sắm không giới hạn trên các sàn thương mại điện tử và hệ thống Offline'),
                    SizedBox(height: 10),
                    ListItem(title: 'Thanh toán chỉ trong 3 - 4 tháng'),
                    SizedBox(height: 10),
                    ListItem(title: 'Cơ hội nhận ưu đãi hoàn tiền chỉ trong 1 ngày'),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              _buildDicoverBtn()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDicoverBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: ColorConstants.GREY_BODER),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.HOME_SCREEN_TWO, height: 30),
          const SizedBox(width: 10),
          const Text(
            'Khám phá ngay',
            style: TextStyle(color: Colors.white, fontSize: AppTextStyles.NORMAL_FS, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
