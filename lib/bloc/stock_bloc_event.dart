part of 'stock_bloc_bloc.dart';

@immutable
abstract class StockBlocEvent {}

class MarketListingEvent extends StockBlocEvent {
  MarketListingEvent();
}

class StockListingEvent extends StockBlocEvent {
  StockListingEvent();
}

class SectorPermformanceEvent extends StockBlocEvent {
  SectorPermformanceEvent();
}

class StockNewsEvent extends StockBlocEvent {
  StockNewsEvent();
}
