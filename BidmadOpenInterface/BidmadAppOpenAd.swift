//
//  BidmadAppopenAd.swift
//  BidmadOpenInterface
//
//  Created by ADOP_Mac on 2021/11/30.
//

import UIKit
import OpenBiddingHelper

@objc
public protocol BidmadAppOpenAdDelegate {
    @objc func bidmadAppOpenAdLoad()
    @objc func bidmadAppOpenAdShow()
    @objc func bidmadAppOpenAdClose()
    @objc func bidmadAppOpenAdAllFail()
}

@objc
open class BidmadAppOpenAd: NSObject, BidmadAdStandardFullScreenAd {
    var appOpenAd: OpenBiddingAppOpenAd
    
    public let zoneID: String
    let parentViewController: UIViewController
    
    public var delegate: BidmadAppOpenAdDelegate? = nil
    
    public required init(with parentViewController: UIViewController, zoneID: String) {
        self.parentViewController = parentViewController
        self.zoneID = zoneID
        
        self.appOpenAd = .init()
        self.appOpenAd.zoneID = zoneID
        
        super.init()
        
        self.appOpenAd.delegate = self
    }
    
    func load() {
        self.appOpenAd.request()
    }
    
    func show() {
        self.appOpenAd.show()
    }
    
    func registerForAppOpenAd(for zoneID: String) {
        self.appOpenAd.registerForAppOpenAd(forZoneID: zoneID)
    }
    
    func cancelAppOpenAd() {
        self.appOpenAd.deregisterForAppOpenAd()
    }
    
    func isLoaded() -> Bool {
        return self.appOpenAd.isLoaded
    }
}

extension BidmadAppOpenAd: OpenBiddingAppOpenAdDelegate {
    public func openBiddingAppOpenAdLoad(_ core: OpenBiddingAppOpenAd!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadAppOpenAdLoad()
    }
    
    public func openBiddingAppOpenAdShow(_ core: OpenBiddingAppOpenAd!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadAppOpenAdShow()
    }
    
    public func openBiddingAppOpenAdClose(_ core: OpenBiddingAppOpenAd!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadAppOpenAdClose()
    }
    
    public func openBiddingAppOpenAdAllFail(_ core: OpenBiddingAppOpenAd!, code error: String!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadAppOpenAdAllFail()
    }
}
