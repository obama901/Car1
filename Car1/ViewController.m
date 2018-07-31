//
//  ViewController.m
//  Car1
//
//  Created by Ardee on 15/11/14.
//  Copyright © 2015年 Ardee. All rights reserved.
//

#import "ViewController.h"


//屏幕尺寸
#define MAIN_SIZE ([ [ UIScreen mainScreen ] bounds ].size)
//320*480

//#define CAR_LEFT_OFFSET ((int)MAIN_SIZE.width)%5
#define CAR_LEFT_OFFSET 50
#define CAR_SIZE (MAIN_SIZE.width-CAR_LEFT_OFFSET)/5
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    speed = 0.02;
    
    UIView *page1 = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIImageView *bkg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"road"]];
    bkg.frame = CGRectMake(0, 0, MAIN_SIZE.width, MAIN_SIZE.height);
    [page1 addSubview:bkg];
    [self.view addSubview:page1];
    cy = 20;
    
    zebra = [[UIImageView alloc] initWithFrame:CGRectMake((MAIN_SIZE.width-40)/2, 0, 40, 300)];
    zebra.backgroundColor = [UIColor whiteColor];
    [page1 addSubview:zebra];
    
    start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake((MAIN_SIZE.width-80)/2, MAIN_SIZE.height/2-10, 80, 40);
    [start setBackgroundColor:[UIColor lightGrayColor]];
    [start setTitle:@"开始" forState:UIControlStateNormal];
    start.clipsToBounds = YES;
    start.layer.cornerRadius = 3;
    [start addTarget:self action:@selector(kaiShi) forControlEvents:UIControlEventTouchUpInside];
    
    page3 = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [page1 addSubview:page3];
    
//    float carLeftOffset = ((int)MAIN_SIZE.width)%5;
//    float carSize = (MAIN_SIZE.width-carLeftOffset)/5;
    car1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"car1"]];
    car1.frame = CGRectMake(CAR_LEFT_OFFSET, cy, CAR_SIZE, CAR_SIZE);
    [page3 addSubview:car1];
    
    car2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"car2"]];
    car2.frame = CGRectMake(CAR_LEFT_OFFSET+CAR_SIZE, cy, CAR_SIZE, CAR_SIZE);
    [page3 addSubview:car2];
    
    car3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"car3"]];
    car3.frame = CGRectMake(CAR_LEFT_OFFSET+(CAR_SIZE)*2, cy, CAR_SIZE, CAR_SIZE);
    [page3 addSubview:car3];
    
    car4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"car4"]];
    car4.frame = CGRectMake(CAR_LEFT_OFFSET+(CAR_SIZE)*3, cy, CAR_SIZE, CAR_SIZE);
    [page3 addSubview:car4];
    
    car5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"car5"]];
    car5.frame = CGRectMake(CAR_LEFT_OFFSET+(CAR_SIZE)*4, cy, CAR_SIZE, CAR_SIZE);
    [page3 addSubview:car5];
    [page3 addSubview:start];
    
    UILabel *fenShu1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, CAR_LEFT_OFFSET, 20)];
    fenShu1.text = @"分";
    fenShu1.textColor = [UIColor whiteColor];
    [page3 addSubview:fenShu1];
    
    UILabel *fenShu2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, CAR_LEFT_OFFSET, 20)];
    fenShu2.text = @"数";
    fenShu2.textColor = [UIColor whiteColor];
    [page3 addSubview:fenShu2];
    
    fenShu3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, CAR_LEFT_OFFSET+20, 20)];
    
    fenShu3.textColor = [UIColor whiteColor];
    [page3 addSubview:fenShu3];
    
    UIButton *toLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    toLeft.frame = CGRectMake(0, MAIN_SIZE.height-40, MAIN_SIZE.width/2, 40);
    [toLeft setBackgroundColor:[UIColor lightTextColor]];
    [toLeft setBackgroundImage:[UIImage imageNamed:@"toLeft"] forState:UIControlStateNormal];
    [toLeft addTarget:self action:@selector(toLeft) forControlEvents:UIControlEventTouchUpInside];
    [page3 addSubview:toLeft];
    
    UIButton *toRight = [UIButton buttonWithType:UIButtonTypeCustom];
    toRight.frame = CGRectMake(MAIN_SIZE.width/2, MAIN_SIZE.height-40, MAIN_SIZE.width/2, 40);
    [toRight setBackgroundColor:[UIColor lightTextColor]];
    [toRight setBackgroundImage:[UIImage imageNamed:@"toRight"] forState:UIControlStateNormal];
    [toRight addTarget:self action:@selector(toRight) forControlEvents:UIControlEventTouchUpInside];
    [page3 addSubview:toRight];
    
    ren = [[UIImageView alloc] initWithFrame:CGRectMake(CAR_LEFT_OFFSET+(CAR_SIZE)*2, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE)];
    [ren setImage:[UIImage imageNamed:@"jy8"]];
    [page3 addSubview:ren];
    x = ren.frame.origin.x;
    
    //    [timer setFireDate:[NSDate distantFuture ]];
    
    page2 = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    page2.backgroundColor = [UIColor clearColor];
    
