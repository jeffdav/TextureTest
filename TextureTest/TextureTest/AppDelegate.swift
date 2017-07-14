//
//  AppDelegate.swift
//  TextureTest
//
//  Created by Jeffrey Davis on 7/14/17.
//  Copyright © 2017 Mombo Labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.backgroundColor = .orange
    window.makeKeyAndVisible()
    self.window = window

    let viewController = ViewController()
    window.rootViewController = viewController

    return true
  }
}

