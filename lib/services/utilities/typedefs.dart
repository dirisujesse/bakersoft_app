import 'package:flutter/material.dart';
import 'package:baker_app/services/utilities/lma_scaler.dart';

typedef OnPressed = void Function();
typedef OnChanged<T> = void Function(T value);
typedef OnChangedAsync<T> = Future<void> Function(T value);
typedef QueryFuture<T> = Future<T> Function();
typedef OnValidate<T> = String? Function(T value);
typedef ItemBuilder = Widget Function(BuildContext context, int index);
typedef ValueBuilder<T> = Widget Function(T value);
typedef LayoutCallback = Widget Function(BuildContext context, BakerScaleUtil scaler, BoxConstraints constraints);
