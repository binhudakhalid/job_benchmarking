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

    julia  = readdlm(joinpath(@__DIR__, "latency_julia.csv"), ',', Float64; skipstart=1)
    julia2 = readdlm(joinpath(@__DIR__, "latency_osu.csv"), ',', Float64; skipstart=1)

    #title = "Latency of MPI Put with fence  @ Nocuta (4 nodes, 512 ranks)",

    p = plot(;
             title = "Point to point latency @ Nocuta (2 nodes, 1 rank each)",
             titlefont=font(8),
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
    plot!(p, julia[:, 1],  julia[:, 3];  label="MPIBenchmark.jl", marker=:auto, markersize=3)
    plot!(p, julia2[:, 1], julia2[:, 2] ./ 1e6; label="OSU Benchmark", marker=:auto, markersize=3)
    #plot!(p, julia2[:, 1], julia2[:, 2] .* 1e-6; label="osu", marker=:auto, markersize=3)


    #reference[:, 3] .* 1e-6


    #plot!(p, riken[:, 1], riken[:, 2]; label="Cache avoidance (Riken-CCS)", marker=:auto, markersize=3)
    savefig(joinpath(@__DIR__, "$(lowercase(name))-latency_ptp.pdf"))

end

#plot_bench("Allreduce"; xlims=(4, 2 ^ 22.5), ylims=(10 ^ -6, Inf))
#plot_bench("Gatherv"; xlims=(1, 2 ^ 20.5))
plot_bench("ALLReduce"; xlims=(4, 2 ^ 22), ylims=(Inf, Inf))