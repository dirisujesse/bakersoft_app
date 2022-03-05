import 'package:baker_app/services/logging/little_logger.dart';
import 'package:baker_app/services/utilities/typedefs.dart';

mixin AppQueryMixin {
  Future<T> queryHandler<T>(
    QueryFuture<T> func,
  ) async {
    try {
      final result = await func();
      return result;
    } catch (e, t) {
      BakerLogger.severe("$e", stackTrace: t, error: e);
      throw e;
    }
  }
}
