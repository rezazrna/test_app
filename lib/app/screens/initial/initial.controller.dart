import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/app/routes/app_routes.dart';

class InitialController extends GetxController {
  Future<void> boot() async {
    print('masuk boot');

    Box myBox = await Hive.openBox('myBox');

    if (myBox.get('hasSignIn') ?? false) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      print('masuk sini');
      Get.offAllNamed(AppRoutes.login);
    }
  } 
  
  @override
  void onInit() {
    boot();
    super.onInit();
  }
}