//
//  ViewController.m
//  learn_refresh
//
//  Created by renhe_cx on 8/22/15.
//  Copyright (c) 2015 renhe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;
@property (nonatomic) NSInteger count;
- (IBAction)clickRefresh:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    _count = 3;
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _refreshButton.layer.cornerRadius = 8.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -- tableview代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark -- uiscrollview代理方法
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    
}

- (IBAction)clickRefresh:(id)sender {
    _count = _count + 6;
    [_tableView reloadData];
}
@end