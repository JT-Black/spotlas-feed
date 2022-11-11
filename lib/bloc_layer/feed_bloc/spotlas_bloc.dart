// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotlas_feed/data_layer/data_repository.dart';
import 'package:spotlas_feed/data_layer/spotlas_model.dart';

part 'spotlas_event.dart';
part 'spotlas_state.dart';

class SpotlasBloc extends Bloc<SpotlasEvent, SpotlasState> {
  SpotlasBloc() : super(SpotlasInitial()) {
    final DataRepository dataRepository = DataRepository();

    on<SpotlasEvent>((event, emit) async {
      try {
        emit(SpotlasLoading());
        final feedList = await dataRepository.fetchFeedList();
        emit(SpotlasLoaded(feedList));
        // if (feedList.error != null) {
        //   emit(SpotlasError(feedList.error));
        // }
      } on NetworkError {
        emit(const SpotlasError('Network Error! Failed to fetch the feed'));
      }
    });
  }
}
