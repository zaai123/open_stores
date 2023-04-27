#ifndef FLUTTER_PLUGIN_OPEN_STORES_PLUGIN_H_
#define FLUTTER_PLUGIN_OPEN_STORES_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace open_stores {

class OpenStoresPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  OpenStoresPlugin();

  virtual ~OpenStoresPlugin();

  // Disallow copy and assign.
  OpenStoresPlugin(const OpenStoresPlugin&) = delete;
  OpenStoresPlugin& operator=(const OpenStoresPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace open_stores

#endif  // FLUTTER_PLUGIN_OPEN_STORES_PLUGIN_H_
