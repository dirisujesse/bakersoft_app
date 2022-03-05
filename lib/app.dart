import 'package:flutter/material.dart';
import 'package:baker_app/data/config/app_config.dart';
import 'package:baker_app/data/constants/routes.dart';
import 'package:baker_app/data/models/enums/env.dart';
import 'package:baker_app/presentation/styles/theme.dart';
import 'package:baker_app/presentation/widgets/layouts/state/state_wrapper.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';

class BakerApp extends StatefulWidget {
  final bool isMock;
  final Environment environment;

  const BakerApp({
    this.isMock = false,
    this.environment = Environment.PRODUCTION,
  });

  @override
  State<StatefulWidget> createState() => _BakerAppState();
}

class _BakerAppState extends State<BakerApp> {
  @override
  Widget build(BuildContext context) {
    return StateWrapper(
      child: MaterialApp(
        theme: BakerThemes.defaultTheme,
        navigatorKey: AppConfig.navigator,
        title: 'Baker',
        debugShowCheckedModeBanner: false,
        routes: BakerRoutes.staticRoutes,
        onGenerateRoute: BakerRoutes.dynamicRoutes,
        builder: (context, page) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1,
            ),
            child: GestureDetector(
              child: page ?? const Offstage(),
              onTap: context.resetFocus,
            ),
          );
        },
      ),
    );
  }
}
