# ------------------------------------------------------------------
# Licensed under the MIT License. See LICENSE in the project root.
# ------------------------------------------------------------------

module DensityRatioEstimation

using Statistics
using LinearAlgebra
using Distances

# API for density ratio estimation
include("api.jl")

# density ratio estimators
include("kliep.jl")

# pure Julia implementations
include("mmd/julia.jl")

# implementations with extra dependencies
using Requires
function __init__()
  @require JuMP="4076af6c-e467-56ae-b986-b466b2749572" begin
    @require Ipopt="b6b21f68-93f8-5de0-b562-5493be1d77c9" include("mmd/jump.jl")
  end
  @require Optim="429524aa-4258-5aef-a3af-852621145aeb" include("kliep/optim.jl")
end

export
  # estimators
  DensityRatioEstimator,
  MMD,
  KLIEP,

  MMDAnalytical, # TODO: deprecate
  MMDNumerical, # TODO: deprecate

  # optim libs
  JuliaLib,
  OptimLib,
  ConvexLib,
  JuMPLib,

  # functions
  density_ratio

end # module
