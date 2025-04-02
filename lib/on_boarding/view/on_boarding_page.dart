import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_app/home/view/home_page.dart';
import 'package:parking_app/on_boarding/view/on_boarding_charing.dart';
import 'package:parking_app/shared/utils/app_colors.dart';
import 'package:parking_app/shared/widgets/eleveated_button_widget.dart';
import 'package:parking_app/shared/widgets/fade_in_up.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  // static const path = '/onboarding';
  static const path = '/onboarding';

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    // Define the animation: Slide from left (-1.0) to right (1.0)
    _animation = Tween<Offset>(
      begin: const Offset(-1, 0), // Start from the left (off-screen)
      end: Offset.zero, // End at the right (off-screen)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth animation curve
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Animated Car Image
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  buildCircleContainer(),
                  Positioned(
                    top: 0,
                    left: -280,
                    right: 0,
                    child: SlideTransition(
                      position: _animation,
                      child: Container(
                        margin: EdgeInsets.only(top: height * 0.13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/car.png',
                              height: 183,
                            ),
                            Image.asset(
                              'assets/images/light.png',
                              height: 183,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),

            FadeInUp(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.directions_car,
                          color: Colors.green,
                          size: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Car Parking',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'You can feel best\nperformance on\nyour drive 💪',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold,
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
            ),
            const SizedBox(height: 32),
            // Buttons Section
            FadeInUp(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip Button
                    Expanded(
                      flex: 3,
                      child: ElevatedButtonWidget(
                        onPressed: () {
                          // Handle Skip button press
                          context.go(HomePage.path);
                        },
                        title: 'Skip',
                        backgroundColor: AppColors.secondary,
                        foregroundColor: Colors.black54,
                      ),
                    ),
                    // Next Button
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 4,
                      child: ElevatedButtonWidget(
                        onPressed: () {
                          // Handle Next button press
                          context.go(OnBoardingChargingPage.path);
                        },
                        title: 'Next',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // build circle container
  Widget buildCircleContainer() {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: height * 0.9,
      height: height * 0.9,
      padding: EdgeInsets.all(height * 0.06),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // radial gradient
        gradient: RadialGradient(
          colors: [
            const Color(0xFFEFEEF6),
            const Color(0xFFD6D3D1).withAlpha(0),
          ],
          stops: const [0, 1],
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(height * 0.05),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Color(0xFFE5E5E5),
              Color(0xFFFFFFFF),
            ],
            stops: [0, 1],
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Color(0xFFEFEEF6),
                Color(0xFFFFFFFF),
              ],
              stops: [0, 1],
            ),
          ),
        ),
      ),
    );
  }
}
