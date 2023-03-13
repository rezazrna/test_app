import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../model/user.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final List<User> users = [
    User(username: 'user1', password: '123'),
    User(username: 'user2', password: '321'),
  ];

  Future<bool> checkLogin() async {
    final bool valid = users.any((User user) {
      return user.username == usernameController.text &&
        user.password == passwordController.text;
    });

    if (valid) {
      final Box myBox = await Hive.openBox('myBox');
      myBox.put('hasSignIn', true);
    }

    return valid;
  }
}