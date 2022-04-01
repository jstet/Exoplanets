<script>
  import * as d3 from "d3";

  import { onMount } from "svelte";

  import Svg from "./Svg.svelte";

  const url =
    "https://gist.githubusercontent.com/JStet/651de83fa0e67a948e0d4ec07366ef4a/raw/21d29a466fdde81b91013b0d37c3c5f553720879/exoplanets.json";

  let rows = [];
  onMount(async () => {
    rows = await d3.json(url).then((data) => {
      return data;
    });
  });
</script>

<div class="columns is-multiline">
  {#each rows as row}
    <Svg
      name={row.Name}
      object={row.Object}
      radius={row.Radius}
      distance={row.Scaled_Distance_Previous}
    />
  {/each}
</div>
