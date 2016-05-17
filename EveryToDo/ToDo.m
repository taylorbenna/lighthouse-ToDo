//
//  ToDo.m
//  EveryToDo
//
//  Created by Taylor Benna on 2016-05-17.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

-(instancetype)initWithTitle:(NSString *)title descrip:(NSString *)desc priority:(PriorityLevel)prio isComplete:(BOOL)isComp
{
    self = [super init];
    if (self) {
        _title = title;
        _desc = desc;
        _priority = prio;
        _isCompleted = isComp;
    }
    return self;
}

@end


