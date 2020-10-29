import 'dart:async';



class ImageSliderUpdate {
  int current = 0;

  void changeImageSlider(int current) {
    this.current = current;
  }
}


class ImageSliderBloc {
  final imageSliderController = new StreamController();
  final ImageSliderUpdate imageSliderUpdate = new ImageSliderUpdate();

  Stream get imageSliderStream => imageSliderController.stream;

  void updateImageSlider(int _currentIndex) {
    imageSliderUpdate.changeImageSlider(_currentIndex);
    imageSliderController.sink.add(imageSliderUpdate);
  }

  void dispose() {
    imageSliderController.close();
  }
}
