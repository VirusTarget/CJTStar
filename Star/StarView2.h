//
//  StarView2.h
//  Star
//
//  Created by jkc on 16/4/12.
//  Copyright © 2016年 CJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView2 : UIView
{
@private NSInteger star_count;
@private CGFloat width;
@private UIView *FrontView;
}

/*设置满星、半星和空星时候的图片*/
@property (nonatomic,strong) UIImage *FullImage;
@property (nonatomic,strong) UIImage *EmptyImage;

/*获得当前的分数*/
@property (nonatomic,assign) double NowScore;

/*创建*/
-(instancetype)initWithFrame:(CGRect)frame AndStarCount:(NSInteger)StarCount;


@end
