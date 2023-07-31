//
//  AppDelegate.swift
//  SwiftProjectDemo
//
//  Created by hax on 2023/7/28.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setup()
        return true
    }
    
    func setup() {
        
        flutterEngine.run()
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let itemsViewControler: YTabBarBoard = YTabBarBoard()
        window?.rootViewController = itemsViewControler
        window?.makeKeyAndVisible()
        

    }
}


