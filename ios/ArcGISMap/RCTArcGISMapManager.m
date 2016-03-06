#import "RCTArcGISMapManager.h"
#import "RCTArcGISMap.h"

#import "RCTUIManager.h"

#import <ArcGIS/ArcGIS.h>

@implementation RCTArcGISMapManager

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;

- (UIView *)view
{
	return [[RCTArcGISMap alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

- (dispatch_queue_t)methodQueue
{
	return self.bridge.uiManager.methodQueue;
}

RCT_EXPORT_VIEW_PROPERTY(layer, NSString);

RCT_EXPORT_METHOD(setLevel:(nonnull NSNumber *)reactTag level:(double)level) {
	RCTLogInfo(@"setLevel %f", level);
	
	[self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, RCTArcGISMap *> *viewRegistry) {
		RCTArcGISMap *view = viewRegistry[reactTag];
		if ([view isKindOfClass:[RCTArcGISMap class]]) {
			[view setLevel:level];
		}
	}];
}

RCT_EXPORT_METHOD(setCenterWGS84:(nonnull NSNumber *)reactTag x:(double)x y:(double)y) {
	RCTLogInfo(@"setCenterWGS84 %f %f", x, y);
	
	[self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, RCTArcGISMap *> *viewRegistry) {
		RCTArcGISMap *view = viewRegistry[reactTag];
		if ([view isKindOfClass:[RCTArcGISMap class]]) {
			[view setCenterWGS84:x y:y];
		}
	}];
}

@end