import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/configuration_page.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';
import 'package:listinha/src/shared/services/realm/realm_config.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

import 'home/home_module.dart';

class AppModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind.instance<Realm>(Realm(config)),
    //AutoBind.factory(ConfigurationServiceImpl.new),
    Bind.factory(<ConfigurationService>(i) => ConfigurationServiceImpl.new),
    Bind.singleton((i) => AppStore.new),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/home', module: HomeModule()),
    ChildRoute('/config', child: (context, args) => const ConfigurationPage()),
  ];
}
