//
//  ViewController.h
//  Car1
//
//  Created by Ardee on 15/11/14.
//  Copyright © 2015年 Ardee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIImageView *zebra;
    UIButton *start;
    UIImageView *ren;
    int x;
    int cy;
    int a;
    int y;//小汽车的y坐标
    UIImageView *car1;
    UIImageView *car2;
    UIImageView *car3;
    UIImageView *car4;
    UIImageView *car5;
    NSTimer *timer;
    UIView *page3;
    UIView *page2;
    float speed;
    int scoureX;
    UILabel *fenShu3;
    int b;
}


@end

