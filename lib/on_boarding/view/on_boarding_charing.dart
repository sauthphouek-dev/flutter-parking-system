import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_app/home/home.dart';
import 'package:parking_app/shared/utils/app_colors.dart';
import 'package:parking_app/shared/widgets/eleveated_button_widget.dart';
import 'package:parking_app/shared/widgets/fade_in_up.dart';

class OnBoardingChargingPage extends StatefulWidget {
  const OnBoardingChargingPage({super.key});

  static const path = '/onboarding/charging';

  @override
  _OnBoardingChargingPageState createState() => _OnBoardingChargingPageState();
}

class _OnBoardingChargingPageState extends State<OnBoardingChargingPage>
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
      begin: Offset.zero, // Start from the center
      end: const Offset(0, -1), // Move to the top
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Animated Car Image
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/line.png',
                    width: 12,
                  ),
                  const SizedBox(width: 16),
                  FadeInUp(
                    child: Image.asset(
                      'assets/images/car_lighting.png',
                      width: 183,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Image.asset(
                    'assets/images/line.png',
                    width: 12,
                  ),
                ],
              ),
            ),
            const Spacer(),
            FadeInUp(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // svg

                        SvgPicture.asset(
                          'assets/svg/flash.svg',
                          height: 24,
                          width: 24,
                        ),

                        SizedBox(width: 8),
                        const Text(
                          'Charging',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Awesome 🧤\nexperience car energy charge',
                            style: TextStyle(
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
            // Buttons Section
            const SizedBox(height: 32),
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
                          context.go(HomePage.path);
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
}
