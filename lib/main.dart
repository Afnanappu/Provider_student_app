import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/application/home/grid_and_search_simple_state_provider.dart';
import 'package:student_app_provider/application/home/student_controller.dart';
import 'package:student_app_provider/application/student_add/profile_image_provider.dart';
import 'package:student_app_provider/persistance/student/model/student_model.dart';
import 'package:student_app_provider/presentation/home/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Hive initializing
  await Hive.initFlutter();

  //Registering student model if not already registered.
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }

  await Hive.openBox<StudentModel>('studentBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentController(),
        ),
        ChangeNotifierProvider(
          create: (context) => IsGridOrSearchController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileImageProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Student App GetX',
        theme: ThemeData(
            // primarySwatch: Colors.amber,
            // colorSchemeSeed: Colors.amber,
            // primaryColor: Colors.amber,

            // appBarTheme: const AppBarTheme(
            //     color: Colors.amberAccent,
            //     systemOverlayStyle: SystemUiOverlayStyle(
            //         statusBarColor: Color.fromARGB(63, 129, 102, 7))),
            colorScheme:
                // ColorScheme(
                //   brightness: Brightness.light,
                //   primary: Colors.amber,
                //   onPrimary: const Color.fromARGB(255, 0, 0, 0),
                //   secondary: Colors.amberAccent,
                //   onSecondary: Colors.white,
                //   error: Colors.red,
                //   onError: Colors.white,
                //   surface: const Color.fromARGB(255, 255, 255, 255)!,
                //   onSurface: Colors.black,
                // ),

                ColorScheme.fromSwatch(
              primarySwatch: Colors.purple,
              accentColor: Colors.purpleAccent,
              errorColor: Colors.red,
              cardColor: Colors.purple,
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: Colors.grey[900],
            buttonTheme:
                ButtonThemeData(colorScheme: Theme.of(context).colorScheme)),
        home: const ScreenHome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
