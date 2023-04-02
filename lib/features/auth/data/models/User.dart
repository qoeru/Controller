import 'dart:convert';

List<User> userModelFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userModelToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  final String username;
  final String full_name;

  User({required this.username, required this.full_name});

  Map<String, dynamic> toJson() => {
        "username": username,
        "full_name": full_name,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        full_name: json["full_name"],
      );
}
