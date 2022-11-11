part of 'like_bloc_bloc.dart';

abstract class LikeBlocState extends Equatable {
  const LikeBlocState();
  
  @override
  List<Object> get props => [];
}

class LikeBlocInitial extends LikeBlocState {}
