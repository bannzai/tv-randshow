import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uni_links/uni_links.dart';

import '../models/tvshow_actions.dart';

@lazySingleton
class AppService {
  int timesOpenLink = 0;
  PackageInfo _packageInfo;

  Future<String> getVersion() async {
    _packageInfo ??= await PackageInfo.fromPlatform();
    return _packageInfo.version;
  }

  Future<TvshowActions> initUniLinks() async {
    try {
      final Uri initialLink = await getInitialUri();
      if (initialLink == null || initialLink.path.isEmpty) {
        debugPrint('$runtimeType Link empty or null');
        return TvshowActions(tvshow: '');
      } else {
        return _parseLink(initialLink);
      }
    } on PlatformException catch (e) {
      return throw PlatformException(
          code: e.code, message: e.message, details: e.details);
    }
  }

  TvshowActions _parseLink(Uri initialLink) {
    if (initialLink.path.contains('getRandomEpisode')) {
      final TvshowActions tvshowActions =
          TvshowActions.fromMap(initialLink.queryParameters);
      timesOpenLink = ++timesOpenLink;
      return tvshowActions;
    } else {
      return TvshowActions(tvshow: '');
    }
  }
}
