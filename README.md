# BLDropDownSlider

<p align="center">
<img src="http://i.imgur.com/J3yJzQy.gif">
<br>
[slow motion]
</p>


BLDropDownSlider allows you to create dropdown sliders, segmented controls, etc. within a table view. 

This project contains a sample application using it. Just open the project in XCode, build it and run it.

## Using the component

Add BLDropDownSlider.h/.m to your project and import the .h file into the view controller where you would like the table view to show.

Create a table view instance. For example:

	- (void) viewDidLoad
	{
    BLDropDownSlider *tableView = [[BLDropDownSlider alloc] initWithFrame:CGRectMake(0, 0, 600, 670) style:UITableViewStyleGrouped];
      [tableView setValues];
      tableView.delegate = tableView;
      tableView.dataSource = tableView;
      tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
      [self.view addSubview:tableView];
      
	}
    
Now in BLDropDownSlider.m fill the arrays with your custom content, set the row number where the slider is coming and the section:


	- (void) setValues 
	{
     //Add the titles of your rows to the settings array or set to custom array
    
      self.settings = [[NSMutableArray alloc] initWithObjects:@"Set Radius",@"Map Type", nil];
      self.secondSection = [[NSMutableArray alloc] initWithObjects:@"Turn Sound Off", nil];
    
      //Set the row where the slider will appear from
    
      rowAbove = 0;
    
      //Set section where the slider will appear
    
      section = 0;
	}
      

      
