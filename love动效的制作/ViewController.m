//
//  ViewController.m
//  love动效的制作
//
//  Created by TOPTEAM on 16/9/13.
//  Copyright © 2016年 TOPTEAM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBezierPath * bpath=[UIBezierPath bezierPath];
    //设置起点
    [bpath moveToPoint:CGPointMake(self.view.frame.size.width*0.5, 150)];
    
    //endpoint：终端点
    //controlPoint；控制点   对于二次贝塞尔曲线  只有一个控制点
    [bpath addQuadCurveToPoint:CGPointMake(self.view.frame.size.width*0.5, 300) controlPoint:CGPointMake(self.view.frame.size.width+100, 0)];
    
    [bpath addQuadCurveToPoint:CGPointMake(self.view.frame.size.width*0.5, 150) controlPoint:CGPointMake(-100, 0)];
    
    
    //lineCapStyle 属性是用来设置线条拐角帽样式的
    bpath.lineCapStyle = kCGLineCapRound;
    
    //lineJoinStyle 属性是用来设置两条线连接点的样式
    bpath.lineJoinStyle = kCGLineJoinRound;
    
    //线宽
    bpath.lineWidth = 5;
    
    
    [[UIColor redColor] setStroke];
    
    [bpath closePath];
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path=bpath.CGPath;
    
    animation.duration = 3;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    
    UIView *rview=[UIView new];
    rview.frame=CGRectMake(self.view.frame.size.width-25,self.view.frame.size.height-25 , 50, 50);
    rview.layer.cornerRadius=25.0;
    rview.layer.masksToBounds = YES;
    rview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:rview];
    [rview.layer addAnimation:animation forKey:nil];
    CAReplicatorLayer *r1=[CAReplicatorLayer layer];
    //设置颜色
    r1.instanceColor=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1].CGColor;
    //设置复制最大数
    r1.instanceCount = 40;
    //设置出现的时间间隔
    r1.instanceDelay = 0.2 ;
    //颜色 的渐变值
    r1.instanceRedOffset=-0.01;
    r1.instanceGreenOffset=-0.01;
    [r1 addSublayer:rview.layer];
    
    [self.view.layer addSublayer:r1];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
