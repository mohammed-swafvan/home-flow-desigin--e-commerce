import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

// -- Import application providers
import 'package:home_screen_flow/application/main_notifier.dart';
import 'package:home_screen_flow/application/home_notifier.dart';
import 'package:home_screen_flow/application/search_notifier.dart';
import 'package:home_screen_flow/application/filter_notifier.dart';
import 'package:home_screen_flow/application/all_products_notifier.dart';
import 'package:home_screen_flow/application/pin_code_notifier.dart';
import 'package:home_screen_flow/application/product_images_notifier.dart';
import 'package:home_screen_flow/application/product_notifier.dart';
import 'package:home_screen_flow/application/wished_notifier.dart';
import 'package:home_screen_flow/application/rate_now_notifier.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import app presentation Screen
import 'package:home_screen_flow/presentation/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<int>('wished_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainNotifier()),
        ChangeNotifierProvider(create: (_) => HomeNotifier()),
        ChangeNotifierProvider(create: (_) => WishedNotifier()),
        ChangeNotifierProvider(create: (_) => SearchNotifier()),
        ChangeNotifierProvider(create: (_) => AllProductsNotifier()),
        ChangeNotifierProvider(create: (_) => FilterNotifier()),
        ChangeNotifierProvider(create: (_) => ProductNotifier()),
        ChangeNotifierProvider(create: (_) => ProductImagesNotifier()),
        ChangeNotifierProvider(create: (_) => PinCodeNotifier()),
        ChangeNotifierProvider(create: (_) => RateNowNotifier()),
      ],
      child: MaterialApp(
        title: 'Home Page Flow',
        theme: mainTheme,
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}
