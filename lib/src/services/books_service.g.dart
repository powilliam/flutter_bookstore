// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _BooksService implements BooksService {
  _BooksService(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<VolumesResponseDTO> volumes(query,
      {filter = 'paid-ebooks',
      limit = 12,
      orderBy = 'relevance',
      type = 'books',
      offset = 0}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'q': query,
      r'filter': filter,
      r'maxResults': limit,
      r'orderBy': orderBy,
      r'printType': type,
      r'startIndex': offset
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VolumesResponseDTO>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/v1/volumes',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VolumesResponseDTO.fromJson(_result.data!);
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
