import 'package:get/get.dart';
import '../../controllers/HomeController.dart';
class HomeBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController(city: 'Hanoi'));
  }
}