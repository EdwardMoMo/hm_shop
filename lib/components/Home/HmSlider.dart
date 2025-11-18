import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';


class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {  

  CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex =0;

  Widget _getSlider(){

    final double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      carouselController: _controller,
      items: List.generate(widget.bannerList.length, (int index){
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        //autoPlayInterval: Duration(seconds: 5),
        height: 300,
        viewportFraction: 1,
        autoPlay: true,
        onPageChanged: (int index, reason){
          setState(() {
            _currentIndex = index;
          });
        }
      ),
    );
  }

  Widget _getSearch(){
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0,0,0,0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text("搜索...", style: TextStyle(color: Colors.white, fontSize: 16),),
        ),
      )
    );
  }

  Widget _getDots(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index){
            return GestureDetector(
              onTap: (){
                _controller.jumpToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 3),
              height: 6,
              width: index==_currentIndex? 40:20,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: index == _currentIndex ? Colors.white : Color.fromRGBO(0,0,0,0.3),
                borderRadius: BorderRadius.circular(3),

              ),
            ),
            );
          })
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
    /* return Container(
      height:300,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("轮播图",style: TextStyle(color: Colors.white, fontSize: 20)),
    ); */
  }
}