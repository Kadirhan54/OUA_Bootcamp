import 'package:get/get.dart';
import 'package:oua_bootcamp/app/data/models/model.dart';
import 'package:oua_bootcamp/app/data/client/api_client.dart';

class MyRepository {
  MyApiClient apiClient = Get.find<MyApiClient>();

  late Future<MyModel> futureMyModel;

  getAllPosts() async {
    return await apiClient.getAllPosts();
  }

  getPostById(id) async {
    var futureMyModel = apiClient.getPostById(id);
    return futureMyModel;
  }
}
