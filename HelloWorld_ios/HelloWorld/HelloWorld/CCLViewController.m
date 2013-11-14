//
//  CCLViewController.m
//  HelloWorld
//
//  Created by Aiden Montgomery on 25/09/2013.
//  Copyright (c) 2013 Constructive Coding Ltd. All rights reserved.
//

#import "CCLViewController.h"

@interface CCLViewController ()

@end

@implementation CCLViewController

- (void)viewDidLoad{
  [self configureUI];
}

- (void)setPebble:(PBWatch *)pebble{
  _pebble = pebble;
  
  [self configureUI];
}

- (void)configureUI{
  if (_pebble) {
    _connectionBtn.hidden = NO;
    _communicateBtn.hidden = YES;
    _failBtn.hidden = YES;
  } else {
    _communicateBtn.hidden = YES;
    _connectionBtn.hidden = YES;
    _failBtn.hidden = YES;
  }
}

- (IBAction)connectToPebble:(id)sender {
  [_pebble appMessagesGetIsSupported:^(PBWatch *watch, BOOL isAppMessagesSupported) {
    if (isAppMessagesSupported){
      _communicateBtn.hidden = NO;
      _failBtn.hidden = NO;
    } else {
      _communicateBtn.hidden = YES;
      _failBtn.hidden = YES;
    }
  }];
}

- (IBAction)communicateWithPebble:(id)sender {
  NSMutableDictionary *data = [NSMutableDictionary dictionaryWithCapacity:1];
  [data setObject:@"Hello NSManchester" forKey:@(1)];
  // send data to app
  if (_pebble){
    uint8_t bytes[] = { 0x3D, 0xCC, 0x58, 0x91, 0xF7, 0x97, 0x45, 0xA9, 0xB2, 0x48, 0x3A, 0xBC, 0xF8, 0x7E, 0xA6, 0x70 };
    [_pebble appMessagesSetUUID:[NSData dataWithBytes:bytes length:sizeof(bytes)]];
    [_pebble appMessagesPushUpdate:data onSent:^(PBWatch *watch, NSDictionary *update, NSError *error) {
      if (error){
        NSLog(@"Error updating pebble: %@", [error localizedDescription]);
      } else {
        // Update success
      }
    }];
  }
}

- (IBAction)failToCommunicateWithPebble:(id)sender {
  NSMutableDictionary *data = [NSMutableDictionary dictionaryWithCapacity:1];
  [data setObject:@"Hello, this is a really really long message that is probably larger than I am supposed to be." forKey:@(1)];
  // send data to app
  if (_pebble){
    uint8_t bytes[] = { 0x3D, 0xCC, 0x58, 0x91, 0xF7, 0x97, 0x45, 0xA9, 0xB2, 0x48, 0x3A, 0xBC, 0xF8, 0x7E, 0xA6, 0x70 };
    [_pebble appMessagesSetUUID:[NSData dataWithBytes:bytes length:sizeof(bytes)]];
    [_pebble appMessagesPushUpdate:data onSent:^(PBWatch *watch, NSDictionary *update, NSError *error) {
      if (error){
        NSLog(@"Error updating pebble: %@", [error localizedDescription]);
      } else {
        // Update success
      }
    }];
  }
}

@end
