//
//  SynapsoftQuizTests.m
//  SynapsoftQuizTests
//
//  Created by Kabkee Moon on 2013. 10. 31..
//  Copyright (c) 2013년 Kabkee Moon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppSolution.h"

@interface SynapsoftQuizTests : XCTestCase

@end

@implementation SynapsoftQuizTests
{
    AppSolution * appSolution;
    NSArray *alphabets;
}

- (void)setUp
{
    [super setUp];

    appSolution = [[AppSolution alloc] init];
    alphabets = appSolution.alphabets;
    
}

- (void)tearDown
{
    [super tearDown];
    
}

- (void)testCheckIfAlphabetCountIsCorrect // Alphabet count = 26 - A to Z;
{
    const int alphabetCount = 26;
    XCTAssertEqual(alphabetCount, (int)alphabets.count, @"alphabetCount is not 26 as expected!");
}

- (void)testCheckIfAlphabetReturnedIsCorrectUsingSerialNumber
{
    // SerialNumber should correctly indicate the alphabet serial number
    
    int serialNumber = 26;
    
    NSString *answer = [appSolution returnAlphabetWithSerialNumber: serialNumber];
    NSString *expectedAnswer = @"Z";

    XCTAssert([answer isEqualToString:expectedAnswer], @"expectedAnswer is not EQUAL to answer");
}

- (void)testSolutionResults
{
    int inputNumber = 18278;
    int inputNumber2 = 703;
    int inputNumber3 = 3390;

    
    XCTAssert([[appSolution returnAlphabetsAsNSString:inputNumber] isEqualToString:@"ZZZ"], @"testSolutionResult answer is not quite equal.");
    
    XCTAssert([[appSolution returnAlphabetsAsNSString:inputNumber2] isEqualToString:@"AAA"], @"testSolutionResult answer is not quite equal.");
    
    XCTAssert([[appSolution returnAlphabetsAsNSString:inputNumber3] isEqualToString:@"DZJ"], @"testSolutionResult answer is not quite equal.");
}

- (void)testVarificationStringToInt
{
    NSString *expectedAnswer = @"AAA";
    int answer = [appSolution decTo26sVarificationStringToInt:expectedAnswer];
    
    XCTAssertEqual(answer, 703, @"expectedAnswer is not EQUAL to answer");
}

@end
