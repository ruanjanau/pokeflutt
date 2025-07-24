import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_pokedex/src/core/theme/theme_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = Modular.get<ThemeApp>();

    Modular.setInitialRoute('/splash/');
    return AnimatedBuilder(
      animation: themeStore,
      builder: (context, _) {
        return MaterialApp.router(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeStore.themeMode,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
