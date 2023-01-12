using MPIBenchmarks
benchmark(OSUGetAccumulateLatency(Int8; synchronization_option = "fence", max_size=2097152,filename="e1_j_get_accumulate_latency_fence.csv", iterations=262144))
