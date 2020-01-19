//
//  User.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/20.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//
import UIKit

// アカウントのオブジェクト
class Account: NSObject {
    
    let login:      String
    let type:       String
    let html_url:   String
    let avatar_url: String
    
    init(login: String, type: String, html_url: String, avatar_url: String) {
        self.login      = login
        self.type       = type
        self.html_url   = html_url
        self.avatar_url = avatar_url
    }

}
