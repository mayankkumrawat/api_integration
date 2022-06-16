import 'package:get/get.dart';
import '../model/post.dart';
import '../services/remote_services.dart';

class HomePageController extends GetxController {
  var datums = List<Datum>.empty(growable: true).obs;
  var isLoaded = false.obs;
  RemoteService remoteService = RemoteService();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    datums.value = (await remoteService.getData())!;
    if (datums != null) {
      isLoaded.value = true;
    }
  }
}
