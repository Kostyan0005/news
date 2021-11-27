import 'package:flutter/material.dart';
import 'package:news/modules/news/models/news_piece_model.dart';
import 'package:news/modules/news/pages/news_piece_page.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'options_sheet.dart';

class NewsItem extends StatelessWidget {
  final NewsPiece piece;

  const NewsItem(this.piece);

  void _showOptionsSheet(BuildContext context) => showModalBottomSheet(
      context: context, builder: (_) => OptionsSheet(piece));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(NewsPiecePage.routeName, arguments: piece),
        onLongPress: () => _showOptionsSheet(context),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 16,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Padding(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              child: Text(piece.title),
            ),
            subtitle: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${piece.sourceName} · ${timeago.format(piece.pubDate)}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _showOptionsSheet(context),
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.grey,
                  iconSize: 20,
                  constraints: const BoxConstraints(
                    maxHeight: 30,
                    maxWidth: 36,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
