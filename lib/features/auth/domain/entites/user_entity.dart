class UserEntity {
  final String name;
  final String email;
  final String uId;
  String userAvatarUrl;

  UserEntity(
      {this.userAvatarUrl =
          'https://hxknihxevezcsgfffdmr.supabase.co/storage/v1/object/public/images/avatars/profiel.png',
      required this.name,
      required this.email,
      required this.uId});

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? imageUrl,
  }) {
    return UserEntity(
      uId: id ?? this.uId,
      name: name ?? this.name,
      email: email ?? this.email,
      userAvatarUrl: imageUrl ?? this.userAvatarUrl,
    );
  }
}
