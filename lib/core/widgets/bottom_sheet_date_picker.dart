import 'package:carcirus/core/resources/app_asset.dart';
import 'package:carcirus/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class BottomSheetDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const BottomSheetDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<BottomSheetDatePicker> createState() => _BottomSheetDatePickerState();
}

class _BottomSheetDatePickerState extends State<BottomSheetDatePicker> {
  late DateTime _visibleMonth;
  late DateTime? _selectedDate;
  final DateTime _today = DateTime.now();

  @override
  void initState() {
    super.initState();
    _visibleMonth = DateTime(widget.initialDate.year, widget.initialDate.month);
    _selectedDate = widget.initialDate;
  }

  void _changeMonth(int offset) {
    setState(() {
      _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month + offset);
      _selectedDate = null;
    });
  }

  String _monthTitle(DateTime date) {
    const monthNames = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return "${monthNames[date.month - 1]} ${date.year}";
  }

  /// Build 6x7 grid (42 days) including previous & next month dates
  List<Widget> _buildDays() {
    final firstDayOfMonth = DateTime(_visibleMonth.year, _visibleMonth.month, 1);
    final firstWeekday = firstDayOfMonth.weekday % 7; // Sunday=0
    final daysInMonth = DateTime(_visibleMonth.year, _visibleMonth.month + 1, 0).day;

    // calculate previous month info
    final prevMonth = DateTime(_visibleMonth.year, _visibleMonth.month - 1);
    final prevMonthDays = DateTime(prevMonth.year, prevMonth.month + 1, 0).day;

    // how many leading days to show
    final leadingDays = firstWeekday;
    final totalCells = 42; // 6 rows * 7 columns
    final days = <Widget>[];

    for (int i = 0; i < totalCells; i++) {
      DateTime date;
      bool isCurrentMonth;

      if (i < leadingDays) {
        // from previous month
        int day = prevMonthDays - leadingDays + i + 1;
        date = DateTime(prevMonth.year, prevMonth.month, day);
        isCurrentMonth = false;
      } else if (i >= leadingDays + daysInMonth) {
        // from next month
        int day = i - (leadingDays + daysInMonth) + 1;
        date = DateTime(_visibleMonth.year, _visibleMonth.month + 1, day);
        isCurrentMonth = false;
      } else {
        // current month
        int day = i - leadingDays + 1;
        date = DateTime(_visibleMonth.year, _visibleMonth.month, day);
        isCurrentMonth = true;
      }

      final isPast = date.isBefore(DateTime(_today.year, _today.month, _today.day));
      final isSelected = date.year == _selectedDate?.year &&
          date.month == _selectedDate?.month &&
          date.day == _selectedDate?.day;

      // determine color
      Color textColor;
      if (!isCurrentMonth) {
        textColor = AppColors.disableGray; // other month = light gray
      } else if (isPast) {
        textColor = AppColors.disableGray; // past in same month = darker gray
      } else {
        textColor = isSelected ? AppColors.white : AppColors.textBlack;
      }

      final bgColor = isSelected ? AppColors.primaryGreen : Colors.transparent;

      days.add(
        GestureDetector(
          onTap: (!isCurrentMonth || isPast)
              ? null
              : () {
            setState(() {
              _selectedDate = date;
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Text(
              "${date.day}",
              style: TextStyle(
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 16.75
              ),
            ),
          ),
        ),
      );
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    final monthTitle = _monthTitle(_visibleMonth);

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    "Pick-up Date",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            // Month navigation
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderGray),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _changeMonth(-1),
                      child: Image.asset(
                        AppAssets.imgLeftArrow,
                        width: 15,
                        height: 15,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      monthTitle.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _changeMonth(1),
                      child: Image.asset(
                        AppAssets.imgRightArrow,
                        width: 15,
                        height: 15,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              )
            ),
            const SizedBox(height: 24),
            // Weekdays
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
                  .map((day) => Text(
                day,
                style: TextStyle(
                    fontSize: 16.75,
                    color: AppColors.textBlack,
                    fontWeight: FontWeight.w500
                ),
              ))
                  .toList(),
            ),
            const SizedBox(height: 8),

            // Calendar grid
            GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: _buildDays(),
            ),

            const SizedBox(height: 32),

            // Apply button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  if (_selectedDate != null) {
                    widget.onDateSelected(_selectedDate!);
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Apply",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
