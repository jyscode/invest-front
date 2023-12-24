// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_price_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _StockPriceRepository implements StockPriceRepository {
  _StockPriceRepository(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PriceModel> getStockPrice(code) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'fid_input_iscd': code};
    final _headers = <String, dynamic>{
      r'accessToken': 'true',
      r'tr_id': 'FHKST01010100',
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PriceModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/inquire-price',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PriceModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PriceDayModel> getStockPriceDay(code) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'fid_input_iscd': code};
    final _headers = <String, dynamic>{
      r'accessToken': 'true',
      r'tr_id': 'FHKST01010400',
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PriceDayModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/inquire-daily-price',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PriceDayModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
