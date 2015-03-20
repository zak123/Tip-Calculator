//
//  ViewController.m
//  Tip Calculator
//
//  Created by Zachary Mallicoat on 3/20/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [_inputText becomeFirstResponder];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderChanged:(id)sender {
    
    float tipInDollars;
    float totalOwed;
    int inputInt;
    
    
    inputInt = [_inputText.text intValue];
    
    
    CGFloat value = [_tipSlider value];
    
    CGFloat roundValue = roundf(value);
    
    if (value != roundValue) {
        
        [_tipSlider setValue:roundValue];
    }
    
    
    
    tipInDollars = _tipSlider.value/100 * inputInt;
    
    
    totalOwed = inputInt + tipInDollars;
    
    NSString *newRoundValue = [NSString stringWithFormat:@"%.00f%%",roundValue];
    
    
    _tipPercent.text = newRoundValue;

    _totalOwed.text = [NSString stringWithFormat:@"$%.02f",totalOwed];
    _tipAmount.text = [NSString stringWithFormat:@"$%.02f",tipInDollars];
    
    
    
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"You entered %@",self.inputText.text);

    
    [self.inputText resignFirstResponder];
    return YES;
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"Touch: Keyboard should disappear");
    [self.view endEditing:YES];
    [self textFieldShouldReturn:_inputText];

    [super touchesBegan:touches withEvent:event];
}


@end
