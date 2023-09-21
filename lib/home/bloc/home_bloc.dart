import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ploff_part/home/data/model/banner_response.dart';
import 'package:ploff_part/home/data/model/gecategory_response.dart';
import 'package:ploff_part/home/domain/banner_repository.dart';
import 'package:ploff_part/home/domain/category_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetCategoryEvent>(_category);
    on<BannerEvent>(_banner);
  }

  final _categoryRepository = CategoryRepository();
  final _bannerRepository = BannerRepository();

  Future<void> _category(
      GetCategoryEvent event, Emitter<HomeState> emit) async {
    final result = await _categoryRepository.getCategory();
    emit(state.copyWith(categoriesResponse: result));
  }

  Future<void> _banner(BannerEvent event, Emitter<HomeState> emi) async {
    final result = await _bannerRepository.bannerRepo();

    emit(
      state.copyWith(bannerResponse: result),
    );
  }
}
