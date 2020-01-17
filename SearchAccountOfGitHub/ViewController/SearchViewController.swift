//
//  SearchViewController.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/17.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {


    @IBOutlet weak var rootNavi: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootNavi.title = "アカウント検索"

        
    }
    
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
    }
    */
    
    // セル数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    // セル生成
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セル生成
        let cell = UITableViewCell.init()
        
        // 実験台
        let label = UILabel.init(frame: CGRect.init(x: 10, y: 10, width: 100, height:20))
        label.text = "Hello World"
        
        // 貼り付けて返す
        cell.addSubview(label)
        return cell
    }
    
    
    // セルの高さ
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    // 画面遷移(タップ時)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let navigationController = self.storyboard!.instantiateViewController(withIdentifier: "SearchResultViewController")
        
        self.show(navigationController, sender: nil)
    }

}
