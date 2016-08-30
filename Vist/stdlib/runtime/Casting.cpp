//
//  Casting.cpp
//  Vist
//
//  Created by Josef Willsher on 10/05/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

#include <cstring>

// introspection

RUNTIME_STDLIB_INTERFACE
void *vist_runtime_getMetadata(ExistentialObject *ex) {
    return ex->metadata;
}
RUNTIME_STDLIB_INTERFACE
int64_t vist_runtime_metadataGetSize(void *md) {
    auto metadata = (TypeMetadata*)md;
    return metadata->size;
}
RUNTIME_STDLIB_INTERFACE
void *vist_runtime_metadataGetName(void *md) {
    auto metadata = (TypeMetadata*)md;
    return (void *)vist_demangle(metadata->name);
}


RUNTIME_COMPILER_INTERFACE
bool vist_castExistentialToConcrete(ExistentialObject *_Nonnull existential,
                                    TypeMetadata *_Nonnull targetMetadata,
                                    void *_Nullable out) {
    if (existential->metadata != targetMetadata)
        return false;
    // if the metadata is the same, we can copy into the out param
    memcpy(out, (void*)existential->projectBuffer(), targetMetadata->size);
    return true;
}



