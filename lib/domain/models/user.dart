import 'dart:convert';

List<User> userModelFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userModelToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  final String username;
  final String fullname;
  bool hasToken = false;

  User({required this.username, required this.fullname});

  Map<String, dynamic> toJson() => {
        "username": username,
        "full_name": fullname,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        fullname: json["full_name"],
      );
}
