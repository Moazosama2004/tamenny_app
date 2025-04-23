import 'package:firebase_auth/firebase_auth.dart';
import 'package:tamenny_app/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.name,
      required super.email,
      required super.uId,
      required super.userAvatarUrl});

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
    String? id,
    String? name,
    String? email,
    String? imageUrl,
  }) {
    return UserModel(
      uId: id ?? this.uId,
      name: name ?? this.name,
      email: email ?? this.email,
      userAvatarUrl: imageUrl ?? this.userAvatarUrl,
    );
  }
}
