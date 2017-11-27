//
//  Course+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by ShiPanpan on 2017/11/9.
//  Copyright © 2017年 ShiPanpan. All rights reserved.
//
//

#import "Course+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Course (CoreDataProperties)

+ (NSFetchRequest<Course *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *courseName;
@property (nonatomic) int16_t courseId;
@property (nonatomic) int16_t chapterCount;
@property (nullable, nonatomic, retain) NSSet<Student *> *courseStudents;

@end

@interface Course (CoreDataGeneratedAccessors)

- (void)addCourseStudentsObject:(Student *)value;
- (void)removeCourseStudentsObject:(Student *)value;
- (void)addCourseStudents:(NSSet<Student *> *)values;
- (void)removeCourseStudents:(NSSet<Student *> *)values;

@end

NS_ASSUME_NONNULL_END
