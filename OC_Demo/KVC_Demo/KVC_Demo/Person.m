//
//  Person.m
//  KVC_Demo
//
//  Created by 玛卡巴卡 on 2022/4/30.
//

#import "Person.h"

@implementation Person
- (instancetype)init
{
    if(self = [super init]){
//        _name = @"_name";
        name = @"name";
//        isName = @"isname";
//        _isName = @"_isname";
        _dog = [[Dog alloc] init];
    }
    return self;
}
//+ (BOOL)accessInstanceVariablesDirectly
//{
//    return NO;
//}
//getter
//-(NSString *) name
//{
//    return @"getter-->name";
//}
- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}
@end
