import 'package:bookia/feautres/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bookia/feautres/home/data/models/best_seller_response/product.dart';
import 'package:bookia/feautres/home/data/models/slider_response/slider.dart';
import 'package:bookia/feautres/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/feautres/home/data/repo/home_repo.dart';
import 'package:bookia/feautres/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Product> products = [];
  List<SliderModel> sliders = [];

  getInitData() async {
    emit(HomeLoadingState());
    var results = await Future.wait([
      HomeRepo.getSliders(),
      HomeRepo.getBestSellers(),
    ]); // run in parallel the 2 futures

    var sliderRes = results[0] as SliderResponse?;
    var bestSellerRes = results[1] as BestSellerResponse?;

    // check 3la el response 3l4an nrg3 state l el screen

    if (sliderRes != null || bestSellerRes != null) {
      sliders = sliderRes?.data?.sliders ?? [];
      products = bestSellerRes?.data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }
}
