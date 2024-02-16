import 'package:flutter/material.dart';
import 'package:pfa2/main_layout.dart';
import 'package:pfa2/utils/config.dart';
import 'package:pfa2/screens/auth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DocDate', // Ajustez le titre de l'application ici
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: Config.primaryColor,
    border: Config.outlinedBorder,
    focusedBorder: Config.focusBorder,
    errorBorder: Config.errorBorder,
    enabledBorder: Config.outlinedBorder,
    floatingLabelStyle: TextStyle(color: Config.primaryColor),
    prefixIconColor: Colors.black38,
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.blue, // Changez cette ligne pour définir la couleur bleue
    selectedItemColor: Colors.white,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    unselectedItemColor: Colors.grey.shade700,
    elevation: 10,
    type: BottomNavigationBarType.fixed,
  ),
),

      // Supprimez la route par défaut '/', car 'home' est déjà défini
      routes: {
        '/':(context)=> const AuthPage() ,
         'main': (context) => const MainLayout()
      },
     
    );
  }
}



