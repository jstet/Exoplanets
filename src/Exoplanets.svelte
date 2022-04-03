<script>
  import * as d3 from "d3";

  import { onMount } from "svelte";

  import Svg from "./Svg.svelte";

  const url =
    "https://raw.githubusercontent.com/JStet/exoplanets_R_script/main/exoplanets.json";

  let rows = [];

  let teq_extent;
  let teq_median;
  let teq_color_scale;

  onMount(async () => {
    rows = await d3.json(url).then((data) => {
      let Flux = data.map(({ Flux }) => Flux);
      var spans = d3.max(Flux) / 5;

      return data;
    });

    teq_extent = d3.extent(rows, (d) => d.Teq);
    teq_median = d3.median(rows, (d) => d.Teq);
    teq_color_scale = d3
      .scaleDiverging()
      .domain([teq_extent[0], teq_median, teq_extent[1]])
      .interpolator(d3.interpolatePuOr);
  });

  const distance_multiplier = 100;
</script>

<div class="columns is-multiline">
  {#each rows as row}
    <div
      class="has-text-centered column {row.Scaled_Distance_Previous == 0
        ? ''
        : 'is-full'}"
      style="margin-top: {distance_multiplier * row.Scaled_Distance_Previous}vh"
    >
      <Svg
        name={row.Name}
        object={row.Object}
        radius={row.Radius}
        scaled_flux={row.Scaled_Flux}
        water_color={teq_color_scale(row.Teq)}
      />
    </div>
  {/each}
</div>
