import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:equatable/equatable.dart';

part 'check_location_permission_state.dart';

class CheckLocationPermissionCubit extends Cubit<CheckLocationPermissionState> {
  CheckLocationPermissionCubit() : super(const CheckLocationPermissionState());

  Future<void> checkLocationPermission() async {
    emit(state.copyWith(status: LocationPermissionStatus.initial));
    final permissionCheck = await Geolocator.checkPermission();

    if (permissionCheck == LocationPermission.denied || permissionCheck == LocationPermission.deniedForever) {
      final permission = await Geolocator.requestPermission();
      _handlePermissionResponse(permission);
    } else {
      _handleGrantedPermission();
    }

    Geolocator.getServiceStatusStream().listen((status) async {
      if (status == ServiceStatus.enabled) {
        final permission = await Geolocator.checkPermission();
        _handlePermissionResponse(permission);
      }
    });
  }

  void _handlePermissionResponse(LocationPermission permission) {
    if (permission == LocationPermission.denied) {
      emit(
        state.copyWith(
          message: 'Please enable your location permission.',
          status: LocationPermissionStatus.denied,
        ),
      );
      log("Location permission denied.");
    } else if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      emit(
        state.copyWith(
          message: 'Location permission granted.',
          status: LocationPermissionStatus.always,
        ),
      );
    } else if (permission == LocationPermission.deniedForever) {
      emit(
        state.copyWith(
          message: 'Location permission denied forever.',
          status: LocationPermissionStatus.deniedForever,
        ),
      );
      log("Location permission denied forever.");
    }
  }

  void _handleGrantedPermission() {
    emit(
      state.copyWith(
        message: 'Location permission granted.',
        status: LocationPermissionStatus.always,
      ),
    );
  }
}
