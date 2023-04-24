part of 'stock_bloc_bloc.dart';

@immutable
abstract class StockBlocState {}

class StockBlocInitial extends StockBlocState {}

class MarkedListedState extends StockBlocState {
  final Market market;

  MarkedListedState(this.market);
}

class StockListedState extends StockBlocState {
  final Stocks stocks;

  StockListedState(this.stocks);
}

class SectorListedState extends StockBlocState {
  SectorListedState(this.sector);
  final Sector sector;
}

class StockNewsState extends StockBlocState {
  final StockNews stockNews;

  StockNewsState(this.stockNews);
}
