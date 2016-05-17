//
//  DetailViewController.h
//  EveryToDo
//
//  Created by Taylor Benna on 2016-05-17.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailCompleteLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailPriorityLabel;

@end

