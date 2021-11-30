//
//  BidmadInterstitialAd.swift
//  BidmadOpenInterface
//
//  Created by ADOP_Mac on 2021/11/30.
//

import UIKit
import OpenBiddingHelper

@objc
public protocol BidmadInterstitialAdDelegate {
    @objc func bidmadInterstitialLoad()
    @objc func bidmadInterstitialShow()
    @objc func bidmadInterstitialClose()
    @objc func bidmadInterstitialAllFail()
}

open class BidmadInterstitialAd: NSObject, BidmadAdStandardFullScreenAd {
    var interstitial: OpenBiddingInterstitial
    
    public let zoneID: String
    let parentViewController: UIViewController
    
    public var delegate: BidmadInterstitialAdDelegate? = nil
    
    public required init(with parentViewController: UIViewController, zoneID: String) {
        self.zoneID = zoneID
        self.parentViewController = parentViewController
        
        self.interstitial = OpenBiddingInterstitial()
        self.interstitial.zoneID = self.zoneID
        self.interstitial.parentViewController = self.parentViewController
        
        super.init()
        
        self.interstitial.delegate = self
    }
    
    func load() {
        self.interstitial.loadView()
    }
    
    func show() {
        self.interstitial.showView()
    }
    
    func isLoaded() -> Bool {
        return self.interstitial.isLoaded
    }
}

extension BidmadInterstitialAd: BIDMADOpenBiddingInterstitialDelegate {
    public func bidmadOpenBiddingInterstitialLoad(_ core: OpenBiddingInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadInterstitialLoad()
    }
    
    public func bidmadOpenBiddingInterstitialShow(_ core: OpenBiddingInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadInterstitialShow()
    }
    
    public func bidmadOpenBiddingInterstitialClose(_ core: OpenBiddingInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadInterstitialClose()
    }
    
    public func bidmadOpenBiddingInterstitialAllFail(_ core: OpenBiddingInterstitial!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadInterstitialAllFail()
    }
}
