//
//  RefcountedObject.cpp
//  Vist
//
//  Created by Josef Willsher on 10/5/2016.
//  Copyright © 2015 vistlang. All rights reserved.
//

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

struct RefcountedObject {
    void *object;
    uint32_t refCount;
};


// Private


__attribute__((always_inline))
void incrementRefCount(RefcountedObject *object) {
    __atomic_fetch_add(&object->refCount, 1, __ATOMIC_RELAXED);
}

__attribute__((always_inline))
void decrementRefCount(RefcountedObject *object) {
    __atomic_fetch_sub(&object->refCount, 1, __ATOMIC_RELAXED);
}


// Ref counting

/// allocates a new heap object and returns the refcounted box
extern "C"
RefcountedObject *
vist_allocObject(uint32_t size) {
    // malloc the object storage
    void *object = malloc(size);
    // calloc the box storage -- need calloc so it is initialised
    auto refCountedObject = reinterpret_cast<RefcountedObject *>(malloc(sizeof(RefcountedObject)));
    
    // store the object and initial ref count in the box
    refCountedObject->object = object;
    refCountedObject->refCount = 0;
#ifdef REFCOUNT_DEBUG
    printf(">alloc  \t%p, rc=%i\n", refCountedObject->object, refCountedObject->refCount);
#endif
    // return heap pointer to ref counted box
    return refCountedObject;
};

/// Deallocs a heap object
extern "C"
void vist_deallocObject(RefcountedObject *object) {
#ifdef REFCOUNT_DEBUG
    printf(">dealloc\t%p\n", object->object);
#endif
    free(object->object);
    // this is probably leaking -- `object` is on the heap and we can't dispose of it
};

/// Releases this capture. If its now unowned we dealloc
extern "C"
void vist_releaseObject(RefcountedObject *object) {
#ifdef REFCOUNT_DEBUG
    printf(">release\t%p, rc=%i\n", object->object, object->refCount-1);
#endif
    // if no more references, we dealloc it
    if (object->refCount == 1)
        vist_deallocObject(object);
    // otherwise we decrement
    else
        decrementRefCount(object);
};

/// Retain an object
extern "C"
void vist_retainObject(RefcountedObject *object) {
    incrementRefCount(object);
#ifdef REFCOUNT_DEBUG
    printf(">retain \t%p, rc=%i\n", object->object, object->refCount);
#endif
};

/// Release an object without deallocating
extern "C"
void vist_releaseUnownedObject(RefcountedObject *object) {
    decrementRefCount(object);
#ifdef REFCOUNT_DEBUG
    printf(">release-unowned \t%p, rc=%i\n", object->object, object->refCount);
#endif
};

/// Deallocate a -1 object if it is unowned
extern "C"
void vist_deallocUnownedObject(RefcountedObject *object) {
#ifdef REFCOUNT_DEBUG
    printf(">dealloc-unowned\t%p, rc=%i\n", object->object, object->refCount);
#endif
    if (object->refCount == 0)
        vist_deallocObject(object);
};

/// Get the ref count
extern "C"
uint32_t vist_getObjectRefcount(RefcountedObject *object) {
    return object->refCount;
};

/// Check if the object is singly referenced
extern "C"
bool vist_objectHasUniqueReference(RefcountedObject *object) {
    return object->refCount == 1;
};

