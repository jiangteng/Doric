//
//  WSClient.m
//  Doric
//
//  Created by pengfei.zhou on 2019/8/14.
//

#import "DoricWSClient.h"
#import <SocketRocket/SRWebSocket.h>
#import "DoricUtil.h"
#import "DoricContextManager.h"

@interface DoricWSClient () <SRWebSocketDelegate>
@property(nonatomic, strong) SRWebSocket *websocket;
@end

@implementation DoricWSClient
- (instancetype)initWithUrl:(NSString *)url {
    if (self = [super init]) {
        _websocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:url]];
        _websocket.delegate = self;
        [_websocket open];
    }
    return self;
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    DoricLog(@"webSocketDidOpen");
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    DoricLog(@"webSocketdidReceivePong");
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSData *jsonData = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if (err) {
        DoricLog(@"webSocketdidReceiveMessage parse error：%@", err);
        return;
    }
    NSString *source = [[dic valueForKey:@"source"] mutableCopy];
    NSString *script = [dic valueForKey:@"script"];
    for (NSValue *value in  [[DoricContextManager instance] aliveContexts]) {
        DoricContext *context = value.nonretainedObjectValue;
        if ([source containsString:context.source]) {
            [context reload:script];
        }
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    DoricLog(@"webSocketdidFailWithError");
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    DoricLog(@"webSocketdidCloseWithCode");
}

- (void)close {
    [self.websocket close];
}
@end
