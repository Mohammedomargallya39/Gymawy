import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cubit/MyBlocObserver.dart';
import 'core/cubit/bank_cubit/cubit.dart';
import 'core/cubit/bank_cubit/state.dart';
import 'core/services/injection.dart' as sl;
import 'core/services/injection.dart';
import 'features/bank/home/home_bank.dart';
import 'features/bank/splash_screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<MainBloc>()..changeTheme(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child)=> BlocBuilder<MainBloc, MainState>(
          buildWhen: (previous, current) => current is ChangeModeState,
          builder: (context, state) {
            return MaterialApp(
              // themeMode: MainBloc.get(context).isDark
              //     ? ThemeMode.dark
              //     : ThemeMode.light,
              themeMode: ThemeMode.light,
              theme: MainBloc.get(context).lightTheme,
              // darkTheme: MainBloc.get(context).darkTheme,
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}

