import 'package:bs_app/src/dto/volumes.dart';
import 'package:bs_app/src/interceptors/authorization_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/http.dart';

part 'books_service.g.dart';

@RestApi()
abstract class BooksService {
  static final Dio _defaultClient =
      Dio(BaseOptions(baseUrl: dotenv.get('BOOK_BASE_URL')))
        ..interceptors.addAll([AuthorizationInterceptor()]);

  factory BooksService() =>
      _BooksService(_defaultClient, baseUrl: dotenv.get('BOOK_BASE_URL'));

  @GET('/v1/volumes')
  Future<VolumesResponseDTO> volumes(@Query('q') final String query,
      {@Query('filter') final String filter = 'paid-ebooks',
      @Query('maxResults') final int limit = 12,
      @Query('orderBy') final String orderBy = 'relevance',
      @Query('printType') final String type = 'books',
      @Query('startIndex') final int offset = 0});
}
