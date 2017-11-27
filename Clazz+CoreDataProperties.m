//
//  Clazz+CoreDataProperties.m
//  CoreDataDemo
//
//  Created by ShiPanpan on 2017/11/9.
//  Copyright © 2017年 ShiPanpan. All rights reserved.
//
//

#import "Clazz+CoreDataProperties.h"

@implementation Clazz (CoreDataProperties)

+ (NSFetchRequest<Clazz *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Clazz"];
}

@dynamic clazzName;
@dynamic classId;
@dynamic classStudents;

@end
