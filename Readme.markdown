# Localytics

This is my fork of the [Localytics](http://www.localytics.com) iOS client. Mainly fixing warnings and such.

## Integration

* Download from http://www.localytics.com/docs/iphone-integration/
* Add files to your project
* Disable ARC for those files if you're using ARC
* Add libSqlite3 to your target

``` objective-c
#define ANALYTICS_ENABLED (!DEBUG && !TARGET_IPHONE_SIMULATOR)

#if ANALYTICS_ENABLED
  #import "LocalyticsSession.h"
  #define LLStartSession(key) [[LocalyticsSession sharedLocalyticsSession] startSession:(key)];
  #define LLLogEvent(name) [[LocalyticsSession sharedLocalyticsSession] tagEvent:(name)];
  #define LLLogEventWithAttributes(name, parameters) [[LocalyticsSession sharedLocalyticsSession] tagEvent:(name) attributes:(parameters)];
  #define LLLogScreen(screen) [[LocalyticsSession sharedLocalyticsSession] tagScreen:screen];
#else
  #define LLStartSession(...)
  #define LLLogEvent(...)
  #define LLLogEventWithAttributes(...)
  #define LLLogScreen(...)
#endif
```

App delegate:

``` objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  LLStartSession(@"YOUR_KEY");

  // ...

  return YES;
}


#if ANALYTICS_ENABLED
- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[LocalyticsSession sharedLocalyticsSession] resume];
    [[LocalyticsSession sharedLocalyticsSession] upload];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[LocalyticsSession sharedLocalyticsSession] close];
    [[LocalyticsSession sharedLocalyticsSession] upload];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [[LocalyticsSession sharedLocalyticsSession] close];
}
#endif
```
