import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ploff_part/home/data/model/banner_response.dart';
import 'package:ploff_part/home/data/model/category_response.dart';
import 'package:ploff_part/home/data/model/getcategory_response.dart';
import 'package:ploff_part/home/domain/banner_repository.dart';
import 'package:ploff_part/home/domain/category_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<CategoryEvent>(_category);
    on<BannerEvent>(_banner);
    on<GetCategoryEvent>(_getCategory);
  }

  final _categoryRepository = CategoryRepository();
  final _bannerRepository = BannerRepository();
  final _getCategoryRepo =CategoryRepository();


  //____________CATEGORY__________
  Future<void> _category(
      CategoryEvent event, Emitter<HomeState> emit) async {
    final result = await _categoryRepository.category();
    emit(state.copyWith(categoriesResponse: result,));
  }

  //________________BANNER____________
  Future<void> _banner(BannerEvent event, Emitter<HomeState> emi) async {
    final result = await _bannerRepository.bannerRepo();

    emit(
      state.copyWith(bannerResponse: result),
    );
  }

  //________________GETCATEGORY_____________

Future<void>  _getCategory(GetCategoryEvent event,Emitter<HomeState>emit)async{
    final result=await  _getCategoryRepo.getCategory();
    emit(state.copyWith(getCategoryResponse: result));
}
}
