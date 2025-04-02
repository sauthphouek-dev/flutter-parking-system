// home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_app/home/home.dart';
import 'package:parking_app/parking_map/cubit/user_current_location/check_location_permission_cubit.dart';
import 'package:parking_app/parking_map/cubit/user_current_location/get_user_position_cubit.dart';
import 'package:parking_app/parking_map/parking_map.dart';
import 'package:parking_app/shared/utils/app_colors.dart';
import 'package:parking_app/shared/utils/app_spacing.dart';
import 'package:parking_app/shared/widgets/fade_in_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const path = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CheckLocationPermissionCubit _checkLocationPermissionCubit;
  late GetUserPositionCubit _getUserPositionCubit;

  @override
  void initState() {
    super.initState();

    _checkLocationPermissionCubit =
        context.read<CheckLocationPermissionCubit>();
    _getUserPositionCubit = context.read<GetUserPositionCubit>();

    _checkLocationPermissionCubit.checkLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BlocListener<CheckLocationPermissionCubit,
            CheckLocationPermissionState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state.status == LocationPermissionStatus.always) {
              _getUserPositionCubit.getUserCurrentLocation();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: Colors.white.withAlpha(0),
              title: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  'assets/images/profile.png',
                ), // Add your profile image in assets
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    context.push(ParkingMapPage.path);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.md,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/pin.svg',
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const Text(
                              'Hello, Muhammad',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 10),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Made easy\n',
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Vehicle type selection (Car, Bike, Bus)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildVehicleButton(
                                context,
                                icon: SvgPicture.asset(
                                  'assets/svg/Car.svg',
                                  height: 50,
                                  width: 50,
                                ),
                                label: 'Car',
                                isSelected:
                                    state.selectedVehicle == VehicleType.car,
                                onTap: () => context
                                    .read<HomeCubit>()
                                    .selectVehicle(VehicleType.car),
                              ),
                              _buildVehicleButton(
                                context,
                                icon: SvgPicture.asset(
                                  'assets/svg/Bike.svg',
                                  height: 50,
                                  width: 50,
                                ),
                                label: 'Bike',
                                isSelected:
                                    state.selectedVehicle == VehicleType.bike,
                                onTap: () => context
                                    .read<HomeCubit>()
                                    .selectVehicle(VehicleType.bike),
                              ),
                              _buildVehicleButton(
                                context,
                                icon: SvgPicture.asset(
                                  'assets/svg/Bus.svg',
                                  height: 50,
                                  width: 50,
                                ),
                                label: 'Bus',
                                isSelected:
                                    state.selectedVehicle == VehicleType.bus,
                                onTap: () => context
                                    .read<HomeCubit>()
                                    .selectVehicle(VehicleType.bus),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // line
                            Image.asset(
                              'assets/images/line.png',
                              width: 12,
                              height: MediaQuery.of(context).size.height * 0.5,
                            ),
                            const SizedBox(width: 16),
                            BlocSelector<HomeCubit, HomeState, VehicleType>(
                              selector: (state) {
                                return state.selectedVehicle;
                              },
                              builder: (context, state) {
                                if (state == VehicleType.bus) {
                                  return FadeInUp(
                                    child: Image.asset(
                                      'assets/images/bus.png',
                                      width: 183,
                                    ),
                                  );
                                } else if (state == VehicleType.bike) {
                                  return FadeInUp(
                                    child: Image.asset(
                                      'assets/images/bike.png',
                                      width: 183,
                                    ),
                                  );
                                } else {
                                  return FadeInUp(
                                    child: Image.asset(
                                      'assets/images/car_lighting.png',
                                      width: 183,
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/images/line.png',
                              width: 12,
                              height: MediaQuery.of(context).size.height * 0.5,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your logic for "Start to add car" button
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(40),
                    ),
                    child: const Text(
                      'Start\nto add car',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildVehicleButton(
    BuildContext context, {
    required SvgPicture icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.shade100,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.black : const Color(0xFF5D5A6D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
