/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Functional wrapper for Success or Failure states.
 * Relevant Info: Used exclusively in Data and Domain layers. */

import 'package:core/src/error/app_error.dart';

sealed class ResultWrapper<T> {
  const ResultWrapper();

  R when<R>({
    required R Function(T data) success,
    required R Function(AppError error) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else {
      return failure((this as Failure<T>).error);
    }
  }
}

class Success<T> extends ResultWrapper<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ResultWrapper<T> {
  final AppError error;
  const Failure(this.error);
}
