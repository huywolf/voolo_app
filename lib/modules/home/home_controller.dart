import 'dart:math';

import 'package:voolo_app/models/response/users_response.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  HomeController();

  var currentTabIndex = 0.obs;
  var users = Rxn<UsersResponse>();
  var user = Rxn<Datum>();

  late HomeTab homeTab;
  late HistoryTab historyTab;
  late PromoTab promoTab;
  late AccountTab accountTab;

  @override
  void onInit() async {
    super.onInit();

    homeTab = const HomeTab();
    historyTab = const HistoryTab();
    promoTab = const PromoTab();
    accountTab = const AccountTab();
  }

  void signout() {
    var prefs = Get.find<SharedPreferences>();
    prefs.clear();
    // NavigatorHelper.popLastScreens(popCount: 2);

    Get.offAllNamed(Routes.AUTH);
  }

  void _saveUserInfo(UsersResponse users) {
    var random = Random();
    var index = random.nextInt(users.data!.length);
    user.value = users.data![index];
    var prefs = Get.find<SharedPreferences>();
    // prefs.setString(StorageConstants.userInfo, users.data![index].toRawJson());

    // var userInfo = prefs.getString(StorageConstants.userInfo);
    // var userInfoObj = Datum.fromRawJson(xx!);
    // print(userInfoObj);
  }

  void switchTab(int index) {
    currentTabIndex.value = index;
  }
}
