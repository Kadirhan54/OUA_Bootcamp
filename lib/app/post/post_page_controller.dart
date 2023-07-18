import 'package:get/get.dart';
import 'package:oua_bootcamp/app/data/client/api_client.dart';
import 'package:oua_bootcamp/app/data/models/post_model.dart';

class PostPageController extends GetxController {
  MyApiClient apiClient = Get.find<MyApiClient>();

  final Rx<MyModel> _post = MyModel().obs;
  get post => _post;
  set post(value) => post.value = value;

}
