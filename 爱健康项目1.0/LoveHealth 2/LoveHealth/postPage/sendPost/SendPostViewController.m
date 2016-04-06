//
//  SendPostViewController.m
//  LoveHealth
//
//  Created by administrator on 16/3/26.
//  Copyright © 2016年 yjh. All rights reserved.
//

#import "SendPostViewController.h"
#import "Header.h"
@interface SendPostViewController ()

@property (strong,nonatomic)UILabel *titleLabel;

@property (strong,nonatomic)UITextField *titleText;

@property (strong,nonatomic)UILabel *contentLabel;

@property (strong,nonatomic)UITextField *contentText;

@property (strong,nonatomic)UIButton *markBtn;

@end

@implementation SendPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"发帖子";
    
    [self createPart];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createPart{
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 80, 35, 20)];
    self.titleLabel.text = @"标题:";
    [self.view addSubview:self.titleLabel];
    
    self.titleText = [[UITextField alloc]initWithFrame:CGRectMake(15, 115, 290, 30)];
    self.titleText.layer.cornerRadius = 6;
    [self.view addSubview:self.titleText];
    
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 155, 35, 20)];
    self.contentLabel.text = @"内容:";
    [self.view addSubview:self.contentLabel];
    
    self.contentText = [[UITextField alloc]initWithFrame:CGRectMake(15, 185, 290, 305)];
    self.contentText.layer.cornerRadius = 6;
    [self.view addSubview:self.contentText];
    
    self.markBtn = [[UIButton alloc]initWithFrame:CGRectMake(220, 80, 84, 20)];
    [self.markBtn setBackgroundColor:COLOR(204, 255, 255, 1)];
    [self.markBtn setTitle:@"点击选择标签" forState:UIControlStateNormal];
    [self.markBtn set]
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
