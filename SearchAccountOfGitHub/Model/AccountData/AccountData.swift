//
//  AccountData2.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/20.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

/*
 * JSONDecoderでインスタンスを作る
 *
*/
import Foundation

struct AccountData: Codable {
    
    let total_count: Int
    let items:       [Item]  // ここからデータを拾う
    
    // ネスト対応
    struct Item: Codable {
        let login:      String
        let type:       String
        let html_url:   String
        let avatar_url: String
    }
}
