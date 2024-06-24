import 'package:http/http.dart' as http;

import 'package:meow_finder/models/cat_breed.dart';

class ApiService {
  final String _baseUrl = 'https://api.thecatapi.com/v1/breeds';

  final Map<String, String> _headers = {
    'x-api-key':
        'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr'
  };

  Future<List<CatBreed>> fetchCatBreeds() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl), headers: _headers);

      if (response.statusCode == 200) {
        final List<CatBreed> catBreeds = catBreedFromJson(response.body);
        return catBreeds;
      } else {
        throw Exception('Failed to load cat breeds');
      }
    } catch (error) {
      throw Exception('Failed to load cat breeds');
    }
  }
}
