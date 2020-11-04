//
//  BannerViewController.swift
//  AdIntegrationExampleApp
//
//  Created by Marcel Klínek on 26/05/2020.
//  Copyright © 2020 Stroeer. All rights reserved.
//

import UIKit
import YieldloveAdIntegration
import GoogleMobileAds
import PrebidMobile

class BannerViewController: UIViewController {
    
    var adSlotId: String
    var bannerDelegate: YLBannerViewDelegate?
    
    init(adSlotId: String) {
        self.adSlotId = adSlotId
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("Banner View Controller deinitialized")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        serveAd()
        addReloadButton()
    }
    
    @objc func reloadAd() {
        self.view.subviews.forEach { $0.removeFromSuperview() }
        self.bannerDelegate = nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.serveAd()
            self.addReloadButton()
        }
    }
    
    @objc func addReloadButton() {
        let reload = UIButton(type: .system)
        reload.translatesAutoresizingMaskIntoConstraints = false
        reload.setTitle("Reload Ad", for: .normal)
        reload.tintColor = .blue
        reload.addTarget(self, action: #selector(reloadAd), for: .touchUpInside)
        self.view.addSubview(reload)
        
        NSLayoutConstraint.activate([
            reload.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            reload.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
        ])
    }
    
    @objc func serveAd() {
        bannerDelegate = BannerDelegate(viewController: self)
        Yieldlove.instance.bannerAd(
            AdSlotId: adSlotId,
            UIViewController: self,
            Delegate: bannerDelegate!
        )
    }
    
}
