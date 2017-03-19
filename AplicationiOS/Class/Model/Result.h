//
//  Result.h
//  AplicationiOS
//
//  Created by Dong Nguyen on 3/19/17.
//  Copyright © 2017 TVT25. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol Result
@end

@interface Result : JSONModel
@property (nonatomic, strong) NSString<Optional> *trackCensoredName;
@property (nonatomic, strong) NSString<Optional> *artworkUrl100;
@property (nonatomic, strong) NSString<Optional> *previewUrl;
@end
