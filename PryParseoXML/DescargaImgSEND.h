//
//  DescargaImgSEND.h
//  PryParseoXML
//
//  Created by Henry AT on 1/8/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "MisCompletionBlocks.h"



@interface DescargaImgSEND : AFHTTPSessionManager



+ (DescargaImgSEND *)sharedDescargasImagen;

- (instancetype)initWithBaseURL:(NSURL *)url;

-(NSURLSessionDataTask *)ejecutarDescargadeImagenConPais:(NSString *)pPais yRetina:(NSInteger)pRetina completion:(CRDictionaryCompletionBlock)pRespuesta;



@end
