import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:baker_app/services/utilities/typedefs.dart';

class BoolListener extends StatelessWidget {
  final ValueBuilder<bool> builder;
  final ValueListenable<bool> valueListenable;

  const BoolListener({required this.builder, required this.valueListenable,});

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<bool>(
      valueListenable: valueListenable,
      builder: (context, activeOption, _) => builder(activeOption),
    );
  }
}