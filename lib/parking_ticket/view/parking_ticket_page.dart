import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:parking_app/home/home.dart';
import 'package:parking_app/payment/view/payment_page.dart';
import 'package:parking_app/shared/utils/app_colors.dart';
import 'package:parking_app/shared/utils/app_font_weight.dart';
import 'package:parking_app/shared/utils/app_spacing.dart';
import 'package:parking_app/shared/widgets/eleveated_button_widget.dart';

class ParkingTicket {
  ParkingTicket({
    required this.registrationNumber,
    required this.ownerName,
    required this.zone,
    required this.ticketType,
    required this.startTime,
    required this.endTime,
    required this.paymentMethod,
    required this.cardNumber,
    required this.cardHolder,
    required this.totalCost,
    required this.currency,
  });
  final String registrationNumber;
  final String ownerName;
  final String zone;
  final String ticketType;
  final DateTime startTime;
  final DateTime endTime;
  final String paymentMethod;
  final String cardNumber;
  final String cardHolder;
  final double totalCost;
  final String currency;

  static final parkingTicket = ParkingTicket(
    registrationNumber: 'ZG12341G',
    ownerName: 'Mamin AUTO',
    zone: 'Zone 1 - Rovinj',
    ticketType: 'Hourly parking ticket',
    startTime: DateTime(2022, 3, 6, 15, 6),
    endTime: DateTime(2022, 3, 6, 15, 41),
    paymentMethod: 'mastercard',
    cardNumber: '3056****5904',
    cardHolder: 'Ivan Horvat . 06/26',
    totalCost: 1.00,
    currency: 'HRK',
  );
}

class ParkingTicketDetailsScreen extends StatefulWidget {
  const ParkingTicketDetailsScreen({super.key});

  static const path = '/parking-ticket-details';

  @override
  State<ParkingTicketDetailsScreen> createState() =>
      _ParkingTicketDetailsScreenState();
}

class _ParkingTicketDetailsScreenState
    extends State<ParkingTicketDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Parking Ticket Details',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ticket Summary Card
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.lg,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.lg),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.green,
                      child: Text(
                        'P',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${ParkingTicket.parkingTicket.registrationNumber} ${ParkingTicket.parkingTicket.ownerName}',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${ParkingTicket.parkingTicket.zone} - ${ParkingTicket.parkingTicket.ticketType}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.location_on, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Log Activities Section
              Text(
                'Log activities',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.green,
                      ),
                      Container(
                        width: 2,
                        height: 40,
                        color: Colors.grey[200],
                        // dash
                      ),
                      const CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      _buildLogActivity(
                        context,
                        time: ParkingTicket.parkingTicket.startTime,
                        isStart: true,
                      ),
                      const SizedBox(height: 16),
                      _buildLogActivity(
                        context,
                        time: ParkingTicket.parkingTicket.endTime,
                        isStart: false,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              // Payment Details Section
              const PaymentOption(
                iconPath: 'assets/svg/mastercard.svg',
                cardNumber: '5213****4854',
                subTitle: 'Ivan Horvat . 06/26',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 96,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButtonWidget(
                  onPressed: () {
                    context.go(HomePage.path);
                  },
                  title: 'Confirm',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogActivity(
    BuildContext context, {
    required DateTime time,
    required bool isStart,
  }) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${DateFormat('HH:mm').format(time)} ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text: DateFormat('dd.MM.yyyy').format(time),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
