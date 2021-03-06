//
//  Casting.cpp
//  Vist
//
//  Created by Josef Willsher on 10/05/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

#include <cstring>

RUNTIME_COMPILER_INTERFACE
bool vist_castExistentialToConcrete(ExistentialObject *_Nonnull existential,
                                    TypeMetadata *_Nonnull targetMetadata,
                                    void *_Nullable out) {
    if (existential->metadata != targetMetadata)
        return false;
    // if the metadata is the same, we can copy into the out param
    memcpy(out, (void*)existential->projectBuffer(), targetMetadata->storageSize());
    return true;
}

RUNTIME_COMPILER_INTERFACE
bool vist_castExistentialToConcept(ExistentialObject *_Nonnull existential,
                                   TypeMetadata *_Nonnull conceptMetadata,
                                   ExistentialObject *_Nullable out) {
    auto conformances = existential->metadata->conformances;
    
#ifdef RUNTIME_DEBUG
    printf("→cast %s:\t%p to\t%s\n", existential->metadata->name, (void*)existential->projectBuffer(), conceptMetadata->name);
#endif
    
    for (int index = 0; index < existential->metadata->numConformances; index += 1) {
#ifdef RUNTIME_DEBUG
        auto conf = conformances[index];
        printf("   ↳witness=%p:\t%s\n", conf, conf->concept->name);
#endif
        if (conformances[index]->concept == conceptMetadata) {
            // if the metadata is the same, we can construct a non local existential
            
            auto in = (void*)existential->projectBuffer();
            void *mem;
            if (existential->metadata->isRefCounted) {
#ifdef RUNTIME_DEBUG
                printf("   ↳cast_existential_retain↘︎\n");
#endif
                vist_retainObject((RefcountedObject*)existential->projectBuffer());
                mem = in;
            } else if (auto copyConstructor = existential->metadata->copyConstructor) {
#ifdef RUNTIME_DEBUG
                printf("     ↳cast_deep_copy %s:\t%p to: %p\n", existential->metadata->name, in, mem);
                printf("         ↳cast_deep_copy_fn=%p\n", copyConstructor);
#endif
                mem = malloc(existential->metadata->storageSize());
                copyConstructor(in, mem);
            } else {
#ifdef RUNTIME_DEBUG
                printf("     ↳cast_copy %s:\t%p to: %p\n", conceptMetadata->name, in, mem);
#endif
                // if there is no copy constructor, we just have to do a shallow copy
                mem = malloc(existential->metadata->storageSize());
                memcpy(mem, in, existential->metadata->storageSize());
            }
            *out = ExistentialObject((uintptr_t)mem, existential->metadata,
                                     // it requires an arr of conforming types, we...
                                     // just provide a view into the original, 1 long
                                     1, existential->metadata->conformances+index);
            return true;
        }
    }
#ifdef RUNTIME_DEBUG
    printf("     ↳no match found\n");
#endif
    return false;
}

// cache metadata referenced and check here first
// static metadataCache

