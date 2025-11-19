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
/* 
{
    "code": "1",
    "msg": "操作成功",
    "result": [
        {
            "id": "1181622001",
            "name": "气质女装",
            "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png",
            "children": [
                {
                    "id": "1191110001",
                    "name": "半裙",
                    "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView",
                    "children": null,
                    "goods": null
                },
                {
                    "id": "1191110002",
                    "name": "衬衫",
                    "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_cs.png?quality=95&imageView",
                    "children": null,
                    "goods": null
                },
                {
                    "id": "1191110022",
                    "name": "T恤",
                    "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_tx.png?quality=95&imageView",
                    "children": null,
                    "goods": null
                },
                {
                    "id": "1191110023",
                    "name": "针织衫",
                    "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_zzs.png?quality=95&imageView",
                    "children": null,
                    "goods": null
                },
                {
                    "id": "1191110024",
                    "name": "夹克",
                    "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_jk.png?quality=95&imageView",
                    "children": null,
                    "goods": null
                },
                {
                    "id": "1191110025",
                    "name": "卫衣",
                    "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_wy.png?quality=95&imageView",
                    "children": null,
                    "goods": null
                },
                {
                    "id": "1191110028",
                    "name": "背心",
                    "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bx.png?quality=95&imageView",
                    "children": null,
                    "goods": null
                }
            ],
            "goods": null
        },                
    ]
} */

//根据json编写class对象和工厂转化函数
//分类列表
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({required this.id, required this.name, required this.picture, this.children});

//扩展一个工厂函数， 一般用于factory来声明, 一般用来创建实例对象
  factory CategoryItem.fromJSON(Map<String, dynamic> json){
    var childrenFromJson = json['children'] as List?;
    List<CategoryItem>? childrenList = childrenFromJson != null
        ? childrenFromJson.map((child) => CategoryItem.fromJSON(child)).toList()
        : null;

    return CategoryItem(
      id: json["id"],
      name: json["name"],
      picture: json["picture"] ?? "",
      children: childrenList,
    );
  }
}