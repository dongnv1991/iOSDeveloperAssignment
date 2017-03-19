//
//  SearchJSONModel.h
//  AplicationiOS
//
//  Created by Dong Nguyen on 3/19/17.
//  Copyright © 2017 TVT25. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Result.h"
@protocol SearchJSONModel

@end
@interface SearchJSONModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *resultCount;
@property (nonatomic, strong) NSArray<Result, Optional> *results;
@end
