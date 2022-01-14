import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
    this.name,
    this.avatarUrls
  });

  int? id;
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;
  String? name;
  Map<String, String>? avatarUrls;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] ?? null,
    token: json["token"],
    userEmail: json["user_email"],
    userNicename: json["user_nicename"],
    userDisplayName: json["user_display_name"],
    name: json["name"] == null ? "" : json["name"],
    avatarUrls: json["avatar_urls"] == null ? null : Map.from(json["avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "token": token,
    "user_email": userEmail,
    "user_nicename": userNicename,
    "user_display_name": userDisplayName,
    "name": name,
    "avatarUrls":avatarUrls
  };
}