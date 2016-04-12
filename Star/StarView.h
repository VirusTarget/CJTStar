//
//  StarView.h
//  Star
//
//  Created by jkc on 16/4/12.
//  Copyright © 2016年 CJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
@private NSInteger star_count;
@private CGFloat width;
@private NSMutableArray *ImageArray;
}

/*设置满星、半星和空星时候的图片*/
@property (nonatomic,strong) UIImage *FullImage;
@property (nonatomic,strong) UIImage *HalfImage;
@property (nonatomic,strong) UIImage *EmptyImage;

/*获得当前的分数*/
@property (nonatomic,assign) double NowScore;

/*设置是否打开半星*/
@property (nonatomic,assign) bool OpenHalf;
/*创建*/
-(instancetype)initWithFrame:(CGRect)frame AndStarCount:(NSInteger)StarCount;


@end
