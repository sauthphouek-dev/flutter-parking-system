part of 'get_user_position_cubit.dart';

enum GetUserPositionStatus { initial, loading, loaded, failure }

class GetUserPositionState extends Equatable {
  const GetUserPositionState({
    this.status = GetUserPositionStatus.initial,
    this.currentPosition,
  });

  final GetUserPositionStatus status;
  final LatLng? currentPosition;

  // copy with
  GetUserPositionState copyWith({
    GetUserPositionStatus? status,
    LatLng? currentPosition,
  }) {
    return GetUserPositionState(
      status: status ?? this.status,
      currentPosition: currentPosition ?? this.currentPosition,
    );
  }

  @override
  List<Object?> get props => [status, currentPosition];
}
