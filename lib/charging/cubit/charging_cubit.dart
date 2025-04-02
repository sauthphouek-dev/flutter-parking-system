import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'charging_state.dart';

class ChargingCubit extends Cubit<ChargingState> {
  ChargingCubit() : super(const ChargingState());
}
