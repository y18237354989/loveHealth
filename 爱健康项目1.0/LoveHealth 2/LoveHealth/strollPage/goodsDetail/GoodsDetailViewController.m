//
//  GoodsDetailViewController.m
//  逛一逛Tableview
//
//  Created by Administrator on 16/3/31.
//  Copyright © 2016年 Administrator. All rights reserved.
//

#import "GoodsDetailViewController.h"
#import "Header.h"
#import "GoodsDetailTableViewCell.h"

@interface GoodsDetailViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic)UIScrollView *headScroll;
@property (strong,nonatomic)UIImageView *headImage;
@property (strong,nonatomic)UILabel *goodsNameLabel;  //商品名label
@property (strong,nonatomic)UILabel *collectLabel;  //收藏label
@property (strong,nonatomic)UIButton *collectbtn;  //收藏image
@property (strong,nonatomic)UILabel *verticalLineLabel;  //垂直线label
@property (strong,nonatomic)UILabel *transervseLineLabel;  //横线label
@property (strong,nonatomic)UILabel *goodsPriceLabel;  //商品价格label
@property (strong,nonatomic)UILabel *goodsOldPriceLabel;  //商品原价label
@property (strong,nonatomic)UILabel *expressFeeLabel;  //快递费label
@property (strong,nonatomic)UILabel *saleLabel; //月销量label
@property (strong,nonatomic)UILabel *shopAddressLabel; //商家地址
@property (strong,nonatomic)UILabel *sellerPromiseLabel; //卖家承诺
@property (strong,nonatomic)UILabel *separateLineLabel; //灰色分割线
@property (strong,nonatomic)UILabel * evaluateLabel;  //评价

@property (strong,nonatomic)UIView *bottomView;
@property (strong,nonatomic)UIButton *serviceBtn; //客服按钮
@property (strong,nonatomic)UIButton *shopBtn;  //店铺按钮
@property (strong,nonatomic)UIButton *shopCarBtn;  //加入购物车按钮
@property (strong,nonatomic)UIButton *buyBtn;  //立即购买按钮
@property (strong,nonatomic)UILabel *label;  //底部分隔线
@property (strong,nonatomic)UILabel *assess1, *assess2, *assess3, *assess4, *assess5, *assess6;  //评价类
@property (assign, nonatomic)float height;  //评论label高度

@property (strong,nonatomic)UIView *backGroundView; //背景灰色（透明度）
@property (strong,nonatomic)UIView *cartView;  //购物车
@property (strong,nonatomic)UIView *buyView;  //购买
@end

@implementation GoodsDetailViewController

- (void)viewDidLoad {
     [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
     
     self.goodsDetail = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT5S(504)) style:UITableViewStyleGrouped];
     self.goodsDetail.dataSource = self;
     self.goodsDetail.delegate = self;
     [self.view addSubview:self.goodsDetail];
     
     self.goodsDetail.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT5S(521))];
     [self.goodsDetail addSubview:self.goodsDetail.tableHeaderView];
     
     self.picArr = [NSMutableArray arrayWithCapacity:0];
     
     [self createHeadScroll];
     [self createOtherPart];
     [self createBottomView];
     [self createShopCart];
     [self createShopBuy];
     
}

- (void)didReceiveMemoryWarning {
     [super didReceiveMemoryWarning];
     // Dispose of any resources that can be recreated.
}

