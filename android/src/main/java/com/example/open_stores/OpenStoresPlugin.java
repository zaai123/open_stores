package com.example.open_stores;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import androidx.annotation.NonNull;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** OpenStoresPlugin */
public class OpenStoresPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private final String OPEN_PLAY_STORE = "openPlayStore";
  private Context mContext;
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "open_stores");
    channel.setMethodCallHandler(this);
    mContext = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }else if (call.method.equals(OPEN_PLAY_STORE)) {
      String packageName = call.argument("package");
      result.success(openPlayStore(packageName));
    } else {
      result.notImplemented();
    }
  }

  public boolean openPlayStore(String packageName) {
    try {
      String url = "market://details?id=" + packageName;
      Log.e("Url: ", url);
      Intent intent = new Intent(Intent.ACTION_VIEW,
              Uri.parse(url));
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      mContext.startActivity(intent);
    } catch (android.content.ActivityNotFoundException anfe) {
      String url = "https://play.google.com/store/apps/details?id=" + packageName;
      Log.e("Url: ", url);
      Intent intent = new Intent(Intent.ACTION_VIEW,
              Uri.parse(url));
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      mContext.startActivity(intent);
    }
    return true;
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
