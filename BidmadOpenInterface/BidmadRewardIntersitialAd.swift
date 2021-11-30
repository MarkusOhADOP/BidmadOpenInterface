//
//  BidmadRewardIntersitialAd.swift
//  BidmadOpenInterface
//
//  Created by ADOP_Mac on 2021/11/30.
//

import UIKit
import OpenBiddingHelper

@objc
public protocol BidmadRewardInterstitialAdDelegate {
    @objc func bidmadRewardInterstitialLoad()
    @objc func bidmadRewardInterstitialShow()
    @objc func bidmadRewardInterstitialClick()
    @objc func bidmadRewardInterstitialSkipped()
    @objc func bidmadRewardInterstitialComplete()
    @objc func bidmadRewardInterstitialClose()
    @objc func bidmadRewardInterstitialAllFail()
}

@objc
open class BidmadRewardIntersitialAd: NSObject, BidmadAdStandardFullScreenAd {
    var rewardInterstitial: OpenBiddingRewardInterstitial
    
    public let zoneID: String
    let parentViewController: UIViewController
    
    public var delegate: BidmadRewardInterstitialAdDelegate? = nil
    
    public required init(with parentViewController: UIViewController, zoneID: String) {
        self.zoneID = zoneID
        self.parentViewController = parentViewController
        
        self.rewardInterstitial = .init()
        self.rewardInterstitial.parentViewController = self.parentViewController
        self.rewardInterstitial.zoneID = self.zoneID
        
        super.init()
        
        self.rewardInterstitial.delegate = self
    }
    
    func load() {
        self.rewardInterstitial.request()
    }
    
    func show() {
        self.rewardInterstitial.showView()
    }
    
    func isLoaded() -> Bool {
        return self.rewardInterstitial.isLoaded
    }
}

extension BidmadRewardIntersitialAd: OpenBiddingRewardInterstitialDelegate {
    public func openBiddingRewardInterstitialLoad(_ core: OpenBiddingRewardInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardInterstitialLoad()
    }
    
    public func openBiddingRewardInterstitialShow(_ core: OpenBiddingRewardInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardInterstitialShow()
    }
    
    public func openBiddingRewardInterstitialClick(_ core: OpenBiddingRewardInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardInterstitialClick()
    }
    
    public func openBiddingRewardInterstitialClose(_ core: OpenBiddingRewardInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardInterstitialClose()
    }
    
    public func openBiddingRewardInterstitialSkipped(_ core: OpenBiddingRewardInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardInterstitialSkipped()
    }
    
    public func openBiddingRewardInterstitialSuccess(_ core: OpenBiddingRewardInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardInterstitialComplete()
    }
    
    public func openBiddingRewardInterstitialComplete(_ core: OpenBiddingRewardInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardInterstitialComplete()
    }
    
    public func openBiddingRewardInterstitialAllFail(_ core: OpenBiddingRewardInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardInterstitialAllFail()
    }
}
