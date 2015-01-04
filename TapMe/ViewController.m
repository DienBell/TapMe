//
//  ViewController.m
//  TapMe
//
//  Created by bellnas on 15/1/3.
//  Copyright (c) 2015年 DienBell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.view.backgroundColor = [UIColor purpleColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    scoreLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    timerLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    [self setupGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)buttonPressed{
    NSLog((@"Pressed!"));
    count++;
    
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%i",count];
    [buttonBeep play];
}
-(void)setupGame{
    seconds = 30;
    count = 0;
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%i",count];
    timerLabel.text = [NSString stringWithFormat:@"Time:%i",seconds];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
    
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
}
-(void)subtractTime{
    seconds --;
    timerLabel.text = [NSString stringWithFormat:@"Time:%i",seconds];
    [secondBeep play];
    if(seconds == 0){
        [timer invalidate];
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Time is up"
                                                        message:[NSString stringWithFormat:@"Your score is:\n%i",count]
                                                       delegate:self
                                              cancelButtonTitle:@"Play again"
                                              otherButtonTitles:nil];
        [alert show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self setupGame];
}
- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    // 1
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 2
    NSError *error;
    
    // 3
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    // 4
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    // 5
    return audioPlayer;
}
@end
