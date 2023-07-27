import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/entities/post.dart';

class PostPageController extends GetxController {
  static final instance = Get.find<PostPageController>();

  var count = 0.obs;

  final _params = {}.obs;
  get params => _params;
  set params(value) => _params.value = value;

  late PostData postData;

  @override
  void onInit() {
    super.onInit();
    dynamic data = Get.arguments;

    postData = PostData(
        add_time: data['add_time'],
        id: data['id'],
        owner_avatarUrl: data['owner_avatarUrl'],
        like_count: data['like_count'],
        title: data['title'],
        body: data['body'],
        user_id: data['user_id']);

    params(data);
  }
}
