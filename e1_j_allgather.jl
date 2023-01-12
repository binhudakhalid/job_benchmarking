using MPIBenchmarks
benchmark(OSUAllgather(Int8;max_size=2097152,filename="e1_j_allgather.csv", iterations=262144))