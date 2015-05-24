//
//  ViewController.m
//  ServiceCall
//
//  Created by Faisal Syed on 5/24/15.
//  Copyright (c) 2015 Faisal Syed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //APP_ID = 3b2ac1cc
    
    //APP_KEY = 37793f2d4901156ec5f50a51ea4f594d
    
    //Service Call...
    NSString *userEnteredString = @"Pizza Hut";
    NSString *correctedString = [userEnteredString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.nutritionix.com/v1_1/search/%@?results=0%%3A20&cal_min=0&cal_max=50000&fields=item_name%%2Cbrand_name%%2Citem_id%%2Cbrand_id&appId=3b2ac1cc&appKey=37793f2d4901156ec5f50a51ea4f594d", correctedString];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:30];
    
    NSData *urlData;
    NSURLResponse *response;
    NSError *error;
    
    
    urlData = [NSURLConnection sendSynchronousRequest:urlRequest
                                    returningResponse:&response
                                                error:&error];
    
    NSMutableArray *myArray = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&error];
    
    NSLog(@"%@", myArray);
    
    

   
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
