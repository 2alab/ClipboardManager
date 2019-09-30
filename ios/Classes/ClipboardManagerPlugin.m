#import "ClipboardManagerPlugin.h"

@implementation ClipboardManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"clipboard_manager" binaryMessenger:[registrar messenger]];
    
    ClipboardManagerPlugin *instance = [[ClipboardManagerPlugin alloc] init];
    
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    [[UIPasteboard generalPasteboard] setString:call.arguments[@"text"]];
    result(@YES);
}

@end
