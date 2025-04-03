import 'dart:async';

import 'package:cureocity_flutter_test/features/Home/domain/entity/response_entity.dart';
import 'package:cureocity_flutter_test/features/Home/domain/usecase/get_contry_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCountryList getCountryList;
  HomeBloc(this.getCountryList) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetCountryListEvent>(getCountryListEvent);
  }

  FutureOr<void> getCountryListEvent(
      GetCountryListEvent event, Emitter<HomeState> emit) async {
    emit(LoadingState());
    final response = await getCountryList.getCoutries();
    response.fold(
        (l) => emit(FailureState(message: l.message)),
        (r) => emit(
              SuccessState(responseEntity: r),
            ));
  }
}
