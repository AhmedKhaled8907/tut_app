
// onboarding model
class SliderObject {
  final String title;
  final String subTitle;
  final String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  final SliderObject sliderObject;
  final int numOfSliders;
  final int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.numOfSliders,
    required this.currentIndex,
  });
}
