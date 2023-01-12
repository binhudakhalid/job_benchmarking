using MPIBenchmarks
benchmark(OSUGetAccumulateLatency(Int8;max_size=2097152,filename="e1_j_get_accumulate_latency_lock.csv", iterations=262144))
