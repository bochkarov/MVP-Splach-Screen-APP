//
//  SplashPresenter.swift
//  MVP Splach Screen APP
//
//  Created by Bochkarov Valentyn on 25/08/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import Foundation
import UIKit

protocol SplashPresenterDescription: class {
    func present(to view: UIView)
    func dismiss()
    
}

class SplashPresenter: SplashPresenterDescription {
    
    var splashView = SplashView()
    
    func present(to view: UIView) {
        
                    splashView.translatesAutoresizingMaskIntoConstraints = false
                    view.addSubview(splashView)
            
                    NSLayoutConstraint.activate([
                        splashView.topAnchor.constraint(equalTo: view.topAnchor),
                        splashView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        splashView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        splashView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
                    ])
    }
    
    func dismiss() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: { [weak self] in
            self?.splashView.alpha = 0
        }) { [weak self] (_) in
            self?.splashView.removeFromSuperview()
        }
    }
}
