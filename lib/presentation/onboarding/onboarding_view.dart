import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/presentation/resources/managers/color_manager.dart';
import 'package:tut_app/presentation/resources/managers/assets_manager.dart';
import 'package:tut_app/presentation/resources/managers/font_manager.dart';
import 'package:tut_app/presentation/resources/managers/string_manager.dart';
import 'package:tut_app/presentation/resources/managers/styles_manager.dart';
import 'package:tut_app/presentation/resources/managers/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int currentIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: 0,
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
          setState(() {});
        },
        itemBuilder: (context, index) {
          return OnboardingPage(sliderObject: _list[index]);

          //  Padding(
          //   padding: const EdgeInsets.symmetric(
          //     vertical: AppPadding.p16,
          //     horizontal: AppPadding.p16,
          //   ),
          //   child:
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Text(
          //             _list[index].title,
          //             style: getSemiBoldStyle(
          //               color: ColorManager.darkGrey,
          //               fontSize: AppSize.s20,
          //             ),
          //           ),
          //           const SizedBox(height: AppSize.s8),
          //           Text(
          //             _list[index].subTitle,
          //             style: getRegularStyle(
          //               color: ColorManager.grey,
          //               fontSize: AppSize.s14,
          //             ),
          //             textAlign: TextAlign.center,
          //           ),
          //         ],
          //       ),
          //       Padding(
          //         padding:
          //             const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          //         child: SvgPicture.asset(
          //           _list[index].image,
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //       TextButton(
          //         onPressed: () {},
          //         child: Align(
          //           alignment: Alignment.bottomRight,
          //           child: Text(
          //             AppStrings.skipText,
          //             style: getMediumStyle(
          //               color: ColorManager.primary,
          //               fontSize: FontSize.s16,
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // );
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            // skip button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: getMediumStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s16,
                  ),
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
        // the left arrow
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: InkWell(
                  splashColor: ColorManager.darkGrey,
                  onTap: () {},
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
                child: InkWell(
                  onTap: () {},
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

class SliderObject {
  final String title;
  final String subTitle;
  final String image;

  SliderObject(this.title, this.subTitle, this.image);
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
