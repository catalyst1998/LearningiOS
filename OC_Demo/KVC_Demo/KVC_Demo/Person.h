//
//  Person.h
//  KVC_Demo
//
//  Created by 玛卡巴卡 on 2022/4/30.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
//    NSString *_name;
    NSString *name;
//    NSString *_isName;
//    NSString *isName;
    
}
@property (nonatomic,strong) Dog *dog;
@end

NS_ASSUME_NONNULL_END
