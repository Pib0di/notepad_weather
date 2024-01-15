part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {
  int i = 0;
}

class HomePageInitial extends HomePageState {}

class HomePageUpdate extends HomePageState {
  HomePageUpdate(int i) : super();
}
