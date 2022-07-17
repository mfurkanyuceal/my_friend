import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:get/get.dart';
import 'package:my_friend/app/utils/app_constants.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SentryFlutter.init(
    (options) {
      options.dsn = AppConstants.SENTRY_DSN;
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      Phoenix(
        child: GetMaterialApp(
          title: LocaleKeys.my_friend,
          translationsKeys: AppTranslation.translations,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          enableLog: true,
          fallbackLocale: const Locale('en', 'US'),
          supportedLocales: const [
            Locale('tr', 'TR'),
            Locale('en', 'US'),
          ],
        ),
      ),
    ),
  );
}
