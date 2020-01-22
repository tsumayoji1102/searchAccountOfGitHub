//
//  ViewController.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/17.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import WebKit
import KRProgressHUD

class SearchResultViewController: UIViewController {
    
    // @IBoutlet
    @IBOutlet weak var resultNavi: UINavigationItem!
    
    // 値
    var resultUrl: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let screenSize = getSize.getUsefulSize()
        
        let screenSizeForView = CGRect.init(
            x:      0,
            y:      screenSize["statusBarHeight"]!,
            width:  screenSize["screenWidth"]!,
            height: screenSize["screenHeight"]! - screenSize["statusBarHeight"]!)
        
        let webView = WKWebView.init(frame: screenSizeForView)
        
        view.addSubview(webView)
        
        // テスト用URL
        let url = URL(string: resultUrl)
        
        webView.load(URLRequest(url: url!))
     
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        KRProgressHUD.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        KRProgressHUD.dismiss()
    }
    
}

