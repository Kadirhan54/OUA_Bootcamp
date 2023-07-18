import 'package:get/get.dart';
import 'package:oua_bootcamp/app/data/models/post_model.dart';
import 'package:oua_bootcamp/app/data/client/api_client.dart';

class DetailsController extends GetxController {
  static DetailsController instance = Get.find();

  MyApiClient apiClient = Get.find<MyApiClient>();

  Rx<MyModel> post = MyModel().obs;

  RxBool isLoading = false.obs;

  void getPostById(int id) async {
    isLoading(true);
    var res = await apiClient.getPostById(id);
    post.value = res;
    isLoading(false);
  }



}
