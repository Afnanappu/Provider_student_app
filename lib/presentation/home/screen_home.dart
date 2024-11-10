import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/application/home/grid_and_search_simple_state_provider.dart';
import 'package:student_app_provider/application/home/student_controller.dart';
import 'package:student_app_provider/core/navigations.dart';
import 'package:student_app_provider/presentation/home/widgets/app_bar_for_home.dart';
import 'package:student_app_provider/presentation/home/widgets/grid_tile_builder.dart';
import 'package:student_app_provider/presentation/home/widgets/list_tile_builder.dart';
import 'package:student_app_provider/presentation/home/widgets/search_bar_for_home.dart';
import 'package:student_app_provider/presentation/student_add/screen_student_add.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: AppBarForHome(),
      ),

      body: ListView(
        children: [
          SearchBarForHome(),
          RefreshIndicator.adaptive(onRefresh: () async {
            Provider.of<StudentController>(context, listen: false)
                .fetchAllStudent();
          }, child: Consumer<StudentController>(
            builder: (context, value, _) {
              final studentList = value.studentList;

              return studentList.isNotEmpty
                  ? Provider.of<IsGridOrSearchController>(context).isGrid
                      ? CustomGridView(studentList: studentList)
                      : ListTileBuilder(studentList: studentList)
                  : const Center(
                      child: Text('No student'),
                    );
            },
          ))
        ],
      ),

      //Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => ScreenStudentAdd(),
          // ));
          Nav.push(context, ScreenStudentAdd());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
