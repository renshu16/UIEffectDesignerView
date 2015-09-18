//
//  ViewController.m
//  EffectDesignerDemo_iOS
//
//  Created by Marin Todorov on 3/10/13.
//  Copyright (c) 2013 Marin Todorov. All rights reserved.
//

#import "ViewController.h"
#import "UIEffectDesignerView.h"


@interface ViewController ()
{
    UIButton *startBtn;
    UIEffectDesignerView *animationView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    CGFloat screenWidth = [[UIScreen mainScreen]bounds].size.width;
    
    startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.bounds = CGRectMake(0, 0, 60, 44);
    startBtn.center = CGPointMake(screenWidth/2, 70);
    [startBtn setTitle:@"start" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
}

-(void)startAction:(UIButton *)btn
{
    [startBtn setHidden:YES];
    
    animationView = nil;
    animationView = [UIEffectDesignerView effectWithFile:@"chatcell2.ped"];
    
    [animationView setEmitterCellHidden:NO];
    [self.view addSubview:animationView];
    [self performSelector:@selector(hiddenAnimationView) withObject:nil afterDelay:3.0];
}
-(void)hiddenAnimationView
{
    
    [animationView setEmitterCellHidden:YES];
    [self performSelector:@selector(removeAnimationView) withObject:nil afterDelay:3.0];
}

-(void)removeAnimationView
{
    [startBtn setHidden:NO];
    [animationView removeFromSuperview];
}

@end

