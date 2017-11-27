//
//  Student+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by ShiPanpan on 2017/11/9.
//  Copyright © 2017年 ShiPanpan. All rights reserved.
//
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nonatomic) int16_t studentId;
@property (nullable, nonatomic, copy) NSString *studentName;
@property (nonatomic) int16_t studentAge;
@property (nullable, nonatomic, retain) Clazz *studentClass;
@property (nullable, nonatomic, retain) NSSet<Course *> *studentCourses;

@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addStudentCoursesObject:(Course *)value;
- (void)removeStudentCoursesObject:(Course *)value;
- (void)addStudentCourses:(NSSet<Course *> *)values;
- (void)removeStudentCourses:(NSSet<Course *> *)values;

@end

NS_ASSUME_NONNULL_END
