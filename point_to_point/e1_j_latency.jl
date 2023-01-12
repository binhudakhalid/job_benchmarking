using MPIBenchmarks
benchmark(OSULatency(Int8;max_size=2097152, filename="e1_j_latency.csv", iterations=262144))
