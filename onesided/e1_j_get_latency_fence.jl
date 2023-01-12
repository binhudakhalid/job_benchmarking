using MPIBenchmarks
benchmark(OSUGetLatency(Int8; synchronization_option = "fence", max_size=2097152,filename="e1_j_get_latency_lock.csv", iterations=262144))
