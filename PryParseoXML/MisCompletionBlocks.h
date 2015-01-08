//
//  MisCompletionBlocks.h
//  PryParseoXML
//
//  Created by Henry AT on 1/8/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#ifndef PryParseoXML_MisCompletionBlocks_h
#define PryParseoXML_MisCompletionBlocks_h


typedef void(^CRArrayCompletionBlock) (NSArray *coleccion, NSError *error);

// -- - - - Respuesta:
typedef void(^CRDictionaryCompletionBlock) (NSDictionary *coleccion, NSError *error);
// Para Impresion de Servicios:
typedef void(^CRStringCompletionBlock) (NSString *coleccion, NSError *error);

// Esto es especial para los Saldos.
//typedef void(^CRSaldosCompletionBlock) (SaldosHTTPClient *coleccion, NSError *error);




#endif
