import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../mockClass.dart';
import '../models/markets.dart';
import '../models/news.dart';
import '../models/sector.dart';
import '../models/stocks.dart';

part 'stock_bloc_event.dart';
part 'stock_bloc_state.dart';

class StockBloc extends Bloc<StockBlocEvent, StockBlocState> {
  StockBloc(this._mockDataSource) : super(StockBlocInitial()) {
    on<MarketListingEvent>((event, emit) async {
      final response = await _mockDataSource.getResponse();
      final data = Market.fromJson(json.decode(response.body));
      emit(MarkedListedState(data));
    });

    on<StockListingEvent>((event, emit) async {
      final response = await _mockDataSource.getStockResponse();
      final data = Stocks.fromJson(json.decode(response.body));
      emit(StockListedState(data));
    });

    on<SectorPermformanceEvent>((event, emit) async {
      final response = await _mockDataSource.getSectorResponse();
      final data = Sector.fromJson(json.decode(response.body));
      emit(SectorListedState(data));
    });

    on<StockNewsEvent>((event, emit) async {
      final response = await _mockDataSource.getNewsData();
      final data = StockNews.fromJson(json.decode(response.body));
      emit(StockNewsState(data));
    });
  }

  final MockDataSource _mockDataSource;
}
