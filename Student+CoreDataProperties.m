//
//  Student+CoreDataProperties.m
//  CoreDataDemo
//
//  Created by ShiPanpan on 2017/11/9.
//  Copyright © 2017年 ShiPanpan. All rights reserved.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic studentId;
@dynamic studentName;
@dynamic studentAge;
@dynamic studentClass;
@dynamic studentCourses;

@end
