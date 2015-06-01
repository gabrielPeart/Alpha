//
//  FLEXDisplayItem.m
//  UICatalog
//
//  Created by Dal Rupnik on 20/05/15.
//  Copyright (c) 2015 Unified Sense. All rights reserved.
//

#import "ALPHADataItem.h"

NSString* const ALPHADisplayItemTitleKey = @"kALPHADisplayItemTitleKey";
NSString* const ALPHADisplayItemDetailkey = @"kALPHADisplayItemDetailkey";

@implementation ALPHADataItem

#pragma mark - Getters and Setters

- (void)setIcon:(id)icon
{
    if ([icon isKindOfClass:[UIImage class]] || [icon isKindOfClass:[NSString class]])
    {
        _icon = icon;
    }
    else
    {
        @throw [NSException exceptionWithName:@"Icon can be a string or UIImage" reason:@"Only NSString and UIImage is supported for icon." userInfo:@{ @"icon" : icon }];
    }
}

#pragma mark - Static Methods

+ (instancetype)itemWithIdentifier:(NSString *)identifier
{
    return [[[self class] alloc] initWithIdentifier:identifier title:nil detail:nil style:UITableViewCellStyleDefault];
}

#pragma mark - Initializers

- (instancetype)init
{
    return [self initWithIdentifier:@""];
}

- (instancetype)initWithIdentifier:(NSString *)identifier
{
    return [self initWithIdentifier:identifier title:nil detail:nil];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: %@", NSStringFromClass(self.class), self.identifier];
}

- (instancetype)initWithIdentifier:(NSString *)identifier style:(UITableViewCellStyle)style;
{
    return [self initWithIdentifier:identifier title:nil detail:nil style:style];
}

- (instancetype)initWithIdentifier:(NSString *)identifier title:(NSString *)title detail:(NSString *)detail
{
    return [self initWithIdentifier:identifier title:title detail:detail style:UITableViewCellStyleValue1];
}

- (instancetype)initWithIdentifier:(NSString *)identifier title:(NSString *)title detail:(NSString *)detail style:(UITableViewCellStyle)style
{
    self = [super init];
    
    if (self)
    {
        self.identifier = identifier;
        self.title = title;
        self.detail = detail;
        self.style = style;
    }
    
    return self;
}

@end
