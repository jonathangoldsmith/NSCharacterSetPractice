//
//  ViewController.h
//  textManipulation
//
//  Created by Jonathan Goldsmith on 3/21/15.
//  Copyright (c) 2015 JonathanGoldsmith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textEnetered;
@property (weak, nonatomic) IBOutlet UILabel *textReturned;


@end

