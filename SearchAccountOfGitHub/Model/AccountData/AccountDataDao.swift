//
//  AccountDataDao.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/18.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class AccountDataDao: NSObject {
    
    private var accountData: AccountData!
    
    override init() {
        super.init()
    }
    
    
    
    // データを取得する(非同期処理)
    func getAccountDataFromAPI(urlString: String, completion: @escaping (Array<Account>) -> Swift.Void){
        
        // URL型に変換
        let url = URL(string: urlString)!
        
        // request生成
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            
            // データがないなら処理終了
            guard let data = data else{
                print("データなし")
                return
            }
            
            do{
                let jsonData = try JSONDecoder().decode(AccountData.self, from: data)
                print(jsonData)
                
                var list = Array<Account>()
                
                for item in jsonData.items {
                    let account = Account.init(
                        login:      item.login,
                        type:       item.type,
                        html_url:   item.html_url,
                        avatar_url: item.avatar_url)
                    
                    list.append(account)
                }
                
                completion(list)
                
            }catch let e{
                print("デコードエラー: \(e)")
                
            }
            
        }
        // 実行
        task.resume()
        
    }
    
    
    // データ取得(非同期）
    func getAccountData() -> AccountData!{
        return self.accountData
    }

}
