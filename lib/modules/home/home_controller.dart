import 'dart:math';

import 'package:voolo_app/api/api.dart';
import 'package:voolo_app/models/response/users_response.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  var currentTab = MainTabs.home.obs;
  var users = Rxn<UsersResponse>();
  var user = Rxn<Datum>();

  late HomeTab homeTab;
  late HistoryTab historyTab;
  late AccountTab accountTab;

  @override
  void onInit() async {
    super.onInit();

    homeTab = const HomeTab();
    historyTab = const HistoryTab();
    accountTab = const AccountTab();
  }

  Future<void> loadUsers() async {
    var _users = await apiRepository.getUsers();
    if (_users!.data!.length > 0) {
      users.value = _users;
      users.refresh();
      _saveUserInfo(_users);
    }
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

  void switchTab(index) {
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.notifcation:
        return 1;
      case MainTabs.account:
        return 2;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.notifcation;
      case 2:
        return MainTabs.account;
      default:
        return MainTabs.home;
    }
  }
}
