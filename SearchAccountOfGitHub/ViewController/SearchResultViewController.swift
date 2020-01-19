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
    
    @IBOutlet weak var resultNavi: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KRProgressHUD.show()
        
        // 画面サイズ取得
        let screenSize = getSize.getUsefulSize()
        
        // View用CGRect
        let screenSizeForView = CGRect.init(
            x: 0,
            y:      screenSize["statusBarHeight"]!,
            width:  screenSize["screenWidth"]!,
            height: screenSize["screenHeight"]!
                  - screenSize["statusBarHeight"]!)
        
        // webKit生成
        let webView = WKWebView.init(frame: screenSizeForView)
        
        view.addSubview(webView)
        
        // テスト用URL
        let url = URL(string: "https://google.co.jp")
        
        webView.load(URLRequest(url: url!))
     
        resultNavi.title = "結果"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        KRProgressHUD.dismiss()
    }
    
    
}


