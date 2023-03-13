import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final RxInt count = 0.obs;

  increment() => count.value++;

  Future<void> logout() async {
    final Box myBox = await Hive.openBox('myBox');

    await myBox.delete('hasSignIn');

    Get.offAllNamed(AppRoutes.login);
  }
}