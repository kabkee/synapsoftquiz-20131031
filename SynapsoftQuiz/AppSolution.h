//
//  AppSolution.h
//  SynapsoftQuiz
//
//  Created by Kabkee Moon on 2013. 10. 31..
//  Copyright (c) 2013년 Kabkee Moon. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppSolution : NSObject

@property NSArray * alphabets;
@property NSMutableString * alphabetsAsNsstring;
@property NSMutableArray * alphabetsAsIntArray;

- (NSString *) returnAlphabetWithSerialNumber: (int) question;
- (NSString *) returnAlphabetsAsNSString: (int)inputNumber;
- (void) decTo26s:(int)dec;
- (int) decTo26sVarificationStringToInt:(NSString *)valueOfString;

@end
