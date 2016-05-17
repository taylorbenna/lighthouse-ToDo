//
//  AddItemTableViewController.h
//  EveryToDo
//
//  Created by Taylor Benna on 2016-05-17.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddItemMessageSender

-(void)messageSent:(ToDo *)message;

@end

@interface AddItemTableViewController : UITableViewController

@property (nonatomic, weak) id<AddItemMessageSender> delegate;

@end
