part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingState extends HomeState {}

final class SuccessState extends HomeState {
  final ResponseEntity responseEntity;

  SuccessState({required this.responseEntity});
}

final class FailureState extends HomeState {
  final String message;

  FailureState({required this.message});
}
