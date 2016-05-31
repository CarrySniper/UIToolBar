//
//  ViewController.m
//  UIToolBar的使用
//
//  Created by 思久科技 on 16/5/31.
//  Copyright © 2016年 Seejoys. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"UIToolBar的使用";
    self.view.backgroundColor = [UIColor grayColor];
    [self.navigationController setToolbarHidden:NO];
    
    //设置半透明
    [self.navigationController.toolbar setTranslucent:NO];
    //设置痕迹颜色
    [self.navigationController.toolbar setTintColor:[UIColor whiteColor]];
    //设置背景颜色
    [self.navigationController.toolbar setBarTintColor:[UIColor purpleColor]];
    //设置背景图片
    [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:@""] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    
    
    //添加UIBarButtonItem 4个
    //1.系统自带的
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction)];
    
    //2.带图片UIImage的
    UIImage *itemImage = [[UIImage imageNamed:@"mortgage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithImage:itemImage style:UIBarButtonItemStyleDone target:self action:@selector(imageAciton)];
    
    //3.带标题Title的
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"title" style:UIBarButtonItemStyleDone target:self action:@selector(titleAction)];
    
    //4.自定义UIView的 - 需要UIView自己添加响应，直接设置item是不会响应的，原因不懂，可以测试。
    UISwitch *Switch = [[UISwitch alloc] init];
    [Switch addTarget:self action:@selector(customViewAction:) forControlEvents:UIControlEventValueChanged];//添加事件
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithCustomView:Switch];

    //添加UIBarButtonItem 空格间距，这样就会平均排版到整个UIToolBar
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    //将4个UIBarButtonItem作为数组元素复制到数组self.toolbarItems中
    NSArray *itemsArray = @[fixedSpace, item0,
                            flexibleSpace, item1,
                            flexibleSpace, item2,
                            flexibleSpace, item3,
                            fixedSpace];
    self.toolbarItems = itemsArray;
    
}

- (void)addAction
{
    NSLog(@"系统自带的");
}

- (void)imageAciton
{
    NSLog(@"带图片UIImage的");
}

- (void)titleAction
{
    NSLog(@"带标题Title的");
}

- (void)customViewAction:(UISwitch *)sender
{
    if (sender.isOn) {
        NSLog(@"自定义UIView的 : 开");
    }else{
        NSLog(@"自定义UIView的 : 关");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
