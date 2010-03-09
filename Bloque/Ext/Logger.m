//
//  Logger.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 09/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Logger.h"

void print_log_info(const char* filename, int lineno, id format, ...) {
	NSString *str;
	if ([format isKindOfClass:[NSString class]]) {
		va_list args;
		va_start (args, format);
		str = [[NSString alloc] initWithFormat:format  arguments: args];
		va_end (args);		
	} else {
		str = [NSString stringWithFormat:@"%@", format];
	}
	const char* output = [str cStringUsingEncoding:NSUTF8StringEncoding];	
	NSString* printFormat = [NSString stringWithFormat:@"%%%ds #%%03d   %%s\n", FILENAME_PADDING];
	printf([printFormat UTF8String], filename, lineno, output);
    [str release];
}