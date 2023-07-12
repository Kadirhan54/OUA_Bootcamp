import 'package:get/get.dart';
import 'package:oua_bootcamp/app/data/client/api_client.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  MyApiClient apiClient = Get.find<MyApiClient>();

  final _liste = List<dynamic>.empty(growable: true).obs;
  get liste => _liste;
  set liste(value) => _liste.value = value;

  RxBool isLoading = true.obs;

  // Previous attempts
  // RxList<dynamic> liste = List<MyModel>.empty(growable: true).obs;
  // RxList<dynamic> liste = RxList.empty(growable: true);

  @override
  onInit() {
    super.onInit();
    fetchPosts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchPosts() async {
    isLoading(true);
    var res = await apiClient.getAllPosts();
    liste(res);
    isLoading(false);
    // liste.assignAll(res);
    update();
  }
}
