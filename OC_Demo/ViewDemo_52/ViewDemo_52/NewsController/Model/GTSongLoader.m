//
//  GTSongLoader.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/13.
//

#import "GTSongLoader.h"
#import "GTSongItem.h"
@implementation GTSongLoader
- (void)loadSongDataWithFinishBlock:(GTSongLoaderFinishBlock)finishBlock{
    NSString *urlSong = @"http://music.163.com/api/artist/top/song?id=13223";
    NSURL *songURL = [NSURL URLWithString:urlSong];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:songURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonError;
        
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        NSArray *dataArray =  [(NSDictionary *)jsonObj objectForKey:@"songs"];
        
        NSMutableArray *songItemArray = [[NSMutableArray alloc] init];
        
        for(NSDictionary *info in dataArray){
            GTSongItem *songItem = [[GTSongItem alloc]init];
            [songItem dealWithDictionary:info];
            [songItemArray addObject:songItem];
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock){
                finishBlock(error == nil,songItemArray.copy);
            }
        });
    }];
    
    [dataTask resume];
    
    NSLog(@"song load");
    
}
@end
