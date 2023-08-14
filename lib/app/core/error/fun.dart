  import '../strings/failures.dart';
import 'failures.dart';

String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return FailureMessage.SERVER_FAILURE;
      case EmptyCacheFailure:
        return FailureMessage.CACHE_FAILURE;
      default:
        return FailureMessage.UNEXPECTED_ERROR;
    }
  }