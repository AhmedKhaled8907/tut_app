import '../../base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers

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
}

mixin OnBoardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);
}

mixin OnBoardingViewModelOutputs {}
