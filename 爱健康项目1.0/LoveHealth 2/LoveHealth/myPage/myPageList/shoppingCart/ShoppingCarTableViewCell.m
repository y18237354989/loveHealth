//
//  ShoppingCarTableViewCell.m
//  LoveHealth
//
//  Created by administrator on 16/4/5.
//  Copyright © 2016年 yjh. All rights reserved.
//

#import "ShoppingCarTableViewCell.h"

@implementation ShoppingCarTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.goodsImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
        self.goodsImage.image = [UIImage imageNamed:@"2.jpg"];
        [self.contentView addSubview:self.goodsImage];
        
        self.goodsNamelabel = [[UILabel alloc]init];
        self.goodsNamelabel.numberOfLines = 2;
        self.goodsNamelabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.goodsNamelabel];
        
        self.goodsPriceLabel = [[UILabel alloc]init];
        self.goodsPriceLabel.font = [UIFont systemFontOfSize:12];
        self.goodsPriceLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.goodsPriceLabel];
        
        self.goodsNumLabel = [[UILabel alloc]init];
        self.goodsNumLabel.font = [UIFont systemFontOfSize:12];
        self.goodsNumLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.goodsNumLabel];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];

    self.goodsNamelabel.frame = CGRectMake(95, 10, 200, 35);
    self.goodsPriceLabel.frame = CGRectMake(95, 65, 50, 15);
    self.goodsNumLabel.frame = CGRectMake(280, 65, 20, 15);
    
    
}

@end
