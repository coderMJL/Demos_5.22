//
//  ViewController.m
//  P_D
//
//  Created by majunliang on 16/5/22.
//  Copyright © 2016年 majunliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    NSString *str  = [NSString new];
    NSString *str1 = str;
    
    NSString *str3;
    NSLog(@"%d  %d",str,str1);
    NSLog(@"%p  %p",str,str1);
    NSLog(@"%d,%p,%@",str3,str3,str3);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
