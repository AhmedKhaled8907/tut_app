import 'dart:async';

import 'package:tut_app/domain/models/models.dart';

import '../../base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final _streamController = StreamController<SliderViewObject>();

  @override
  void dispose() {}

  @override
  void start() {}

  @override
  void goNext() {}

  @override
  void goPrevious() {}

  @override
  void onPageChanged(int index) {}

  // onboarding View Model inputs
  @override
  Sink get inputSliderViewObject => throw UnimplementedError();

  // onboarding View Model outputs
  @override
  Stream get outputSliderViewObject => throw UnimplementedError();
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
