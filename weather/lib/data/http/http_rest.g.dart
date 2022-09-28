// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_rest.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.weatherapi.com/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CurrentLocation> getCurrentLocationWeather(apiKey, q, aqi) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CurrentLocation>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(
                _dio.options, '/current.json?key=${apiKey}&q=${q}&aqi=${aqi}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CurrentLocation.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ForCastResponseEntity> getForecastLocationWeather(
      key, q, days, aqi, alerts) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ForCastResponseEntity>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/forecast.json?key=${key}&q=${q}&days=${days}&aqi=${aqi}&alerts=${alerts}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ForCastResponseEntity.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<LocationSearch>> getSearchLocationWeather(key, q) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<LocationSearch>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/search.json?key=${key}&q=${q}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => LocationSearch.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<HistoryEntity> getHistoryLocationWeather(key, q, dt) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HistoryEntity>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/history.json/${key}/${q}/${dt}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HistoryEntity.fromJson(_result.data!);
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
