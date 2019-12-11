@testset "KLIEP" begin
  for (i, pair) in enumerate([pair₁, pair₂])
    d_nu, d_de = pair
    Random.seed!(123)
    x_nu, x_de = rand(d_nu, 2000), rand(d_de, 1000)

    # estimated density ratio
    σ, b = 1.0, 100
    r̂ = densratio(x_nu, x_de, KLIEP(σ, b))

    if visualtests
      gr(size=(800,800))
      @plottest plot_d_nu(pair,x_de,r̂) joinpath(datadir,"KLIEP-$i.png") !istravis
    end
  end
end
