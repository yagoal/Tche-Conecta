//
//  AppStartViewRepresentable.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI
import UIKit

struct AppStartViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        let coordinator = AppCoordinator(rootViewController: navigationController)
        coordinator.start()

        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "chevron.left")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.left")
        UINavigationBar.appearance().tintColor = .blue
        navigationController.navigationBar.topItem?.backBarButtonItem = backButton

        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}
