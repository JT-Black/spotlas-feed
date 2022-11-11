// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'like_bloc_event.dart';
part 'like_bloc_state.dart';

class LikeBlocBloc extends Bloc<LikeBlocEvent, LikeBlocState> {
  LikeBlocBloc() : super(LikeBlocInitial()) {
    on<LikeBlocEvent>((event, emit) {
      // ignore: todo
      // TODO: implement event handler
    });
  }
}
