import 'package:flutter_music_player/core/viewmodels/home_page_viewmodel.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => HomePageViewModel());
}
