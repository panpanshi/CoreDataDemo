//
//  Clazz+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by ShiPanpan on 2017/11/9.
//  Copyright © 2017年 ShiPanpan. All rights reserved.
//
//

#import "Clazz+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Clazz (CoreDataProperties)

+ (NSFetchRequest<Clazz *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *clazzName;
@property (nonatomic) int16_t classId;
@property (nullable, nonatomic, retain) NSSet<Student *> *classStudents;

@end

@interface Clazz (CoreDataGeneratedAccessors)

- (void)addClassStudentsObject:(Student *)value;
- (void)removeClassStudentsObject:(Student *)value;
- (void)addClassStudents:(NSSet<Student *> *)values;
- (void)removeClassStudents:(NSSet<Student *> *)values;

@end

NS_ASSUME_NONNULL_END
