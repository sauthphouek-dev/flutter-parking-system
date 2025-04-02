part of 'home_cubit.dart';

enum VehicleType { car, bike, bus }

class HomeState {
  HomeState({this.selectedVehicle = VehicleType.car});
  final VehicleType selectedVehicle;
}
