//
//  BLSliderTableViewController.m
//  Slider
//
//  Created by Aditya Narayan on 8/17/15.
//  Copyright (c) 2015 Shehzad. All rights reserved.
//

#import "BLSliderTableViewController.h"

NSInteger rowCount;
int  rowAbove;

@interface BLSliderTableViewController ()

@end

@implementation BLSliderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

-(void)setValues {
    
    self.settings = [[NSMutableArray alloc] initWithObjects:@"Test",@"Test2", nil];
    rowAbove = 0;
    
    rowCount = [self.settings count];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return rowCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    switch ([indexPath section]) {
        case 0:
            
            if ([_settings[indexPath.row] isEqualToString:@"TEST"]) {
                
                if(cell.contentView.subviews.count==0) {
                    
                    [cell.contentView addSubview:self.slider];
                    [cell.contentView addSubview:self.radiusLabel];
                    _slider.frame = CGRectMake(0, 0, cell.contentView.bounds.size.width - 130, _slider.bounds.size.height);
                    _slider.center = CGPointMake(250, CGRectGetMidY(cell.contentView.bounds));
                    _slider.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
                    self.slider.minimumValue = 5;
                    self.slider.maximumValue = 500;
                    self.slider.value = (self.slider.maximumValue / 10);
                    [self.slider setContinuous:false];
                    self.radiusLabel.bounds = CGRectMake(0, 0, cell.contentView.bounds.size.width - 10, _slider.bounds.size.height);
                    self.radiusLabel.center = CGPointMake(580, CGRectGetMidY(cell.contentView.bounds));
                    self.radiusLabel.text = [NSString stringWithFormat:@"%.0f meters", self.slider.value];
                    [self.slider addTarget:self action:@selector(getSliderValue:) forControlEvents:UIControlEventValueChanged];
                }
            }
            else {
                cell.textLabel.text = _settings[indexPath.row];
            }
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
    
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == rowAbove && indexPath.section == 0 && sliderInserted == NO) {
        
        rowCount++;
        NSString *test = @"TEST";
        [self.settings insertObject:test atIndex:1];
        NSMutableArray* paths = [[NSMutableArray alloc] init];
        NSIndexPath *indice = [NSIndexPath indexPathForRow:1 inSection:0];
        [paths addObject:indice];
        [tableView beginUpdates];
        [tableView insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationBottom];
        [tableView endUpdates];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        sliderInserted = YES;
        
    }
    
    else {
        
        rowCount--;
        [self.settings removeObjectAtIndex:1];
        NSMutableArray* paths = [[NSMutableArray alloc] init];
        NSIndexPath *indice = [NSIndexPath indexPathForRow:1 inSection:0];
        [paths addObject:indice];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView endUpdates];
        sliderInserted = NO;
    }
}

@end
