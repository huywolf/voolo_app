import 'dart:async';

import 'package:voolo_app/models/models.dart';

import 'bnpl_api_provider.dart';

class BnplApiRepository {
  BnplApiRepository({required this.apiProvider});

  final BnplApiProvider apiProvider;

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.checkPhoneExist('/api/login', data);
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    }
    return null;
  }
}
