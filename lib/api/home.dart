import "package:hm_shop/viewmodels/home.dart";
import "package:hm_shop/utils/DioRequest.dart";
import "package:hm_shop/constants/index.dart";

Future<List<BannerItem>> getBannerListAPI() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
    return BannerItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}