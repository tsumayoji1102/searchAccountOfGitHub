//
//  AccountDataDao.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/18.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit

class AccountDataDao: NSObject {
    
    // AccountData
    var accountData: AccountData!
    
    override init() {
        super.init()
    }
    
    
    // APIから取得するメソッド
    func getApiInfo(word: String) -> AccountData!{
        
        // stringのURL
        let urlString = "https://api.github.com/search/users"
        print(urlString)
        // URL化
        let url = URL(string: urlString)
        // コンポーネントの作成
        guard var components = URLComponents(url: url!, resolvingAgainstBaseURL: url?.baseURL != nil) else {
            return self.accountData
        }
        
        // クエリを指定（q = 検索ワード)
        components.queryItems = [URLQueryItem(name: "q", value: word)] + (components.queryItems ?? [])
        
        // request生成
        var request = URLRequest(url: components.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // JSONを拾う作業
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            // Errorがあるなら終了
            if let error = error{
                print("セッションエラー:\(error)")
                return
            }
            // データがなくても終了
            guard let data = data else{
                return
            }
            // JSONDecoder使う
            do{
                self.accountData = try JSONDecoder().decode(AccountData.self, from: data)
            }catch {
                print("JSONDecoderエラー")
            }
        })
        // 終了
        task.resume()
        
        return self.accountData
        
    }

}
