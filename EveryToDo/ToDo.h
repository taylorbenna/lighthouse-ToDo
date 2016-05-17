//
//  ToDo.h
//  EveryToDo
//
//  Created by Taylor Benna on 2016-05-17.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PriorityLow,
    PriorityMedium,
    PriorityHigh
}PriorityLevel;

@interface ToDo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *desc;
@property (nonatomic) PriorityLevel priority;
@property (nonatomic) BOOL isCompleted;



-(instancetype)initWithTitle:(NSString *)title descrip:(NSString *)desc priority:(PriorityLevel)prio isComplete:(BOOL)isComp;

@end

