import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/features/bank/main_screen/home_client/home_client.dart';
import 'package:gym/features/bank/main_screen/profile_screen/profile_screen.dart';
import 'package:gym/features/bank/main_screen/search_screen/search_screen.dart';
import 'package:gym/features/bank/main_screen/setting_screen/setting_screen.dart';

import '../../../core/cubit/bank_cubit/cubit.dart';
import '../../../core/cubit/bank_cubit/state.dart';
import '../../../gen/assets.gen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainBloc cubit;
  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }
  static const List<Widget> widgets =
  [
      HomeClientScreen(),
      SearchScreen(),
      SettingsScreen(),
      ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.elementAt(cubit.currentNavIndex),
      bottomNavigationBar: BlocBuilder<MainBloc,MainState>(
        builder: (context,state)
        {
          return Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(18.sp),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ]
            ),
            margin: EdgeInsets.all(18.sp),
            child: SafeArea(
              child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[300]!,
                  gap: 8,
                  activeColor: const Color.fromARGB(255, 248, 96, 13),
                  iconSize: 24.sp,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.w),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[300]!,
                  color: Colors.black,
                  tabs: const [
                    GButton(
                        icon: Icons.home,
                        text: AppString.home,
                    ),
                    GButton(
                      icon: Icons.search,
                      text: AppString.searchMain,
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: AppString.settings,
                    ),
                    GButton(
                      icon: Icons.person,
                      text: AppString.profile,
                    ),
                  ],
                selectedIndex: cubit.currentNavIndex,
                onTabChange: (index)
                {
                  setState(() {
                    cubit.currentNavIndex = index;
                  });
                },
              ),
              // BottomNavigationBar(
              //     selectedFontSize: 14.sp,
              //     unselectedFontSize: 0,
              //     type: BottomNavigationBarType.fixed,
              //     backgroundColor: Colors.grey.shade300,
              //     showSelectedLabels: true,
              //     showUnselectedLabels: true,
              //     onTap: (index)
              //     {
              //       return cubit.bottomChanged(index, context);
              //     },
              //     currentIndex: cubit.currentNavIndex,
              //     items: [
              //       BottomNavigationBarItem(
              //           icon: SvgPicture.asset(
              //               Assets.images.svg.bar
              //           ),
              //           label: AppString.home,
              //           backgroundColor: Colors.grey
              //       ),
              //       BottomNavigationBarItem(
              //         icon: SvgPicture.asset(
              //             Assets.images.svg.search
              //         ),
              //         label: AppString.searchMain,
              //       ),
              //       BottomNavigationBarItem(
              //         icon: SvgPicture.asset(
              //             Assets.images.svg.settings
              //         ),
              //         label: AppString.settings,
              //       ),
              //       BottomNavigationBarItem(
              //         icon: SvgPicture.asset(
              //             Assets.images.svg.person
              //         ),
              //         label: AppString.profile,
              //       ),
              //     ]
              // ),
            ),
          );
        },
      ),
    );
  }
}
