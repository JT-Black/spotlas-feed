part of 'spotlas_bloc.dart';

abstract class SpotlasEvent extends Equatable {
  const SpotlasEvent();

  @override
  List<Object> get props => [];
}

class GetSpotlasList extends SpotlasEvent {}
