//
//  ToDoCell.m
//  EveryToDo
//
//  Created by Taylor Benna on 2016-05-17.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "ToDoCell.h"

@implementation ToDoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/*
- (IBAction)changePriority:(UIButton *)sender {
    [sender setTitle:@"Medium" forState:UIControlStateNormal];
    sender.tintColor = [UIColor orangeColor];
}
 */

@end
