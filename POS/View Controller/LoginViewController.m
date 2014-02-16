//
//  LoginViewController.m
//  POS
//
//  Created by leo.chang on 2014/2/16.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginTitleHeaderView.h"
#import "inputFieldCell.h"

#import "POSViewController.h"

#define inputFieldCellIdentifier @"inputFieldCellIdentifier"
#define buttonFieldCellIdentifier @"buttonFieldCellIdentifier"
#define headerIdenfidier @"headerIdenfidier"

@interface LoginViewController ()

@property (nonatomic, strong) NSArray *fields;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.fields = @[@"企業帳號",@"帳號",@"密碼"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.aTableView setDelegate:self];
    [self.aTableView setDataSource:self];
    [self createHeaderView];
    [self.aTableView registerNib:[UINib nibWithNibName:@"inputFieldCell" bundle:nil] forCellReuseIdentifier:inputFieldCellIdentifier];
    [self.aTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:buttonFieldCellIdentifier];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == loginSectionField)
        return 3;
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == loginSectionField)
        return 40;
    return 0;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == loginSectionField)
    {
        LoginTitleHeaderView *view = [[[NSBundle mainBundle] loadNibNamed:@"LoginTitleHeaderView" owner:self options:nil] objectAtIndex:0];
        
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger sec = [indexPath section];
    NSInteger row = [indexPath row];
    if (sec == loginSectionField)
    {
        inputFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:inputFieldCellIdentifier forIndexPath:indexPath];
        
        [cell.inputField setPlaceholder:_fields[row]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:buttonFieldCellIdentifier forIndexPath:indexPath];
        
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
        [cell.textLabel setText:@"登入"];
        [cell.detailTextLabel setText:@""];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    POSViewController *posView = [[POSViewController alloc] initWithNibName:@"POSViewController" bundle:nil];
    
    [self.navigationController pushViewController:posView animated:YES];
    
}


#pragma mark - Create TableView HeaderView
- (void)createHeaderView
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    UIView *logoView = [[[NSBundle mainBundle] loadNibNamed:@"LogoView" owner:self options:nil] objectAtIndex:0];
    
    [self.aTableView setTableHeaderView:logoView];
}

#pragma mark - keyboard show / hide
- (void)keyboardWillShow:(NSNotification *)note
{
    [self.aTableView setContentOffset:CGPointMake(0, 100) animated:YES];
}

- (void)keyboardWillHide:(NSNotification *)note
{
    [self.aTableView setContentOffset:CGPointMake(0, 0) animated:YES];
}


@end
