<script>
  export let name;
  export let object;
  export let radius;
  export let continent_color;
  export let water_color;

  import * as d3 from "d3";
  import { onMount } from "svelte";

  const radius_multiplier = 90;
  const dimension = Math.round(radius_multiplier * radius);

  // generating random integer in visually appropriate range, then shifting digits
  const south_pole_dividend =
    (Math.floor(Math.random() * (300 - 200 + 1)) + 200) / 100;
</script>

<svg width={dimension} height={dimension} class="m-3">
  <defs>
    <clipPath id={name.replace(/ +/g, "_")}>
      <circle cx={dimension / 2} cy={dimension / 2} r={dimension / 2} />
    </clipPath>
  </defs>
  <g id="pol" clip-path="url(#{name.replace(/ +/g, '_')})">
    <rect width={dimension} height={dimension} fill={water_color} />
    <path
      id="south_pole"
      d="M0,{dimension} q{dimension / 2},{-dimension /
        south_pole_dividend} {dimension},0"
      fill={continent_color}
    />
  </g>
</svg>
<p>{name == "Earth" ? name : object + ": " + name}</p>
