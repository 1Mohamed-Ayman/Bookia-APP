import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.welcomePNG,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 2),
                SvgPicture.asset(AppImages.logoSVG, width: 220),
                Gap(20),
                Text('Order Your Book Now!', style: TextStyles.stylesize20()),
                Spacer(flex: 5),
                MainButton(
                  text: 'Login',
                  onPressed: () {
                    pushTo(context, Routes.login);
                  },
                ),
                Gap(15),
                MainButton(
                  borderColor: AppColors.darkColor,
                  bgColor: AppColors.whiteColor,
                  textColor: AppColors.darkColor,
                  text: 'Sign Up',
                  onPressed: () {
                    pushTo(context, Routes.register);
                  },
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
