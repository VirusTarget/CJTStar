//
//  StarView.m
//  Star
//
//  Created by jkc on 16/4/12.
//  Copyright © 2016年 CJT. All rights reserved.
//

#import "StarView.h"

@implementation StarView

-(instancetype)initWithFrame:(CGRect)frame AndStarCount:(NSInteger)StarCount
{
    if (self = [super initWithFrame:frame]) {
        
        /*初始化*/
        ImageArray = [NSMutableArray array];
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
            StarImage.userInteractionEnabled = NO;
            [self addSubview:StarImage];
            
            [ImageArray addObject:StarImage];
        }
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
    int y = point.y;
    
    _NowScore = x/width;
    _NowScore = _NowScore<star_count?_NowScore:star_count;
    _NowScore = _NowScore>0?_NowScore:0;
    
    int site =0;
    //整数部分都是满星
    for (;site<_NowScore; site++) {
        UIImageView *image = ImageArray[site];
        image.image = self.FullImage;
    }
    //需判断是否开启半星
    if (site-_NowScore>0.5 && _OpenHalf == YES) {
        UIImageView *image = ImageArray[site-1];
        image.image = self.HalfImage;
    }
    
    for (;site<star_count; site++) {
        UIImageView *image = ImageArray[site];
        image.image = self.EmptyImage;
    }

    
    
    NSLog(@"touch (x, y) is (%d, %d)", x, y);
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
    
    NSLog(@"%lf",_NowScore);
    int site =0;
    for (;site<_NowScore; site++) {
        UIImageView *image = ImageArray[site];
        image.image = self.FullImage;
    }
    if (site-_NowScore>0.5 && _OpenHalf == YES) {
        UIImageView *image = ImageArray[site-1];
        image.image = self.HalfImage;
    }
    for (;site<star_count; site++) {
        UIImageView *image = ImageArray[site];
        image.image = self.EmptyImage;
    }
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    double Score = (NSInteger)_NowScore;
    if (_NowScore - Score > 0.5) {
        Score += 0.5;
    }
    _NowScore = Score;
}
#pragma mark 懒加载
-(UIImage *)EmptyImage
{
    if (!_EmptyImage) {
        _EmptyImage = [UIImage imageNamed:@"star-empty"];
    }
    return _EmptyImage;
}

-(UIImage *)HalfImage
{
    if (!_HalfImage) {
        _HalfImage = [UIImage imageNamed:@"star-half"];
    }
    return _HalfImage;
}

-(UIImage *)FullImage
{
    if (!_FullImage) {
        _FullImage = [UIImage imageNamed:@"star--full"];
    }
    return _FullImage;
}

@end
