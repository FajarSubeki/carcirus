import 'package:flutter/material.dart';
import '../../../core/widgets/app_button.dart';
import '../widgets/date_time_picker.dart';
import '../widgets/rent_benefit_item.dart';
import '../widgets/how_to_rent_item.dart';

class RentScreen extends StatelessWidget {
  const RentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Scaffold background diatur ke putih, ini akan menjadi warna bagian bawah
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Rent Car'),
        backgroundColor: Colors.blue.shade700, // Atur warna AppBar agar sesuai
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          // 2. Padding dihilangkan agar Container biru bisa full-width
          padding: EdgeInsets.zero,
          children: [
            // --- BAGIAN BIRU (Header dan DateTimePickers) ---
            Container(
              width: double.infinity,
              // Warna biru untuk latar belakang bagian atas
              color: Colors.blue.shade700,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Teks diubah warnanya menjadi putih agar kontras
                  const Text(
                    'Looking for a car rental?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // <-- Ubah ke Putih
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Book now and enjoy 10% off your first week's rental!",
                    style: TextStyle(color: Colors.white70), // <-- Ubah ke Putih Muda
                  ),
                  const SizedBox(height: 16),

                  // Container untuk DateTimePicker tetap Putih
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const DateTimePicker(
                          label: 'Pick-up date',
                          value: 'Aug 27, Thursday',
                          icon: Icons.calendar_today_outlined,
                        ),
                        const SizedBox(height: 12),
                        const DateTimePicker(
                          label: 'Pick-up time',
                          value: '12.00 AM',
                          icon: Icons.access_time_outlined,
                        ),
                        const SizedBox(height: 12),
                        AppButton(
                          text: 'Select My Car',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  RichText(
                    text: TextSpan(
                      text: 'Why ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'CarCircus',
                          style: TextStyle(
                            color: Color(0xFF66B984),
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 24,
                    runSpacing: 16,
                    children: const [
                      RentBenefitItem(
                        title: 'Start with \$300/week',
                        icon: Icons.workspace_premium_outlined,
                      ),
                      RentBenefitItem(
                        title: 'Reasonable price',
                        icon: Icons.price_check_outlined,
                      ),
                      RentBenefitItem(
                        title: 'Well maintained cars',
                        icon: Icons.directions_car_filled_outlined,
                      ),
                      RentBenefitItem(
                        title: 'Drive with unlimited mileage',
                        icon: Icons.speed_outlined,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'How to rent car',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      HowToRentItem(
                        step: 1,
                        title: 'Find your ride',
                        desc:
                        'Set your pick-up date & time. Tap ‘Book Now’ to make a reservation for available car.',
                      ),
                      HowToRentItem(
                        step: 2,
                        title: 'Fill the submission',
                        desc:
                        'You can fill the submission form and review details provided by the app.',
                      ),
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
