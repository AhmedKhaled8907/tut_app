import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/presentation/resources/managers/color_manager.dart';
import 'package:tut_app/presentation/resources/managers/assets_manager.dart';
import 'package:tut_app/presentation/resources/managers/constants_manager.dart';
import 'package:tut_app/presentation/resources/managers/string_manager.dart';
import 'package:tut_app/presentation/resources/managers/values_manager.dart';

import '../../resources/managers/router_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();

  

  //     @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnboardingPage(sliderObject: _list[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        // height: AppSize.s100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // skip button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () async {
                  await Navigator.of(context)
                      .pushReplacementNamed(Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),

            // widgets indicator and arrows
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // the left arrow
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p14),
                child: GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      _getPreviousIndex(),
                      duration: const Duration(
                        milliseconds: AppConstants.sliderDotsDuration,
                      ),
                      curve: Curves.bounceInOut,
                    );
                  },
                  child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: SvgPicture.asset(ImageAssets.leftArrowIc),
                  ),
                ),
              ),
            ],
          ),

          // the dots indicator
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i),
                ),
            ],
          ),

          // the right arrow
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      _getNextIndex(),
                      duration: const Duration(
                        milliseconds: AppConstants.sliderDotsDuration,
                      ),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: SvgPicture.asset(ImageAssets.rightArrowIc),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index) {
    if (index == currentIndex) {
      return const ActiveDocIndicator();
    } else {
      return const InActiveDocIndicator();
    }
  }



}

class InActiveDocIndicator extends StatelessWidget {
  const InActiveDocIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s12,
      width: AppSize.s12,
      child: CircleAvatar(
        backgroundColor: ColorManager.darkGrey,
      ),
    );
  }
}

class ActiveDocIndicator extends StatelessWidget {
  const ActiveDocIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s12,
      width: AppSize.s12,
      child: CircleAvatar(
        backgroundColor: ColorManager.white,
      ),
    );
  }
}



class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.sliderObject});

  final SliderObject sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(sliderObject.image),
      ],
    );
  }
}
