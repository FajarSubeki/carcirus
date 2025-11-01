import 'package:carcirus/core/resources/app_asset.dart';
import 'package:carcirus/core/resources/app_colors.dart';
import 'package:carcirus/core/widgets/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;

  const BottomSheetTimePicker({super.key, required this.initialTime});

  @override
  State<BottomSheetTimePicker> createState() => _BottomSheetTimePickerState();
}

class _BottomSheetTimePickerState extends State<BottomSheetTimePicker> {
  final hours = List.generate(12, (i) => i + 1);
  final minutes = [0, 30];

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
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Garis horizontal
                Positioned(
                  top: (150 / 2) - 20,
                  left: 40,
                  right: 40,
                  child: Column(
                    children: [
                      Container(
                        height: 1,
                        color: AppColors.lightGray.withOpacity(0.4),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        height: 1,
                        color: AppColors.lightGray.withOpacity(0.4),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      child: CupertinoPicker(
                        scrollController: hourController,
                        itemExtent: 40,
                        selectionOverlay: const SizedBox.shrink(),
                        onSelectedItemChanged: (index) {
                          setState(() => selectedHour = hours[index]);
                        },
                        children: hours.map((h) {
                          final isSelected = h == selectedHour;
                          return Center(
                            child: Text(
                              h.toString().padLeft(2, '0'),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.normal,
                                color: isSelected
                                    ? AppColors.textBlack02
                                    : AppColors.lightGray,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(":", style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 4),
                    SizedBox(
                      width: 60,
                      child: CupertinoPicker(
                        scrollController: minuteController,
                        itemExtent: 40,
                        selectionOverlay: const SizedBox.shrink(),
                        onSelectedItemChanged: (index) {
                          setState(() => selectedMinute = minutes[index]);
                        },
                        children: minutes.map((m) {
                          final isSelected = m == selectedMinute;
                          return Center(
                            child: Text(
                              m.toString().padLeft(2, '0'),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.normal,
                                color: isSelected
                                    ? AppColors.textBlack02
                                    : AppColors.lightGray,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                Positioned(
                  right: 38,
                  child: SizedBox(
                    width: 60,
                    child: CupertinoPicker(
                      scrollController: periodController,
                      itemExtent: 40,
                      selectionOverlay: const SizedBox.shrink(),
                      onSelectedItemChanged: (i) {
                        setState(() => selectedPeriod = i == 0 ? "PM" : "AM");
                      },
                      children: ["PM", "AM"].map((p) {
                        final isSelected = p == selectedPeriod;
                        return Center(
                          child: Text(
                            p,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.normal,
                              color: isSelected
                                  ? AppColors.textBlack02
                                  : AppColors.lightGray,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: 'Apply',
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
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
