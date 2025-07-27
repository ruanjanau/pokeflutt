import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/flutter_carousel_intro.dart';
import 'package:flutter_carousel_intro/slider_item_model.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/assets/assets.dart';
import '../../../../core/widgets/widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: FlutterCarouselIntro(
          indicatorAlign: IndicatorAlign.bottom,
          showIndicators: true,
          primaryColor: Colors.redAccent,
          slides: [
            SliderItem(
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
              title: Strings.onboardingOne,
              subtitle: Text(
                Strings.onboardingDescriptionOne,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              widget: Image.asset(ImagesNetwork.onboarding_1),
            ),
            SliderItem(
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
              title: Strings.onboardingTwo,
              subtitle: Text(
                Strings.onboardingDescriptionTwo,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              widget: Image.asset(ImagesNetwork.onboarding_2),
            ),
            SliderItem(
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
              title: Strings.onboardingDescriptionThree,
              subtitle: PrimaryButton(
                titileButton: Strings.start,
                onPressed: () => Modular.to.pushNamed('/home'),
                color: Colors.redAccent,
              ),
              widget: Image.asset(ImagesNetwork.onboarding, scale: 1.0),
            ),
          ],
        ),
      ),
    );
  }
}
