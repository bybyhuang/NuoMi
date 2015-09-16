//
//  BYHomeViewClassCell.m
//  BYNuoMi
//
//  Created by huangbaoyu on 15/9/15.
//  Copyright (c) 2015年 huangbaoyu. All rights reserved.
//

#import "BYHomeViewClassCell.h"
#import "BYClassView.h"

@implementation BYHomeViewClassCell

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:@"class"])
    {
        
//        self.backgroundColor = [UIColor redColor];
        BYClassView *classView = [[BYClassView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 180)];
        
        
        [self.contentView addSubview:classView];
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
