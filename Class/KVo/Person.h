//
//  Person.h
//  Class
//
//  Created by majunliang on 16/5/21.
//  Copyright © 2016年 majunliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
  @public
    NSString *_name;
    //    NSString *_sex;
}

@property (nonatomic, assign) NSInteger sex;

- (void)update;
@end
