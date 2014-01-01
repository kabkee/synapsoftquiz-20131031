//
//  ViewController.h
//  SynapsoftQuiz
//
//  Created by Kabkee Moon on 2013. 10. 31..
//  Copyright (c) 2013년 Kabkee Moon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppSolution.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property AppSolution * appSolution;

@property (strong, nonatomic) IBOutlet UITextField *textFieldMaxInt;
@property (strong, nonatomic) IBOutlet UITextField *textFieldInput;
@property (strong, nonatomic) IBOutlet UITextField *textFieldResult;
@property (strong, nonatomic) IBOutlet UIButton *BtnTranslate;
@property (strong, nonatomic) IBOutlet UITextField *textFiledVrfResult;

- (IBAction)toTranslate:(id)sender;

@end
