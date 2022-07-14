<script>
  import * as d3 from "d3";

  import { onMount } from "svelte";

  import Svg from "./Svg.svelte";

  const url =
    "https://raw.githubusercontent.com/JStet/exoplanets_R_script/main/exoplanets.json";

  let rows = [];

  let teq_extent;
  let teq_earth;
  let teq_color_scale;

  let flux_extent;
  let flux_earth;
  let flux_color_scale;

  onMount(async () => {
    rows = await d3.json(url).then((data) => {
      let Flux = data.map(({ Flux }) => Flux);
      var spans = d3.max(Flux) / 5;

      return data;
    });

    // https://observablehq.com/@d3/working-with-color
    // Teq Color -> Water Color
    teq_extent = d3.extent(rows, (d) => d.Teq);
    teq_earth = rows[0]["Teq"];
    teq_color_scale = d3
      .scaleDiverging()
      .domain([teq_extent[0], teq_earth, teq_extent[1]])
      .interpolator(d3.interpolateBlues);

    // Flux Color -> Continent Color
    flux_extent = d3.extent(rows, (d) => d.Flux);
    flux_earth = rows[0]["Flux"];
    flux_color_scale = d3
      .scaleDiverging()
      .domain([flux_extent[1], flux_earth, flux_extent[0]])
      .interpolator(d3.interpolateGreens);
  });

  const distance_multiplier = 300;
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
        continent_color={flux_color_scale(row.Flux)}
        water_color={teq_color_scale(row.Teq)}
      />
    </div>
  {/each}
</div>
