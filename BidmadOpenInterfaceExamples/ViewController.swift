//
//  ViewController.swift
//  BidmadOpenInterfaceExamples
//
//  Created by ADOP_Mac on 2021/11/29.
//

import UIKit
import SwiftUI
import BidmadOpenInterface

class ViewController: UIViewController {
    
    var reward: BidmadRewardAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        reward = BidmadRewardAd(with: self, zoneID: "346775fc-8e9c-477a-b938-1193fe805717")
//        reward?.delegate = self
//        reward?.load()
        
        let swiftUIBannerView =
            //BidmadBannerView()
            Rectangle().fill(Color.blue).frame(width: 320, height: 50)
        let swiftUIViewController = UIHostingController(rootView: swiftUIBannerView)
        
        self.present(swiftUIViewController, animated: true, completion: nil)
    }

}

extension ViewController: BidmadRewardAdDelegate {
    func bidmadRewardLoad() {
        print("Load")
        reward?.show()
    }
    
    func bidmadRewardShow() {
        print("Show")
    }
    
    func bidmadRewardClose() {
        print("Close")
    }
    
    func bidmadRewardClick() {
        print("Click")
    }
    
    func bidmadRewardComplete() {
        print("Complete")
    }
    
    func bidmadRewardAllFail() {
        print("AllFail")
    }
    
    func bidmadRewardSkipped() {
        print("Skipped")
    }
}
