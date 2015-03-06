//
//  ListViewController.m
//  Dream Catcher
//
//  Created by Ronald Hernandez on 3/5/15.
//  Copyright (c) 2015 Ronald Hernandez. All rights reserved.
//

#import "ListViewController.h"


@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    return cell;
}
- (IBAction)onEditButtonTapped:(id)sender {
}
- (IBAction)onAddButtonTapped:(id)sender {
    
}

@end
