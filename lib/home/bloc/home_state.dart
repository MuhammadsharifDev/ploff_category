part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final CategoryResponse? categoriesResponse;
  final BannerResponse? bannerResponse;
  final GetCategoryResponse? getCategoryResponse;

  const HomeState(
      {this.categoriesResponse, this.bannerResponse, this.getCategoryResponse});

  HomeState copyWith(
      {CategoryResponse? categoriesResponse,
      BannerResponse? bannerResponse,
      GetCategoryResponse? getCategoryResponse}) {
    return HomeState(
        categoriesResponse: categoriesResponse ?? this.categoriesResponse,
        bannerResponse: bannerResponse ?? this.bannerResponse,
        getCategoryResponse: getCategoryResponse ?? this.getCategoryResponse);
  }

  @override
  List<Object?> get props =>
      [categoriesResponse, bannerResponse, getCategoryResponse];
}
