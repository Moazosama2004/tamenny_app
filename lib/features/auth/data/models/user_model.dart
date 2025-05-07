import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

import 'package:tamenny_app/features/auth/domain/entites/user_entity.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String userAvatarUrl;

  @HiveField(3)
  final String uId;
  UserModel(
      {required this.name,
      required this.email,
      required this.uId,
      required this.userAvatarUrl});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      userAvatarUrl: user.photoURL ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      userAvatarUrl: json['userAvatarUrl'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
        name: user.name,
        email: user.email,
        uId: user.uId,
        userAvatarUrl: user.userAvatarUrl);
  }

  UserEntity toEntity() {
    return UserEntity(
        name: name, email: email, uId: uId, userAvatarUrl: userAvatarUrl);
  }

  toJson() {
    return {
      "name": name,
      "email": email,
      "uId": uId,
      'userAvatarUrl': userAvatarUrl
    };
  }

  @override
  String toString() {
    return 'name => $name , email => $email , uid => $uId';
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? userAvatarUrl,
    String? uId,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      userAvatarUrl: userAvatarUrl ?? this.userAvatarUrl,
      uId: uId ?? this.uId,
    );
  }
}
