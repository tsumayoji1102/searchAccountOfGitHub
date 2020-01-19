//
//  SearchViewController.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/17.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {

    // @IBOutlet
    @IBOutlet weak var rootNavi: UINavigationItem!
    
    // 検索結果
    var accountList: Array<Account>!
    
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootNavi.title = "アカウント検索"

        
    }
    
    
    // MARK: - TableView系メソッド
    
    // ヘッダー内容
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // 検索欄
        let searchBar = UISearchBar.init()
        return searchBar
    }
    
    // ヘッダーの高さ
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
    
    
    // セル数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(accountList == nil || accountList.count == 0){
            return 1
            
        }else{
            return accountList.count
        }
        
    }
    
    
    // セル生成
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セル生成
        let cell = UITableViewCell.init()
        
        if(accountList == nil || accountList.count == 0){
            
            // 実験台
            let label = UILabel.init(frame: CGRect.init(x: 10, y: 25, width: 100, height:20))
            label.text = "Hello World"
            
            // 貼り付けて返す
            cell.addSubview(label)
        
        // 一旦Hello World
        }else{
            
            let account = accountList[indexPath.row]
            
            //let image = UIImage
            let nameLabel = UILabel.init(frame: CGRect.init(x: 60, y: 10, width: 100, height: 15))
            nameLabel.text = account.login
            
            let typeLabel = UILabel.init(frame: CGRect.init(x: 60, y: 25, width: 100, height: 15))
            typeLabel.text = account.type
            
            cell.addSubview(nameLabel)
            cell.addSubview(typeLabel)
            
        }
        
        return cell
    }
    
    
    // セルの高さ
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    // 画面遷移(タップ時)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let navigationController = self.storyboard!.instantiateViewController(withIdentifier: "SearchResultViewController")
        
        self.show(navigationController, sender: nil)
    }

}
