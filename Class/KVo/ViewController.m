//
//  ViewController.m
//  KVo
//
//  Created by majunliang on 16/5/21.
//  Copyright © 2016年 majunliang. All rights reserved.
//
#import "ViewController.h"
@interface ViewController () {
    Person *_p;
}
@end
@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    Person *p = [Person new];
    p->_name = @"xxxx";
    p.sex = 12;
    _p = p;
    [p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [p addObserver:self forKeyPath:@"sex" options:NSKeyValueObservingOptionNew context:@"blalal"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _p->_name = @"xxxxxx";
    //    _p.sex = 12; //属性,触发kvo
    //    _p->_sex = @"nan"; //不通过,触发kvo

    //    [_p setValue:@"nv" forKey:@"sex"];//kvc触发kvo
//        [_p setValue:@"nv" forKey:@"name"];//kvc触发kvo

    [_p update];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *, id> *)change context:(void *)context
{
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
