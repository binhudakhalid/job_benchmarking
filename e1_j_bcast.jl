using MPIBenchmarks
benchmark(OSUBroadcast(Int8;max_size=2097152,filename="e1_j_broadcast.csv", iterations=262144))