//
//  ViewController.h
//  TapMe
//
//  Created by bellnas on 15/1/3.
//  Copyright (c) 2015年 DienBell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>{
    IBOutlet UILabel* scoreLabel;
    IBOutlet UILabel* timerLabel;
    
    NSInteger count;
    NSInteger seconds;
    NSTimer* timer;
}
-(IBAction)buttonPressed;
@end

