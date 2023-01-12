using MPIBenchmarks
benchmark(OSUAllreduce(max_size=2097152,filename="e1_j_allreduce.csv", iterations=262144))