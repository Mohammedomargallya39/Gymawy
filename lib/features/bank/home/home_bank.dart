import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/cubit/bank_cubit/cubit.dart';
import '../../../core/cubit/bank_cubit/state.dart';
import '../../../core/utils/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainBloc cubit;


  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Bank'),
          ),
          body: Center(),
        );
      },
    );
  }
}
