import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/application/home/grid_and_search_simple_state_provider.dart';
import 'package:student_app_provider/application/home/student_controller.dart';
import 'package:student_app_provider/presentation/home/widgets/my_debounce.dart';

class SearchBarForHome extends StatelessWidget {
  SearchBarForHome({super.key});
  final db = Debounce();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Visibility(
          visible: Provider.of<IsGridOrSearchController>(context).isSearchOn,
          child: SearchBar(
            hintText: 'Search',
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).focusColor,
            ),
            leading: const Icon(Icons.search),
            onChanged: (value) {
              db.debounce(
                  //todo
                  () {
                Provider.of<StudentController>(context, listen: false)
                    .fetchAllSearchedStudentsData(value);
              });
            },
            // trailing: [
            //   IconButton(onPressed: () {

            //   }, icon: Icon(Icons.close)),
            // ],
          )),
    );
  }
}
