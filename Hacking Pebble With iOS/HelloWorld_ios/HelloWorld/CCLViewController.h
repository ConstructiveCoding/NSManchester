//
//  CCLViewController.h
//  HelloWorld
//
//  Created by Aiden Montgomery on 25/09/2013.
//  Copyright (c) 2013 Constructive Coding Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PebbleKit/PebbleKit.h>

@interface CCLViewController : UIViewController

@property (nonatomic, strong) PBWatch *pebble;

@property (weak, nonatomic) IBOutlet UIButton *connectionBtn;
@property (weak, nonatomic) IBOutlet UIButton *communicateBtn;
@property (weak, nonatomic) IBOutlet UIButton *failBtn;

- (IBAction)connectToPebble:(id)sender;
- (IBAction)communicateWithPebble:(id)sender;
- (IBAction)failToCommunicateWithPebble:(id)sender;

@end
