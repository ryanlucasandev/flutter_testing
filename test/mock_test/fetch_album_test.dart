// Generate a MockClient using the Mockito package.
// Create a new instances of this class in each test.
// Note: Naming the generated mock 'MockHttpclient to avoid confusion with
// MockClient from package:http/testing.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/mock_test/fetch_data.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockHttpClient();

      when(
        client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer(
        (_) async =>
            http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200),
      );

      expect(await mockFetchAlbum(client), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockHttpClient();

      // Use Mockito to return an unsuccessful response when it calls the provided http.Client
      when(
        client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(mockFetchAlbum(client), throwsException);
    });
  });
}
