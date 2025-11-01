import 'package:carcirus/core/resources/app_asset.dart';
import 'package:carcirus/core/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;

  const BottomSheetTimePicker({
    super.key,
    required this.initialTime,
  });

  @override
  State<BottomSheetTimePicker> createState() => _BottomSheetTimePickerState();
}

class _BottomSheetTimePickerState extends State<BottomSheetTimePicker> {
  final hours = List.generate(12, (i) => i + 1);
  final minutes = [0, 30]; // hanya 00 dan 30

  late int selectedHour;
  late int selectedMinute;
  late String selectedPeriod;

  late FixedExtentScrollController hourController;
  late FixedExtentScrollController minuteController;
  late FixedExtentScrollController periodController;

  @override
  void initState() {
    super.initState();

    selectedHour = widget.initialTime.hourOfPeriod == 0
        ? 12
        : widget.initialTime.hourOfPeriod;
    selectedMinute = widget.initialTime.minute;
    selectedPeriod = widget.initialTime.period == DayPeriod.pm ? 'PM' : 'AM';

    hourController = FixedExtentScrollController(
      initialItem: selectedHour == 0 ? 11 : selectedHour - 1,
    );

    int closestMinute = (selectedMinute >= 15 && selectedMinute < 45) ? 30 : 0;

    minuteController = FixedExtentScrollController(
      initialItem: minutes.indexOf(closestMinute),
    );

    periodController = FixedExtentScrollController(
      initialItem: selectedPeriod == "PM" ? 0 : 1,
    );

    selectedMinute = closestMinute;

  }

  @override
  void dispose() {
    hourController.dispose();
    minuteController.dispose();
    periodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              AppAssets.imgClose,
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 16),
            child: Text(
              "Pick-up Time",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10),
          // Picker Section
          SizedBox(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hour
                Expanded(
                  child: CupertinoPicker(
                    scrollController: hourController,
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedHour = hours[index];
                      });
                    },
                    children: List.generate(hours.length, (index) {
                      final isSelected = hours[index] == selectedHour;
                      return Center(
                        child: Text(
                          hours[index].toString().padLeft(2, '0'),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            color: isSelected ? AppColors.textBlack02 : AppColors.lightGray,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const Text(":", style: TextStyle(fontSize: 16)),
                // Minute
                Expanded(
                  child: CupertinoPicker(
                    scrollController: minuteController,
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedMinute = minutes[index];
                      });
                    },
                    children: List.generate(minutes.length, (index) {
                      final isSelected = minutes[index] == selectedMinute;
                      return Center(
                        child: Text(
                          minutes[index].toString().padLeft(2, '0'),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            color: isSelected
                                ? AppColors.textBlack02
                                : AppColors.lightGray,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                // Period
                Expanded(
                  child: CupertinoPicker(
                    scrollController: periodController,
                    itemExtent: 40,
                    onSelectedItemChanged: (i) {
                      setState(() {
                        selectedPeriod = i == 0 ? "PM" : "AM";
                      });
                    },
                    children: List.generate(2, (index) {
                      final period = index == 0 ? "PM" : "AM";
                      final isSelected = selectedPeriod == period;

                      return Center(
                        child: Text(
                          period,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            color: isSelected
                                ? AppColors.textBlack02
                                : AppColors.lightGray,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Apply Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6FCF97),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                final hourIndex = hourController.selectedItem;
                final minuteIndex = minuteController.selectedItem;
                final periodIndex = periodController.selectedItem;

                final hourValue = hours[hourIndex];
                final minuteValue = minutes[minuteIndex];
                final periodValue = periodIndex == 0 ? 'PM' : 'AM';

                final hour = periodValue == 'PM'
                    ? (hourValue % 12) + 12
                    : hourValue % 12;

                Navigator.pop(
                  context,
                  TimeOfDay(hour: hour, minute: minuteValue),
                );
              },
              child: const Text(
                "Apply",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

