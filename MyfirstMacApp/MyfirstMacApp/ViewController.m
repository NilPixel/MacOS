//
//  ViewController.m
//  MyfirstMacApp
//
//  Created by 政 on 2017/9/18.
//  Copyright © 2017年 政. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

}

- (NSTableView *)tableView {
    if (!_tableView) {
        _tableView = [[NSTableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor = [NSColor cyanColor];
    }
    return _tableView;
}

@end
