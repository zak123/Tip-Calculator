//
//  ViewController.h
//  Tip Calculator
//
//  Created by Zachary Mallicoat on 3/20/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *inputText;

@property (strong, nonatomic) IBOutlet UISlider *tipSlider;

@property (strong, nonatomic) IBOutlet UITextField *totalOwed;

@property (strong, nonatomic) IBOutlet UILabel *tipPercent;
@property (strong, nonatomic) IBOutlet UILabel *tipAmount;

@end

