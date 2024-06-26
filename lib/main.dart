import 'package:flutter/material.dart';
import 'package:flutter_task1/src/features/general_news/general_news_screen.dart';
import 'package:flutter_task1/src/features/theme/theme_provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var likedNews = await Hive.openBox('likedNews');
  likedNews.path;

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/': (context) => const NewsListScreen(),
      },
    );
  }
}
