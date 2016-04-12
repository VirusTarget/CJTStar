//
//  StarView2.m
//  Star
//
//  Created by jkc on 16/4/12.
//  Copyright © 2016年 CJT. All rights reserved.
//

#import "StarView2.h"

@implementation StarView2

-(instancetype)initWithFrame:(CGRect)frame AndStarCount:(NSInteger)StarCount
{
    if (self = [super initWithFrame:frame]) {
        
        /*初始化*/
        [self setUserInteractionEnabled:YES];
        star_count = StarCount;
        CGRect rect = self.frame;
        width = rect.size.width/StarCount;
        self.backgroundColor = [UIColor whiteColor];
        
        for (int count = 0; count < StarCount; count++) {
            //设置初始的图像
            UIImageView *StarImage = [[UIImageView alloc] initWithImage:self.EmptyImage];
            StarImage.frame = CGRectMake(count*width, 0, width, rect.size.height);
            [StarImage setContentMode:UIViewContentModeScaleToFill];
            [self addSubview:StarImage];
            
        }
        
        //设置前置图片
        FrontView = [[UIView alloc] initWithFrame:self.bounds];
        //设置子视图范围不超过父视图
        FrontView.clipsToBounds = YES;
        for (int count = 0; count < StarCount; count++) {
            //设置初始的图像
            UIImageView *StarImage = [[UIImageView alloc] initWithImage:self.FullImage];
            StarImage.frame = CGRectMake(count*width, 0, width, rect.size.height);
            [StarImage setContentMode:UIViewContentModeScaleToFill];
            [FrontView addSubview:StarImage];
        }
        NSLog(@"%f",FrontView.frame.size.width);
        [self addSubview:FrontView];
    }
    return self;
}

#pragma mark 触摸响应
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [event touchesForView:self];
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    int x = point.x;
    
    _NowScore = x/width;
    _NowScore = _NowScore<star_count?_NowScore:star_count;
    _NowScore = _NowScore>0?_NowScore:0;
    
    //获得百分比
    double precent = _NowScore/star_count;
    CGRect rect = self.bounds;
    rect.size.width = precent*rect.size.width;
    //设置新宽度
    [UIView animateWithDuration:0.1 animations:^{
        FrontView.frame = rect;
    }];
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    int x = point.x;
    
    _NowScore = x/width;
    _NowScore = _NowScore<star_count?_NowScore:star_count;
    _NowScore = _NowScore>0?_NowScore:0;
    
    double precent = _NowScore/star_count;
    CGRect rect = self.bounds;
    rect.size.width = precent*self.bounds.size.width;
    FrontView.frame = rect;
    
}

#pragma mark 懒加载
-(UIImage *)EmptyImage
{
    if (!_EmptyImage) {
        _EmptyImage = [UIImage imageNamed:@"star-empty"];
    }
    return _EmptyImage;
}


-(UIImage *)FullImage
{
    if (!_FullImage) {
        _FullImage = [UIImage imageNamed:@"star--full"];
    }
    return _FullImage;
}

@end
