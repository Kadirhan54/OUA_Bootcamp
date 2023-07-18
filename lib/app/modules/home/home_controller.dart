import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/entities/post.dart';
import 'package:oua_bootcamp/app/data/client/api_client.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  MyApiClient apiClient = Get.find<MyApiClient>();

  // // RxList<dynamic> liste = List<MyModel>.empty(growable: true).obs;
  final _liste = List<dynamic>.empty(growable: true).obs;
  get liste => _liste;
  set liste(value) => _liste.value = value;

  RxBool isLoading = true.obs;

  final db = FirebaseFirestore.instance;

  final postList = List<PostData>.empty(growable: true).obs;

  @override
  onInit() {
    super.onInit();
    // fetchPosts();
    getPostsFromFirebase();
    fetchPosts();
  }

  @override
  onReady() {
    super.onReady();

    db
        .collection("posts")
        .where("id", isEqualTo: '0')
        .snapshots()
        .listen((event) {
      update();
    });
    // postList.listen((event) {
    //   update();
    // });
  }

  goPostPageWithPostData(PostData postData) {
    Get.toNamed(
      '/post',
      parameters: {
        'title': postData.title ?? '',
        'body': postData.body ?? '',
        'like_count': postData.like_count.toString(),
        'owner_avatarUrl': postData.owner_avatarUrl ?? '',
        'add_time': postData.add_time.toString(),
      },
    );
  }

  Future<void> getPostsFromFirebase() async {
    var postBase = await db
        .collection('posts')
        .withConverter(
            fromFirestore: PostData.fromFirestore,
            toFirestore: (PostData postData, options) => postData.toFirestore())
        .get();

    postList.clear();

    for (var doc in postBase.docs) {
      postList.add(doc.data());
    }

    isLoading(false);
    update();
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
