import 'package\:flutter/material.dart';
import 'package\:latihan\_login/screen/splash\_screen.dart';
import 'package\:provider/provider.dart';
import 'theme/theme\_provider.dart';
// import 'screen/login\_screen.dart';
import 'package\:get/get.dart';
import 'package\:get\_storage/get\_storage.dart';

void main() async {
await GetStorage.init();
runApp(
ChangeNotifierProvider(
create: (_) => ThemeProvider(),
child: const MyApp(),
),
);
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
final themeProvider = Provider.of<ThemeProvider>(context);

return GetMaterialApp(
  title: 'Aplikasi',
  theme: themeProvider.currentTheme,
  home: const SplashScreen(),
);


}
}