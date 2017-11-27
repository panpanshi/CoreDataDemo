//
//  Course+CoreDataProperties.m
//  CoreDataDemo
//
//  Created by ShiPanpan on 2017/11/9.
//  Copyright © 2017年 ShiPanpan. All rights reserved.
//
//

#import "Course+CoreDataProperties.h"

@implementation Course (CoreDataProperties)

+ (NSFetchRequest<Course *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Course"];
}

@dynamic courseName;
@dynamic courseId;
@dynamic chapterCount;
@dynamic courseStudents;

@end
