//
//  ViewController.m
//  时间选择器demo
//
//  Created by Huaxia on 15/1/6.
//  Copyright (c) 2015年 ZhangWeiodng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self buildDatePicker];
}
-(void)buildDatePicker
{
    UIDatePicker *datePicker = [ [ UIDatePicker alloc] initWithFrame:CGRectMake(0.0,0.0,0.0,0.0)];
    datePicker.datePickerMode = UIDatePickerModeDate;//日期选取器模式
    
//    UIDatePickerModeTime,           // Displays hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. 6 | 53 | PM)
//    UIDatePickerModeDate,           // Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
//    UIDatePickerModeDateAndTime,    // Displays date, hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. Wed Nov 15 | 6 | 53 | PM)
//    UIDatePickerModeCountDownTimer  // Displays hour and minute (e.g. 1 | 53)
    
    datePicker.minuteInterval = 5;  //时间间隔
    
    NSString *minDateString = @"1900-01-01 00:00:00";
    NSDateFormatter *minDateFormater = [[NSDateFormatter alloc] init];
    [minDateFormater setDateFormat:@"yyyy-MM-DD HH:mm:ss"];
    NSDate *minDate = [minDateFormater dateFromString: minDateString];
    
    NSString *maxDateString = @"2019-01-01 00:00:00";
    NSDateFormatter *maxDateFormater = [[NSDateFormatter alloc] init];
    [maxDateFormater setDateFormat:@"yyyy-MM-DD HH:mm:ss"];
    NSDate *maxDate = [maxDateFormater dateFromString: maxDateString];

    NSDate *nowDate = [[NSDate alloc]initWithTimeIntervalSinceNow:NSTimeIntervalSince1970];
    NSLog(@"%@",nowDate);
    datePicker.minimumDate = minDate;
    datePicker.maximumDate = maxDate;
    datePicker.date = minDate;
    [ datePicker setDate:nowDate animated:YES];

    [ self.view addSubview:datePicker];
    NSDate* _date = datePicker.date;
    [ datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
}
-(void)dateChanged:(id)sender{
    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate* _date = control.date;
    /*添加你自己响应代码*/
    NSLog(@"%@",_date);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
