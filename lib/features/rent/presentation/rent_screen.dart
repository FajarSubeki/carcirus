import 'package:carcirus/core/resources/app_asset.dart';
import 'package:carcirus/core/resources/app_colors.dart';
import 'package:carcirus/core/widgets/bottom_sheet_date_picker.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/app_button.dart';
import '../widgets/date_time_picker.dart';
import '../widgets/rent_benefit_item.dart';
import '../widgets/how_to_rent_item.dart';

class RentScreen extends StatefulWidget {
  const RentScreen({super.key});

  @override
  State<RentScreen> createState() => _RentScreen();
}

class _RentScreen extends State<RentScreen> {

  DateTime? _selectedDate;

  void _showDatePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BottomSheetDatePicker(
          initialDate: _selectedDate ?? DateTime.now(),
          onDateSelected: (date) {
            setState(() {
              _selectedDate = date;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final formattedDate = _selectedDate == null
        ? 'Select date'
        : "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}";

    final benefits = [
      RentBenefitItemData(
        title: 'Start with \$300/week',
        imagePath: AppAssets.imgReason1,
      ),
      RentBenefitItemData(
        title: 'Reasonable price',
        imagePath: AppAssets.imgReason2,
      ),
      RentBenefitItemData(
        title: 'Well maintained cars',
        imagePath: AppAssets.imgReason3,
      ),
      RentBenefitItemData(
        title: 'Drive with unlimited mileage',
        imagePath: AppAssets.imgReason4,
      ),
    ];

    final howToRentItems = [
      const HowToRentItem(
        step: 1,
        title: 'Find your ride',
        desc:
        'Set your pick-up date & time. Tap ‘Book Now’ to make a reservation for available car.',
      ),
      const HowToRentItem(
        step: 2,
        title: 'Fill the submission',
        desc:
        'You can fill the form submission and we are going to make sure you are provided by our services.',
      ),
    ];

    return Scaffold(
      // 1. Scaffold background diatur ke putih, ini akan menjadi warna bagian bawah
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            AppAssets.imgAppLogo,
            height: 34,
            width: 89,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: double.infinity,
              color: AppColors.primaryBlue,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 24),
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
                        DateTimePicker(
                          label: 'Pick-up date',
                          value: formattedDate,
                          iconPath: AppAssets.imgCalendar,
                          onTap: _showDatePicker,
                        ),
                        const SizedBox(height: 12),
                        const DateTimePicker(
                          label: 'Pick-up time',
                          value: '12.00 AM',
                          iconPath: AppAssets.imgTime,
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
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'CarCircus',
                          style: TextStyle(
                            color: Color(0xFF66B984),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 kolom
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 3.2, // sesuaikan proporsi agar rapi
                    ),
                    itemCount: benefits.length,
                    itemBuilder: (context, index) {
                      final item = benefits[index];
                      return RentBenefitItem(
                        title: item.title,
                        imagePath: item.imagePath,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'How to rent car',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 193,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: howToRentItems.length,
                      itemBuilder: (context, index) {
                        final item = howToRentItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: HowToRentItem(
                            step: item.step,
                            title: item.title,
                            desc: item.desc,
                          ),
                        );
                      },
                    ),
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
