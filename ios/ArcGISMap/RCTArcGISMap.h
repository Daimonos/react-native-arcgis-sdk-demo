@class RCTEventDispatcher;

@interface RCTArcGISMap : UIView

@property (nonatomic, assign) NSString *layer;

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;

- (void)setLevel:(double)level;
- (void)setCenterWGS84:(double)x y:(double)y;

@end