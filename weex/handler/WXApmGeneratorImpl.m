#import "WXApmGeneratorImpl.h"
#import "WXApmImpl.h"

@implementation WXApmGeneratorImpl

- (id)gengratorApmInstance:(NSString *) type
{
    id instance = [[WXApmImpl alloc] init];
    return instance;
}

@end
