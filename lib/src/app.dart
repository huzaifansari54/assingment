import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:softlab/src/auth/UI/controller/auth_controller.dart';
import 'package:softlab/src/auth/UI/page/forget_page.dart';
import 'package:softlab/src/auth/UI/page/main_page.dart';
import 'package:softlab/src/auth/UI/page/register/register.dart';
import 'package:softlab/src/auth/UI/page/reset_page.dart';
import 'package:softlab/src/auth/UI/page/sign_in.dart';
import 'package:softlab/src/auth/UI/page/verfy_page.dart';
import 'package:softlab/src/splash/page/splash_page.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvder);
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],

      // Use AppLocalizations to configure the correct application title
      // depending on the user's locale.
      //
      // The appTitle is defined in .arb files found in the localization
      // directory.
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case "/":
                return auth.authanticated
                    ? const MainPage()
                    : const SignInScreen();
              case RegeisterForm.routeName:
                return const RegeisterForm();
              case ForgetPage.routeName:
                return const ForgetPage();
              case SignInScreen.routeName:
                return const SignInScreen();

              default:
                return const SplashPage();
            }
          },
        );
      },
    );
  }
}
