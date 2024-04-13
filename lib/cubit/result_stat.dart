import 'package:apis/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_stat.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.idle() = Idle<T>;

  const factory ResultState.loading() = Loading<T>;

  const factory ResultState.success(T data) = Success<T>;

  const factory ResultState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}