import 'package:get/get.dart';
import 'package:oua_bootcamp/app/data/models/model.dart';
import 'package:oua_bootcamp/app/data/client/api_client.dart';
import 'package:oua_bootcamp/app/data/repository/repository.dart';

class DetailsController extends GetxController {
  static DetailsController instance = Get.find();

  MyRepository repo = Get.find<MyRepository>();
  MyApiClient apiClient = Get.find<MyApiClient>();

  Rx<MyModel> post = MyModel().obs;

  RxBool isLoading = false.obs;

  void getPostById(int id) async {
    isLoading(true);
    var res = await apiClient.getPostById(id);
    post.value = res;
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
