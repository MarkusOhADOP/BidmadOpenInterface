//
//  BidmadAdStandard.swift
//  BidmadOpenInterface
//
//  Created by ADOP_Mac on 2021/11/30.
//

import Foundation
import UIKit

enum BidmadInterfaceException: Error {
    case invalidZoneID
    case noContainerView
}

@objc
protocol BidmadAdStandardBanner {
    
    /// This initializer takes in zoneID, view controller, and view container.
    @objc init(with parentViewController: UIViewController, containerView: UIView, zoneID: String)
    
    /// This method loads ads from respective zoneID.
    @objc func load()
    
    /// This method sets the refresh time for banner
    @objc func setRefreshInterval(_ refreshIntervalTime: Int)
}

@objc
protocol BidmadAdStandardFullScreenAd {
    
    /// This initializer takes in zoneID, view controller, and optionally view container.
    /// The view container will only be used for banner ads.
    @objc init(with parentViewController: UIViewController, zoneID: String)
    
    /// This method loads ads from respective zoneID.
    @objc func load()
    
    /// This method shows the loaded ad. Use only for Interstitial and Rewarded ads.
    @objc func show()
    
    /// This method returns if the ad is loaded and available for displaying
    @objc func isLoaded() -> Bool
}
