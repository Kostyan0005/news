import 'package:news/utils/rss_utils.dart';

enum Headline {
  latest,
  nation,
  world,
  business,
  technology,
  entertainment,
  science,
  sports,
  health,
}

extension HeadlineExtension on Headline {
  String getTitle(String locale) {
    final isRu = locale == 'ru_UA';

    switch (this) {
      case Headline.latest:
        return isRu ? 'Последние' : 'Latest';
      case Headline.nation:
        return isRu ? 'Украина' : 'U.S.';
      case Headline.world:
        return isRu ? 'В мире' : 'World';
      case Headline.business:
        return isRu ? 'Бизнес' : 'Business';
      case Headline.technology:
        return isRu ? 'Технологии' : 'Technology';
      case Headline.entertainment:
        return isRu ? 'Развлечения' : 'Entertainment';
      case Headline.science:
        return isRu ? 'Наука' : 'Science';
      case Headline.sports:
        return isRu ? 'Спорт' : 'Sports';
      case Headline.health:
        return isRu ? 'Здоровье' : 'Health';
    }
  }

  String get topic => toString().replaceAll('Headline.', '').toUpperCase();

  String getRssUrl(String locale) {
    switch (this) {
      case Headline.latest:
        return getLatestNewsUrl(locale);
      default:
        return getHeadlineNewsUrl(topic, locale);
    }
  }
}
