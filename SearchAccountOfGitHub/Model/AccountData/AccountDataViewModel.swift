//
//  AcountDataViewModel.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/20.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit

class AccountDataViewModel: NSObject {
    
    let accountDataDao: AccountDataDao = AccountDataDao.init()
    var accountList: Array<Account>!
    
    override init(){
        super.init()
    }
    
    // 検索結果を返す
    func searchAccount(word: String){
        
        // gitHubAPI
        let url: String = "https://api.github.com/search/users?q=\(word)"
        
        // データ取得
        accountDataDao.getAccountDataFromAPI(urlString: url, completion: {(accountList) in
            
            self.accountList = accountList
        })
        
    }
    
    
    // 画像をURLから取得
    func getImageByUrl(url: String) -> UIImage{
        
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            return UIImage(data: data)!
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        return UIImage()
    }

}
