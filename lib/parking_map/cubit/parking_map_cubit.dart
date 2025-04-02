import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'parking_map_state.dart';

class ParkingMapCubit extends Cubit<ParkingMapState> {
  ParkingMapCubit() : super(const ParkingMapState());
}
