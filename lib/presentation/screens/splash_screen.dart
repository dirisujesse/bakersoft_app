import 'dart:async';

import 'package:flutter/material.dart';
import 'package:baker_app/data/constants/assets.dart';
import 'package:baker_app/data/constants/routes.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer? timer;

  @override
  void initState() {
    super.initState();
    _handleRouting();
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null && (timer?.isActive ?? false)) {
      timer?.cancel();
    }
  }

  _handleRouting() {
    timer = Timer(
      Duration(seconds: 1),
      () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          BakerRoutes.product,
          (_) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(BakerSvgs.logo)),
    );
  }
}
