//
//  TableViewTest.h
//  Slider
//
//  Created by Brandon Leeds on 8/17/15.
//  Copyright (c) 2015 Brandon Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLDropDownSlider : UITableView <UITableViewDataSource, UITableViewDelegate>

{
    BOOL sliderInserted;
}

@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *radiusLabel;
@property (nonatomic, strong) NSMutableArray *settings;
@property (nonatomic, strong) NSMutableArray *secondSection;

-(void)setValues;


@end
