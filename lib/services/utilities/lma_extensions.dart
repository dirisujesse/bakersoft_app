import 'package:flutter/widgets.dart';
import 'package:baker_app/services/utilities/lma_scaler.dart';

extension WidgetExtensions on Widget {
  List<Widget> operator *(int count) {
    return List.generate(count, (_) => this);
  }
}

extension ScaleExtension on BuildContext {
  BakerScaleUtil get scaler => BakerScaleUtil(this);

  Size get size => scaler.size;

  Offset get offset => scaler.position;

  resetFocus() {
    FocusScope.of(this).requestFocus(FocusNode());
  }
}

extension DateExtension on DateTime {
  bool operator <(DateTime? other) {
    if (other == null) return false;
    return this.millisecondsSinceEpoch < other.millisecondsSinceEpoch;
  }

  bool operator <=(DateTime? other) {
    if (other == null) return false;
    return this.millisecondsSinceEpoch <= other.millisecondsSinceEpoch;
  }

  bool operator >(DateTime? other) {
    if (other == null) return true;
    return this.millisecondsSinceEpoch > other.millisecondsSinceEpoch;
  }

  bool operator >=(DateTime? other) {
    if (other == null) return true;
    return this.millisecondsSinceEpoch >= other.millisecondsSinceEpoch;
  }
}

extension SnapshotExtension on AsyncSnapshot {
  bool get isLoading {
    return this.connectionState == ConnectionState.waiting;
  }

  bool get isLoaded {
    return !isLoading && !this.hasError && this.hasData;
  }

  bool get isEmpty {
    if ((this.data is Iterable?) || (this.data is Iterable)) {
      return !this.hasData || ((this.data as Iterable?)?.isEmpty ?? false);
    }
    return !this.hasData;
  }
}
