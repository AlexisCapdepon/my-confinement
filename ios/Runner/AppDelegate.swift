import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("IzaSyAmHHfjzERpT665-jvdnmfl49B3vr_OaE0")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
