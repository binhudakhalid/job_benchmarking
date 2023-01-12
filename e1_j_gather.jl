using MPIBenchmarks
benchmark(OSUGather(Int8;max_size=2097152,filename="e1_j_gather.csv", iterations=262144))