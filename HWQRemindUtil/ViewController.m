//
//  ViewController.m
//  HWQRemindUtil
//
//  Created by hwq on 2018/1/2.
//  Copyright © 2018年 hwq. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+HUD.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)NSArray *kinds;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提示类型选择";
    
    _kinds = @[@"网络加载提示",@"不带图标提示",@"带图标提示"];
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _kinds.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _kinds[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self showHudInView:self.view hint:@"加载中..."];
//            int i=0;
//            while (i<9000000) {
//                i++;
//            }
            
             //   [self hideHud];
          
            // 启动图片延时: 2秒
           // [NSThread sleepForTimeInterval:3];
            break;
        case 1:
            [self showHint:@"不带图标提示" yOffset:0];
            break;
        case 2:
            [self showHint:@"带图标提示" andImageName:@"成功" yOffset:0];
        default:
            break;
    }
}

@end
