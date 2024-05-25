//
//  AppCoordinator.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI
import UIKit

class AppCoordinator: ObservableObject {
    private let rootViewController: UINavigationController

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    func start() {
        let loginView = LoginView().environmentObject(self)
        let host = UIHostingController(rootView: loginView)
        rootViewController.pushViewController(host, animated: false)
    }

    func showSignup() {
        let signupView = SignupView().environmentObject(self)
        let host = UIHostingController(rootView: signupView)
        rootViewController.pushViewController(host, animated: true)
    }

    func showHome() {
        let homeView = HomeView().environmentObject(self)
        let host = UIHostingController(rootView: homeView)
        rootViewController.pushViewController(host, animated: true)
    }
    
    func showRequestServices() {
        let requestServicesView = RequestServicesView().environmentObject(self)
        let host = UIHostingController(rootView: requestServicesView)
        rootViewController.pushViewController(host, animated: true)
    }

    func popToRoot() {
        rootViewController.popToRootViewController(animated: true)
    }
}
