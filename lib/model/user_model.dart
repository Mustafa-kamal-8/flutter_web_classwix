class UsersModel {
  UsersModel({
    required this.message,
    required this.users,
  });
  late final String message;
  late final List<Users> users;

  UsersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    users = List.from(json['users']).map((e) => Users.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['users'] = users.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Users {
  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.phoneVerifiedAt,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String? phoneVerifiedAt;
  late final Null emailVerifiedAt;
  late final String createdAt;
  late final String updatedAt;

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phoneVerifiedAt = null;
    emailVerifiedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['phone_verified_at'] = phoneVerifiedAt;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
