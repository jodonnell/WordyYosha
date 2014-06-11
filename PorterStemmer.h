//
//  PorterStemmer.h
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/11/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PorterStemmer : NSObject
{
}

+ (NSString*)stemFromString:(NSString*)input;

@end
