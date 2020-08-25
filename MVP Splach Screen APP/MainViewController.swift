//
//  ViewController.swift
//  MVP Splach Screen APP
//
//  Created by Bochkarov Valentyn on 25/08/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let splashPresenter = SplashPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        splashPresenter.present(to: view)
        view.backgroundColor = .gray
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.splashPresenter.dismiss()
        }
    }
}

