//
//  AccountDataDao.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/18.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit

class AccountDataDao: NSObject {
    
    override init() {
        super.init()
    }
    
    
    // データを取得する(非同期処理)
    func getAccountDataFromAPI(urlString: String, completion: @escaping (AccountData?) -> Swift.Void){
        
        // URL型に変換
        guard let url = URL(string: urlString) else{
            return
        }
        // request生成
        let request = URLRequest(url: url)
        
        // 非同期でリクエスト
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            
            // データがないなら処理終了
            guard let data = data else{
                print("データなし")
                return
            }
            
            do{
                // JSONにデコード
                let jsonData = try JSONDecoder().decode(AccountData.self, from: data)
                print(jsonData)

                // 返却
                completion(jsonData)
                
            }catch let e{
                print("デコードエラー: \(e)")
                completion(nil)
            }
            
        }
        // 実行
        task.resume()
    }

}
