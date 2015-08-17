//
//  TableViewTest.m
//  Slider
//
//  Created by Aditya Narayan on 8/17/15.
//  Copyright (c) 2015 Shehzad. All rights reserved.
//

#import "BLDropDownSlider.h"

NSInteger rowCount;
NSInteger arrayCount;
int  rowAbove;
int  section;

@implementation BLDropDownSlider 


-(void)setValues {
    
    //Add the titles of your rows to the settings array or set to custom array
    
    self.settings = [[NSMutableArray alloc] initWithObjects:@"Set Radius",@"Map Type", nil];
    self.secondSection = [[NSMutableArray alloc] initWithObjects:@"Turn Sound Off", nil];
    
    //Set the row where the slider will appear from
    
    rowAbove = 0;
    
    //Set section where the slider will appear
    
    section = 0;
    
    rowCount = [self.settings count];
    sliderInserted = NO;
    self.slider = [[UISlider alloc] init];
    self.radiusLabel = [[UILabel alloc] init];
    arrayCount = ([self.settings count] + 1);

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger sectionNumber = 0;
    switch (section) {
        case 0:
            sectionNumber = rowCount;
            break;
            
        case 1:
            sectionNumber = [_secondSection count];
            break;
            
        default:
            break;
    }
    return sectionNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    switch ([indexPath section]) {
        case 0:
            
            if ([_settings[indexPath.row] isEqualToString:@"Finder"]) {
                
                if(cell.contentView.subviews.count==0) {
                    NSLog(@"%f", cell.contentView.bounds.size.width);
                    [cell.contentView addSubview:self.slider];
                    [cell.contentView addSubview:self.radiusLabel];
                    _slider.frame = CGRectMake(20, 0, cell.contentView.bounds.size.width - 100, cell.contentView.bounds.size.height);
                    self.slider.minimumValue = 5;
                    self.slider.maximumValue = 500;
                    self.slider.value = (self.slider.maximumValue / 10);
                    [self.slider setContinuous:true];
                    self.radiusLabel.frame = CGRectMake(270, 0, cell.contentView.bounds.size.width - 10, cell.contentView.bounds.size.height);
                    self.radiusLabel.text = [NSString stringWithFormat:@"%.0f meters", self.slider.value];
                    self.radiusLabel.layer.zPosition = 10;
                    [self.slider addTarget:self action:@selector(getSliderValue:) forControlEvents:UIControlEventValueChanged];
                }
            }
            else {
                cell.textLabel.text = _settings[indexPath.row];
            }
            break;
            
        case 1:
            cell.textLabel.text = _secondSection[indexPath.row];
            break;
            
        default:
            break;
    }
    
    return cell;
    
}

- (void) getSliderValue: (UISlider *)paramSender {
    if ([paramSender isEqual:self.slider]){
        self.radiusLabel.text = [NSString stringWithFormat:@"%.0f meters", self.slider.value];
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == rowAbove && indexPath.section == section && sliderInserted == NO) {
        
        rowCount++;
        NSString *finderVar = @"Finder";
        [self.settings insertObject:finderVar atIndex:(rowAbove + 1)];
        NSMutableArray* paths = [[NSMutableArray alloc] init];
        NSIndexPath *indice = [NSIndexPath indexPathForRow:(rowAbove + 1) inSection:section];
        [paths addObject:indice];
        [tableView beginUpdates];
        [tableView insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationBottom];
        [tableView endUpdates];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        sliderInserted = YES;
        
    }
    
    else if (rowCount == arrayCount) {
        
        rowCount--;
        [self.settings removeObjectAtIndex:(rowAbove + 1)];
        NSMutableArray* paths = [[NSMutableArray alloc] init];
        NSIndexPath *indice = [NSIndexPath indexPathForRow:(rowAbove + 1) inSection:section];
        [paths addObject:indice];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView endUpdates];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        sliderInserted = NO;
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *myString = @"Empty Setting";
    switch (section) {
        case 0:
            myString = @"Settings";
            break;
        case 1:
            myString = @"Sound";
            break;
        default:
            break;
    }
    
    return myString;
}



@end
