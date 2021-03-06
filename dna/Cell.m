//
//  Cell.m
//  dna
//
//  Created by Yura Tolstik on 10/31/12.
//  Copyright (c) 2012 Yura Tolstik. All rights reserved.
//

#include <stdlib.h>
#import "Cell.h"

#define DNA_LENGTH 100

@implementation Cell

static NSArray *availableSymbols;

+(void) initialize {
  availableSymbols = [[NSArray alloc] initWithObjects:@"A", @"C", @"G", @"T", nil];
}

+(NSString *)randomSymbol {
  return [availableSymbols objectAtIndex:arc4random()%4];
}

@synthesize dna = _dna;

-(id) init {
  self = [super init];

  if (self) {
    _dna = [[NSMutableArray alloc] initWithCapacity:DNA_LENGTH];
    for (int i = 0; i < DNA_LENGTH; i++) {
      [_dna addObject:[Cell randomSymbol]];
    }
  }
  
  return self;
}

-(int) hammingDistance:(Cell *) cell {
  int res = 0;
  for (int i = 0; i < [[self dna] count]; i++) {
    if (![[self dna][i] isEqualToString:[cell dna][i]]) res++;
  }
  return res;
}

@end
