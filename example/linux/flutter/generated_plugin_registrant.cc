//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <open_stores/open_stores_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) open_stores_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "OpenStoresPlugin");
  open_stores_plugin_register_with_registrar(open_stores_registrar);
}
