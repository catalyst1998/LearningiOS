//
//  Iterm.m
//  Homepwner
//
//  Created by Goggles on 2022/5/10.
//

#import "Item.h"


@implementation Item


- (NSString *)description{
    NSString *descriptionString =[[NSString alloc] initWithFormat:@"%@ (%@): Worth $ %d, recorded on %@",self.itemName,self.serialNumber,self.valueInDollars,self.dateCreated];

    return descriptionString;
}


- (instancetype)initWithName:(NSString *)name
             valueInDollars :(int) value
                serialNumber:(NSString *)number{
    //调用父类的指定初始方法
    self  = [super init];
    if(self){
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = number;
        _dateCreated = [NSDate now];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name{
    return [self initWithName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype)init{
    return [self initWithName:@"item"];
}


+ (instancetype)randomItem{
    // 创建不可变数组对象，包含三个形容词
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];

      // 创建不可变数组对象，包含三个名词
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];

     // 根据数组对象所含对象的个数，得到随机索引
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];

    NSInteger nounIndex = arc4random() % [randomNounList count];

    NSString *randomName = [NSString stringWithFormat:@"%@ %@",[randomAdjectiveList objectAtIndex:adjectiveIndex],[randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = arc4random() % 100;

    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",'0' + arc4random() % 10,'A' + arc4random() % 26,'0' + arc4random() % 10,'A' + arc4random() % 26,'0' + arc4random() % 10];

    Item *newItem = [[self alloc] initWithName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];

    return newItem;

}
@end
