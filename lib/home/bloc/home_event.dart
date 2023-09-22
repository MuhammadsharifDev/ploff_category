part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class CategoryEvent extends HomeEvent {
  CategoryEvent();
}

class BannerEvent extends HomeEvent {
  BannerEvent();
}

class GetCategoryEvent extends HomeEvent {
  GetCategoryEvent();
}
