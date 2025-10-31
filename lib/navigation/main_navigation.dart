import 'package:carcirus/core/resources/app_asset.dart';
import 'package:carcirus/core/resources/app_colors.dart';
import 'package:carcirus/features/rent/presentation/bill_screen.dart';
import 'package:carcirus/features/rent/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import '../features/rent/presentation/car_screen.dart';
import '../features/rent/presentation/rent_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    RentScreen(),
    CarScreen(),
    BilScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: AppColors.borderGray,
              width: 0.5,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (i) => setState(() => _selectedIndex = i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryGreen,
          unselectedItemColor: AppColors.lightGray,
          showUnselectedLabels: true,
          items: [
            _buildNavItem(AppAssets.imgRent, 'Rent', 0),
            _buildNavItem(AppAssets.imgMyCar, 'My Car', 1),
            _buildNavItem(AppAssets.imgMyBills, 'My Bills', 2),
            _buildNavItem(AppAssets.imgProfile, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String path, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Image.asset(
          path,
          width: 24,
          height: 24,
          color: isSelected ? AppColors.primaryGreen : AppColors.lightGray,
        ),
      ),
      label: label,
      tooltip: '',
    );
  }

}