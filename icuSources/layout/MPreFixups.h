/*
 * (C) Copyright IBM Corp. 2002-2003 - All Rights Reserved
 *
 * $Source: /cvs/root/ICU/icuSources/layout/MPreFixups.h,v $
 * $Date: 2003/07/03 18:13:45 $
 * $Revision: 1.1.1.1 $
 *
 */

#ifndef __MPREFIXUPS_H
#define __MPREFIXUPS_H

/**
 * \file
 * \internal
 */

#include "LETypes.h"

U_NAMESPACE_BEGIN

// Might want to make this a private member...
struct FixupData;

class MPreFixups : public UMemory
{
public:
    MPreFixups(le_int32 charCount);
   ~MPreFixups();

    void add(le_int32 baseIndex, le_int32 mpreIndex);
    
    void apply(LEGlyphID *glyphs, le_int32 *charIndicies);

private:
    FixupData *fFixupData;
    le_int32   fFixupCount;
};

U_NAMESPACE_END
#endif


