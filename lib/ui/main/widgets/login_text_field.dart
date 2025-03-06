import 'package:code_generator_app/ui/main/widgets/themed_text_field.dart';
import 'package:code_generator_app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.isLoginObscured,
    required this.loginController,
    required this.onObscureLoginTap,
  });

  final ValueNotifier<bool> isLoginObscured;
  final TextEditingController loginController;
  final VoidCallback onObscureLoginTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoginObscured,
      builder: (_, isLoginObscured, __) => ThemedTextField(
        labelText: 'Логин (необязательно)',
        prefixIcon: const Icon(Icons.account_circle_rounded),
        suffixIcon: Icon(
          Icons.remove_red_eye_rounded,
          color: isLoginObscured ? null : AppColors.white,
        ),
        controller: loginController,
        obscureText: isLoginObscured,
        onObscureTap: () => onObscureLoginTap(),
      ),
    );
  }
}
