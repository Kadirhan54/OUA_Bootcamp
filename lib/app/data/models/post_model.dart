// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyModel {
  int? userId;
  int? id;
  String? title;
  String? body;
  MyModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  MyModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return MyModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory MyModel.fromMap(Map<String, dynamic> map) {
    return MyModel(
      userId: map['userId'] != null ? map['userId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyModel.fromJson(String source) =>
      MyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant MyModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
