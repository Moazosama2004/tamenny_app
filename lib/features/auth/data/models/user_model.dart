class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? imageUrl;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      imageUrl: json['imageUrl'],
    );
  }
}