//    UILabel *gameOver = [[UILabel alloc] initWithFrame:CGRectMake(70, 140, 220, 60)];
    UILabel *gameOver = [[UILabel alloc] init];
    gameOver.bounds = CGRectMake(0, 0, 220, 60);
    gameOver.center = CGPointMake(MAIN_SIZE.width/2, MAIN_SIZE.height/2-100);
    gameOver.textAlignment = NSTextAlignmentCenter;
    gameOver.text = @"游戏结束";
    gameOver.textColor = [UIColor redColor];
    gameOver.font = [UIFont systemFontOfSize:45];
    [page2 addSubview:gameOver];
    
    UIButton *reStart = [UIButton buttonWithType:UIButtonTypeCustom];
    reStart.frame = CGRectMake((MAIN_SIZE.width-80)/2, MAIN_SIZE.height/2-10, 80, 40);
    [reStart setBackgroundColor:[UIColor lightGrayColor]];
    [reStart setTitle:@"重新开始" forState:UIControlStateNormal];
    reStart.clipsToBounds = YES;
    reStart.layer.cornerRadius = 3;
    [reStart addTarget:self action:@selector(reStart) forControlEvents:UIControlEventTouchUpInside];
    [page2 addSubview:reStart];
}
- (void)toLeft
{
    y = car1.frame.origin.y;
    if (x == (CAR_LEFT_OFFSET+(CAR_SIZE)*4) && y < MAIN_SIZE.height-40-(CAR_SIZE)*5/3) {
        ren.frame = CGRectMake(x - CAR_SIZE, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE);
        x = CAR_LEFT_OFFSET+(CAR_SIZE)*3;
    } else if (x == CAR_LEFT_OFFSET+(CAR_SIZE)*3 && y < MAIN_SIZE.height-40-(CAR_SIZE)*5/3)
    {
        ren.frame = CGRectMake(x - CAR_SIZE, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE);
        x = CAR_LEFT_OFFSET+(CAR_SIZE)*2;
    }else if (x == CAR_LEFT_OFFSET+(CAR_SIZE)*2 && y < MAIN_SIZE.height-40-(CAR_SIZE)*5/3)
    {
        ren.frame = CGRectMake(x - CAR_SIZE, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE);
        x = CAR_LEFT_OFFSET+CAR_SIZE;
    }else if (x == CAR_LEFT_OFFSET+CAR_SIZE && y < MAIN_SIZE.height-40-(CAR_SIZE)*5/3)
    {
        ren.frame = CGRectMake(x - CAR_SIZE, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE);
        x = CAR_LEFT_OFFSET;
    }else if (x == CAR_LEFT_OFFSET && y < MAIN_SIZE.height-40-(CAR_SIZE)*5/3)
    {
        ren.frame = CGRectMake(x, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE);
    }
    
}
- (void)toRight
{
    y = car1.frame.origin.y;
    if (x == CAR_LEFT_OFFSET && y < MAIN_SIZE.height-40-(CAR_SIZE)*5/3) {
        ren.frame = CGRectMake(x + CAR_SIZE, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE);
        x = CAR_LEFT_OFFSET+CAR_SIZE;
    } else if(x == CAR_LEFT_OFFSET+CAR_SIZE && y < MAIN_SIZE.height-40-(CAR_SIZE)*5/3)
    {
        ren.frame = CGRectMake(x + CAR_SIZE, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE);
        x = CAR_LEFT_OFFSET+(CAR_SIZE)*2;
    }else if (x == CAR_LEFT_OFFSET+(CAR_SIZE)*2 && y < MAIN_SIZE.height-40-(CAR_SIZE)*5/3)
    {
        ren.frame = CGRectMake(x + CAR_SIZE, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE);
        x = CAR_LEFT_OFFSET+(CAR_SIZE)*3;
    }else if (x == CAR_LEFT_OFFSET+(CAR_SIZE)*3 && y < MAIN_SIZE.height-40-(CAR_SIZE)*5/3)
    {
        ren.frame = CGRectMake(x + CAR_SIZE, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE);
        x = CAR_LEFT_OFFSET+(CAR_SIZE)*4;
    }else if (x == CAR_LEFT_OFFSET+(CAR_SIZE)*4 && y < MAIN_SIZE.height-40-(CAR_SIZE)*5/3)
    {
        ren.frame = CGRectMake(x, MAIN_SIZE.height-40-CAR_SIZE, CAR_SIZE, CAR_SIZE);
    }
}
- (void)reStart
{
    
    [page2 removeFromSuperview];
    timer = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(runCar) userInfo:nil repeats:YES];
    [timer fire];
    
    
}
- (void)runCar
{
    
    //使小汽车向下降
    cy = cy + 1;
    if (cy > MAIN_SIZE.height-40-CAR_SIZE) {
        cy = CAR_LEFT_OFFSET;
        if (a == 0) {
            [page3 addSubview:car1];
        } else if (a == 1)
        {
            [page3 addSubview:car2];
        }else if (a == 2)
        {
            [page3 addSubview:car3];
        }else if (a == 3)
        {
            [page3 addSubview:car4];
        }else
        {
            [page3 addSubview:car5];
        }
        a = arc4random()%5;
        
        static int scoure;
        
        
        scoure = scoure + 1;
        if (scoure % 3 == 0) {
            speed = speed * 0.7;
        }
        [timer invalidate];
        timer = nil;
        timer = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(runCar) userInfo:nil repeats:YES];
        if (b == 0) {
            scoure = 0;
        }
        scoureX = scoure;
        NSString *str1 = [NSString alloc];
        str1 = [NSString stringWithFormat:@"%d",scoureX];
        fenShu3.text = str1;
        b = b + 1;
    }
    car1.frame = CGRectMake(CAR_LEFT_OFFSET, cy, CAR_SIZE, CAR_SIZE);
    car2.frame = CGRectMake(CAR_LEFT_OFFSET+CAR_SIZE, cy, CAR_SIZE, CAR_SIZE);
    car3.frame = CGRectMake(CAR_LEFT_OFFSET+(CAR_SIZE)*2, cy, CAR_SIZE, CAR_SIZE);
    car4.frame = CGRectMake(CAR_LEFT_OFFSET+(CAR_SIZE)*3, cy, CAR_SIZE, CAR_SIZE);
    car5.frame = CGRectMake(CAR_LEFT_OFFSET+(CAR_SIZE)*4, cy, CAR_SIZE, CAR_SIZE);
    [self deleteCar];
    [self crashCar];
    
    
}
- (void)kaiShi
{
    //    CGRect a = CGRectMake(car3.frame.origin.x, car2.frame.origin.y, 60, 60);
    //    CGRect b = CGRectMake(ren.frame.origin.x, ren.frame.origin.y, 60, 60);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDuration:5];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    start.frame = CGRectMake((MAIN_SIZE.width-80)/2, MAIN_SIZE.height, 80, 40);
    zebra.frame = CGRectMake((MAIN_SIZE.width-40)/2, -300, 40, 300);
    
    timer = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(runCar) userInfo:nil repeats:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(begin2)];
    [UIView commitAnimations];
    //    [timer setFireDate:[NSDate distantPast]];
    b = 1;
    
    
}
- (void)crashCar
{
//    if (cy == MAIN_SIZE.height-40-CAR_SIZE && x != (3*a+1)*20)
    if (cy == MAIN_SIZE.height-40-CAR_SIZE && x != CAR_LEFT_OFFSET+(CAR_SIZE)*a)
    {
        [timer invalidate];
        [self.view addSubview:page2];
        speed = 0.02;
        b = 0;
        
        
    }
}

- (void)deleteCar
{
    
    if (a == 0) {
        [car1 removeFromSuperview];
    } else if (a == 1)
    {
        [car2 removeFromSuperview];
    }else if (a == 2)
    {
        [car3 removeFromSuperview];
    }else if (a == 3)
    {
        [car4 removeFromSuperview];
    }else
    {
        [car5 removeFromSuperview];
    }
}
- (void)begin2
{
    zebra.frame = CGRectMake((MAIN_SIZE.width-40)/2, MAIN_SIZE.height, 40, 300);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDuration:6];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    zebra.frame = CGRectMake((MAIN_SIZE.width-40)/2, 0, 40, 300);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(begin3)];
    [UIView commitAnimations];
}
- (void)begin3
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDuration:5];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    zebra.frame = CGRectMake((MAIN_SIZE.width-40)/2, -300, 40, 300);
    
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(begin2)];
    [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
