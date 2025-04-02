import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parking_app/booking_progess/booking_progess.dart';

class BookingProgessPage extends StatelessWidget {
  const BookingProgessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingProgessCubit(),
      child: const BookingProgessView(),
    );
  }
}

class BookingProgessView extends StatelessWidget {
  const BookingProgessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingProgessCubit, BookingProgessState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
