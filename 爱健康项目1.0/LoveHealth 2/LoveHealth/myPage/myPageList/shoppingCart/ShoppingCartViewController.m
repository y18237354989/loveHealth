//
//  ShoppingCartViewController.m
//  LoveHealth
//
//  Created by administrator on 16/3/26.
//  Copyright © 2016年 yjh. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "Header.h"
#import "ShoppingCarTableViewCell.h"

@interface ShoppingCartViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *tableView;

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTableView];
}
-(void)createTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH5S(320), HEIGHT5S(568))];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"shoppingcart";
    ShoppingCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[ShoppingCarTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
//    NSString *home = NSHomeDirectory();
//    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
//    NSString *filePath = [docPath stringByAppendingPathComponent:@"goodsinfo.plist"];
//    NSArray *goodsArr = [[NSArray alloc]initWithContentsOfFile:filePath];
    
    //    cell.goodsNamelabel.text =[NSString stringWithFormat:@"%@",[self.goodsDic1 objectForKey:@"goodsName"]];
//    cell.goodsPriceLabel.text = [NSString stringWithFormat:@"%@",[self.goodsDic1 objectForKey:@"goodsPrice"]];;
//    cell.goodsNamelabel.text = [NSString stringWithFormat:@"%@",[goodsArr[indexPath.row] objectForKey:@"goodsName" ]];
    cell.goodsNamelabel.text = @"商品名称";
    cell.goodsPriceLabel.text = @"商品价格";
    cell.goodsNumLabel.text = @"x2";
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
