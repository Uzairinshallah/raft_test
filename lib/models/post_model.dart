class PostModel{
  final String pId;
  String? caption;
  String? img;
  int? time;

  PostModel({
    required this.pId,
    this.caption,
    this.img,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'pId': pId,
      'caption': caption,
      'img': img,
      'time': time,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      pId: map['pId'],
      caption: map['caption'] ?? "",
      img: map['img'] ?? "",
      time: map['time'] ?? DateTime.now().microsecond,
    );
  }
}