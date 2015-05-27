//
//  NGCache.m
//  SurfTumblr
//
//  Created by Le Ngoc Giang on 5/27/15.
//
//

#import "NGCache.h"

@implementation NGCache
{
    NSCache *_cache;
}
+ (instancetype)sharedInstance{
    static NGCache *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[NGCache alloc]init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _cache = [NSCache new];
    }
    return self;
}

- (void)storeImageData:(NSData *)imageData forKey:(NSString *)key
{
    [_cache setObject:imageData forKey:key];
}

- (void)queryImageForKey:(NSString *)key done:(NGCacheQueryCompletedBlock)doneBlock
{
    NSData *imageData = [_cache objectForKey:key];
    
    if (!imageData)
    {
        doneBlock(nil);
    }
    else
    {
        doneBlock(imageData);
    }
}

@end
