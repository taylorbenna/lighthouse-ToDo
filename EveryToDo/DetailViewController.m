//
//  DetailViewController.m
//  EveryToDo
//
//  Created by Taylor Benna on 2016-05-17.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDo.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        if([self.detailItem isKindOfClass:[ToDo class]]) {
            ToDo *displayItem = self.detailItem;
            self.detailTitleLabel.text = displayItem.title;
            self.detailDescriptionLabel.text = displayItem.desc;
            
            if (displayItem.isCompleted) {
                self.detailCompleteLabel.text = @"COMPLETE";
            } else {
                self.detailCompleteLabel.text = @"NOT COMPLETE";
            }
            
            switch (displayItem.priority) {
                case PriorityHigh:
                    self.detailPriorityLabel.text = @"High Priority";
                    self.detailPriorityLabel.textColor = [UIColor redColor];
                    break;
                    
                case PriorityMedium:
                    self.detailPriorityLabel.text = @"Medium Priority";
                    self.detailPriorityLabel.textColor = [UIColor orangeColor];
                    break;
                    
                default:
                    self.detailPriorityLabel.text = @"Low Priority";
                    self.detailPriorityLabel.textColor = [UIColor greenColor];
                    break;
            }
            
        }
   
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
