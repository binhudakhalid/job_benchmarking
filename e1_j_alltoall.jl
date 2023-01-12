using MPIBenchmarks
benchmark(OSUAlltoall(Int8;max_size=2097152,filename="e1_j_alltoall.csv", iterations=262144))