//
//  EndPoint.m
//  PryParseoXML
//
//  Created by Henry AT on 1/7/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "EndPoint.h"

@implementation EndPoint


-(void) initWithIdEP:(NSString *)pIdEP yCodEP:(NSString *)pCodEP yDesEP:(NSString *)pDesEP yVersion:(NSString *)pVersion yHost:(NSString *)pHost yPuerto:(NSString *)pPuerto yRestUrl:(NSString *)pRestUrl yIdPais:(NSString *)pIdPais {

 _idEndPoint = pIdEP;
 _codigoEndPoint = pCodEP;
 _descEndPoint = pDesEP;
 _version = pVersion;
 _host = pHost;
 _puerto = pPuerto;
 _restoUrl = pRestUrl;
 _idPais = pIdPais;
    
}



@end
