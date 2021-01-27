//
//  ViewController.m
//  首次启动判断
//
//  Created by Developer on 2021/1/25.
//

#import "ViewController.h"

#define LAST_RUN_VERSION_KEY @"1"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self isFirstLoad];
    
}

- (BOOL)isFirstLoad{
    
    NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary]
                                
                                objectForKey:@"CFBundleShortVersionString"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *lastRunVersion = [defaults objectForKey:LAST_RUN_VERSION_KEY];
    
    if (!lastRunVersion) {
        
        [defaults setObject:currentVersion forKey:LAST_RUN_VERSION_KEY];
        
        NSLog(@"--------首次---------");
        
        return YES;
   
    }
    
    else if (![lastRunVersion isEqualToString:currentVersion]) {
        
        [defaults setObject:currentVersion forKey:LAST_RUN_VERSION_KEY];
        
        NSLog(@"------新版本----第一次----------");
        
        return YES;
        
    }
    
    NSLog(@"-------第二次----------");
    
    return NO;
    
}

- (NSString *)addTitleStr:(NSString *)string {
    
    return @"哈哈哈哈";
    
}

@end
