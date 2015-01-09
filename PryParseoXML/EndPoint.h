//
//  EndPoint.h
//  PryParseoXML
//
//  Created by Henry AT on 1/7/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EndPoint : NSObject

/*

 <id_endpoint>1</id_endpoint>
 <cod_endpoint>CONPRE</cod_endpoint>
 <desc_endpoint>Consulta de Precio</desc_endpoint>
 <version>2</version>
 <host>importaciones.sodimac.cl</host>
 <puerto>80</puerto>
 <resto_url>/Mobilidad/consulta_precio.php</resto_url>
 <id_pais>56</id_pais>

 */

@property (nonatomic, strong) NSString * idEndPoint;
@property (nonatomic, strong) NSString * codigoEndPoint;
@property (nonatomic, strong) NSString * descEndPoint;
@property (nonatomic, strong) NSString * version;
@property (nonatomic, strong) NSString * host;
@property (nonatomic, strong) NSString * puerto;
@property (nonatomic, strong) NSString * restoUrl;
@property (nonatomic, strong) NSString * idPais;



@end
