//
//  DataHolder.h
//  Tip Calculator
//
//  Created by Zachary Mallicoat on 3/20/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHolder : NSObject

+ (DataHolder *)sharedInstance;

@property (assign) int badService;
@property (assign) int averageService;
@property (assign) int goodService;

-(void) saveData;
-(void) loadData;

@end