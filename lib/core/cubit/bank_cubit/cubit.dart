import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/cubit/bank_cubit/state.dart';
import 'package:material_color_gen/material_color_gen.dart';

import '../../../features/bank/register/pages/addressPage.dart';
import '../../../features/bank/register/pages/create_account.dart';
import '../../../features/bank/register/pages/gender_date.dart';
import '../../../features/bank/register/pages/goal_page.dart';
import '../../../features/bank/register/pages/select_fat.dart';
import '../../../features/bank/register/pages/select_type_page.dart';
import '../../../features/bank/register/pages/social_media.dart';
import '../../../gen/assets.gen.dart';
import '../../services/cache_helper.dart';
import '../../services/injection.dart';
import '../../services/repository.dart';
import '../../utils/constants.dart';
import '../../utils/theme_app.dart';
import '../../widgets/myText.dart';


class MainBloc extends Cubit<MainState> {
  final Repository repository;

  MainBloc({
    required Repository repository,
  })
      : repository = repository,
        super(Empty());

  static MainBloc get(context) => BlocProvider.of(context);


  /// ------------ register

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isCoach = false;

  Future selectType({required bool isCoach}) async {
    this.isCoach = isCoach;
    emit(ChangeCoach());
  }

  List<Widget> pagesClint = [
     const CreateAccountPage(),
     const GenderDatePage(),
     const AddressPage(),
     const SelectFat(),
     const GoalPage(),
  ];

  List<Widget> pagesCoach = [
    const CreateAccountPage(),
    const GenderDatePage(),
    const AddressPage(),
    const SocialMediaPage(),
  ];

  int currentIndex = 0;
  PageController pageController = PageController();
  void bottomChanged(
      int index,
      context
      ){
    currentNavIndex = index;
    pageController.jumpToPage(index);
    emit(BottomChanged());
  }

  Future<void> nextPage(bool isNext,BuildContext context) async {
    isNext ? currentIndex++ : currentIndex--;
    await changePage(currentIndex,context);
    emit(ChangePage());
  }

  Future<void> changePage(int index,BuildContext context) async {
    currentIndex = index;
    if (index >= 0) {
      if (pageController.hasClients) {
        await pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease);
      }
    } else {
      Navigator.pop(context);
    }
    emit(ChangePage());
  }

  bool isPasswordEightCharacters = false;
  bool isPasswordHasSpecialCharacter = false;
  bool isPasswordHasUpperAndLower = false;
  bool isPasswordNotMach = false;

  matchPassword() {
    if (passwordController.text == confirmPasswordController.text) {
      isPasswordNotMach = true;
    } else {
      isPasswordNotMach = false;
    }
    emit(MatchPassword());
  }

  onPasswordChanged(String password) {
    final upperLower = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
    final specialCharacter = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
      isPasswordEightCharacters = false;
      if (password.length >= 8) isPasswordEightCharacters = true;

      isPasswordHasUpperAndLower = false;
      if (upperLower.hasMatch(password)) isPasswordHasUpperAndLower = true;

      isPasswordHasSpecialCharacter = false;
      if (specialCharacter.hasMatch(password)) {
        isPasswordHasSpecialCharacter = true;
      }
    emit(PasswordChanged());
  }

  bool isPasswordValid() {
    return isPasswordEightCharacters &&
        isPasswordHasSpecialCharacter &&
        isPasswordHasUpperAndLower;
  }

  bool isPasswordMach() {
    return passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        !isPasswordNotMach;
  }

/// ----------------- Theme Application
  late ThemeData lightTheme;
  // late ThemeData darkTheme;

  void changeTheme() {
    lightTheme = ThemeApp().whiteTheme();
    // darkTheme = ThemeApp().blackTheme();
  }

  bool isDark = false;
  void changeMode() {
    isDark = !isDark;
    di<CacheHelper>().put('isDark', isDark);
    emit(ChangeModeState());
  }

  bool isCompleted = false;
  void changeCompleted()
  {
    isCompleted = !isCompleted;

    emit(ChangeCompletedState());
  }

  int currentNavIndex = 0;

  bool coachRadioButton = false;
  bool clientRadioButton = false;
  void changeToCoachRadioButton()
  {
    coachRadioButton = !coachRadioButton;
    clientRadioButton = false;
    emit(ChangeCoachRadioButtonState());
  }

  void changeToClientRadioButton()
  {
    coachRadioButton = false;
    clientRadioButton = !clientRadioButton;
    emit(ChangeClientRadioButtonState());
  }

  bool? isVisibilityPlanIcon = false;
  void visibilityPlan()
  {
    isVisibilityPlanIcon = !isVisibilityPlanIcon!;
    emit(ChangeVisibilityPlanState());
  }


}