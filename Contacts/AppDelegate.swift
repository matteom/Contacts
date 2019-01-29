//
//  AppDelegate.swift
//  Contacts
//
//  Created by Matteo Manferdini on 27/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	let stateController = StateController()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		guard let tabBarController = window?.rootViewController as? UITabBarController,
			let viewControllers = tabBarController.viewControllers else {
			return true
		}
		for (index, viewController) in viewControllers.enumerated() {
			if let navigationController = viewController as? UINavigationController,
				let contactsViewController = navigationController.viewControllers.first as? ContactsViewController {
				contactsViewController.stateController = stateController
				contactsViewController.favoritesOnly = index == 1
			}
		}
		return true
	}
}

