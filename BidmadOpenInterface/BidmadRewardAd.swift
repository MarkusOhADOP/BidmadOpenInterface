//
//  BidmadRewardAd.swift
//  BidmadOpenInterface
//
//  Created by ADOP_Mac on 2021/11/30.
//

import UIKit
import OpenBiddingHelper

@objc
public protocol BidmadRewardAdDelegate {
    @objc func bidmadRewardLoad()
    @objc func bidmadRewardShow()
    @objc func bidmadRewardClick()
    @objc func bidmadRewardComplete()
    @objc func bidmadRewardSkipped()
    @objc func bidmadRewardClose()
    @objc func bidmadRewardAllFail()
}

@objc
open class BidmadRewardAd: NSObject, BidmadAdStandardFullScreenAd {
    var reward: OpenBiddingRewardVideo
    
    public let zoneID: String
    let parentViewController: UIViewController
    
    public var delegate: BidmadRewardAdDelegate? = nil
    
    public required init(with parentViewController: UIViewController, zoneID: String) {
        self.parentViewController = parentViewController
        self.zoneID = zoneID
        self.reward = OpenBiddingRewardVideo()
        self.reward.zoneID = self.zoneID
        self.reward.parentViewController = self.parentViewController
        
        super.init()
        
        self.reward.delegate = self
    }
    
    @objc public func load() {
        self.reward.load()
    }
    
    @objc public func show() {
        self.reward.show()
    }
    
    @objc public func isLoaded() -> Bool {
        return self.reward.isLoaded
    }
}

extension BidmadRewardAd: BIDMADOpenBiddingRewardVideoDelegate {
    public func bidmadOpenBiddingRewardSkipped(_ core: OpenBiddingRewardVideo!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardSkipped()
    }
    
    public func bidmadOpenBiddingRewardVideoLoad(_ core: OpenBiddingRewardVideo!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardLoad()
    }
    
    public func bidmadOpenBiddingRewardVideoShow(_ core: OpenBiddingRewardVideo!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardShow()
    }
    
    public func bidmadOpenBiddingRewardVideoClick(_ core: OpenBiddingRewardVideo!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardClick()
    }
    
    public func bidmadOpenBiddingRewardVideoClose(_ core: OpenBiddingRewardVideo!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardClose()
    }
    
    public func bidmadOpenBiddingRewardVideoSucceed(_ core: OpenBiddingRewardVideo!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardComplete()
    }
    
    public func bidmadOpenBiddingRewardVideoComplete(_ core: OpenBiddingRewardVideo!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardComplete()
    }
    
    public func bidmadOpenBiddingRewardVideoAllFail(_ core: OpenBiddingRewardVideo!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadRewardAllFail()
    }
    
    public func bidmadOpenBiddingRewardVideoErrorLoadLog(_ currentDic: [AnyHashable : Any]!) { /**Unsupported Callback*/ }
    
    public func bidmadOpenBiddingRewardVideoSuccessLoadLog(_ currentDic: [AnyHashable : Any]!) { /**Unsupported Callback*/ }
}
