//
//  getSize.swift
//  SearchAccountOfGitHub
//
//  Created by 塩見陵介 on 2020/01/19.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit

class getSize: NSObject {
    
    static func getUsefulSize() -> Dictionary<String, CGFloat>{
        
        let screenSize = UIScreen.main.bounds.size
        
        let screenHeight = screenSize.height
        let screenWidth  = screenSize.width
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        
        let dic = ["screenHeight":    screenHeight,
                   "screenWidth":     screenWidth,
                   "statusBarHeight": statusBarHeight]
        
        return dic
    }

}
