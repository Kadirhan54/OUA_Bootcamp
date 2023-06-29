// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Comment {
  String postId;
  int id;
  String name;
  String email;
  String body;
  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  Comment copyWith({
    String? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return Comment(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      postId: map['postId'] as String,
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Comment(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;
  
    return 
      other.postId == postId &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.body == body;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;
  }
}
