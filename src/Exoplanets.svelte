<script>
  import * as d3 from "d3";

  import { onMount } from "svelte";

  import Svg from "./Svg.svelte";

  const url =
    "https://gist.githubusercontent.com/JStet/651de83fa0e67a948e0d4ec07366ef4a/raw/28044fa419d04e1ad8343afe3fc899380e1ec7c3/exoplanets.json";

  let rows = [];
  onMount(async () => {
    rows = await d3.json(url).then((data) => {
      let Flux = data.map(({ Flux }) => Flux);
      var spans = d3.max(Flux) / 5;

      return data;
    });
  });

  // Color Calculation
</script>

<div class="columns is-multiline">
  {#each rows as row}
    <Svg
      name={row.Name}
      object={row.Object}
      radius={row.Radius}
      water_color={row.Water_Color}
      scaled_distance_previous={row.Scaled_Distance_Previous}
      scaled_flux={row.Scaled_Flux}
    />
  {/each}
</div>
