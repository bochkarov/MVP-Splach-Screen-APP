//
//  SplashView.swift
//  MVP Splach Screen APP
//
//  Created by Bochkarov Valentyn on 25/08/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import Foundation

import UIKit

class SplashView: UIView {
    var launchView = UIView()
    let label = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        
        launchView = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()?.view ?? UIView()
        label.text = "Увеличиваем удачу..."
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 25)
        label.dynText(strings: ["Увеличиваем удачу...", "Раскручиваем спины...", "Открываем слоты..."], interval: 1)
        
        setupConstraints()

    }
    
    private func setupConstraints() {
        launchView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(launchView)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            launchView.topAnchor.constraint(equalTo: topAnchor),
            launchView.leadingAnchor.constraint(equalTo: leadingAnchor),
            launchView.trailingAnchor.constraint(equalTo: trailingAnchor),
            launchView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    extension UILabel {
        func dynText(strings: [String?], interval: TimeInterval) {
            guard strings.count > 0 else { return }
            var counter = 1
            text = strings[0]
            
            let timer = Timer(timeInterval: interval, repeats: true) { [weak self] (timer) in
                guard let strongSelf = self,
                    strongSelf.superview?.superview != nil else {
                        timer.invalidate()
                        return
                }
                strongSelf.text = strings[counter % strings.count]
                counter += 1
            }
            
            RunLoop.current.add(timer, forMode: .common)
        }
    }

