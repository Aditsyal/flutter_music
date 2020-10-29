import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/core/resources/app_colors.dart';
import 'package:flutter_music_player/core/resources/text_styles.dart';
import 'package:flutter_music_player/core/viewmodels/home_page_viewmodel.dart';

class HomePageWidgets {
  static Widget slider(Duration position, Duration duration,
      HomePageViewModel model, AudioPlayer advancedPlayer) {
    return Column(
      children: [
        Slider(
            activeColor: AppColors.accentColor,
            inactiveColor: AppColors.accentColor.withOpacity(0.5),
            value: position.inSeconds.toDouble(),
            min: 0.00,
            max: duration.inSeconds.toDouble(),
            onChanged: (double value) {
              model.seekToSecond(value.toInt(), advancedPlayer);
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${position.inMinutes}:${position.inSeconds}",
                style: AppTextStyles.songDurationTextStyle,
              ),
              Text("${duration.inMinutes}:${duration.inSeconds % 10}",
                  style: AppTextStyles.songPositionTextStyle),
            ],
          ),
        )
      ],
    );
  }
}
