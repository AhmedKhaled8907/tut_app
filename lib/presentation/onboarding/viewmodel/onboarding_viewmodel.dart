import 'dart:async';

import 'package:tut_app/domain/models/models.dart';
import 'package:tut_app/presentation/resources/managers/assets_manager.dart';
import 'package:tut_app/presentation/resources/managers/string_manager.dart';

import '../../base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void goNext() {}

  @override
  void goPrevious() {}

  @override
  void onPageChanged(int index) {}

  // onboarding View Model inputs
  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // onboarding View Model outputs
  @override
  Stream get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        sliderObject: _list[currentIndex],
        numOfSliders: _list.length,
        currentIndex: currentIndex,
      ),
    );
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onboardingLogo4,
        ),
      ];
}

mixin OnBoardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);

  // stream controller input
  Sink get inputSliderViewObject;
}

mixin OnBoardingViewModelOutputs {
  // stream controller output
  Stream get outputSliderViewObject;
}
