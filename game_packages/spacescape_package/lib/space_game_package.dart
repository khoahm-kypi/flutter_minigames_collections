import 'package:hive_flutter/hive_flutter.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/settings.dart';
import 'screens/main_menu.dart';
import 'models/player_data.dart';
import 'models/spaceship_details.dart';

class SpacescapeGamePackage {
  static Future openSpacescapeGame(BuildContext context2) async {
    WidgetsFlutterBinding.ensureInitialized();
    final navigator = Navigator.of(context2); // <- Add this
    // This opens the app in fullscreen mode.
    await Flame.device.fullScreen();

    // Initialize hive.
    await _initHive();

    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => MultiProvider(
        providers: [
          FutureProvider<PlayerData>(
            create: (BuildContext context) => _getPlayerData(),
            initialData: PlayerData.fromMap(PlayerData.defaultData),
          ),
          FutureProvider<Settings>(
            create: (BuildContext context) => _getSettings(),
            initialData: Settings(soundEffects: false, backgroundMusic: false),
          ),
        ],
        builder: (context, child) {
          // We use .value constructor here because the required objects
          // are already created by upstream FutureProviders.
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<PlayerData>.value(
                value: Provider.of<PlayerData>(context),
              ),
              ChangeNotifierProvider<Settings>.value(
                value: Provider.of<Settings>(context),
              ),
            ],
            child: child,
          );
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // Dark more because we are too cool for white theme.
          themeMode: ThemeMode.dark,
          // Use custom theme with 'BungeeInline' font.
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'BungeeInline',
            scaffoldBackgroundColor: Colors.black,
          ),
          // MainMenu will be the first screen for now.
          // But this might change in future if we decide
          // to add a splash screen.
          home: const MainMenu(),
        ),
      ),
    );

    return navigator.push(pageRoute);
  }

// This function initializes hive with app's
// documents directory and also registers
// all the hive adapters.
  static Future<void> _initHive() async {
    try {
      await Hive.initFlutter();

      Hive.registerAdapter(PlayerDataAdapter());
      Hive.registerAdapter(SpaceshipTypeAdapter());
      Hive.registerAdapter(SettingsAdapter());
    } catch (e, s) {}
  }

  /// This function reads the stored [PlayerData] from disk.
  static Future<PlayerData> _getPlayerData() async {
    // Open the player data box and read player data from it.
    final box = await Hive.openBox<PlayerData>(PlayerData.playerDataBox);
    final playerData = box.get(PlayerData.playerDataKey);

    // If player data is null, it means this is a fresh launch
    // of the game. In such case, we first store the default
    // player data in the player data box and then return the same.
    if (playerData == null) {
      box.put(
        PlayerData.playerDataKey,
        PlayerData.fromMap(PlayerData.defaultData),
      );
    }

    return box.get(PlayerData.playerDataKey)!;
  }

  /// This function reads the stored [Settings] from disk.
  static Future<Settings> _getSettings() async {
    // Open the settings box and read settings from it.
    final box = await Hive.openBox<Settings>(Settings.settingsBox);
    final settings = box.get(Settings.settingsKey);

    // If settings is null, it means this is a fresh launch
    // of the game. In such case, we first store the default
    // settings in the settings box and then return the same.
    if (settings == null) {
      box.put(Settings.settingsKey,
          Settings(soundEffects: true, backgroundMusic: true));
    }

    return box.get(Settings.settingsKey)!;
  }
}
