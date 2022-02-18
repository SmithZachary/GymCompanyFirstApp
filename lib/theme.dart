import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_bar_gym/utils/colors.dart';
import 'package:the_bar_gym/utils/enums.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: MyColors.primaryColor,
  accentColor: MyColors.accentColor,
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: MyColors.primaryColor,
  accentColor: MyColors.accentColor,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "AppTheme";

  AppTheme? appTheme;

  ThemeNotifier() {
    appTheme = AppTheme.light;
    getThemeFromPrefs();
  }

  toggleAppTheme(AppTheme? appTheme) {
    this.appTheme = appTheme;
    saveThemeToPrefs();
    notifyListeners();
  }

  getThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? prefsData = prefs.getString(key);
    //this.appTheme =
    appThemeEnumFromString(prefsData);
    notifyListeners();
  }

  saveThemeToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, appTheme.toString());
  }

  void appThemeEnumFromString(String? value) {
    //return AppTheme.values.firstWhere((e) => e.toString() == value);
    for (var element in AppTheme.values) {
      if (element.toString() == value) {
        appTheme = element;
      }
    }
    notifyListeners();
  }

  ThemeMode themeModeFromEnum() {
    if (appTheme == AppTheme.light) {
      return ThemeMode.light;
    } else if (appTheme == AppTheme.dark) {
      return ThemeMode.dark;
    } else if (appTheme == AppTheme.system) {
      return ThemeMode.system;
    } else {
      return ThemeMode.light;
    }
  }
}

abstract class AppColors {
  static const primary = Color(0xFFCC0025);
  static const accent = Color(0xFFCC0025);
  static const textDark = Color(0xFF53585A);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFE0E0E0);
  static const iconDark = Color(0xFFE0E0E0);
  static const textHighlight = primary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF1B1D21);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1D21);
  static const card = AppColors.cardDark;
}
//
// /// Reference to the application theme.
// class AppTheme {
//   static const accentColor = AppColors.accent;
//   static final visualDensity = VisualDensity.adaptivePlatformDensity;
//
//   final darkBase = ThemeData.dark();
//   final lightBase = ThemeData.light();
//
//   /// Light theme and its settings.
//   ThemeData light = ThemeData(
//     brightness: Brightness.light,
//     primaryColor: AppColors.primary,
//     accentColor: AppColors.accent,
//   );
//
//   ThemeData dark = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: AppColors.primary,
//     accentColor: AppColors.accent,
//   );
// //   ThemeData light = ThemeData(
// //         brightness: Brightness.light,
// //         colorScheme: lightBase.colorScheme.copyWith(secondary: accentColor),
// //         visualDensity: visualDensity,
// //         textTheme:
// //             GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
// //         backgroundColor: _LightColors.background,
// //         appBarTheme: lightBase.appBarTheme.copyWith(
// //           iconTheme: lightBase.iconTheme,
// //           backgroundColor: Colors.transparent,
// //           elevation: 0,
// //           centerTitle: true,
// //           titleTextStyle: const TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 17,
// //             color: AppColors.textDark,
// //           ),
// //           systemOverlayStyle: SystemUiOverlayStyle.dark,
// //         ),
// //         scaffoldBackgroundColor: _LightColors.background,
// //         elevatedButtonTheme: ElevatedButtonThemeData(
// //           style: ElevatedButton.styleFrom(primary: AppColors.secondary),
// //         ),
// //         cardColor: _LightColors.card,
// //         primaryTextTheme: const TextTheme(
// //           headline6: TextStyle(color: AppColors.textDark),
// //         ),
// //         iconTheme: const IconThemeData(color: AppColors.iconDark),
// //       );
// //
// //   /// Dark theme and its settings.
// //   ThemeData get dark => ThemeData(
// //         brightness: Brightness.dark,
// //         colorScheme: darkBase.colorScheme.copyWith(secondary: accentColor),
// //         visualDensity: visualDensity,
// //         textTheme:
// //             GoogleFonts.interTextTheme().apply(bodyColor: AppColors.textLigth),
// //         backgroundColor: _DarkColors.background,
// //         appBarTheme: darkBase.appBarTheme.copyWith(
// //           backgroundColor: const Color(0xFF1E2228),
// //           elevation: 0,
// //           centerTitle: true,
// //           titleTextStyle: const TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 17,
// //           ),
// //           systemOverlayStyle: SystemUiOverlayStyle.light,
// //         ),
// //         scaffoldBackgroundColor: _DarkColors.background,
// //         elevatedButtonTheme: ElevatedButtonThemeData(
// //           style: ElevatedButton.styleFrom(primary: AppColors.secondary),
// //         ),
// //         cardColor: _DarkColors.card,
// //         primaryTextTheme: const TextTheme(
// //           headline6: TextStyle(color: AppColors.textLigth),
// //         ),
// //         iconTheme: const IconThemeData(color: AppColors.iconLight),
// //       );
// // }
// }
// class ThemeNotifier extends ChangeNotifier {
//   final String key = "AppTheme";
//
//   AppTheme? appTheme;
//
//   ThemeNotifier() {
//    appTheme = AppTheme.accentColor;
//     getThemeFromPrefs();
//   }
//
//   toggleAppTheme(AppTheme? appTheme) {
//     this.appTheme = appTheme;
//     saveThemeToPrefs();
//     notifyListeners();
//   }
//
//   getThemeFromPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? prefsData = prefs.getString(key);
//     //this.appTheme =
//     appThemeEnumFromString(prefsData);
//     notifyListeners();
//   }
//
//   saveThemeToPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(key, appTheme.toString());
//   }
//
//   void appThemeEnumFromString(String? value) {
//     //return AppTheme.values.firstWhere((e) => e.toString() == value);
//     for (var element in AppTheme.values) {
//       if (element.toString() == value) {
//         appTheme = element;
//       }
//     }
//     notifyListeners();
//   }
//
//   ThemeMode themeModeFromEnum() {
//     if (appTheme == AppTheme.light) {
//       return ThemeMode.light;
//     } else if (appTheme == AppTheme.dark) {
//       return ThemeMode.dark;
//     } else if (appTheme == AppTheme.system) {
//       return ThemeMode.system;
//     } else {
//       return ThemeMode.light;
//     }
//   }
// }
