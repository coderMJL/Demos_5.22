//
//  ViewController.m
//  teeeeewwe
//
//  Created by majunliang on 16/5/19.
//  Copyright © 2016年 majunliang. All rights reserved.
//

#import "ViewController.h"

struct Student2
{
    char name[20];
    char sex;
    int age;
    char addr[40];
};

struct Student1
{
    char name[20];
    char sex;
    struct Student2 age;
    char addr[40];
};

struct Student
{
    char name[20];
    struct Student1 s;
    int age;
    char addr[40];
};

@interface ViewController (){
    NSString *_name;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIViewController *vc = [UIViewController new];
    struct Student *student;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
