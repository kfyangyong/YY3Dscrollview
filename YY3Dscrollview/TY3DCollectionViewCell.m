//
//  TY3DCollectionViewCell.m
//  YY3Dscrollview
//
//  Created by Apple on 2017/4/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TY3DCollectionViewCell.h"

@implementation TY3DCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;
}

@end
