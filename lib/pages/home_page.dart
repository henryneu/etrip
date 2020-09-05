import 'package:cached_network_image/cached_network_image.dart';
import 'package:etrip/widgets/error_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const String HOME_BANNER_ONE = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1503471047&di=679d7a6c499f59d1b0dcd56b62a9aa6c&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.90sheji.com%2Fdianpu_cover%2F11%2F14%2F64%2F55%2F94ibannercsn_1200.jpg";
const String HOME_BANNER_TWO = "https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg";
const String HOME_BANNER_THREE = "https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg";
const String HOME_BANNER_FOUR = "http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> _imageUrls = [
    HOME_BANNER_ONE,
    HOME_BANNER_TWO,
    HOME_BANNER_THREE,
    HOME_BANNER_FOUR
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 160.0,
              child: Swiper(
                itemCount: _imageUrls.length,
                autoplay: true,
                pagination: SwiperPagination(),
                itemBuilder: (BuildContext context, int index) {
                  return CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: _imageUrls[index],
                    errorWidget: (c, s, _) => ErrorImageWidget(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
