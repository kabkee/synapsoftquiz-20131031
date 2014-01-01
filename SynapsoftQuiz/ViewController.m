//
//  ViewController.m
//  SynapsoftQuiz
//
//  Created by Kabkee Moon on 2013. 10. 31..
//  Copyright (c) 2013년 Kabkee Moon. All rights reserved.
//

#import "ViewController.h"
#import "AppSolution.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textFieldInput;
@synthesize textFieldMaxInt;
@synthesize textFieldResult;
@synthesize textFiledVrfResult;
@synthesize appSolution;

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSNumber * maxInt = [[NSNumber alloc] initWithInt: INT_MAX];
    
    textFieldMaxInt.text =[maxInt stringValue] ;
    
    appSolution = [[AppSolution alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toTranslate:(id)sender
{
    int inputValue = [textFieldInput.text integerValue];
    if ( inputValue >0 && inputValue <= INT_MAX) {
        textFieldResult.text = [appSolution returnAlphabetsAsNSString: inputValue];
        NSString * vrfResultString = [NSString stringWithFormat:@"%d",[appSolution decTo26sVarificationStringToInt: textFieldResult.text]];
        textFiledVrfResult.text = vrfResultString;
    }else{
        textFieldResult.text = @"다시입력하세요";
    }
    [self.view endEditing:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
