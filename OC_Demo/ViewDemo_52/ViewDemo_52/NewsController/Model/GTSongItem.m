//
//  GTSongItem.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/13.
//

#import "GTSongItem.h"

@implementation GTSongItem

- (void)dealWithDictionary:(NSDictionary *)dictionary {
    
#warning 类型是否匹配

//    self.songID = [dictionary objectForKey:@"id"];
    self.name = [dictionary objectForKey:@"name"];
//    self.mark = [dictionary objectForKey:@"mark"];
    self.artist = [(NSDictionary *)(((NSArray *)[dictionary objectForKey:@"ar"])[0]) objectForKey:@"name"];
//    self.picUrl = @"http://p1.music.126.net/W1kczDCB4-r-uNAznD1ljg==/108851651165850.jpg";

    self.picUrl = [(NSDictionary *)(NSDictionary *)[dictionary objectForKey:@"al"] objectForKey:@"picUrl"];

    
}
@end
