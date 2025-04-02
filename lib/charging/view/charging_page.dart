import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parking_app/charging/charging.dart';

class ChargingPage extends StatelessWidget {
  const ChargingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChargingCubit(),
      child: const ChargingView(),
    );
  }
}

class ChargingView extends StatelessWidget {
  const ChargingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChargingCubit, ChargingState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
