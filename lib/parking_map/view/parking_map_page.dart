import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/parking_map/cubit/user_current_location/get_user_position_cubit.dart';

import 'package:parking_app/parking_map/parking_map.dart';
import 'package:parking_app/payment/view/payment_page.dart';
import 'package:parking_app/shared/utils/app_colors.dart';
import 'package:parking_app/shared/utils/app_spacing.dart';
import 'package:parking_app/shared/widgets/eleveated_button_widget.dart';

class ParkingMapPage extends StatelessWidget {
  const ParkingMapPage({super.key});

  static const path = '/parking-map';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ParkingMapCubit(),
      child: ParkingMapScreen(),
    );
  }
}

// Data class to hold parking spot information
class ParkingSpot {
  ParkingSpot({
    required this.markerId,
    required this.position,
    required this.zone,
    required this.timeSlot,
    required this.price,
  });

  final String markerId;
  final LatLng position;
  final String zone;
  final String timeSlot;
  final String price;
}

class ParkingMapScreen extends StatefulWidget {
  @override
  _ParkingMapScreenState createState() => _ParkingMapScreenState();
}

class _ParkingMapScreenState extends State<ParkingMapScreen> {
  // Initial position for the map (San Francisco as an example)
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: const LatLng(37.7749, -122.4194),
    zoom: 15.47,
  );

  // List of parking spots with their details
  late List<ParkingSpot> _parkingSpots;
  late Set<Marker> _markers;

  @override
  void initState() {
    super.initState();

    // Initialize parking spots with their details
    _parkingSpots = [
      ParkingSpot(
        markerId: '1',
        position: const LatLng(37.7749, -122.4194),
        zone: 'A-013',
        timeSlot: '10:02 PM - 12:20 AM',
        price: r'$20',
      ),
      ParkingSpot(
        markerId: '2',
        position: const LatLng(37.7750, -122.4180),
        zone: 'B-005',
        timeSlot: '9:00 AM - 11:00 AM',
        price: r'$15',
      ),
      ParkingSpot(
        markerId: '3',
        position: const LatLng(37.7730, -122.4200),
        zone: 'C-007',
        timeSlot: '1:00 PM - 3:00 PM',
        price: '\$25',
      ),
      ParkingSpot(
        markerId: '4',
        position: const LatLng(37.7760, -122.4170),
        zone: 'D-009',
        timeSlot: '6:00 PM - 8:00 PM',
        price: '\$18',
      ),
      ParkingSpot(
        markerId: '5',
        position: const LatLng(37.7720, -122.4210),
        zone: 'E-011',
        timeSlot: '3:00 PM - 5:00 PM',
        price: r'$22',
      ),
      ParkingSpot(
        markerId: '6',
        position: const LatLng(37.7710, -122.4190),
        zone: 'F-003',
        timeSlot: '7:00 AM - 9:00 AM',
        price: r'$10',
      ),
    ];

    // Create markers from parking spots
    _markers = _parkingSpots.map((spot) {
      return Marker(
        markerId: MarkerId(spot.markerId),
        position: spot.position,
        onTap: () => _showParkingDetails(spot),
      );
    }).toSet();
  }

  // Function to show parking details in a bottom sheet
  void _showParkingDetails(ParkingSpot spot) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Book your car\n',
                      style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: 'Parking',
                      style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.shade100,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Zone and Icon Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Zone',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              spot.zone,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Time Slot and Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time Slot',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              spot.timeSlot,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          spot.price,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Start Booking Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButtonWidget(
                  title: 'Start Booking',
                  backgroundColor: AppColors.yellow,
                  foregroundColor: Colors.black,
                  onPressed: () {
                    context.push(SelectPaymentScreen.path, extra: spot);
                  },
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      // Body with Google Map
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            markers: _markers,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: buildAppBar(),
          ),
        ],
      ),
    );
  }

  // build app bar
  Widget buildAppBar() {
    return AppBar(
      leadingWidth: 56,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          margin: const EdgeInsets.only(
            left: 8,
            top: 6,
            bottom: 6,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      title: const Text(
        'Parking Map',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white.withAlpha(80),
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}
