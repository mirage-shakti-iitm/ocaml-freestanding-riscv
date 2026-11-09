unsigned long long generate_random_id();

void __fides_free(void* fpr);

void* __fides_malloc(unsigned long s);

void* __fides_calloc(unsigned long n, unsigned long s);

void* __fides_realloc(void* p, unsigned long s);

void* __fides_memalign(unsigned long alignment, unsigned long s);