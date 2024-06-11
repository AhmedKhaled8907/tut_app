abstract class BaseViewModel with BaseViewModelInputs, BaseViewModelOutputs {
  // shared variables and function that will be used through any view model.
}

mixin BaseViewModelInputs {
  void start();
  void dispose();
}

mixin BaseViewModelOutputs {}
