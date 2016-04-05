//
//  MyOrderViewController.m
//  LoveHealth
//
//  Created by administrator on 16/3/26.
//  Copyright © 2016年 yjh. All rights reserved.
//

#import "MyOrderViewController.h"
#import "Header.h"
#import "OrderTableViewCell.h"

@interface MyOrderViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
     self.orderTable = [[UITableView alloc]initWithFrame:CGRectMake(0, HEIGHT5S(64), SCREEN_WIDTH, HEIGHT5S(504)) style:UITableViewStylePlain];
     self.orderTable.dataSource = self;
     self.orderTable.delegate = self;
     [self.view addSubview:self.orderTable];
     
     [self createCommentView];
     
     self.orderArr = [NSMutableArray arrayWithCapacity:0];
     [self.orderArr addObject:self.orderDic];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     
     return self.orderArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     return 85;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     
     static NSString *Identifier = @"orderList";
     
     OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
     if (cell == nil) {
          cell = [[OrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
     }
     cell.goodsImg.image = [UIImage imageNamed:@"1.1.jpg"];
     cell.goodsName.text = [self.orderDic objectForKey:@"name"];
     cell.orderNumber.text = [self.orderDic objectForKey:@"buyNumber"];
     cell.date.text = @"2016-04-05";
     cell.number.text = [NSString stringWithFormat:@"数量:%d",self.num];
     cell.isSend.text = @"已发货";
     [cell.comment addTarget:self action:@selector(goComment) forControlEvents:UIControlEventTouchUpInside];
     
     return cell;
}

- (void)goComment{
     
    [UIView animateWithDuration:0.3 animations:^{
         self.sendCommentView.frame = CGRectMake(0, HEIGHT5S(200), SCREEN_WIDTH, HEIGHT5S(368));
    }];
     
    
}

//创建评价view
- (void)createCommentView{
     
     
     self.sendCommentView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT5S(568), SCREEN_WIDTH, HEIGHT5S(368))];
     [self.view addSubview:self.sendCommentView];
     
     self.commentView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, WIDTH5S(320), HEIGHT5S(200))];
     self.commentView.textColor = COLOR(100, 100, 100, 1);
     self.commentView.font = FONT(15);
     self.commentView.delegate = self;
     self.commentView.returnKeyType = UIReturnKeyDefault;
     self.commentView.scrollEnabled = YES;//可拖动
     self.commentView.editable = YES;//可编辑
     self.commentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适高
     [self.sendCommentView addSubview:self.commentView];
     
     self.typebtn1 = [[UIButton alloc]initWithFrame:CGRectMake(15, HEIGHT5S(210), WIDTH5S(90), HEIGHT5S(30))];
     [self.typebtn1 setTitle:@"质量好" forState:UIControlStateNormal];
     self.typebtn1.backgroundColor = COLOR(228, 228, 228, 1);
     [self.typebtn1 setTitleColor:COLOR(228, 228, 228, 1) forState:UIControlStateNormal];
     [self.typebtn1 setTitleColor:COLOR(0, 210, 210, 1) forState:UIControlStateSelected];
     [self.sendCommentView addSubview:self.typebtn1];
     
     self.typebtn2 = [[UIButton alloc]initWithFrame:CGRectMake(115, HEIGHT5S(210), WIDTH5S(90), HEIGHT5S(30))];
     [self.typebtn2 setTitle:@"便宜" forState:UIControlStateNormal];
     self.typebtn2.backgroundColor = COLOR(228, 228, 228, 1);
     [self.typebtn2 setTitleColor:COLOR(228, 228, 228, 1) forState:UIControlStateNormal];
     [self.typebtn2 setTitleColor:COLOR(0, 210, 210, 1) forState:UIControlStateSelected];
     [self.sendCommentView addSubview:self.typebtn2];
     
     self.typebtn3 = [[UIButton alloc]initWithFrame:CGRectMake(215, HEIGHT5S(210), WIDTH5S(90), HEIGHT5S(30))];
     [self.typebtn3 setTitle:@"快递不错" forState:UIControlStateNormal];
     self.typebtn3.backgroundColor = COLOR(228, 228, 228, 1);
     [self.typebtn3 setTitleColor:COLOR(228, 228, 228, 1) forState:UIControlStateNormal];
     [self.typebtn3 setTitleColor:COLOR(0, 210, 210, 1) forState:UIControlStateSelected];
     [self.sendCommentView addSubview:self.typebtn3];
     
     self.typebtn4 = [[UIButton alloc]initWithFrame:CGRectMake(15, HEIGHT5S(250), WIDTH5S(90), HEIGHT5S(30))];
     [self.typebtn4 setTitle:@"款式新" forState:UIControlStateNormal];
     self.typebtn4.backgroundColor = COLOR(228, 228, 228, 1);
     [self.typebtn4 setTitleColor:COLOR(228, 228, 228, 1) forState:UIControlStateNormal];
     [self.typebtn4 setTitleColor:COLOR(0, 210, 210, 1) forState:UIControlStateSelected];
     [self.sendCommentView addSubview:self.typebtn4];
     
     self.typebtn5 = [[UIButton alloc]initWithFrame:CGRectMake(115, HEIGHT5S(250), WIDTH5S(90), HEIGHT5S(30))];
     [self.typebtn5 setTitle:@"态度好" forState:UIControlStateNormal];
     self.typebtn5.backgroundColor = COLOR(228, 228, 228, 1);
     [self.typebtn5 setTitleColor:COLOR(228, 228, 228, 1) forState:UIControlStateNormal];
     [self.typebtn5 setTitleColor:COLOR(0, 210, 210, 1) forState:UIControlStateSelected];
     [self.sendCommentView addSubview:self.typebtn5];
     
     self.typebtn6 = [[UIButton alloc]initWithFrame:CGRectMake(215, HEIGHT5S(250), WIDTH5S(90), HEIGHT5S(30))];
     [self.typebtn6 setTitle:@"大小合适" forState:UIControlStateNormal];
     self.typebtn6.backgroundColor = COLOR(228, 228, 228, 1);
     [self.typebtn6 setTitleColor:COLOR(228, 228, 228, 1) forState:UIControlStateNormal];
     [self.typebtn6 setTitleColor:COLOR(0, 210, 210, 1) forState:UIControlStateSelected];
     [self.sendCommentView addSubview:self.typebtn6];
     
     self.sendComment = [[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT5S(320), SCREEN_WIDTH, HEIGHT5S(48))];
     [self.sendComment setTitle:@"发送评价" forState:UIControlStateNormal];
     [self.sendComment setTitleColor:COLOR(150, 150, 150, 1) forState:UIControlStateNormal];
     [self.sendCommentView addSubview:self.sendComment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
