import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/app/routes/app_routes.dart';

class InitialController extends GetxController {
  Future<void> boot() async {
    Box myBox = await Hive.openBox('myBox');

    if (myBox.get('hasSignIn') ?? false) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  } 
  
  @override
  void onInit() {
    boot();
    super.onInit();
  }
}