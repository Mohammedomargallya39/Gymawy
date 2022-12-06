import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MainState{}

class Empty extends MainState {
  List<Object?> get props => [];
}

class Loading extends MainState {
  List<Object?> get props => [];
}

class Error extends MainState {
  final String error;
  Error(this.error);
  List<Object?> get props => [];
}

class ChangeModeState extends MainState {
  List<Object?> get props => [];
}

class ChangeSlider extends MainState {
  List<Object?> get props => [];
}

class ChangeDarkMode extends MainState {
  List<Object?> get props => [];
}

class ChangeCompletedState extends MainState {
  List<Object?> get props => [];
}


class ChangePage extends MainState {
  List<Object?> get props => [];
}

class BottomChanged extends MainState {
  List<Object?> get props => [];
}

class GoalChangedColor extends MainState {
  List<Object?> get props => [];
}

class ChangeCoach extends MainState {
  List<Object?> get props => [];
}

class PasswordChanged extends MainState {
  List<Object?> get props => [];
}

class MatchPassword extends MainState {
  List<Object?> get props => [];
}

class ChangeCoachRadioButtonState extends MainState {
  List<Object?> get props => [];
}

class ChangeClientRadioButtonState extends MainState {
  List<Object?> get props => [];
}

class ChangeVisibilityPlanState extends MainState {
  List<Object?> get props => [];
}

class Ahmed extends MainState {
  String name;
  Ahmed(this.name);
}