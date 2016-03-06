#import "RCTEventDispatcher.h"
#import "UIView+React.h"
#import "RCTLog.h"

#import <ArcGIS/ArcGIS.h>

#import "RCTArcGISMap.h"

@implementation RCTArcGISMap : UIView  {
	
	RCTEventDispatcher *_eventDispatcher;
	AGSMapView *_mapView;
	
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
	if ((self = [super init])) {
		_eventDispatcher = eventDispatcher;
		_mapView = [[AGSMapView alloc] init];
		
		AGSTiledMapServiceLayer *tiledLayer = [[AGSTiledMapServiceLayer alloc] initWithURL:[NSURL URLWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer"]];
		
		AGSFeatureLayer *featureLayer = [[AGSFeatureLayer alloc] initWithURL:[NSURL URLWithString:@"https://services.arcgis.com/nzS0F0zdNLvs7nc8/arcgis/rest/services/MTBENCHMARK2DATA2/FeatureServer/0"] mode:AGSFeatureLayerModeSnapshot];
		
		[_mapView addMapLayer:tiledLayer withName:@"Tiled Layer"];
		[_mapView addMapLayer:featureLayer withName:@"Feature Layer"];
		
		[_mapView addObserver:self forKeyPath:@"visibleAreaEnvelope" options:NSKeyValueObservingOptionNew context:nil];
	}
	
	return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
	if (
			[keyPath isEqualToString:@"resolution"] ||
			[keyPath isEqualToString:@"visibleAreaEnvelope"] ||
			[keyPath isEqualToString:@"rotationAngle"] ||
			[keyPath isEqualToString:@"mapScale"]){
		RCTLogInfo(@"Emit extent change");
		
		NSString *extentChangedLbl = [NSString stringWithFormat:@"x: %d, y: %d, scale: 1/%d",
																	(int) _mapView.visibleAreaEnvelope.center.x,
																	(int) _mapView.visibleAreaEnvelope.center.y,
																	(int) _mapView.mapScale];
		
		[_eventDispatcher sendAppEventWithName:@"onExtentChange"
																			body:@{ @"label": extentChangedLbl }];
	}
	else {
		[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
	}
}

- (void)removeFromSuperview
{
	//
}

- (void)layoutSubviews
{
	_mapView.frame = self.bounds;
	[self addSubview:_mapView];
}

- (void)setLevel:(double)level
{
	CGPoint screenPoint = [_mapView toScreenPoint:_mapView.visibleAreaEnvelope.center];
	[_mapView zoomWithFactor:level atAnchorPoint:screenPoint animated:YES];
}

- (void)setCenterWGS84:(double)x y:(double)y
{
	RCTLogInfo(@"setCenterWGS84 TODO %f %f", x, y);
	
	AGSPoint *pointWGS = [AGSPoint pointWithX:x y:y
													spatialReference:[AGSSpatialReference wgs84SpatialReference]];
	
	AGSPoint *pointMap = (AGSPoint *)[[AGSGeometryEngine defaultGeometryEngine] projectGeometry:pointWGS
																			toSpatialReference:[AGSSpatialReference webMercatorSpatialReference]];
	
	[_mapView centerAtPoint:pointMap animated:YES];
}

- (void)setLayer:(NSString *)layer
{
	RCTLogInfo(@"setLayer TODO %@", layer);
}

@end