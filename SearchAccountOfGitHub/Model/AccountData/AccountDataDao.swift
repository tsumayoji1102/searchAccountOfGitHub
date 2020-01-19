//
//  AccountDataDao.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/18.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import Alamofire

class AccountDataDao: NSObject {
    
    override init() {
        super.init()
    }
  
     
    // 検索メソッド
    func searchAccount(word: String) -> Array<AccountData>{
        
        // stringのURL
        let urlString = "https://api.github.com/search/users?q=\(word)"
        print(urlString)
        
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        
        
    }
    
    func getResult(){
        
    }

}
