part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final GetCategoriesResponse? getCategoriesResponse;

  const HomeState({this.getCategoriesResponse});

  HomeState copyWith({GetCategoriesResponse? getCategoriesResponse}) {
    return HomeState(
        getCategoriesResponse:
            getCategoriesResponse ?? this.getCategoriesResponse);
  }

  @override
  List<Object?> get props => [getCategoriesResponse];
}
