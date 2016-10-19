//
//  ViewController.m
//  LucioTextView_OC
//
//  Created by 李新新 on 2016/10/19.
//  Copyright © 2016年 LucioLee. All rights reserved.
//

#import "ViewController.h"
#import "LucioTextView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet LucioTextView *testTextView;
@property (weak, nonatomic) IBOutlet LucioTextView *attributedTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSAttributedString *attributedPlaceHolder = [[NSAttributedString alloc] initWithString:@"请留下您的宝贵意见..."
                                                                                attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    self.attributedTextView.attributedPlaceHolder = attributedPlaceHolder;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
