import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/entities/post.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxBool isLoading = true.obs;

  final db = FirebaseFirestore.instance;

  final postList = List<PostData>.empty(growable: true).obs;

  @override
  onInit() {
    super.onInit();
    // fetchPosts();
    getPostsFromFirebase();
  }

  @override
  onReady() {
    super.onReady();

    // db
    //     .collection("posts")
    //     .where("id", isEqualTo: '0')
    //     .snapshots()
    //     .listen((event) {
    //   update();

    // });
    // postList.listen((event) {
    //   update();
    // });
  }

  goPostPageWithPostData(PostData postData) {
    // final parameters = {
    //   'id': postData.id ?? '',
    //   'title': postData.title ?? '',
    //   'body': postData.body ?? '',
    //   'like_count': postData.like_count.toString(),
    //   'owner_avatarUrl': postData.owner_avatarUrl ?? '',
    //   'add_time': postData.add_time,
    // };

    Get.toNamed(
      '/post',
      arguments: {
        'id': postData.id ?? '',
        'title': postData.title ?? '',
        'body': postData.body ?? '',
        'like_count': postData.like_count,
        'owner_avatarUrl': postData.owner_avatarUrl ?? '',
        'add_time': postData.add_time,
        'user_id': postData.user_id,
      },
    );
  }

  Future<void> getPostsFromFirebase() async {
    isLoading(true);

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
}
