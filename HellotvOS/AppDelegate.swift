//
//  AppDelegate.swift
//  HellotvOS
//
//  Created by Pedro Ruíz on 3/27/16.
//  Copyright © 2016 Pedro Ruíz. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  var appController: TVApplicationController?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    
    //Create a UIWindow object the same size as the screen and save it into the window property.
    
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    
    // Initialize a TVApplicationControllerContext to provide the launch properties to the application controller. These properties can include the initial JavaScript file, the name of the local storage file and a dictionary of options.
    
    let appControllerContext = TVApplicationControllerContext()
    
    // Locate the initial JavaScript file within the main bundle and provide its location to the controller context.
    
    let javascriptURL = NSBundle.mainBundle().URLForResource("main", withExtension: "js")
    
    appControllerContext.javaScriptApplicationURL = javascriptURL!
    
    // Create the TVApplicationController using the controller context and the window, save it in the property that was just created
    
    appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
    
    
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  


}

extension AppDelegate: TVApplicationControllerDelegate {
  func appController(appController: TVApplicationController, evaluateAppJavaScriptInContext jsContext: JSContext) {
    jsContext.setObject(ResourceLoader.self, forKeyedSubscript: "NativeResourceLoader")
  }
}

