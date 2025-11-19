class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});

  factory BannerItem.formJSON(Map<String, dynamic> json){
    return BannerItem(
      id: json["id"],
      imgUrl: json["imgUrl"] ?? "",
    );
  }
}