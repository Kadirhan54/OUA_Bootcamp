import 'dart:convert';
import 'package:oua_bootcamp/app/data/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:oua_bootcamp/app/data/client/api_constants.dart';

typedef DynamicList = List<dynamic>;
typedef MyModelList = List<MyModel>;

class MyApiClient {
  final baseUrl = ApiConstants.baseUrl;
  var client = http.Client();

  Future<DynamicList> getAllPosts() async {
    var response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      // List<MyModel> list = json
      //     .decode(response.body)
      //     .map((data) => MyModel.fromMap(data))
      //     .toList();

      DynamicList list = json.decode(response.body).toList();

      // denemler
      // var listt = json.decode(response.body);
      // var list = listt.map((data) {
      //   MyModel.fromMap(data);
      //   print(data['title']);
      // });
      // debugPrint('asdasd');

      // fetch data doc
      // return MyModel.fromMap(jsonDecode(response.body));
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<MyModel> getPostById(id) async {
    var response = await client.get(Uri.parse('$baseUrl/posts/$id'));
    if (response.statusCode == 200) {
      MyModel res = MyModel.fromMap(jsonDecode(response.body));
      return res;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
