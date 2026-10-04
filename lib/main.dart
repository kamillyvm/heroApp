import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/di/configure_providers.dart';
import 'ui/page/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final data = await ConfigureProviders.createDependencyTree();

  runApp(AppRoot(data: data));
}

class AppRoot extends StatelessWidget {
  final ConfigureProviders data;

  const AppRoot({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: data.providers,
      child: MaterialApp(
        title: 'Hero Squad',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4FC3F7),
            brightness: Brightness.dark,
          ),
          scaffoldBackgroundColor: const Color(0xFF0F0F1A),
          fontFamily: 'Roboto',
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0F0F1A),
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
