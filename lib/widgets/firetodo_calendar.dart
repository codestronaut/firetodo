import 'package:firetodo/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Notes for learner: Just ignore this complicated widget
// and focus on the main learning goals, Firebase

/// [FireTodoCalendar] is a pre-built customize weekly calendar view.
/// This widget is not fully-functioning yet, but already consume the real
/// [DateTime] data.
class FireTodoCalendar extends StatefulWidget {
  const FireTodoCalendar({super.key, required this.onDateSelected});
  final Function(DateTime? dateTime) onDateSelected;

  @override
  State<FireTodoCalendar> createState() => _FireTodoCalendarState();
}

class _FireTodoCalendarState extends State<FireTodoCalendar> {
  late final List<List<DateTime>> weeklyDates;
  final currentDate = DateTime.now();
  var selectedDate = DateTime.now();

  @override
  void initState() {
    weeklyDates = FireTodoDateUtility.getDatesInMonthWeekly(currentDate);
    super.initState();
  }

  void changeDate(DateTime date) {
    setState(() => selectedDate = date);
    widget.onDateSelected(date);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: weeklyDates.length,
      itemBuilder: (context, index) {
        final weeklyDate = weeklyDates[index];
        return Padding(
          padding: const EdgeInsets.all(FireTodoSpacings.spacingMd),
          child: Row(
            children: weeklyDate.map((date) {
              return Expanded(
                child: _FireTodoCalendarDateCard(
                  onTap: () => changeDate(date),
                  isSelected: date == selectedDate,
                  weeklyDate: date,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class FireTodoCalendarButton extends StatelessWidget {
  const FireTodoCalendarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Feature in development'),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: FireTodoSpacings.spacingSm,
          vertical: FireTodoSpacings.spacingXxs,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: FireTodoSpacings.spacingMd,
        ),
        decoration: const ShapeDecoration(
          color: FireTodoColors.mindfulCreamDarker,
          shape: StadiumBorder(),
        ),
        child: Row(
          children: [
            Text(
              'February 2024', // Note: The date still hardcoded
              style: FireTodoTextStyles.semiBold.copyWith(
                color: FireTodoColors.mindfulBrownLight,
                fontSize: FireTodoSpacings.spacingMd,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: FireTodoColors.mindfulBrownLight,
            ),
          ],
        ),
      ),
    );
  }
}

class _FireTodoCalendarDateCard extends StatelessWidget {
  const _FireTodoCalendarDateCard({
    required this.onTap,
    required this.weeklyDate,
    this.isSelected = false,
  });

  final VoidCallback onTap;
  final DateTime weeklyDate;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final now = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(FireTodoSpacings.spacingMd),
      child: Container(
        padding: const EdgeInsets.all(FireTodoSpacings.spacingXs),
        decoration: BoxDecoration(
          color: isSelected ? FireTodoColors.mindfulGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(FireTodoSpacings.spacingMd),
          border: now.isAtSameMomentAs(weeklyDate)
              ? Border.all(color: FireTodoColors.grayRock)
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat.EEEEE().format(weeklyDate),
              style: FireTodoTextStyles.regular.copyWith(
                color: isSelected ? Colors.white : FireTodoColors.mindfulBrown,
                fontSize: FireTodoSpacings.spacingMd,
              ),
            ),
            const SizedBox(height: FireTodoSpacings.spacingXs),
            Text(
              weeklyDate.day.toString(),
              style: FireTodoTextStyles.bold.copyWith(
                color: isSelected ? Colors.white : FireTodoColors.mindfulBrown,
                fontSize: FireTodoSpacings.spacingLg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
