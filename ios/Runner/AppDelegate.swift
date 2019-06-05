import UIKit
import Flutter
import airship
import AirshipAppExtensions
import AirshipKit
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, UNUserNotificationCenterDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    FirebaseApp.configure()
    /* if #available(iOS 10.0, *) {
        // For iOS 10 display notification (sent via APNS)
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
    } else {
        let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        application.registerUserNotificationSettings(settings)
    }*/
    
    application.registerForRemoteNotifications()
    
    //Airship
    let config = UAConfig.default()
    UAirship.takeOff(config)
    UAirship.push().notificationOptions = [.alert, .badge, .sound]
    UAirship.push().userPushNotificationsEnabled = true
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
