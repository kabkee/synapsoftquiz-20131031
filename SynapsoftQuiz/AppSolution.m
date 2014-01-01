//
//  AppSolution.m
//  SynapsoftQuiz
//
//  Created by Kabkee Moon on 2013. 10. 31..
//  Copyright (c) 2013년 Kabkee Moon. All rights reserved.
//

#import "AppSolution.h"
#import "AppDelegate.h"

@implementation AppSolution
@synthesize alphabets;
@synthesize alphabetsAsNsstring;
@synthesize alphabetsAsIntArray;

- (id)init
{
    self = [super init];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    alphabets = delegate.alphabets;

    alphabetsAsIntArray = [[NSMutableArray alloc] init];
    alphabetsAsNsstring = [NSMutableString stringWithString:@""];
    return self;
}

- (NSString *) returnAlphabetWithSerialNumber: (int)serialNumber
{
    int index = serialNumber -1;
    NSString * answer = alphabets[index];

    return answer;
}

- (NSString *) returnAlphabetsAsNSString: (int)inputNumber
{
    [alphabetsAsIntArray removeAllObjects];
    alphabetsAsNsstring = [NSMutableString stringWithString:@""];
    [self decTo26s: inputNumber];
    
    NSString * lastObjectOfAlphabetAsIntArrayAsString = [[NSString alloc] init];
    int lastObjectOfAlphabetAsIntArrayAsInt;
    
    int rootCountOfAlphabetsAsIntArray = alphabetsAsIntArray.count;
    for (int i = 0; i < rootCountOfAlphabetsAsIntArray; i++) {
        lastObjectOfAlphabetAsIntArrayAsInt = [[alphabetsAsIntArray lastObject] integerValue];
        [alphabetsAsIntArray removeLastObject];
        
        lastObjectOfAlphabetAsIntArrayAsString = [self returnAlphabetWithSerialNumber:lastObjectOfAlphabetAsIntArrayAsInt];
        
        [alphabetsAsNsstring appendString:lastObjectOfAlphabetAsIntArrayAsString];
    }
    return alphabetsAsNsstring;
}

- (void) decTo26s:(int)dec
{
    NSNumber * intToNSNumber = NULL;
    const int alphabetCount = 26;
    int leftover = dec % alphabetCount;
 
    if (dec < alphabetCount ) {
        if ( dec == 0) {
            return;
        }
        intToNSNumber = [NSNumber numberWithInt:dec];
        [alphabetsAsIntArray addObject: intToNSNumber];
    }else{
        if (leftover == 0){
            intToNSNumber = [NSNumber numberWithInt: alphabetCount];
            dec = dec - alphabetCount;
        }else if (leftover < alphabetCount ){
            intToNSNumber = [NSNumber numberWithInt: leftover];
            dec = dec - leftover;
        }
        dec = dec / alphabetCount;
        [alphabetsAsIntArray addObject: intToNSNumber];
        [self decTo26s:dec];
    }
}

- (int) decTo26sVarificationStringToInt:(NSString *)valueOfString
{
    NSMutableArray * valueOfStringToArray = [[NSMutableArray alloc] initWithCapacity:[valueOfString length]];
    NSLog(@"**valueOfString length **= %lu",(unsigned long)[valueOfString length]);
    for (int i=0; i < [valueOfString length]; i++)
    {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [valueOfString characterAtIndex:i]];
        [valueOfStringToArray insertObject: ichar atIndex:0];
    }
    
    int alphabetsToInt = 0;
    for (int i = 0; i < valueOfStringToArray.count ; i++)
    {
        int arrayIndex = [alphabets indexOfObject:valueOfStringToArray[i]] +1;
        alphabetsToInt = alphabetsToInt+ (arrayIndex * pow(26, i));
    }
    return alphabetsToInt;
}

@end
