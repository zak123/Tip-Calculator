//
//  OptionsViewController.m
//  Tip Calculator
//
//  Created by Zachary Mallicoat on 3/20/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "OptionsViewController.h"
#import "DataHolder.h"

@implementation OptionsViewController

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    DataHolder *dataHolder = [DataHolder sharedInstance];
    
    [dataHolder loadData];
    
    _badServiceOptions.text = [NSString stringWithFormat:@"%d", dataHolder.badService];
    
    _averageServiceOptions.text = [NSString stringWithFormat:@"%d", dataHolder.averageService];
    
    _goodServiceOptions.text = [NSString stringWithFormat:@"%d", dataHolder.goodService];
    
}


- (IBAction)badServiceChanged:(id)sender {
    [DataHolder sharedInstance].badService = [_badServiceOptions.text intValue];
    [self justSave];
}

- (IBAction)averageServiceChanged:(id)sender {
    [DataHolder sharedInstance].averageService = [_averageServiceOptions.text intValue];
    [self justSave];
}

- (IBAction)goodServiceChanged:(id)sender {
    [DataHolder sharedInstance].goodService = [_goodServiceOptions.text intValue];
    [self justSave];
}

-(void) justSave {
    [[DataHolder sharedInstance] saveData];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"Touch: Keyboard should disappear");
    [self.view endEditing:YES];
    
    [super touchesBegan:touches withEvent:event];
}

@end
