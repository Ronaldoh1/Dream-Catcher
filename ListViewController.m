//
//  ListViewController.m
//  Dream Catcher
//
//  Created by Ronald Hernandez on 3/5/15.
//  Copyright (c) 2015 Ronald Hernandez. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"


@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *titleArray;
@property NSMutableArray *descriptionArray;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //need to allocate array in memory
    self.titleArray = [NSMutableArray new];
    self.descriptionArray = [NSMutableArray new];
    self.editing = false;
}
-(void)presentDreamEntry{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Enter New Dream" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Dream Title";
    }];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Dream Description";
    }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

   UIAlertAction *saveAction = [UIAlertAction actionWithTitle: @"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
       UITextField *textFieldOne = alertController.textFields[0];
       UITextField *textFieldTwo = alertController.textFields[1];
       [self.titleArray addObject:textFieldOne.text];
       [self.descriptionArray addObject:textFieldTwo.text];

       [self.tableView reloadData];

   }];

    //present the actionss
     [alertController addAction:cancelAction];
    [alertController addAction:saveAction];


    [self presentViewController:alertController animated:true completion:nil];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];

    return cell;
}
- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender {
    if (self.editing){

        self.editing = false;

    [self.tableView setEditing:false animated:true];
    sender.style = UIBarButtonItemStylePlain;
    sender.title = @"Edit";
    }else {

        self.editing = true;
        [self.tableView setEditing:true animated:true];
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Done";

    }
}
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{

    NSString *titleItem = [self.titleArray objectAtIndex:sourceIndexPath.row];
    [self.titleArray removeObject:titleItem];
    [self.titleArray insertObject:titleItem atIndex:destinationIndexPath.row];

    NSString *descriptionItem = [self.descriptionArray objectAtIndex:sourceIndexPath.row];
    [self.descriptionArray removeObject:descriptionItem];
    [self.descriptionArray insertObject:descriptionItem atIndex:destinationIndexPath.row];
    [self.tableView reloadData];


}
- (IBAction)onAddButtonTapped:(id)sender {
    [self presentDreamEntry];

}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.titleArray removeObjectAtIndex:indexPath.row];
    [self.descriptionArray removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailViewController *detailVC = segue.destinationViewController;
    detailVC.titleString = [self.titleArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailVC.descriptionString = [self.descriptionArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    
}

@end
