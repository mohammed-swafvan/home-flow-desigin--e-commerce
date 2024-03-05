import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/main_notifier.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/category/categoty_screen.dart';
import 'package:home_screen_flow/presentation/home/home_screen.dart';
import 'package:home_screen_flow/presentation/main/widgets/main_bottom_nav_section.dart';
import 'package:home_screen_flow/presentation/order/orders_screen.dart';
import 'package:home_screen_flow/presentation/profile/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    // -- All Sreens
    List<Widget> pages = [
      HomeScreen(
        onMenuButtonTap: () {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
      const CategoryScreen(),
      const OrdersScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      body: Consumer<MainNotifier>(builder: (context, notifier, _) {
        return pages[notifier.currentPageIndex];
      }),
      bottomNavigationBar: const MainBottomNavSection(),
    );
  }
}
