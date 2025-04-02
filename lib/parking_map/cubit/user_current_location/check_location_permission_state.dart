part of 'check_location_permission_cubit.dart';

enum LocationPermissionStatus {
  initial,
  denied,
  deniedForever,
  whileInUse,
  always,
}

class CheckLocationPermissionState extends Equatable {
  final LocationPermissionStatus status;
  final String message;

  const CheckLocationPermissionState({
    this.status = LocationPermissionStatus.initial,
    this.message = '',
  });

  CheckLocationPermissionState copyWith({
    LocationPermissionStatus? status,
    String? message,
  }) {
    return CheckLocationPermissionState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, message];
}
