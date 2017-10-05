//
//  EventMonitor.swift
//  MenuBar
//
//  Created by 政 on 2017/10/4.
//  Copyright © 2017年 政. All rights reserved.
//

import Cocoa

class EventMonitor {
    private var monitor: Any?
    private var mask: NSEvent.EventTypeMask
    private var handler: (NSEvent?) -> ()
    
    
    init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> ()) {//handler是一个在构造函数外定义的闭包类型，需要逃逸出函数，需要escaping修饰，不然编译不通过
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}

