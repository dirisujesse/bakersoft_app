import 'dart:async';

import 'package:baker_app/services/logging/little_logger.dart';
import 'package:flutter/material.dart';
import 'package:baker_app/presentation/widgets/fragments/indicators/app_pills.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';

abstract class BakerOverlay {
  late BuildContext context;

  close();
  show();
}

class BakerAlertOverlay implements BakerOverlay {
  @override
  late BuildContext context;

  OverlayEntry? _entry;
  bool _inserted = false;

  BakerAlertOverlay.of(this.context);

  @override
  show({
    String message = "",
    Color? color,
    Color? textColor,
    int? delay,
    bool isPadded = false,
  }) {
    try {
      if (_entry != null || _inserted) {
        close();
      }
      final scaler = context.scaler;

      _entry = OverlayEntry(
        opaque: false,
        builder: (context) {
          return Positioned(
            top: scaler.sizer.setHeight(6),
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Material(
                type: MaterialType.transparency,
                child: AlertPill(
                  isPadded: isPadded,
                  message: message,
                  color: color,
                  textColor: textColor,
                ),
              ),
            ),
          );
        },
      );
      Overlay.of(context)?.insert(_entry!);
      _inserted = true;

      Timer(Duration(milliseconds: delay ?? 1000), close);
    } catch (e, t) {
      BakerLogger.severe("$e", stackTrace: t, error: e);
    }
  }

  @override
  close() {
    try {
      if (_entry != null && _inserted) {
        _entry?.remove();
        _entry = null;
        _inserted = false;
      }
    } catch (e, t) {
      BakerLogger.severe("$e", stackTrace: t, error: e);
    }
  }
}
