import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_app/home/home.dart';
import 'package:parking_app/parking_map/view/parking_map_page.dart';
import 'package:parking_app/parking_ticket/parking_ticket.dart';
import 'package:parking_app/parking_ticket/parking_ticket.dart';

import 'package:parking_app/payment/payment.dart';
import 'package:parking_app/shared/utils/app_font_weight.dart';

class SelectPaymentScreen extends StatelessWidget {
  const SelectPaymentScreen({required this.parkingSpot, super.key});

  static const String path = '/select-payment';

  final ParkingSpot parkingSpot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Payment Method',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontWeight: AppFontWeight.bold,
              ),
        ),
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
        backgroundColor: Colors.white.withAlpha(00),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // card num
            Text(
              'Cards',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                // icon
                Container(
                  width: 86,
                  height: 86,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade100,
                      width: 4,
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/wallet.svg',
                    width: 32,
                    height: 32,
                  ),
                ),
                const SizedBox(width: 8),
                // card num
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HRK 60.00',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: AppFontWeight.semiBold,
                            fontSize: 24,
                            color: const Color(0xFF27B482),
                          ),
                    ),
                    Text(
                      'Account',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: AppFontWeight.semiBold,
                            fontSize: 14,
                            color: const Color(0xFF333333),
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            Text(
              'Credit Card',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                    fontSize: 26,
                  ),
            ),
            const SizedBox(height: 12),
            PaymentOption(
              cardNumber: '3056****5904',
              subTitle: 'Ivan Horvat . 06/26',
              iconPath: 'assets/svg/visa.svg',
              onTap: () {
                context.push(ParkingTicketDetailsScreen.path);
              },
            ),
            const SizedBox(height: 16),
            PaymentOption(
              cardNumber: '5213****4854',
              subTitle: 'Ivan Horvat . 06/26',
              iconPath: 'assets/svg/mastercard.svg',
              onTap: () {
                context.push(ParkingTicketDetailsScreen.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  const PaymentOption({
    required this.cardNumber,
    required this.subTitle,
    required this.iconPath,
    super.key,
    this.onTap,
  });
  final String cardNumber;
  final VoidCallback? onTap;
  final String subTitle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 86,
            height: 86,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade100,
                width: 4,
              ),
            ),
            child: SvgPicture.asset(
              iconPath,
              width: 32,
              height: 32,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardNumber,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: AppFontWeight.medium,
                      fontSize: 24,
                      color: const Color(0xFF000000),
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: AppFontWeight.semiBold,
                      fontSize: 14,
                      color: const Color(0xFF333333),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
