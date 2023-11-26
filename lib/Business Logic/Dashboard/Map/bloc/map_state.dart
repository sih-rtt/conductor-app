part of 'map_bloc.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

final class MapInitial extends MapState {}

final class MapLoading extends MapState {}

final class MapLoaded extends MapState {
  const MapLoaded();
  @override
  List<Object> get props => [];
}
