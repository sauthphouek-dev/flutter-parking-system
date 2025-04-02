import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_progess_state.dart';

class BookingProgessCubit extends Cubit<BookingProgessState> {
  BookingProgessCubit() : super(const BookingProgessState());
}
