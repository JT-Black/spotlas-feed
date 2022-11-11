part of 'spotlas_bloc.dart';

abstract class SpotlasState extends Equatable {
  const SpotlasState();

  @override
  List<Object> get props => [];
}

class SpotlasInitial extends SpotlasState {}

class SpotlasLoading extends SpotlasState {}

class SpotlasLoaded extends SpotlasState {
  final List<SpotlasModel> spotlasModel;
  const SpotlasLoaded(this.spotlasModel);
}

class SpotlasError extends SpotlasState {
  final String? message;
  const SpotlasError(this.message);
}
