//
//  ViewController.m
//  CoreDataDemo
//
//  Created by ShiPanpan on 2017/11/9.
//  Copyright © 2017年 ShiPanpan. All rights reserved.
//

#import "ViewController.h"
#import "Person+CoreDataClass.h"
#import "AppDelegate.h"
#import "Student+CoreDataClass.h"
#import "Clazz+CoreDataClass.h"
#import "Course+CoreDataClass.h"

@interface ViewController ()
@property (nonatomic, strong) AppDelegate *appDelegate;

//测试 context并发操作
@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self initData];
    
//    [self createDataName:@"MainName1" age:10];
//    [self createDataName:@"zhouwu2" age:28];
//
    [self readData];
    
    
    [self createBackgroundDataName:@"BackName1" age:20];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveContextSave:) name:NSManagedObjectContextDidSaveNotification object:self.context];
    
//    [self createDataName:@"zhouwu8" age:80];
    
    
//    [self readData];
    
//    [NSThread sleepForTimeInterval:10];
//    [self createDataName:@"MainName2" age:10];
    
}

- (void)receiveContextSave:(NSNotification *)note {
    //主  context  进行数据持久化
    [self.appDelegate.managedObjectContext mergeChangesFromContextDidSaveNotification:note];
    
    //进行数据查询
    NSLog(@"MainContext合并数据之后的查询");
    [self readData];
    NSLog(@"MainContext合并数据之后的查询结束");
    
    
}

- (void)createBackgroundDataName:(NSString *)name age:(NSInteger)age {
    
    NSManagedObjectContext *backGroundContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).persistentContainer.newBackgroundContext;
    self.context = backGroundContext;
    
    [backGroundContext performBlock:^{
        Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:backGroundContext];
        person.name = name;
        person.age = age;
        //直接保存数据库
        NSError *error = nil;
        [backGroundContext save:&error];
        
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
        
//        NSError *error = nil;
        NSArray *messages = [backGroundContext executeFetchRequest:request error:&error];
        if (error) {
            NSLog(@"error");
        }
        
        NSLog(@"backGroundContext的数据查询");
        for (Person *person in messages) {
            NSLog(@"名字为：%@，年龄为：%d",person.name,person.age);
        }
        NSLog(@"backGroundContext的数据查询结束");
        
        [self createDataName:@"MainName3" age:10];
    }];
}

//创建Person数据
- (void)createDataName:(NSString *)name age:(NSInteger)age {
    
    //1.创建实体
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.appDelegate.managedObjectContext];
    person.name = name;
    person.age = age;
    //直接保存数据库
    [self.appDelegate saveContext];
    
}

//创建Student数据
- (void)createStudentName:(NSString *)name age:(NSInteger)age {
    
    //1.创建实体
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.appDelegate.managedObjectContext];
    
    Course *english = [[Course alloc] initWithContext:self.appDelegate.managedObjectContext];
    Course *math = [[Course alloc] initWithContext:self.appDelegate.managedObjectContext];
    
    [student addStudentCoursesObject:english];
    [student addStudentCourses:[NSSet setWithObjects:english, math, nil]];
    
    student.studentName = name;
    student.studentAge = age;
    
    //直接保存数据库
    [self.appDelegate saveContext];
    
}


//查询数据
- (void)readData {
    // 1.FetchRequest 获取请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    NSError *error = nil;
    NSArray *messages = [self.appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"error");
    }
    
    for (Person *person in messages) {
        NSLog(@"名字为：%@，年龄为：%d",person.name,person.age);
    }
    
    //可以直接输入 fet 三个字符，coredata封装好的代码
    
}

//修改数据
- (void)updateData {
    // 1.FetchRequest 获取请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    NSError *error = nil;
    NSArray *messages = [self.appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"error");
    }
    
    for (Person *person in messages) {
        NSLog(@"名字为：%@，年龄为：%d",person.name,person.age);
        if ([person.name isEqualToString:@"zhangsan"]) {
            person.name = @"lisi";
        }
    }
    
    //可以直接输入 fet 三个字符，coredata封装好的代码
    
}

- (void)initData {
    //初始化数据
    self.appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
