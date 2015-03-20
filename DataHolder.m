//
//  DataHolder.m
//  Tip Calculator
//
//  Created by Zachary Mallicoat on 3/20/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "DataHolder.h"

NSString * const kBadService = @"kBad";
NSString * const kAverageService = @"kAverage";
NSString * const kGoodService = @"kGood";

@implementation DataHolder

- (id) init
{
    self = [super init];
    if (self)
    {
        _badService = 0;
        _averageService = 0;
        _goodService = 0;
    }
    return self;
}

+ (DataHolder *)sharedInstance
{
    static DataHolder *_sharedInstance = nil;
    static dispatch_once_t onceSecurePredicate;
    dispatch_once(&onceSecurePredicate,^
                  {
                      _sharedInstance = [[self alloc] init];
                      
                      NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                      
                      [defaults registerDefaults:@{ kBadService : @(10), kAverageService : @(20), kGoodService : @(30) }];
                      
                      [defaults synchronize];
                      
                      [_sharedInstance loadData];
                  });
    
    return _sharedInstance;
}

//in this example you are saving data to NSUserDefault's
//you could save it also to a file or to some more complex
//data structure: depends on what you need, really

-(void)saveData
{
    [[NSUserDefaults standardUserDefaults]
     setObject:[NSNumber numberWithInt:self.badService] forKey:kBadService];
    
    [[NSUserDefaults standardUserDefaults]
     setObject:[NSNumber numberWithInt:self.averageService] forKey:kAverageService];
    
    [[NSUserDefaults standardUserDefaults]
     setObject:[NSNumber numberWithInt:self.goodService] forKey:kGoodService];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)loadData
{

        self.badService = [(NSNumber *)[[NSUserDefaults standardUserDefaults]
                                   objectForKey:kBadService] intValue];
        
        self.averageService = [(NSNumber *)[[NSUserDefaults standardUserDefaults]
                                   objectForKey:kAverageService] intValue];
        
        self.goodService = [(NSNumber *)[[NSUserDefaults standardUserDefaults]
                                            objectForKey:kGoodService] intValue];

}

@end