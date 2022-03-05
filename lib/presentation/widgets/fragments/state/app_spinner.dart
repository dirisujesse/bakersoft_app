import 'package:flutter/material.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';

class AppSpinner extends StatelessWidget {
  const AppSpinner();

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Center(
      child: SizedBox(
        height: scaler.sizer.setLongestSide(2),
        width: scaler.sizer.setLongestSide(2),
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          backgroundColor: BakerColors.white,
          valueColor: AlwaysStoppedAnimation<Color>(BakerColors.red),
        ),
      ),
    );
  }
}

