import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:product_list_with_get/config.dart';
import 'package:product_list_with_get/infrastructure/navigation/navigation.dart';
import 'package:product_list_with_get/infrastructure/navigation/routes.dart';
import 'package:product_list_with_get/infrastructure/theme/theme.dart';
import 'package:product_list_with_get/initializer.dart';

Future<void> main() async {
  await Initializer.init();
  final initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: EnvironmentsBadge(
        child: GetMaterialApp(
          initialRoute: initialRoute,
          getPages: Nav.routes,
          theme: themeData,
        ),
      ),
    );
  }
}

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;

  const EnvironmentsBadge({required this.child});

  @override
  Widget build(BuildContext context) {
    final env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}
