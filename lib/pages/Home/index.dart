import "package:flutter/material.dart";
import "package:hm_shop/components/Home/HmSlider.dart"; // Add the correct import path for HmSlider
import "package:hm_shop/components/Home/HmCategory.dart"; // Add the correct import path for HmCategory
import "package:hm_shop/components/Home/HmSuggestion.dart";
import "package:hm_shop/components/Home/HmHot.dart";
import "package:hm_shop/components/Home/HmMoreList.dart";
import "package:hm_shop/viewmodels/home.dart";
import "package:hm_shop/api/home.dart";

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(id: "", title: "", subTypes: []);

  List<CategoryItem> _categoryList = [];

  List<BannerItem> _bannerList=[
    /* BannerItem(
      id: "1",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
    ),
    BannerItem(
      id: "2",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.jpg",
    ),
    BannerItem(
      id: "3",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
    ), */
  ];

  List<Widget> _getScrollChildren(){
    return [
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmCategory( categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmSuggestion(specialRecommendResult: _specialRecommendResult)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
             Expanded(child: HmHot(result: _inVogueResult, type: "hot")), 
             SizedBox(width: 10),
             Expanded(child: HmHot(result: _oneStopResult, type: "step"))],
        ),
        ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        HmMoreList(recommendList: _recommendList),

    ];
  }

  SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: []
  );

  SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  List<GoodDetailItem> _recommendList=[];

  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  void _getRecommendList() async {
     if(_isLoading || !_hasMore){
      return;
     }
     _isLoading = true;
     int requestLimit = _page * 8;
    _recommendList = await getRecommendListAPI({"limit":requestLimit});
    _isLoading = false;
    setState(() {});

    if(_recommendList.length < requestLimit){
      _hasMore = false;
      return;
    }
    
    _page ++;
    
  }

  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }


  @override
  void initState(){
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getProductList();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
    _registerEvent();
  }

  void _registerEvent(){
      _controller.addListener((){
        if (_controller.position.pixels >= (_controller.position.maxScrollExtent - 50)) {
          _getRecommendList();
        }
      });
  }

  void _getProductList() async {
    _specialRecommendResult = await getProductListAPI();
    setState(() {});
  }


  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {    
    return CustomScrollView(
      controller: _controller,slivers: _getScrollChildren());
  }
}