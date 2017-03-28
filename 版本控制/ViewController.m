//
//  ViewController.m
//  版本控制
//
//  Created by 李增超 on 2017/3/28.
//  Copyright © 2017年 李增超. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = [self versionCompare:@"1.2.3.5.7" and:@"1.2.4.8.3"];
    NSLog(@"%@",str);
}
- (NSString *)versionCompare:(NSString *) v1 and:(NSString *) v2
{
    NSString *str1 = v1;
    NSString *str2 = v2;
    NSMutableArray *vArray1 = [NSMutableArray array];
    NSMutableArray *vArray2 = [NSMutableArray array];
    //将v1中"."前后的所有数字分离出来添加到一个数组
    do {
        if([v1 rangeOfString:@"."].location !=NSNotFound)//_roaldSearchText
        {
            //v1中含有"."
            NSInteger locat = [v1 rangeOfString:@"."].location;
            NSString *str = [v1 substringToIndex:locat];
            [vArray1 addObject:str];
            v1 = [v1 substringFromIndex:locat+1];
        }
        else
        {
            //v1中不含有"."
            [vArray1 addObject:v1];
            NSLog(@"%@",vArray1);
            break;
        }
    } while (1);
    //将v2中"."前后的所有数字分离出来添加到一个数组
    do {
        if([v2 rangeOfString:@"."].location !=NSNotFound)//_roaldSearchText
        {
            //v2中含有"."
            NSInteger locat = [v2 rangeOfString:@"."].location;
            NSString *str = [v2 substringToIndex:locat];
            [vArray2 addObject:str];
            v2 = [v2 substringFromIndex:locat+1];
        }
        else
        {
            //v2中不含有"."
            [vArray2 addObject:v2];
            NSLog(@"%@",vArray2);
            break;
        }
    } while (1);
    //判断分离合成的数组长度
    NSUInteger i = vArray1.count < vArray2.count ? vArray1.count : vArray2.count;
    for (int j = 0; j < i; j++) {
        NSInteger vv1 = [vArray1[j] integerValue];
        NSInteger vv2 = [vArray2[j] integerValue];
        if (vv1 > vv2) {
            //v1 > v2;
            return str1;
        }else if(vv1 < vv2)
        {
            //v2 > v1
            return str2;
        }
        if (j == i-1) {
           //如果比较完毕没有出结果,只有两种情况:1.较长的数组版本号大 2.数量长度相同则两个版本号相同
            if (vArray1.count == vArray2.count) {
                return @"两个版本相同";
            }else
            {
                return vArray1.count > vArray2.count ? str1: str2;
            }
        }
        
    }
    //没有进入for循环,返回任意一个0.0作为识别
    return @"0.0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
