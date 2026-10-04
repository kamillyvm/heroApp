import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/hero_dto.dart';

class ApiClient {
  final String baseUrl;
  final http.Client _client;

  ApiClient({
    required this.baseUrl,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<List<HeroDto>> getHeroes({
    required int page,
    required int limit,
  }) async {
    final response = await _client
        .get(
          Uri.parse(
            '$baseUrl/heroes?_page=$page&_per_page=$limit&_sort=id',
          ),
          headers: {'Content-Type': 'application/json'},
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> jsonList = json['data'] ?? [];

      return jsonList
          .map((item) => HeroDto.fromJson(item))
          .toList();
    } else {
      throw Exception(
        'Failed to load heroes: ${response.statusCode}',
      );
    }
  }

  Future<HeroDto> getHeroById(int id) async {
    final response = await _client
        .get(
          Uri.parse('$baseUrl/heroes/$id'),
          headers: {'Content-Type': 'application/json'},
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return HeroDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
        'Failed to load hero: ${response.statusCode}',
      );
    }
  }

  Future<List<HeroDto>> getAllHeroes() async {
    final response = await _client
        .get(
          Uri.parse('$baseUrl/heroes?_sort=id'),
          headers: {'Content-Type': 'application/json'},
        )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      return jsonList
          .map((json) => HeroDto.fromJson(json))
          .toList();
    } else {
      throw Exception(
        'Failed to load all heroes: ${response.statusCode}',
      );
    }
  }

  void dispose() {
    _client.close();
  }
}