class BannerImg {
  String id;
  String imgUrl;
  BannerImg({required this.id, required this.imgUrl});

  //  工厂函数，用factory声明，用来创建实例对象
  factory BannerImg.formJSON(Map<String, dynamic> json) {
    // 必须返回 BannerImg实例对象
    return BannerImg(id: json["id"], imgUrl: json["imgUrl"]);
  }
}