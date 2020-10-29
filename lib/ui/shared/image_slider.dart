import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/core/bloc/image_slider_bloc.dart';
import 'package:flutter_music_player/core/resources/app_colors.dart';

class ImageSlider extends StatefulWidget {
  List<String> imageUrl;
  bool autoPlay;
  double height;
  BoxFit fit;
  bool darkScreen;

  ImageSlider(this.imageUrl,
      {this.autoPlay = true, this.height, this.fit, this.darkScreen});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  ImageSliderBloc imageSliderBloc = ImageSliderBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: imageSliderBloc.imageSliderUpdate.current,
        stream: imageSliderBloc.imageSliderStream,
        builder: (context, snapshot) {
          return new Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(
                      widget.imageUrl,
                      (index, url) {
                        return dots(
                            imageSliderBloc.imageSliderUpdate.current, index);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CarouselSlider(
                    height: widget.height,
                    reverse: false,
                    items: carouselSliderList(widget.imageUrl),
                    aspectRatio: 2,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    autoPlay: widget.autoPlay,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    pauseAutoPlayOnTouch: Duration(seconds: 2),
                    enlargeCenterPage: true,
                    onPageChanged: (index) {
                      imageSliderBloc.updateImageSlider(index);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<Widget> carouselSliderList(List<String> imageUrl) {
    return imageUrl.map((i) {
      return Builder(builder: (BuildContext context) {
        return imageSliderItem(i);
      });
    }).toList();
  }

  Widget imageSliderItem(String name) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //padding: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            name,
            fit: widget.fit,
          ),
        ));
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget dots(int current, index) {
    if (current != index) {
      return Container(
          width: 6,
          height: 6.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotColor(index),
          ));
    } else {
      return Container(
          width: 12,
          height: 12,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: dotColor(index)));
    }
  }

  Color dotColor(int index) {
    if (widget.darkScreen == true) {
      return imageSliderBloc.imageSliderUpdate.current == index
          ? AppColors.accentColor
          : AppColors.accentColor.withOpacity(0.3);
    } else {
      return imageSliderBloc.imageSliderUpdate.current == index
          ? Color(0xFF675AE1)
          : Colors.black;
    }
  }
}
