import 'package:audio_manager/audio_manager.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_music_player/core/constants/constants.dart';
import 'package:flutter_music_player/core/resources/app_colors.dart';
import 'package:flutter_music_player/core/resources/strings.dart';
import 'package:flutter_music_player/core/resources/text_styles.dart';
import 'package:flutter_music_player/core/utils/device_size.dart';
import 'package:flutter_music_player/core/viewmodels/home_page_viewmodel.dart';
import 'package:flutter_music_player/ui/shared/base_view.dart';
import 'package:flutter_music_player/ui/shared/image_slider.dart';
import 'package:flutter_music_player/ui/widgets/home_page_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  List<String> imageUrl;

  void initPlayer(HomePageViewModel model) {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    advancedPlayer.completionHandler = () {
      model.setIsPlaying(!model.isPlaying);
    };
    advancedPlayer.durationHandler = (d) => model.setDuration(d);
    advancedPlayer.positionHandler = (p) => model.setPosition(p);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(
      onModelReady: (model) {
        initPlayer(model);
        imageUrl = [
          Constants.coverImage,
          Constants.coverImage,
          Constants.coverImage,
        ];
      },
      builder: (_, model, __) => Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Container(
          height: DeviceSize.height(context),
          width: DeviceSize.width(context),
          color: AppColors.primaryColor,
          padding:
              EdgeInsets.only(top: 20, bottom: 20) + EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageSlider(
                  imageUrl,
                  fit: BoxFit.cover,
                  autoPlay: false,
                  height: MediaQuery.of(context).size.height / 2.5,
                  darkScreen: true,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        Strings.songName,
                        style: AppTextStyles.songTitleTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.songDesc,
                        style: AppTextStyles.songSubTitleTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          advancedPlayer.stop();
                          model.setIsPlaying(true);
                          audioCache.play(Constants.songPath);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              shape: BoxShape.circle),
                          child: Icon(
                            FontAwesomeIcons.backward,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: !model.isPlaying
                            ? () {
                                model.setIsPlaying(!model.isPlaying);
                                audioCache.play(Constants.songPath);
                              }
                            : () {
                                model.setIsPlaying(!model.isPlaying);
                                advancedPlayer.pause();
                              },
                        child: Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              model.isPlaying
                                  ? FontAwesomeIcons.pause
                                  : FontAwesomeIcons.play,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () {
                          advancedPlayer.stop();
                          model.setIsPlaying(true);
                          audioCache.play(Constants.songPath);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              shape: BoxShape.circle),
                          child: Icon(
                            FontAwesomeIcons.forward,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: HomePageWidgets.slider(
                      model.position, model.duration, model, advancedPlayer),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
