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
    
    override init(){
        super.init()
    }
    
    // 検索結果を返す
    func searchAccount(word: String) -> Array<Account>!{
        
        // 返す配列
        var list = Array<Account>()
        
        // gitHubAPI
        let url = "https://api.github.com/search/users?q=\(word)"
        
        // データ取得
        let accountData = accountDataDao.getAccountData(urlString: url)
        
        let max = accountData!.total_count
        
        // データ格納
        for i in 0 ..< max {
            let item = accountData?.items[i]
            let account = Account.init(
                login:      item!.login,
                type:       item!.type,
                html_url:   item!.html_url,
                avatar_url: item!.avatar_url
            )
            list.append(account)
        }
        
        return list
    }

}
