import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'parking_ticket_state.dart';

class ParkingTicketCubit extends Cubit<ParkingTicketState> {
  ParkingTicketCubit() : super(const ParkingTicketState());
}
