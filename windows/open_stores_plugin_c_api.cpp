#include "include/open_stores/open_stores_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "open_stores_plugin.h"

void OpenStoresPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  open_stores::OpenStoresPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
