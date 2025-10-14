import 'dart:math';

import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feautres/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feautres/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/feautres/auth/presentation/login/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildLoginBody(context),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account?"),
          TextButton(
            onPressed: () {
              pushWithReplacement(context, Routes.register);
            },
            child: Text(
              "Sign Up",
              style: TextStyles.stylesize16(color: AppColors.darkColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          pop(context);
          showSuccessDialog(context, state.message);
        } else if (state is AuthErrorState) {
          pop(context);
          showErrorDialog(context, state.message);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                Text(
                  'Welcome back! Glad to see you again!',
                  style: TextStyles.stylesize30(),
                ),
                Gap(30),
                CustomTextField(
                  controller: cubit.emailController,
                  hint: 'Enter your email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                Gap(12),
                CustomTextField(
                  controller: cubit.passwordController,
                  hint: 'Enter your password',
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SvgPicture.asset(AppImages.eyeSVG)],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyles.stylesize16(),
                    ),
                  ),
                ),
                Gap(20),
                MainButton(
                  text: 'Login',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.login();
                    }
                  },
                ),
                Gap(20),
                SocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
