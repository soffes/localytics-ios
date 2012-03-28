//
//  LocalyticsUtilities.m
//  Localytics
//
//  Created by Sam Soffes on 3/27/12.
//  Copyright (c) 2012 Sam Soffes. All rights reserved.
//

#import "LocalyticsUtilities.h"
#if ANALYTICS_ENABLED
#import "LocalyticsSession.h"
#endif

void LLStartSession(NSString *key) {
#if ANALYTICS_ENABLED
	[[LocalyticsSession sharedLocalyticsSession] startSession:(key)]
#endif
}


void LLTagEvent(NSString *name) {
#if ANALYTICS_ENABLED
	[[LocalyticsSession sharedLocalyticsSession] tagEvent:name];
#endif
}


void LLTagEventWithAttributes(NSString *name, NSDictionary *attributes) {
#if ANALYTICS_ENABLED
	[[LocalyticsSession sharedLocalyticsSession] tagEvent:name attributes:attributes];
#endif
}


void LLTagScreen(NSString *name) {
#if ANALYTICS_ENABLED
	[[LocalyticsSession sharedLocalyticsSession] tagScreen:screen];
#endif
}
