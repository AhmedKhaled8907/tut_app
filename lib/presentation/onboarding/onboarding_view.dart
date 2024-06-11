import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/presentation/resources/managers/color_manager.dart';
import 'package:tut_app/presentation/resources/managers/assets_manager.dart';
import 'package:tut_app/presentation/resources/managers/string_manager.dart';
import 'package:tut_app/presentation/resources/managers/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();

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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
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
