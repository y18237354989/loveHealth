//
//  ViewController.m
//  第三方分享
//
//  Created by administrator on 16/3/31.
//  Copyright © 2016年 yjh. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import "AppDelegate.h"

@interface ViewController ()<UMSocialUIDelegate>

@property (strong, nonatomic)UIButton *btn;

@property (strong, nonatomic)UITextField *text;

@end

@implementation ViewController

- (void)viewDidLoad {
     [super viewDidLoad];
     
     self.btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 120, 60)];
     self.btn.backgroundColor = [UIColor redColor];
     [self.view addSubview:self.btn];
     [self.btn addTarget:self action:@selector(sharenews) forControlEvents:UIControlEventTouchUpInside];
     
     self.text = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, 300, 40)];
     self.text.backgroundColor = [UIColor redColor];
     self.text.textAlignment = 1;
     [self.view addSubview:self.text];
     
}

//分享方法
- (void)share{
     
     [UMSocialSnsService presentSnsIconSheetView:self appKey:APPKEY shareText:self.text.text shareImage:[UIImage imageNamed:@"11111.jpg"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToTencent,UMShareToQzone,UMShareToQQ,UMShareToWechatTimeline,UMShareToSina,UMShareToFacebook,UMShareToRenren, nil] delegate:self];
     
     //     //分享样式自定义
     //     [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQQ] content:@"分享文字" image:[UIImage imageNamed:@"icon"] location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
     //          if (response.responseCode == UMSResponseCodeSuccess) {
     //               NSLog(@"分享成功！");
     //          }
     //     }];
     
     //     //点击分享内容跳转链接
     //     [UMSocialData defaultData].extConfig.qqData.title = @"QQ分享title";
     
}

//回调方法
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
     //根据`responseCode`得到发送结果,如果分享成功
     if(response.responseCode == UMSResponseCodeSuccess)
     {
          //得到分享到的微博平台名
          NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
          self.text.text = @"分享成功!";
     }
}

- (void)sharenews{
     
     [self share];
}


- (void)didReceiveMemoryWarning {
     [super didReceiveMemoryWarning];
     // Dispose of any resources that can be recreated.
}

@end
