//
//  POSViewController.m
//  POS
//
//  Created by leo.chang on 2014/2/16.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "POSViewController.h"
#import "MenuTableViewController.h"

@interface POSViewController () <MenuOptionDelegate>

@property (readwrite, nonatomic) MenuTableViewController *menuViewController;

@end

@implementation POSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.menuViewController = [[MenuTableViewController alloc] init];
    self.menuViewController.delegate = self;
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMenu
{
    [self.menuViewController presentFromViewController:self animated:YES completion:nil];
}

#pragma mark - Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    [self.menuViewController presentFromViewController:self panGestureRecognizer:sender];
}

#pragma mark - MenuOptionDelegate

- (void)menu:(MenuTableViewController *)menu didPickWithOption:(PMenuOption)option
{
    [self.menuViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
