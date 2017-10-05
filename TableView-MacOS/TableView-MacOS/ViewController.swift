//
//  ViewController.swift
//  TableView-MacOS
//
//  Created by 政 on 2017/10/3.
//  Copyright © 2017年 政. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTextFieldDelegate {

    var strings = ["apple","banana","orange","watermelon"]
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var inputText: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func addFruit(_ sender: Any?) {
        let string = inputText.stringValue
        if !string.isEmpty {
            strings.append(string)
            inputText.stringValue = ""
            tableView.reloadData()
        }
    }
    //MARK: DataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return strings.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return strings[row]
    }

    //MARK: TextFieldDelegate
    override func controlTextDidEndEditing(_ obj: Notification) {
        addFruit(nil)
    }
}

