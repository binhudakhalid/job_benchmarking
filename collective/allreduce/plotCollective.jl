using Plots, DelimitedFiles

function format_bytes(bytes)
    log2b = log2(bytes)
    unit, val = divrem(log2b, 10)
    val = Int(exp2(val))
    unit_string = if unit == 0
        " B"
    elseif unit == 1
        " KiB"
    elseif unit == 2
        " MiB"
    elseif unit == 3
        " GiB"
    elseif unit == 4
        " TiB"
    end
    return string(val) * unit_string
end
#julia --project=. plot.jl


function plot_bench(name::String; xlims=(1, 2 ^ 23), ylims=(Inf, Inf))
    system = "Fugaku"
    xticks_range = exp2.(log2(first(xlims)):2:log2(last(xlims)))
    xticks = (xticks_range, format_bytes.(xticks_range))

    julia  = readdlm(joinpath(@__DIR__, "j_allreduce.csv"), ',', Float64; skipstart=1)
    
    julia2 = readdlm(joinpath(@__DIR__, "all_reduce.csv"), ',', Float64; skipstart=1)


    p = plot(;
             title = "Latency of MPI Allreduce @Nocuta 2 (4 nodes, 512 ranks)",
             titlefont=font(10),
             xlabel = "message size",
             xscale = :log10,
             xlims,
             xticks,
             ylabel = "time [sec]",
             ylims,
             yscale = :log10,
             legend=:topleft,
             left_margin=10Plots.mm, bottom_margin=10Plots.mm
             )
    # For MPI.jl plot average time.  I don't know what time is used in Riken results
    #plot!(p, riken[:, 1], riken[:, 2]; label="Cache avoidance (Riken-CCS)", marker=:auto, markersize=3)
    plot!(p, julia[:, 1],  julia[:, 5];  label="MPIBenchmark.jl", marker=:auto, markersize=3)
    plot!(p, julia2[:, 1], julia2[:, 2] .* 1e-6; label="OSU Benchmark", marker=:auto, markersize=3)
    #plot!(p, julia3[:, 1], julia3[:, 5] .* 1e-6; label="ibm", marker=:auto, markersize=3)
    #plot!(p, julia4[:, 1], julia4[:, 5] ; label="j srun", marker=:auto, markersize=3)
    #plot!(p, julia5[:, 1], julia5[:, 2] .* 1e-6; label="j srun", marker=:auto, markersize=3)

    #reference[:, 3] .* 1e-6


    #plot!(p, riken[:, 1], riken[:, 2]; label="Cache avoidance (Riken-CCS)", marker=:auto, markersize=3)
    savefig(joinpath(@__DIR__, "allreduce.pdf"))

end

#plot_bench("Allreduce"; xlims=(4, 2 ^ 22.5), ylims=(10 ^ -6, Inf))
#plot_bench("Gatherv"; xlims=(1, 2 ^ 20.5))
plot_bench("ALLReduce"; xlims=(4, 2 ^ 23), ylims=(Inf, Inf))