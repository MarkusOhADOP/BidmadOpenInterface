//
//  BidmadBannerView.swift
//  BidmadOpenInterface
//
//  Created by ADOP_Mac on 2021/11/30.
//

import SwiftUI

public struct BidmadBannerView: UIViewControllerRepresentable {
    let zoneID = "4d1c5d99-777c-493c-960f-d04d9a86dbb9"
    
    public init() { }
    
    public func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = UIViewController()
        let containerView = UIView()
        
        viewController.view.addSubview(containerView)
        viewController.view.frame = CGRect(origin: .zero, size: CGSize(width: 320.0, height: 50.0))
        
        let bidmadBannerAd = BidmadBannerAd(with: viewController, containerView: containerView, zoneID: zoneID)
        bidmadBannerAd.load()
        
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

