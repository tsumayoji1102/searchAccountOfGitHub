//
//  ViewController.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/17.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import WebKit

class SearchResultViewController: UIViewController {
    
    @IBOutlet weak var resultNavi: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let screenSize = getSize.getUsefulSize()
        
        let screenSizeForView = CGRect.init(x: 0, y: screenSize["statusBarHeight"]!, width: screenSize["screenWidth"]!, height: screenSize["screenHeight"]! - screenSize["statusBarHeight"]!)
        
        let webView = WKWebView.init(frame: screenSizeForView)
        
        view.addSubview(webView)
        
        // テスト用URL
        let url = URL(string: "https://google.co.jp")
        
        webView.load(URLRequest(url: url!))
     
        resultNavi.title = "結果"
    }
    
    


}

