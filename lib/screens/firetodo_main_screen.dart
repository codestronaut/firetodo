import 'package:firetodo/data/data.dart';
import 'package:firetodo/providers/providers.dart';
import 'package:firetodo/shared/shared.dart';
import 'package:firetodo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FireTodoMainScreen extends StatefulWidget {
  const FireTodoMainScreen({super.key});

  @override
  State<FireTodoMainScreen> createState() => _FireTodoMainScreenState();
}

class _FireTodoMainScreenState extends State<FireTodoMainScreen> {
  var viewedDateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  // TODO: 4. Delete these data when not used anymore
  final dummyTodos = [
    (
      title: 'Daily meeting with team',
      priority: FireTodoPriority.high,
      status: FireTodoStatus.complete,
    ),
    (
      title: 'Check emails',
      priority: FireTodoPriority.low,
      status: FireTodoStatus.incomplete,
    ),
    (
      title: 'Evening workout',
      priority: FireTodoPriority.medium,
      status: FireTodoStatus.incomplete,
    ),
  ];

  @override
  void initState() {
    getTodoList();
    super.initState();
  }

  void getTodoList() async {
    // TODO: 1. Call provider method to get todolist data on current date
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: FireTodoColors.mindfulCream,
        title: SvgPicture.asset('assets/images/app-brand.svg'),
        actions: const [FireTodoCalendarButton()],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120.0,
              child: FireTodoCalendar(
                onDateSelected: (date) {
                  if (date != null) {
                    setState(() => viewedDateTime = date);
                    // TODO: 3. Load todolist data based on selected date
                  }
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: FireTodoSpacings.spacingMd,
                top: FireTodoSpacings.spacingXs,
                right: FireTodoSpacings.spacingMd,
              ),
              child: Text.rich(
                TextSpan(
                  text: 'My Tasks',
                  children: [
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SizedBox(width: FireTodoSpacings.spacingSm),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: FireTodoSpacings.spacingXs,
                          vertical: FireTodoSpacings.spacingXxs,
                        ),
                        decoration: ShapeDecoration(
                          color: FireTodoColors.mindfulOrange.withOpacity(0.2),
                          shape: const StadiumBorder(),
                        ),
                        child: Consumer<FireTodoListNotifier>(
                          builder: (context, data, child) {
                            return Text(
                              // TODO: 3. Consume the actual todolist count
                              dummyTodos.length.toString(),
                              style: FireTodoTextStyles.bold.copyWith(
                                color: FireTodoColors.mindfulOrange,
                                fontSize: FireTodoSpacings.spacingMd,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                style: FireTodoTextStyles.bold.copyWith(
                  fontSize: FireTodoSpacings.spacingXlg,
                ),
              ),
            ),

            // TODO: 2. Consume the actual todolist data
            // Consumer<FireTodoListNotifier>(
            //   builder: (context, data, child) {
            //     return SizedBox();
            //   },
            // ),

            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(FireTodoSpacings.spacingMd),
              itemCount: dummyTodos.length,
              itemBuilder: (context, index) {
                final dummyTodo = dummyTodos[index];

                return FireTodoCard(
                  title: dummyTodo.title,
                  priority: dummyTodo.priority,
                  status: dummyTodo.status,
                  onComplete: () {},
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: FireTodoSpacings.spacingMd);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: FireTodoColors.mindfulOrange,
        icon: const Icon(Icons.add),
        label: const Text('Todo List'),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            useSafeArea: true,
            isScrollControlled: true,
            builder: (context) {
              return FireTodoNewBottomSheet(date: viewedDateTime);
            },
          );
        },
      ),
    );
  }
}
