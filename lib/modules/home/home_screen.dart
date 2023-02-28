import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/utils/size_config.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => _buildWidget()),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      body: Center(
        child: _buildContent(controller.currentTab.value),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(Assets.botNavScan),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBottomAppBarItem(
                iconAsset: Assets.botNavHome,
                iconAssetActive: Assets.botNavHomeActive,
                title: "home".tr,
                tabLabel: MainTabs.home,
              ),
              _buildBottomAppBarItem(
                iconAsset: Assets.botNavHistory,
                iconAssetActive: Assets.botNavHistory,
                iconSize: 22,
                title: "history".tr,
                tabLabel: MainTabs.history,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: (SizeConfig().screenWidth - 10) / 5,
                child: const Text('QRCode', style: TextStyle(fontSize: 12, color: Color(0xffA1A1A1), fontWeight: FontWeight.w500)),
              ),
              _buildBottomAppBarItem(
                iconAsset: Assets.botNavPromo,
                iconAssetActive: Assets.botNavPromo,
                title: "promo".tr,
                tabLabel: MainTabs.promo,
                enableOverflowBox: true,
              ),
              _buildBottomAppBarItem(
                iconAsset: Assets.botNavAccount,
                iconAssetActive: Assets.botNavAccount,
                title: "account".tr,
                tabLabel: MainTabs.account,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return controller.homeTab;
      case MainTabs.history:
        return controller.historyTab;
      case MainTabs.promo:
        return controller.promoTab;
      case MainTabs.account:
        return controller.accountTab;
      default:
        return controller.homeTab;
    }
  }

  Widget _buildBottomAppBarItem({
    required String iconAsset,
    required String iconAssetActive,
    required String title,
    required MainTabs tabLabel,
    bool? enableOverflowBox,
    double? iconSize,
  }) {
    var isActive = false;
    if (controller.currentTab.value == tabLabel) {
      isActive = true;
    }
    return SizedBox(
      width: (SizeConfig().screenWidth - 4) / 5,
      height: 60,
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: const EdgeInsets.only(top: 12, left: 5, right: 5),
        onPressed: () {
          controller.switchTab(tabLabel);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(isActive ? iconAssetActive : iconAsset, height: iconSize ?? 25),
            const Expanded(child: SizedBox()),
            enableOverflowBox == true
                ? Container(
                    padding: const EdgeInsets.only(top: 5),
                    alignment: Alignment.bottomCenter,
                    height: 20,
                    child: OverflowBox(
                      maxWidth: 200,
                      child: Text(
                        title,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          color: isActive ? const Color(0xffF18F61) : const Color(0xffA1A1A1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                : Container(
                    child: AutoSizeText(
                      title,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 12, color: isActive ? const Color(0xffF18F61) : const Color(0xffA1A1A1), fontWeight: FontWeight.w500),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
