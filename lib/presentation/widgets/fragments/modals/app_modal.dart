import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/lma_scaler.dart';
import 'package:baker_app/services/utilities/typedefs.dart';
import 'package:flutter/material.dart';

class BakerBottomModal {
  ValueBuilder<ScrollController>? builder;

  BakerBottomModal({
    required this.ctx,
    required this.modalWidget,
    this.isDismissable = true,
    this.canDragToClose = true,
    this.isScrollable = false,
    this.canPop = true,
    this.isPadded = true,
    this.padding,
    this.borderRadius = BakerFontSizes.px24,
  })  : builder = null,
        maxChildSize = .9,
        minChildSize = .7,
        initialChildSize = .7,
        _isDraggble = false {
    _showModal = _init(ctx);
  }

  BakerBottomModal.draggable({
    required this.ctx,
    required this.builder,
    this.minChildSize = .3,
    this.initialChildSize = .7,
    this.maxChildSize = .9,
    this.isPadded = true,
    this.padding,
    this.borderRadius = BakerFontSizes.px24,
  })  : _isDraggble = true,
        modalWidget = const Offstage(),
        isScrollable = true,
        canPop = true,
        canDragToClose = true,
        isDismissable = true,
        assert(maxChildSize >= .1 && maxChildSize <= 1),
        assert(minChildSize >= 0 && minChildSize <= 1),
        assert(initialChildSize >= .1 && initialChildSize <= 1) {
    _showModal = _init(ctx);
  }

  final BuildContext ctx;
  final Widget modalWidget;
  final double initialChildSize;
  final double maxChildSize;
  final double borderRadius;
  final double minChildSize;
  final EdgeInsets? padding;
  bool isDismissable;
  bool isPadded;
  bool canDragToClose;
  bool _isDraggble;
  bool canPop;
  bool isScrollable;

  Future? _showModal;

  Widget _body(
    BuildContext context, {
    ScrollController? controller,
    required BakerScaleUtil scaler,
  }) {
    final _padding = padding != null
        ? padding!
        : scaler.insets.symmetric(horizontal: isPadded ? 5 : 0);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: _padding,
            decoration: BoxDecoration(
              color: BakerColors.white,
              borderRadius: _borderRadius(scaler, context),
            ),
            child: ClipRRect(
              child: controller != null ? builder!(controller) : modalWidget,
              borderRadius: _borderRadius(scaler, context),
            ),
          ),
        ],
      ),
    );
  }

  Widget body(BuildContext context, {ScrollController? controller}) {
    return _body(
      context,
      scaler: context.scaler,
      controller: controller,
    );
  }

  BorderRadius _borderRadius(BakerScaleUtil scaler, BuildContext context) {
    final radius = scaler.fontSizer.sp(borderRadius);

    return BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );
  }

  Future<dynamic> _initMobile(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isDismissible: isDismissable,
      enableDrag: canDragToClose,
      isScrollControlled: isScrollable,
      backgroundColor: BakerColors.transparent,
      builder: (_) {
        if (_isDraggble) {
          return DraggableScrollableSheet(
            initialChildSize: initialChildSize,
            maxChildSize: maxChildSize,
            minChildSize: minChildSize,
            builder: (context, scrollController) {
              return body(context, controller: scrollController);
            },
          );
        }
        return WillPopScope(
          onWillPop: () async => canPop,
          child: body(context),
        );
      },
    );
  }

  Future<dynamic> _init(BuildContext context) async {
    return _initMobile(context);
  }

  Future? get showModal => _showModal;
}
