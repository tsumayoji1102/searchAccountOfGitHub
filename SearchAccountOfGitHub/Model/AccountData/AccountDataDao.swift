//
//  AccountDataDao.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/18.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import WebKit

class AccountDataDao: NSObject {
    
    // AccountData
    var accountData: AccountData!
    
    override init() {
        super.init()
    }
    
    
    
    // データを取得する
    func getAccountData(urlString: String) -> AccountData!{
        // アカウントデータ
        var accountData: AccountData!
        
        // components作成
        guard let url = URLComponents(string: urlString) else {
            return nil
        }
        
        // task実行
        let task = URLSession.shared.dataTask(with: url.url!){
            (data, response, error) in
            // Errorで停止
            if(error != nil){
                print("Error:" + error!.localizedDescription)
                return
            }
            // Dataなしで停止
            guard let _data = data else{
                return
            }
            // JSONデコード
            do{
                accountData = try JSONDecoder().decode(AccountData.self, from: _data)
                
                for item in accountData.items{
                    print("login: \(item.login) type: \(item.type) html_url: \(item.html_url)")
                }
                
            }catch{
                print("デコードエラー")
            }
        }
        task.resume()
        
        return accountData
        
    }

}
