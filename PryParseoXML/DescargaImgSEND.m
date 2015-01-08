//
//  DescargaImgSEND.m
//  PryParseoXML
//
//  Created by Henry AT on 1/8/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "DescargaImgSEND.h"


static NSString * const BaseImgURLString = @"http://mobilesod1.cloudapp.net";


@implementation DescargaImgSEND


+ (DescargaImgSEND *)sharedDescargasImagen {
    static DescargaImgSEND * _sharedDescargaImgSEND = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDescargaImgSEND = [[self alloc] initWithBaseURL:[NSURL URLWithString:BaseImgURLString]];
    });
    
    return _sharedDescargaImgSEND;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (self) {
//        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.responseSerializer = [AFImageResponseSerializer serializer];
        self.requestSerializer =  [AFJSONRequestSerializer serializer];
        //AFImageResponseSerializer

    }
    
    return self;
}

//  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
-(NSURLSessionDataTask *)ejecutarDescargadeImagenConPais:(NSString *)pPais yRetina:(NSInteger)pRetina completion:(CRDictionaryCompletionBlock)pRespuesta {
    
    NSParameterAssert(pPais);
    NSParameterAssert(pRetina);

    pPais = [pPais uppercaseString]; // IMPORTANTE.!!!
    
    NSURL *url = [NSURL URLWithString:@"http://mobilesod1.cloudapp.net/imagenesapp/appsodimac/cl/iOS/640x1136_iOS.png"];    
    
    

    return nil;
    
}


@end
