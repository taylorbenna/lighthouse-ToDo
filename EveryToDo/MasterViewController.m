//
//  MasterViewController.m
//  EveryToDo
//
//  Created by Taylor Benna on 2016-05-17.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoCell.h"
#import "AddItemTableViewController.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource, AddItemMessageSender>

@property NSMutableArray *objects;
@property (strong, nonatomic) IBOutlet UITableView *toDoTableView;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    ToDo *first = [[ToDo alloc] initWithTitle:@"Clean Room"
                                      descrip:@"throw out garbage, put away laundry"
                                     priority:PriorityLow
                                   isComplete: NO];
    
    ToDo *second = [[ToDo alloc] initWithTitle:@"Clean Kitchen"
                                       descrip:@"throw out garbage, clean Dishes"
                                      priority:PriorityMedium
                                    isComplete: NO];
    
    ToDo *third = [[ToDo alloc] initWithTitle:@"Do Homework"
                                      descrip:@"math and english"
                                     priority:PriorityHigh
                                   isComplete: NO];
    
    ToDo *fourth = [[ToDo alloc] initWithTitle:@"Call Mom"
                                       descrip:@"Discuss Siblings"
                                      priority:PriorityHigh
                                    isComplete: YES];
    
    NSArray *temp = @[first, second, third, fourth];
    self.objects = [temp mutableCopy];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)messageSent:(ToDo *)message {
    [self.objects addObject:message];
    [self dismissViewControllerAnimated:YES completion:^{}];
    [self.toDoTableView reloadData];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    } else if ([[segue identifier] isEqualToString:@"addItemSegue"]) {
        AddItemTableViewController *theController = segue.destinationViewController;
        theController.delegate = self;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell" forIndexPath:indexPath];
    ToDo *currentObject = self.objects[indexPath.row];
    
    if (currentObject.priority == PriorityLow) {
        [cell.prioButton setTitle:@"Low" forState:UIControlStateNormal];
        cell.prioButton.tintColor = [UIColor greenColor];
    } else if (currentObject.priority == PriorityMedium) {
        [cell.prioButton setTitle:@"Medium" forState:UIControlStateNormal];
        cell.prioButton.tintColor = [UIColor orangeColor];
    } else {
        [cell.prioButton setTitle:@"High" forState:UIControlStateNormal];
        cell.prioButton.tintColor = [UIColor redColor];
    }
    
    if (currentObject.isCompleted) {
        NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
        NSAttributedString* attributedString = [[NSAttributedString alloc] initWithString:currentObject.title attributes:attributes];
        
        cell.titleLabel.attributedText = attributedString;
        
        NSAttributedString* attributedString2 = [[NSAttributedString alloc] initWithString:currentObject.desc attributes:attributes];
        
        cell.descriptionLabel.attributedText = attributedString2;
    } else {
        cell.titleLabel.text = currentObject.title;
        cell.descriptionLabel.text = currentObject.desc;
    }
    
    
    UISwipeGestureRecognizer *swipeGest = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(itemGotSwiped:)];
    [swipeGest setDirection:UISwipeGestureRecognizerDirectionRight];
    [cell addGestureRecognizer:swipeGest];
    
    return cell;
}

-(void) itemGotSwiped:(UISwipeGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateEnded) {
        ToDoCell *cell = (ToDoCell *)sender.view;
        NSIndexPath* indexPath = [self.toDoTableView indexPathForCell:cell];
        ToDo *currentObject = self.objects[indexPath.row];
        if (!currentObject.isCompleted) {
            currentObject.isCompleted = YES;
            
            NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
            NSAttributedString* attributedString = [[NSAttributedString alloc] initWithString:currentObject.title attributes:attributes];
            
            cell.titleLabel.attributedText = attributedString;
            
            NSAttributedString* attributedString2 = [[NSAttributedString alloc] initWithString:currentObject.desc attributes:attributes];
            
            cell.descriptionLabel.attributedText = attributedString2;
            [self.toDoTableView reloadData];
        }
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
