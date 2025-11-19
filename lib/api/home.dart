import "package:hm_shop/viewmodels/home.dart";
import "package:hm_shop/utils/DioRequest.dart";
import "package:hm_shop/constants/index.dart";
import "package:hm_shop/viewmodels/home.dart";

Future<List<BannerItem>> getBannerListAPI() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
    return BannerItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}

//分类列表API
Future<List<CategoryItem>> getCategoryListAPI() async {
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((item){
    return CategoryItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

// 特惠推荐
Future<SpecialRecommendResult> getProductListAPI() async {
  // 返回请求
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

Future<SpecialRecommendResult> getInVogueListAPI() async {
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

Future<SpecialRecommendResult> getOneStopListAPI() async {
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

Future<List<GoodDetailItem>> getRecommendListAPI(Map<String, dynamic> params) async {
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params:params)) as List).map((item){
    return GoodDetailItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
} 