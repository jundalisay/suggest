import 'package:get/get.dart';

class LocaleString extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'Carbon Reference': 'Carbon Reference',
          'Diseases': 'Diseases',
          'Healing Foods': 'Healing Foods',
          'Healthy Practices': 'Healthy Practices',
          'Nutrients': 'Nutrients',
          'Unhealthy Foods': 'Unhealthy Foods',
        },
        'tl': {
          'Carbon Reference': 'Mga Aktibidad na May Paglabas ng Carbon',
          'Diseases': 'Mga Sakit',
          'Healing Foods': 'Pagkaing Nagpapagaling',
          'Healthy Practices': 'Gawaing Pangkalusugan',
          'Nutrients': 'Nutrisyon',
          'Unhealthy Foods': 'Mga Hindi Masustansyang Pagkain'
        },
        'cb': {
          'Carbon Reference': 'Mga Aktibidad na May Paglabas ng Carbon',
          'Diseases': 'Mga Pagkaon sa Pag-ayo',
          'Healing Foods': 'Pagkaing Nagpapagaling',
          'Healthy Practices': 'Gawaing Pangkalusugan',
          'Nutrients': 'Nutrisyon',
          'Unhealthy Foods': 'Dili Maayo na Pagkaon'
        }
      };
}
