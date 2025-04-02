import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'get_user_position_state.dart';

class GetUserPositionCubit extends Cubit<GetUserPositionState> {
  GetUserPositionCubit() : super(const GetUserPositionState());

  // get user current location
  Future<void> getUserCurrentLocation() async {
    emit(
      state.copyWith(
        status: GetUserPositionStatus.loading,
      ),
    );
    try {
      await Geolocator.checkPermission().then((permission) async {
        if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
          final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          emit(
            state.copyWith(
              status: GetUserPositionStatus.loaded,
              currentPosition: LatLng(position.latitude, position.longitude),
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: GetUserPositionStatus.failure,
            ),
          );
        }
      });
    } catch (e) {
      emit(
        state.copyWith(
          status: GetUserPositionStatus.failure,
        ),
      );
    }
  }
}