//定义顶部Scroll
-(void)createHeadScroll{
     
     self.headScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT5S(200))];
     self.headScroll.contentSize = CGSizeMake(SCREEN_WIDTH*4, HEIGHT5S(200));
     self.headScroll.showsVerticalScrollIndicator = NO;//是否显示竖向滚动条
     self.headScroll.showsHorizontalScrollIndicator = NO;//是否显示横向滚动条
     self.headScroll.pagingEnabled = YES;//是否设置分页
     [self.goodsDetail.tableHeaderView addSubview:self.headScroll];
     
     for (int i = 0; i<4; i++) {
          self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, HEIGHT5S(200))];
          self.headImage.image = [UIImage imageNamed:@"1.jpg"];
          [self.headScroll addSubview:self.headImage];
     }
     
}
//创建底部view
-(void)createBottomView{
     
     //    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 519, 320, 49)];
     //    [self.view addSubview:self.bottomView];
     
     self.serviceBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT5S(519), WIDTH5S(60), HEIGHT5S(49))];
     self.serviceBtn.backgroundColor = COLOR(228, 228, 228, 1);
     [self.serviceBtn setImage:[UIImage imageNamed:@"shop"] forState:UIControlStateNormal];
     [self.serviceBtn setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, -20)];
     [self.serviceBtn setTitle:@"客服" forState:UIControlStateNormal];
     self.serviceBtn.titleLabel.font = FONT(10);
     [self.serviceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [self.serviceBtn setTitleEdgeInsets:UIEdgeInsetsMake(20, -24, 0, 0)];
     self.serviceBtn.tag = 1;
     [self.serviceBtn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:self.serviceBtn];
     
     self.shopBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH5S(60), HEIGHT5S(519), WIDTH5S(60), HEIGHT5S(49))];
     self.shopBtn.backgroundColor = COLOR(228, 228, 228, 1);
     [self.shopBtn setImage:[UIImage imageNamed:@"shop"] forState:UIControlStateNormal];
     [self.shopBtn setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, -20)];
     [self.shopBtn setTitle:@"店铺" forState:UIControlStateNormal];
     self.shopBtn.titleLabel.font = FONT(10);
     [self.shopBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [self.shopBtn setTitleEdgeInsets:UIEdgeInsetsMake(20, -24, 0, 0)];
     self.shopBtn.tag = 2;
     [self.shopBtn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:self.shopBtn];
     
     self.shopCarBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH5S(120), HEIGHT5S(519), WIDTH5S(100), HEIGHT5S(49))];
     self.shopCarBtn.backgroundColor = COLOR(0, 204, 204, 1);
     [self.shopCarBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
     self.shopCarBtn.tag = 3;
     [self.shopCarBtn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:self.shopCarBtn];
     
     self.buyBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH5S(220), HEIGHT5S(519), WIDTH5S(100), HEIGHT5S(49))];
     self.buyBtn.backgroundColor = COLOR(0, 204, 102, 1);
     [self.buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
     self.buyBtn.tag = 4;
     [self.buyBtn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:self.buyBtn];
     
     self.label = [[UILabel alloc]initWithFrame:CGRectMake(60, 519, 1, 49)];
     self.label.backgroundColor = [UIColor grayColor];
     [self.view addSubview:self.label];
     
}

