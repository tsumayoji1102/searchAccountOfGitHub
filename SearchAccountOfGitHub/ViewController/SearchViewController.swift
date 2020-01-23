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
    var accountData: AccountData!
    
    // viewModel
    let viewModel = AccountDataViewModel.init()
    
    // viewパーツ
    var searchBar:     UISearchTextField!
    var searchBarView: UIView!
    
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootNavi.title = "アカウント検索"
        
        let cgrect = CGRect.init(x: 0, y: 0, width: getSize.getUsefulSize()["screenWidth"]!, height: 40)
        
        // 検索欄
        searchBar = UISearchTextField.init(frame: cgrect)
        searchBar.delegate = self
        searchBar.placeholder = "アカウントを検索"
        searchBar.keyboardType = .alphabet
        
        
        searchBarView = UIView.init(frame: cgrect)
        searchBarView.backgroundColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 1)
        searchBarView.addSubview(searchBar)
        
        
    }
    
    // MARK: - 通常メソッド
    
    func alertViewOK(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let OKAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - TableView系メソッド
    
    // ヘッダー内容
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return searchBarView
    }
    
    // ヘッダーの高さ
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
    
    
    // セル数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(accountData != nil){
            return accountData.items.count
        }
        
        return 0

    }
    
    
    // セル生成
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セル生成
        let cell = UITableViewCell.init()
    
        let account = accountData.items[indexPath.row]
            
        // imageViewの作成
        let image: UIImage = viewModel.getImageByUrl(url: account.avatar_url)
        let imageView = UIImageView.init(frame: CGRect.init(x: 20, y: 10, width: 50, height: 50))
        imageView.image = image
            
        // アカウント名のラベル
        let loginLabel  = UILabel.init(frame: CGRect.init(x: 100, y: 10, width: 200, height: 18))
        loginLabel.text = account.login
            
        // タイプのラベル
        let typeLabel  = UILabel.init(frame: CGRect.init(x: 100, y: 40, width: 150, height: 18))
        typeLabel.text = account.type
            
        // セルに貼り付け
        cell.addSubview(imageView)
        cell.addSubview(loginLabel)
        cell.addSubview(typeLabel)
    
        return cell
    }
    
    
    // セルの高さ
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    // 画面遷移(タップ時)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let navigationController = self.storyboard!.instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController
        
        // URL, ナビタイトルを紐づける
        navigationController.resultUrl        = accountData.items[indexPath.row].html_url
        navigationController.resultNavi.title = accountData.items[indexPath.row].login
        
        self.show(navigationController, sender: nil)
    }
    

}


// MARK: - TextField系メソッド
extension SearchViewController: UITextFieldDelegate, UISearchTextFieldDelegate{
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        KRProgressHUD.show()
        
        if(textField.text! == ""){
            KRProgressHUD.dismiss()
            alertViewOK(title: "注意", message: "検索ワードを入力してください。")
            return false
            
        }else if(textField.text!.contains(Character.init(" ")) || textField.text!.contains(Character.init("　"))){
            alertViewOK(title: "注意", message: "空白を使用せずに入力してください。")
            KRProgressHUD.dismiss()
            return false
            
        }
        
        // データ取得
        viewModel.searchAccount(word: textField.text!, completion: {
            
            (accountData) in
            
            if(accountData != nil){
                self.accountData = accountData
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                    KRProgressHUD.dismiss()
                })
            }else{
                KRProgressHUD.dismiss()
                self.alertViewOK(title: "エラー", message: "検索結果がないか、エラーが発生しました。")
            }
            
        })
        
        return true
    }
}
    
