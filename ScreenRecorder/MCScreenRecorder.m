//
//  MCScreenRecorder.m
//  ScreenRecorder
//
//  Created by Mark Rada on 12-04-07.
//  Copyright (c) 2012 Marketcircle Incorporated. All rights reserved.
//

#import "MCScreenRecorder.h"


static NSURL*
recordingURL()
{
  NSString* dir  = [@"~/Movies/" stringByExpandingTildeInPath];
  NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"YYYYMMDDHHmmss"];
  NSString* date = [formatter stringFromDate:[NSDate date]];
  NSString* file = [dir stringByAppendingPathComponent:[@"TestRecording-" stringByAppendingString:[date stringByAppendingString:@".mov"]]];
  return [NSURL fileURLWithPath:file];
}


@implementation MCScreenRecorder

@synthesize session;
@synthesize input;
@synthesize output;
@synthesize file;

- (id) init {
  self.session = [[AVCaptureSession alloc] init];
  
  self.input   = [[AVCaptureScreenInput alloc] 
                      initWithDisplayID:CGMainDisplayID()];
  
  self.input.capturesMouseClicks = YES;
  [self.session addInput:self.input];
  
  self.output = [[AVCaptureMovieFileOutput alloc] init];
  // @todo We may need to set a different compression preset
  [self.output  setDelegate:self];
  [self.session addOutput:self.output];
    
  return self;
}

- (BOOL) start {
  if (self.file == nil)
    self.file = recordingURL();

  [self.session startRunning];
  [self.output  startRecordingToOutputFileURL:self.file
                            recordingDelegate:self];

  return YES;
}

- (BOOL) pause {
  [self.session stopRunning];
  return YES;
}

- (BOOL) resume {
  [self.session startRunning];
  return YES;
}

- (BOOL) stop {
  [self.session stopRunning];
  [self.output  stopRecording];
  return YES;
}


#pragma mark AVCaptureFileOutputDelegate

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
}


#pragma mark AVCaptureFileOutputRecordingDelegate

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error {
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didPauseRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections {
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didResumeRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections {
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didStartRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections {
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput willFinishRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections error:(NSError *)error {
}

@end






