-(void)createOtherPart{
     
     self.goodsNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, HEIGHT5S(210), WIDTH5S(140), HEIGHT5S(30))];
     self.goodsNameLabel.textAlignment = NSTextAlignmentLeft;
     self.goodsNameLabel.text = @"商品名称";
     [self.goodsDetail.tableHeaderView addSubview:self.goodsNameLabel];
     
     self.collectLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, HEIGHT5S(236), WIDTH5S(30), HEIGHT5S(18))];
     self.collectLabel.textAlignment = NSTextAlignmentCenter;
     self.collectLabel.text =@"收藏";
     self.collectLabel.font = FONT(10);
     [self.goodsDetail.tableHeaderView addSubview:self.collectLabel];
     
     self.collectbtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-38, HEIGHT5S(211), WIDTH5S(24), HEIGHT5S(24))];
     self.collectbtn.layer.cornerRadius = 12;
     self.collectbtn.layer.masksToBounds = YES;
     [self.collectbtn setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
     [self.collectbtn addTarget:self action:@selector(collectbtnClick) forControlEvents:UIControlEventTouchUpInside];
     [self.goodsDetail.tableHeaderView addSubview:self.collectbtn];
     
     self.verticalLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60, HEIGHT5S(210), WIDTH5S(1), HEIGHT5S(40))];
     self.verticalLineLabel.backgroundColor = COLOR(228, 228, 228, 1);
     [self.goodsDetail.tableHeaderView addSubview:self.verticalLineLabel];
     
     self.transervseLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT5S(257), SCREEN_WIDTH, HEIGHT5S(1))];
     self.transervseLineLabel.backgroundColor = COLOR(228, 228, 228, 1);
     [self.goodsDetail.tableHeaderView addSubview:self.transervseLineLabel];
     
     self.goodsPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, HEIGHT5S(267), WIDTH5S(100), HEIGHT5S(23))];
     self.goodsPriceLabel.textAlignment = NSTextAlignmentLeft;
     self.goodsPriceLabel.textColor = COLOR(150, 150, 150, 1);
     self.goodsPriceLabel.font = FONT(15);
     self.goodsPriceLabel.text = @"￥998";
     [self.goodsDetail.tableHeaderView addSubview:self.goodsPriceLabel];
     
     self.goodsOldPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, HEIGHT5S(291), WIDTH5S(81), HEIGHT5S(18))];
     self.goodsOldPriceLabel.textAlignment = NSTextAlignmentLeft;
     self.goodsOldPriceLabel.textColor = COLOR(148, 148, 148, 1);
     self.goodsOldPriceLabel.text = @"价格：￥1099";
     self.goodsOldPriceLabel.font = FONT(12);
     [self.goodsDetail.tableHeaderView addSubview:self.goodsOldPriceLabel];
     
     self.expressFeeLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, HEIGHT5S(312), WIDTH5S(60), HEIGHT5S(18))];
     self.expressFeeLabel.textAlignment = NSTextAlignmentLeft;
     self.expressFeeLabel.textColor = COLOR(148, 148, 148, 1);
     self.expressFeeLabel.text = @"快递：0";
     self.expressFeeLabel.font = FONT(12);
     [self.goodsDetail.tableHeaderView addSubview:self.expressFeeLabel];
     
     self.saleLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH5S(120), HEIGHT5S(312), WIDTH5S(110), HEIGHT5S(18))];
     self.saleLabel.textAlignment = NSTextAlignmentCenter;
     self.saleLabel.textColor = COLOR(148, 148, 148, 1);
     self.saleLabel.text = @"月销售量265件";
     self.saleLabel.font = FONT(12);
     [self.goodsDetail.tableHeaderView addSubview:self.saleLabel];
     
     self.shopAddressLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH5S(247), HEIGHT5S(312), WIDTH5S(63), HEIGHT5S(18))];
     self.shopAddressLabel.textAlignment = NSTextAlignmentCenter;
     self.shopAddressLabel.textColor = COLOR(148, 148, 148, 1);
     self.shopAddressLabel.text = @"河北 保定";
     self.shopAddressLabel.font = FONT(12);
     [self.goodsDetail.tableHeaderView addSubview:self.shopAddressLabel];
     
     self.sellerPromiseLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT5S(340), SCREEN_WIDTH, HEIGHT5S(40))];
     self.sellerPromiseLabel.textAlignment = NSTextAlignmentCenter;
     self.sellerPromiseLabel.backgroundColor = COLOR(228, 228, 228, 1);
     self.sellerPromiseLabel.textColor = COLOR(188, 188, 188, 1);
     self.sellerPromiseLabel.font = FONT(12);
     self.sellerPromiseLabel.text = @"卖家承诺20小时内发货";
     [self.goodsDetail.tableHeaderView addSubview:self.sellerPromiseLabel];
     
     self.separateLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT5S(380), SCREEN_WIDTH, HEIGHT5S(20))];
     self.separateLineLabel.backgroundColor = COLOR(201, 201, 201, 1);
     [self.goodsDetail.tableHeaderView addSubview:self.separateLineLabel];
     
     self.evaluateLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, HEIGHT5S(401), WIDTH5S(110), HEIGHT5S(30))];
     self.evaluateLabel.textColor = COLOR(150, 150, 150, 1);
     self.evaluateLabel.font = FONT(12);
     self.evaluateLabel.textAlignment = NSTextAlignmentLeft;
     self.evaluateLabel.text = @"宝贝评价(999)";
     [self.goodsDetail.tableHeaderView addSubview:self.evaluateLabel];
     
     self.assess1 = [[UILabel alloc]initWithFrame:CGRectMake(15, HEIGHT5S(441), WIDTH5S(90), HEIGHT5S(30))];
     self.assess1.font = FONT(12);
     self.assess1.layer.cornerRadius = 5;
     self.assess1.layer.masksToBounds = YES;
     self.assess1.backgroundColor = COLOR(100, 255, 255, 1);
     self.assess1.textColor = COLOR(150, 150, 150, 1);
     self.assess1.text = @"质量好(233)";
     self.assess1.textAlignment = NSTextAlignmentCenter;
     [self.goodsDetail.tableHeaderView addSubview:self.assess1];
     
     self.assess2 = [[UILabel alloc]initWithFrame:CGRectMake(115, HEIGHT5S(441), WIDTH5S(80), HEIGHT5S(30))];
     self.assess2.font = FONT(12);
     self.assess2.layer.cornerRadius = 5;
     self.assess2.layer.masksToBounds = YES;
     self.assess2.backgroundColor = COLOR(150, 255, 255, 1);
     self.assess2.textColor = COLOR(150, 150, 150, 1);
     self.assess2.text = @"便宜(518)";
     self.assess2.textAlignment = NSTextAlignmentCenter;
     [self.goodsDetail.tableHeaderView addSubview:self.assess2];
     
     self.assess3 = [[UILabel alloc]initWithFrame:CGRectMake(205, HEIGHT5S(441), WIDTH5S(100), HEIGHT5S(30))];
     self.assess3.font = FONT(12);
     self.assess3.layer.cornerRadius = 5;
     self.assess3.layer.masksToBounds = YES;
     self.assess3.backgroundColor = COLOR(150, 255, 255, 1);
     self.assess3.textColor = COLOR(150, 150, 150, 1);
     self.assess3.text = @"快递不错(20)";
     self.assess3.textAlignment = NSTextAlignmentCenter;
     [self.goodsDetail.tableHeaderView addSubview:self.assess3];
     
     self.assess4 = [[UILabel alloc]initWithFrame:CGRectMake(15, HEIGHT5S(481), WIDTH5S(90), HEIGHT5S(30))];
     self.assess4.font = FONT(12);
     self.assess4.layer.cornerRadius = 5;
     self.assess4.layer.masksToBounds = YES;
     self.assess4.backgroundColor = COLOR(150, 255, 255, 1);
     self.assess4.textColor = COLOR(150, 150, 150, 1);
     self.assess4.text = @"款式新(311)";
     self.assess4.textAlignment = NSTextAlignmentCenter;
     [self.goodsDetail.tableHeaderView addSubview:self.assess4];
     
     self.assess5 = [[UILabel alloc]initWithFrame:CGRectMake(115, HEIGHT5S(481), WIDTH5S(90), HEIGHT5S(30))];
     self.assess5.font = FONT(12);
     self.assess5.layer.cornerRadius = 5;
     self.assess5.layer.masksToBounds = YES;
     self.assess5.backgroundColor = COLOR(150, 255, 255, 1);
     self.assess5.textColor = COLOR(150, 150, 150, 1);
     self.assess5.text = @"态度好(8)";
     self.assess5.textAlignment = NSTextAlignmentCenter;
     [self.goodsDetail.tableHeaderView addSubview:self.assess5];
     
     self.assess6 = [[UILabel alloc]initWithFrame:CGRectMake(215, HEIGHT5S(481), WIDTH5S(90), HEIGHT5S(30))];
     self.assess6.font = FONT(12);
     self.assess6.layer.cornerRadius = 5;
     self.assess6.layer.masksToBounds = YES;
     self.assess6.backgroundColor = COLOR(150, 255, 255, 1);
     self.assess6.textColor = COLOR(150, 150, 150, 1);
     self.assess6.text = @"大小合适(2330)";
     self.assess6.textAlignment = NSTextAlignmentCenter;
     [self.goodsDetail.tableHeaderView addSubview:self.assess6];
     
}

