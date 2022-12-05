//
//  AppDelegate.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupRootViewController()
        
        return true
    }
}

private extension AppDelegate {
    func setupRootViewController() {
        let movieListVC = MovieListConfigurator.configure()
        let navigation = UINavigationController(rootViewController: movieListVC)

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
