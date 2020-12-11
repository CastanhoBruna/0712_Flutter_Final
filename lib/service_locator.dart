import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'services/textoget_service.dart';

// GetIt getIt = GetIt.instance;


// GetIt locator = GetIt.instance;
// void setupLocator() {
//     locator.registerSingleton(TextoGetService());

// }


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(TextoGetService());
}
