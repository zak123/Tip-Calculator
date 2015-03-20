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
- (IBAction)stepperChanged:(id)sender {
    
}

- (IBAction)sliderChanged:(id)sender {
    
    [self recalculateAndUpdateView];
    
}

-(void) recalculateAndUpdateView {
    float tipInDollars;
    float totalOwed;
    int inputInt;
    
    
    inputInt = [_inputText.text intValue];
    
    
    // Round value of UISlider to keep values clean and iterate between integers
    
    CGFloat value = [_tipSlider value];
    
    CGFloat roundValue = roundf(value);
    
    if (value != roundValue) {
        
        [_tipSlider setValue:roundValue];
    }
    
    // Convert slider value into .xx for percentage calculation
    
    tipInDollars = _tipSlider.value/100 * inputInt;
    
    // Percentage calculation
    
    totalOwed = inputInt + tipInDollars;
    
    // Set Labels
    
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


- (IBAction)amountFieldChanged:(id)sender {
    
    [self recalculateAndUpdateView];
    
}
@end
