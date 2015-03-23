//
//  ViewController.m
//  textManipulation
//
//  Created by Jonathan Goldsmith on 3/21/15.
//  Copyright (c) 2015 JonathanGoldsmith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textReturned.text = @"Enter text in the above field to see the edited text here";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)stringEditingDidEnd:(id)sender {
    NSString *text = self.textEnetered.text;
    self.textReturned.text = @"";
    NSCharacterSet *alphanumericCharacterSet = [NSCharacterSet alphanumericCharacterSet];
    NSString *finalTextString = @"";
    char firstCharacter = '\0', finalCharacter = '\0';
    bool alphanumeric = false;
    int letterCount = 0;
    
    for(int x = 0; x< text.length;x++) {
        if(alphanumeric) {
            if([alphanumericCharacterSet characterIsMember:[text characterAtIndex:x]]){
                letterCount++;
                if(x+1 == text.length) {
                    if (letterCount == 0) {
                        finalTextString = [finalTextString stringByAppendingString:[NSString stringWithFormat:@"%c%c",firstCharacter,[text characterAtIndex:x]]];
                    } else {
                        finalCharacter = [text characterAtIndex:x];
                        finalTextString = [finalTextString stringByAppendingString:[NSString stringWithFormat:@"%c%d%c",firstCharacter, letterCount-1,finalCharacter]];
                    }
                }
            } else {
                if (letterCount == 0) {
                    finalTextString = [finalTextString stringByAppendingString:[NSString stringWithFormat:@"%c%c",firstCharacter,[text characterAtIndex:x]]];
                } else {
                    finalCharacter = [text characterAtIndex:x-1];
                    finalTextString = [finalTextString stringByAppendingString:[NSString stringWithFormat:@"%c%d%c%c",firstCharacter, letterCount-1,finalCharacter,[text characterAtIndex:x]]];
                }
                letterCount = 0;
                alphanumeric = false;
                
            }
        } else {
            if([alphanumericCharacterSet characterIsMember:[text characterAtIndex:x]]){
                firstCharacter = [text characterAtIndex:x];
                alphanumeric = true;
                letterCount = 0;
                if(x+1 == text.length) {
                    finalTextString = [finalTextString stringByAppendingString:[NSString stringWithFormat:@"%c", [text characterAtIndex:x]]];
                }
            } else {
                finalTextString = [finalTextString stringByAppendingString:[NSString stringWithFormat:@"%c", [text characterAtIndex:x]]];
            }
        }
    }
    self.textReturned.text = finalTextString;
}

@end
