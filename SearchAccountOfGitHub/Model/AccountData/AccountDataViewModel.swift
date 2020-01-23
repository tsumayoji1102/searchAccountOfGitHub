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
    
    
    // APIの検索結果を返す
    func searchAccount(word: String, completion: @escaping (AccountData?) -> Swift.Void){
        
        // エンコード
        let encoding = word.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // gitHubAPI
        let url: String = "https://api.github.com/search/users?q=\(encoding)"
        print(url)
        
        // データ取得
        accountDataDao.getAccountDataFromAPI(urlString: url, completion: {(accountList) in
            
            completion(accountList!)
        })
        
    }
    
    
    // 画像をURLから取得
    func getImageByUrl(url: String) -> UIImage!{
        
        let url = URL(string: url)
        do {
            // 画像を取得
            let data  = try Data(contentsOf: url!)
            let image = UIImage(data: data)!
            let size  = CGSize(width: 50, height: 50)
            
            // 画像サイズを最適化
            UIGraphicsBeginImageContext(size)
            image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return resizedImage
            
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        return UIImage()
    }

}
