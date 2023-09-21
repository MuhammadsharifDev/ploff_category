part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
 class GetCategoryEvent extends HomeEvent{
  GetCategoryEvent();
 }

 class BannerEvent extends HomeEvent{
 BannerEvent();
 }