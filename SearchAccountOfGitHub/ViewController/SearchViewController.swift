//
//  SearchViewController.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/17.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import KRProgressHUD

class SearchViewController: UITableViewController {

    // @IBOutlet
    @IBOutlet weak var rootNavi: UINavigationItem!
    
    // 検索結果
    var accountList: Array<Account>!
    
    // viewModel
    let viewModel = AccountDataViewModel.init()
    
    // viewパーツ
    var searchBar: UISearchTextField!
    
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootNavi.title = "アカウント検索"
        
        // 検索欄
        searchBar = UISearchTextField.init(frame: CGRect.init(x: 0, y: 0, width: getSize.getUsefulSize()["screenWidth"]! * 4 / 5, height: 40))
        searchBar.delegate = self
        searchBar.placeholder = "アカウントを検索"
        searchBar.keyboardType = .emailAddress

        
    }
    
    // MARK: - TableView系メソッド
    
    // ヘッダー内容
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
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
        
        }else{
            
            let account = accountList[indexPath.row]
            
            let image: UIImage = viewModel.getImageByUrl(url: account.avatar_url)
            
            
            let loginLabel  = UILabel.init(frame: CGRect.init(x: 60, y: 10, width: 100, height: 15))
            loginLabel.text = account.login
            
            let typeLabel  = UILabel.init(frame: CGRect.init(x: 60, y: 25, width: 100, height: 15))
            typeLabel.text = account.type
            
            //cell.addSubview(image)
            cell.addSubview(loginLabel)
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
        
        let navigationController = self.storyboard!.instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController
        
        // 検索結果がないならGoogleにとばす
        if(accountList == nil){
            navigationController.resultUrl = "https://google.co.jp"
            
        }else{
            navigationController.resultUrl = accountList[indexPath.row].html_url
        }
        
        self.show(navigationController, sender: nil)
    }
    

}


// MARK: - TextField系メソッド
extension SearchViewController: UITextFieldDelegate, UISearchTextFieldDelegate{
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        KRProgressHUD.show()
        
        // gitHubAPI
        let url: String = "https://api.github.com/search/users?q=\(textField.text!)"
        
        // データ取得
        viewModel.accountDataDao.getAccountDataFromAPI(urlString: url, completion: {(accountList) in
            
            self.accountList = accountList
            
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
                KRProgressHUD.dismiss()
            })
        })
        
        return true
    }
}
    
