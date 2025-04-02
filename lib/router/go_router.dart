// go router

import 'package:go_router/go_router.dart';
import 'package:parking_app/home/view/home_page.dart';
import 'package:parking_app/on_boarding/view/on_boarding_charing.dart';
import 'package:parking_app/on_boarding/view/on_boarding_page.dart';
import 'package:parking_app/parking_map/view/parking_map_page.dart';
import 'package:parking_app/parking_ticket/parking_ticket.dart';
import 'package:parking_app/payment/view/payment_page.dart';

class GlobalRouter {
  static final GoRouter instance = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: OnBoardingChargingPage.path,
        builder: (context, state) => const OnBoardingChargingPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: ParkingMapPage.path,
        builder: (context, state) => const ParkingMapPage(),
      ),

      // select payment
      GoRoute(
        path: SelectPaymentScreen.path,
        builder: (context, state) {
          final args = state.extra;
          return SelectPaymentScreen(
            parkingSpot: args! as ParkingSpot,
          );
        },
      ),

      // payment
      GoRoute(
        path: ParkingTicketDetailsScreen.path,
        builder: (context, state) => const ParkingTicketDetailsScreen(),
      ),
    ],
  );
}
