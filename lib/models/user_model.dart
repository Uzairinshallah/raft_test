class UserModel{
  final String uid;
  String? userName;
  String? email;
  String? img;
  int? followerCount;
  int? followingCount;

  UserModel({
    required this.uid,
    this.userName,
    this.email,
    this.img,
    this.followerCount,
    this.followingCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName': userName,
      'email': email,
      'img': img,
      'followerCount': followerCount,
      'followingCount': followingCount,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      userName: map['userName'] ?? "",
      email: map['email'] ?? "",
      img: map['img'] ?? "",
      followerCount: map['followerCount'] ?? 0,
      followingCount: map['followingCount'] ?? 0,
    );
  }
}