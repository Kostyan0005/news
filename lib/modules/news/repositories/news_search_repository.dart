import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import '../../../utils/generate_example_xml.dart';
import '../models/news_piece_model.dart';

final newsSearchRepositoryProvider = Provider((_) => NewsSearchRepository());

class NewsSearchRepository {
  final _client = http.Client();

  Future<List<NewsPiece>> getNewsFromRssUrl(String url) async {
    final uri = Uri.parse(url);
    late final http.Response response;

    try {
      response = await _client.get(uri);

      if (response.statusCode != 200) {
        final message = 'Status code: ${response.statusCode}.\n'
            'Reason: ${response.reasonPhrase}.';
        throw HttpException(message, uri: uri);
      }

      return parseNewsFromXml(response.body);
    } on http.ClientException {
      if (kIsWeb) {
        // fetching news on the web does not work, so return example pieces
        return parseNewsFromXml(generateExampleXml());
      } else {
        rethrow;
      }
    }
  }

  List<NewsPiece> parseNewsFromXml(String rawXml) {
    return XmlDocument.parse(rawXml)
        .findAllElements('item')
        .map((e) => NewsPiece.fromXml(e))
        .where((p) => !p.sourceLink.endsWith('.ru'))
        .toList();
  }
}
