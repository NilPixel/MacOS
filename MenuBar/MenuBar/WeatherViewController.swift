//
//  WeatherViewController.swift
//  MenuBar
//
//  Created by 政 on 2017/10/4.
//  Copyright © 2017年 政. All rights reserved.
//

import Cocoa

class WeatherViewController: NSViewController {

    class func loadFromNib() -> WeatherViewController {
        let storyBoard = NSStoryboard(name:NSStoryboard.Name(rawValue: "Main"), bundle:nil)
        return storyBoard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "WeatherViewController")) as! WeatherViewController
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
