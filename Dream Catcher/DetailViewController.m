//
//  DetailViewController.m
//  Dream Catcher
//
//  Created by Ronald Hernandez on 3/5/15.
//  Copyright (c) 2015 Ronald Hernandez. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *text;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = self.titleString;
    self.text.text = self.descriptionString;

}

@end
