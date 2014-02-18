//
//  POSViewController.m
//  POS
//
//  Created by leo.chang on 2014/2/16.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "POSViewController.h"
#import "MenuTableViewController.h"

#import "AnnouncementView.h"
#import "AnnounceAdapter.h"
#import "CreateView.h"

@interface POSViewController () <MenuOptionDelegate, AnnounceDelegate>

@property (readwrite, nonatomic) MenuTableViewController *menuViewController;
@property (strong ,nonatomic) AnnouncementView *announceView;
@property (strong ,nonatomic) AnnounceAdapter *dataAdapter;
@property (strong, nonatomic) CreateView *createView;

- (void)createAllViews;

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
    [self createAllViews];
    self.menuViewController = [[MenuTableViewController alloc] init];
    self.menuViewController.delegate = self;
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
    /*
     release
     */
    //add a shadow
    CALayer *layer = _titleView.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    layer.shadowRadius = 4.0f;
    layer.shadowOpacity = 0.80f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_announceView show];
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

- (void)createAllViews
{
    CGRect frame = CGRectMake(0, 81, 1024, 768 - 80);
    self.announceView = [[[NSBundle mainBundle] loadNibNamed:@"AnnouncementView" owner:self options:nil] objectAtIndex:0];
    self.announceView.frame = frame;
    self.announceView.delegate = self;
    [_announceView.aTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:announceCellIdentifier];
    [_announceView.aTableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:announceHeaderIdentifier];
    self.dataAdapter = [[AnnounceAdapter alloc] init];
    _announceView.aTableView.dataSource = _dataAdapter;
    _announceView.aTableView.delegate = _dataAdapter;
    
    [self.view addSubview:_announceView];
    
    self.createView = [[[NSBundle mainBundle] loadNibNamed:@"CreateView" owner:self options:nil] objectAtIndex:0];
    self.createView.alpha = 0;
    self.createView.frame = frame;
    [self.view addSubview:_createView];
    
    
    [self.view bringSubviewToFront:_announceView];
}

#pragma mark - Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    [self.menuViewController presentFromViewController:self panGestureRecognizer:sender];
}

#pragma mark - MenuOptionDelegate

- (void)menu:(MenuTableViewController *)menu didPickWithOption:(PMenuOption)option
{
    switch (option)
    {
        case PMenuOptionAnnounce:
            [self.view bringSubviewToFront:_announceView];
            [_createView hide];
            [_announceView performSelector:@selector(show) withObject:nil afterDelay:0.5];
            break;
        case PMenuOptionCreate:
            [self.view bringSubviewToFront:_createView];
            [_announceView hide];
            [_createView performSelector:@selector(show) withObject:nil afterDelay:0.5];
            break;
        default:
            
            break;
    }
    [menu dismissViewControllerAnimated:YES completion:nil];
}

@end
