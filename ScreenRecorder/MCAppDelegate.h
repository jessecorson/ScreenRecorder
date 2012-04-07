//
//  MCAppDelegate.h
//  ScreenRecorder
//
//  Created by Mark Rada on 12-03-30.
//  Copyright (c) 2012 Marketcircle Incorporated. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MCScreenRecorder.h"

@interface MCAppDelegate : NSObject <NSApplicationDelegate>

@property (retain) MCScreenRecorder* recorder;
@property (weak) IBOutlet NSMenuItem *toggleButton;
@property (weak) IBOutlet NSMenuItem *menuSeparator;
@property (weak) IBOutlet NSMenuItem *fileButton;

- (IBAction)startRecording:(id)sender;
- (IBAction)pauseRecording:(id)sender;
- (IBAction)stopRecording:(id)sender;
- (IBAction)showInFinder:(id)sender;

@end
