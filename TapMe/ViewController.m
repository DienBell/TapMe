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
    
    [self setupGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)buttonPressed{
    NSLog((@"Pressed!"));
    count++;
    
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%ld",count];
}
-(void)setupGame{
    seconds = 30;
    count = 0;
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%ld",count];
    timerLabel.text = [NSString stringWithFormat:@"Time:%ld",seconds];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
}
-(void)subtractTime{
    seconds --;
    timerLabel.text = [NSString stringWithFormat:@"Time:%ld",seconds];
    if(seconds == 0){
        [timer invalidate];
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Time is up"
                                                        message:[NSString stringWithFormat:@"Your score is:\n%ld",count]
                                                       delegate:self
                                              cancelButtonTitle:@"Play again"
                                              otherButtonTitles:nil];
        [alert show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self setupGame];
}

@end
