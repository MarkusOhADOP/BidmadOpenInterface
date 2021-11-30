//
//  BidmadOfferwallAd.swift
//  BidmadOpenInterface
//
//  Created by ADOP_Mac on 2021/11/30.
//

import UIKit
import BidmadSDK

protocol BidmadOfferwallAdDelegate {
    func bidmadLoadAd()
    func bidmadShowAd()
    func bidmadCloseAd()
    func bidmadFailedAd()
}

class BidmadOfferwallAd: NSObject, BidmadAdStandardFullScreenAd {
    var offerwall: BIDMADOfferwall
    
    public let zoneID: String
    let parentViewController: UIViewController
    
    public var delegate: BidmadOfferwallAdDelegate? = nil
    
    // Success (Bool), Currency Amount (Double)
    private var currencyReceivalAction: ((Bool, Int?) -> Void)? = nil
    // Success (Bool)
    private var currencySpenditureAction: ((Bool) -> Void)? = nil
    
    required init(with parentViewController: UIViewController, zoneID: String) {
        self.zoneID = zoneID
        self.parentViewController = parentViewController
        self.offerwall = BIDMADOfferwall(zoneId: zoneID)
        
        super.init()
        
        self.offerwall.delegate = self
    }
    
    func load() {
        self.offerwall.load()
    }
    
    func show() {
        self.offerwall.show()
    }
    
    func isLoaded() -> Bool {
        return self.offerwall.isLoaded
    }
    
    /**
     Currency info will be provided through completion handler, with the true if success, false if failed.
     If success (true), currency amount (Double) is available.
     */
    func getCurrency(currencyReceivalCompletion: @escaping (_ isSuccess: Bool, _ currencyAmount: Int?) -> Void) {
        self.currencyReceivalAction = currencyReceivalCompletion
    }
    
    /**
     Whether Currency Spenditure was successful or not is provided through completion handler.
     If success, true and if failure, false
     */
    func spendCurrency(currencySpenditureCompletion: @escaping (_ isSuccess: Bool) -> Void) {
        self.currencySpenditureAction = currencySpenditureCompletion
    }
}

extension BidmadOfferwallAd: BIDMADOfferwallDelegate {
    func bidmadOfferwallLoadAd(_ core: BIDMADOfferwall!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadLoadAd()
    }
    
    func bidmadOfferwallShowAd(_ core: BIDMADOfferwall!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadShowAd()
    }
    
    func bidmadOfferwallCloseAd(_ core: BIDMADOfferwall!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadCloseAd()
    }
    
    func bidmadOfferwallFailedAd(_ core: BIDMADOfferwall!) {
        guard let delegate = delegate else { return }
        
        delegate.bidmadFailedAd()
    }
    
    func bidmadOfferwallSpendCurrencyFail(_ core: BIDMADOfferwall!, error: String!) {
        self.currencySpenditureAction?(false)
    }
    
    func bidmadOfferwallGetCurrencyBalanceFail(_ core: BIDMADOfferwall!, error: String!) {
        self.currencyReceivalAction?(false, nil)
    }
    
    func bidmadOfferwallSpendCurrencySuccess(_ core: BIDMADOfferwall!, currencyName: String!, balance: Int32) {
        self.currencySpenditureAction?(true)
    }
    
    func bidmadOfferwallGetCurrencyBalanceSuccess(_ core: BIDMADOfferwall!, currencyName: String!, balance: Int32) {
        self.currencyReceivalAction?(true, Int(balance))
    }
}

