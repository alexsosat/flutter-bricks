import "package:flutter/material.dart";
import "package:flutter_common_classes/flutter_common_classes.dart";

/// Class to inject the dependencies in the application
class DependencyInjection {
  static bool _servicesInjected = false;
  static bool _repositoriesInjected = false;

  /// Inject the critical services in the application
  ///
  /// This injects the services on the main thread
  /// WARNING: This method should be called before the application starts
  /// keep it simple so it doesn't take too long to execute
  static Future injectCriticalServices() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  /// Inject the services in the application
  ///
  /// This injects the services when the application is running
  /// These services are loaded during the splash screen
  static Future injectServices() async {
    if (_servicesInjected) return;
    // TODO: inject services
    _servicesInjected = true;
  }

  /// Inject the repositories in the application
  ///
  /// This injects the repositories when the application is running
  /// These repositories are loaded during the splash screen
  // ignore: long-method
  static void injectRepositories() {
    if (_repositoriesInjected) return;

    if (EnvironmentConfig.isMockFlavor) {
      _injectMockRepositories();
    } else {
      _injectRealRepositories();
    }
    _repositoriesInjected = true;
  }

  static void _injectMockRepositories() {
    const errorPercentage = 0;
    const maxWaitTime = 1000;
  }

  static void _injectRealRepositories() {}
}
