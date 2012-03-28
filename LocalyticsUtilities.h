//
//  LocalyticsUtilities.h
//  Localytics
//
//  Created by Sam Soffes on 3/27/12.
//  Copyright (c) 2012 Sam Soffes. All rights reserved.
//

#define ANALYTICS_ENABLED (!DEBUG && !TARGET_IPHONE_SIMULATOR)

void LLStartSession(NSString *key);
void LLTagEvent(NSString *name);
void LLTagEventWithAttributes(NSString *name, NSDictionary *attributes);
void LLTagScreen(NSString *name);