-  (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     
     return self.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     
     static NSString *pic;
     GoodsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pic];
     
     if (self.picArr.count == 0) {
          pic = @"nilPic";
//          GoodsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pic];
          if (cell == nil) {
               cell = [[GoodsDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pic];
          }
          cell.userImage.image = [UIImage imageNamed:@""];
          cell.userName.text = @"xxx";
          cell.dateLabel.text = @"2016-04-05";
          cell.sizeLabel.text = @"xxl";
          cell.colorLabel.text = @"黑色";
          cell.commentLabel.text = @"不错";
          [cell setIntroductionText:cell.commentLabel.text];
          self.height=cell.frame.size.height;
          return cell;
          
     }
     
     if (self.picArr.count > 0){
          
          pic = @"havePic";
//          GoodsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pic];
          if (cell == nil) {
               cell = [[GoodsDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pic];
          }
          cell.userImage.image = [UIImage imageNamed:@""];
          cell.userName.text = @"xxx";
          cell.dateLabel1.text = @"2016-04-05";
          cell.sizeLabel1.text = @"xxl";
          cell.colorLabel1.text = @"黑色";
          cell.commentLabel.text = @"不错";
          cell.imageOne.image = [UIImage imageNamed:self.picArr[0]];
          cell.imageTwo.image = [UIImage imageNamed:self.picArr[1]];
          cell.imageThree.image = [UIImage imageNamed:self.picArr[2]];
          self.height=cell.frame.size.height;
          return cell;
          
     }
     
     return cell;
}

- (void)createShop{
     
}

- (void)createShopCart{
     
     self.backGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
     self.backGroundView.backgroundColor = [UIColor grayColor];
     self.backGroundView.alpha = 0;
     [self.view addSubview:self.backGroundView];
     
     self.cartView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, HEIGHT5S(368))];
     [self.view addSubview:self.cartView];
     
     
}
- (void)createShopBuy{
     
     self.buyView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, HEIGHT5S(368))];
     [self.view addSubview:self.cartView];
     
}
#pragma mark - 底部四个按钮执行方法
-(void)test:(UIButton *)sender{
     NSLog(@"%ld",sender.tag);
     
     if (sender.tag == 3) {
          
     }else if (sender.tag == 2){
          
     }else if (sender.tag == 3){
          
          [UIView animateWithDuration:0.5 animations:^{
               self.cartView.frame = CGRectMake(0, HEIGHT5S(200), SCREEN_WIDTH, HEIGHT5S(368));
               self.backGroundView.alpha = 0.3;
          }];
          
     }else{
          
          [UIView animateWithDuration:0.5 animations:^{
               self.buyView.frame = CGRectMake(0, HEIGHT5S(200), SCREEN_WIDTH, HEIGHT5S(368));
               self.backGroundView.alpha = 0.3;
          }];
          
     }
}

#pragma mark - collectbtn点击事件
-(void)collectbtnClick{
     NSLog(@"已收藏");
}


@end
