import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/database/app_database.dart';
import '../../data/database/dao/hero_dao.dart';
import '../../data/database/dao/squad_dao.dart';
import '../../data/database/database_mapper.dart';
import '../../data/network/client/api_client.dart';
import '../../data/network/network_mapper.dart';
import '../../data/repository/hero_repository_impl.dart';

class ConfigureProviders {
  final List<SingleChildWidget> providers;

  ConfigureProviders({required this.providers});

  static Future<ConfigureProviders> createDependencyTree() async {
    final appDatabase = AppDatabase();

    final heroDao = HeroDao(appDatabase);
    final squadDao = SquadDao(appDatabase);

    final networkMapper = NetworkMapper();
    final databaseMapper = DatabaseMapper();

    final apiClient = ApiClient(
      baseUrl: 'https://heroapp-bgxv.onrender.com',
    );

    final heroRepository = HeroRepositoryImpl(
      apiClient: apiClient,
      networkMapper: networkMapper,
      databaseMapper: databaseMapper,
      heroDao: heroDao,
      squadDao: squadDao,
    );

    return ConfigureProviders(
      providers: [
        Provider<ApiClient>.value(value: apiClient),
        Provider<NetworkMapper>.value(value: networkMapper),
        Provider<DatabaseMapper>.value(value: databaseMapper),
        Provider<HeroDao>.value(value: heroDao),
        Provider<SquadDao>.value(value: squadDao),
        Provider<HeroRepositoryImpl>.value(value: heroRepository),
      ],
    );
  }
}