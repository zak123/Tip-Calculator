//
//  OptionsViewController.h
//  Tip Calculator
//
//  Created by Zachary Mallicoat on 3/20/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionsViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *badServiceOptions;
@property (strong, nonatomic) IBOutlet UITextField *averageServiceOptions;
@property (strong, nonatomic) IBOutlet UITextField *goodServiceOptions;


@end
