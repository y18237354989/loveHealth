//
//  PostListViewController.m
//  LoveHealth
//
//  Created by administrator on 16/3/26.
//  Copyright © 2016年 yjh. All rights reserved.
//

#import "PostListViewController.h"
#import "Header.h"
#import "SendPostViewController.h"
@interface PostListViewController ()

@end

@implementation PostListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     //设置导航栏标题字体大小和颜色
     [self.navigationController.navigationBar setTitleTextAttributes:
      @{NSFontAttributeName:FONT(18),
        NSForegroundColorAttributeName:COLOR(255, 255, 255, 1)}];
    self.view.backgroundColor = [UIColor blueColor];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"发贴" style:UIBarButtonItemStylePlain target:self action:@selector(sendPostPage)];
    [right setTintColor:COLOR(255, 255, 255, 1)];
    self.navigationItem.rightBarButtonItem = right;
}

-(void)sendPostPage{
    SendPostViewController *svc = [[SendPostViewController alloc]init];
    svc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:svc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
