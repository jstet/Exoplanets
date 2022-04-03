<script>
  export let name;
  export let object;
  export let radius;
  export let scaled_flux;
  export let water_color;

  import { hslToHex } from "./hslToHex.js";
  import * as d3 from "d3";
  import { onMount } from "svelte";

  // Color Calculation

  const continent_color = hslToHex(154, scaled_flux, 43);
  const radius_multiplier = 100;
  const dimension = Math.round(radius_multiplier * radius);

  let title = `${object}: ${name}`;
</script>

<svg width={dimension} height={dimension} class="m-3">
  <clipPath id={name.replace(/ +/g, "_")}>
    <circle cx={dimension / 2} cy={dimension / 2} r={dimension / 2} />
  </clipPath>

  <g id="pol" clip-path="url(#{name.replace(/ +/g, '_')})">
    <rect width={dimension} height={dimension} fill={water_color} />
    <polygon
      points="0,0 {dimension},0 {dimension},{dimension}"
      fill={continent_color}
    />
  </g>
</svg>
<p>{name == "Earth" ? name : object + ": " + name}</p>
