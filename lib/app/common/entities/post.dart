// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  final String? title;
  final String? body;
  final String? id;
  final String? user_id;
  final int? like_count;
  final String? owner_avatarUrl;
  final Timestamp? add_time;

  PostData({
    this.title,
    this.body,
    this.id,
    this.user_id,
    this.like_count,
    this.owner_avatarUrl,
    this.add_time,
  });

  factory PostData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return PostData(
      title: data?['title'],
      body: data?['body'],
      id: data?['id'],
      user_id: data?['user_id'],
      like_count: data?['like_count'],
      owner_avatarUrl: data?['owner_avatarUrl'],
      add_time: data?['add_time'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) "title": title,
      if (body != null) "body": body,
      if (id != null) "id": id,
      if (user_id != null) "user_id": user_id,
      if (like_count != null) "like_count": like_count,
      if (owner_avatarUrl != null) "owner_avatarUrl": owner_avatarUrl,
      if (add_time != null) "add_time": add_time,
    };
  }
}
