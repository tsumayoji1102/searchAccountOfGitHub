//
//  AccountData2.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/18.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

/*
 * @params
 *  accountId:    アカウントのID
 *  accountImage: アカウントのアバター画像
 *  accountName:  アカウントのユーザー名
 *  accountType:  アカウントのタイプ（ユーザーor会社）
 */

import UIKit

class AccountData: NSObject {
    
    private var accountId:    String
    private var accountImage: String
    private var accountName:  String
    private var accountType:  String
    
    // イニシャライザ
    init(accountId: String, accountImage: String, accountName: String, accountType: String){
        
        self.accountId    = accountId
        self.accountImage = accountImage
        self.accountName  = accountName
        self.accountType  = accountType
    }
    
    // MARK: - Getter Method
    func getAccountId()    -> String{
        return self.accountId
    }
    
    func getAccountImage() -> String{
        return self.accountImage
    }
    
    func getAccountName()  -> String{
        return self.accountName
    }
    
    func getAccountType()  -> String{
        return self.accountType
    }

}
