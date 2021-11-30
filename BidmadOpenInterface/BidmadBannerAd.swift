//
//  BidmadBannerAd.swift
//  BidmadOpenInterface
//
//  Created by ADOP_Mac on 2021/11/30.
//

// Interface 는 OpenBiddingHelper 로 이동
// GDPR Interface 는 SDK 안에 있음


import Foundation
import OpenBiddingHelper

@objc
public protocol BidmadBannerAdDelegate {
    @objc func bidmadBannerLoad()
    @objc func bidmadBannerAllFail()
}

@objc
open class BidmadBannerAd: NSObject, BidmadAdStandardBanner {
    var banner: OpenBiddingBanner
    
    public let zoneID: String
    let parentViewController: UIViewController
    var containerView: UIView?
    
    public var delegate: BidmadBannerAdDelegate? = nil
    
    required public init(with parentViewController: UIViewController, containerView: UIView, zoneID: String) {
        self.zoneID = zoneID
        self.parentViewController = parentViewController
        self.containerView = containerView
        
        self.banner = .init(parentViewController: parentViewController, rootView: containerView)
        self.banner.zoneID = self.zoneID
        
        super.init()
        
        self.banner.delegate = self
    }
    
    public func load() {
        banner.requestView()
    }
    
    func setRefreshInterval(_ refreshIntervalTime: Int) {
        self.banner.refreshInterval = Int32(refreshIntervalTime)
    }
}

extension BidmadBannerAd: BIDMADOpenBiddingBannerDelegate {
    public func bidmadOpenBiddingBannerLoad(_ core: OpenBiddingBanner!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadBannerLoad()
    }
    
    public func bidmadOpenBiddingBannerClick(_ core: OpenBiddingBanner!) { /** Unsupported Callbacks */ }
    
    public func bidmadOpenBiddingBannerClosed(_ core: OpenBiddingBanner!) { /** Unsupported Callbacks */ }
    
    public func bidmadOpenBiddingBannerAllFail(_ core: OpenBiddingBanner!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadBannerAllFail()
    }
}
