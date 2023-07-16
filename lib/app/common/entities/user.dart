import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String? id;
  final String? name;
  final String? email;
  final String? avatarUrl;
  final String? location;
  final String? fcmtoken;
  final Timestamp? addtime;

  UserData({
    this.id,
    this.name,
    this.email,
    this.avatarUrl,
    this.location,
    this.fcmtoken,
    this.addtime,
  });

  factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return UserData(
      id: data?['id'],
      name: data?['name'],
      email: data?['email'],
      avatarUrl: data?['avatarUrl'],
      location: data?['location'],
      fcmtoken: data?['fcmtoken'],
      addtime: data?['addtime'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (avatarUrl != null) "avatarUrl": avatarUrl,
      if (location != null) "location": location,
      if (fcmtoken != null) "fcmtoken": fcmtoken,
      if (addtime != null) "addtime": addtime,
    };
  }
}

// 登录返回
class UserLoginResponseEntity {
  String? accessToken;
  String? displayName;
  String? email;
  String? avatarUrl;

  UserLoginResponseEntity({
    this.accessToken,
    this.displayName,
    this.email,
    this.avatarUrl,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        accessToken: json["access_token"],
        displayName: json["display_name"],
        email: json["email"],
        avatarUrl: json["avatarUrl"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "display_name": displayName,
        "email": email,
        "avatarUrl": avatarUrl,
      };
}

class MeListItem {
  String? name;
  String? icon;
  String? explain;
  String? route;


  MeListItem({
    this.name,
    this.icon,
    this.explain,
    this.route,
  });

  factory MeListItem.fromJson(Map<String, dynamic> json) =>
      MeListItem(
        name: json["name"],
        icon: json["icon"],
        explain: json["explain"],
        route: json["route"],
      );
}
