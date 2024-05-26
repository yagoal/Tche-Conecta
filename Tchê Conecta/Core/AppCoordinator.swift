//
//  AppCoordinator.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI
import UIKit

final class AppCoordinator: ObservableObject {
    private let rootViewController: UINavigationController

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        configureNavigationAppearance()
    }

    func start() {
        let loginView = LoginView().environmentObject(self)
        let host = UIHostingController(rootView: loginView)
        configureBackButton(for: host)
        rootViewController.pushViewController(host, animated: false)
    }

    func showSignup() {
        let signupView = SignupView().environmentObject(self)
        let host = UIHostingController(rootView: signupView)
        configureBackButton(for: host)
        rootViewController.pushViewController(host, animated: true)
    }

    func showHome() {
        let homeView = HomeView().environmentObject(self)
        let host = UIHostingController(rootView: homeView)
        configureBackButton(for: host)
        rootViewController.pushViewController(host, animated: true)
    }

    func showRequestServices() {
        let requestServicesView = RequestServicesView().environmentObject(self)
        let host = UIHostingController(rootView: requestServicesView)
        configureBackButton(for: host)
        rootViewController.pushViewController(host, animated: true)
    }

    func showRequestServicesDetails(person: Person) {
        let requestServicesView = RequestServicesDetailsView(person: person)
        .environmentObject(self)

        let host = UIHostingController(rootView: requestServicesView)
        configureBackButton(for: host)
        rootViewController.pushViewController(host, animated: true)
    }
    
    func showChatList() {
        let showChatList = ChatListView().environmentObject(self)
        let host = UIHostingController(rootView: showChatList)
        configureBackButton(for: host)
        rootViewController.pushViewController(host, animated: true)
    }
    
    func showChat(person: Person, message: String?) {
        let showChat = ChatDetailView(person: person, message: message).environmentObject(self)
        let host = UIHostingController(rootView: showChat)
        configureBackButton(for: host)
        rootViewController.pushViewController(host, animated: true)
    }
    
    func showMyServices() {
        let showChat = MyServicesView().environmentObject(self)
        let host = UIHostingController(rootView: showChat)
        configureBackButton(for: host)
        rootViewController.pushViewController(host, animated: true)
    }
    
    func showMyPayments() {
        let showChat = PaymentView().environmentObject(self)
        let host = UIHostingController(rootView: showChat)
        configureBackButton(for: host)
        rootViewController.pushViewController(host, animated: true)
    }

    func showSuccess() {
        let successView = SignupSuccessView().environmentObject(self)
        let host = UIHostingController(rootView: successView)

        let loginView = LoginView().environmentObject(self)
        let loginHost = UIHostingController(rootView: loginView)

        rootViewController.setViewControllers([loginHost, host], animated: true)
    }

    func popToRoot() {
        rootViewController.popToRootViewController(animated: true)
    }

    private func configureNavigationAppearance() {
        UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "chevron.left")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.left")
        UINavigationBar.appearance().tintColor = .blue
    }
 
    private func configureBackButton(for hostingController: UIHostingController<some View>) {
        let backButton = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: #selector(pop)
        )
        hostingController.navigationItem.backBarButtonItem = backButton
    }

    @objc func pop() {
        rootViewController.popViewController(animated: true)
    }
}
