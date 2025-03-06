import 'package:code_generator_app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Icon(Icons.lock,
        color: AppColors.lightPrimaryColor,
        size: 130,
        ),
        Padding(
          padding: EdgeInsets.only(left: 73, top: 83),
          child: Icon(
            Icons.restart_alt_rounded,
            color: Colors.white,
            size: 60,
          ),
        ),
      ],
    );
  }
}
