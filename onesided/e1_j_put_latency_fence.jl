using MPIBenchmarks
benchmark(OSUPutLatency(Int8; synchronization_option = "fence", max_size=2097152,filename="e1_j_put_latency_lock.csv", iterations=262144))







