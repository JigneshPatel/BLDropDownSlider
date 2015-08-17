//
//  BLSliderTableViewController.h
//  Slider
//
//  Created by Aditya Narayan on 8/17/15.
//  Copyright (c) 2015 Shehzad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLSliderTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    BOOL sliderInserted;
}

@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *radiusLabel;
@property (nonatomic, strong) NSMutableArray *settings;



@end
