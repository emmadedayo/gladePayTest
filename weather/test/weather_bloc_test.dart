import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/data/entities/current_location/current_location.dart';
import 'package:weather/data/entities/forcast_response/forcast_response_entity.dart';
import 'package:weather/data/entities/location_search/location_search_entity.dart';
import 'package:weather/data/repository/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  MockWeatherRepository mockWeatherRepository = MockWeatherRepository();
  CurrentLocation? currentLocation;
  ForCastResponseEntity? forCastResponseEntity;
  List<LocationSearch>? locationSearch;

  setUp(() => mockWeatherRepository = MockWeatherRepository());

  group('Get Current Weather', () {
    test('Get Current Weather', () async* {
      when(mockWeatherRepository.getCurrentLocationWeather('7.3567565,3.7976516')).thenAnswer((_) async => currentLocation);
      expect(currentLocation, currentLocation);
    });

    test('Weather forecast', () async* {
      when(mockWeatherRepository.getForecastLocationWeather('7.3567565,3.7976516')).thenAnswer((_) async => forCastResponseEntity);
      expect(forCastResponseEntity, forCastResponseEntity);
    });

    test('Get Location Search', () async* {
      when(mockWeatherRepository.getLocationSearchWeather('7.3567565,3.7976516')).thenAnswer((_) async => locationSearch);
      expect(locationSearch, locationSearch);
    });
  });
}