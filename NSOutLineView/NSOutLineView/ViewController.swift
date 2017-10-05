//
//  ViewController.swift
//  NSOutLineView
//
//  Created by 政 on 2017/10/5.
//  Copyright © 2017年 政. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource {

    @IBOutlet var treeController: NSTreeController!
    @IBOutlet weak var outLineView: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func addData() {
        let root = [
            "name":"Library",
            "isLeaf":false
            ] as [String : Any]
        
        let dict: NSMutableDictionary = NSMutableDictionary(dictionary: root)
        dict.setObject([PlayList(), PlayList()], forKey: "children" as NSCopying)
        treeController.addObject(dict)
        
    }
    
    //MARK Helpers
    func isHeader(_ item: Any) -> Bool {
        if let item = item as? NSTreeNode {
            return !(item.representedObject is PlayList)
        } else {
            return !(item is PlayList)
        }
    }
    //MARK NSOutlineDelegate
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        if isHeader(item) {
            return outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self)
        } else {
            return outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self)
        }
    }

}

