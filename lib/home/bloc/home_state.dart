part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final CategoryResponse? categoriesResponse;
  final BannerResponse? bannerResponse;

  const HomeState({this.categoriesResponse, this.bannerResponse});

  HomeState copyWith(
      {CategoryResponse? categoriesResponse, BannerResponse? bannerResponse}) {
    return HomeState(
        categoriesResponse: categoriesResponse ?? this.categoriesResponse,
        bannerResponse: bannerResponse ?? this.bannerResponse);
  }

  @override
  List<Object?> get props => [categoriesResponse, bannerResponse];
}
