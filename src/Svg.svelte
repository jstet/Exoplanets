<script>
  export let name;
  export let object;
  export let radius;
  export let scaled_distance_previous;
  export let water_color;
  export let scaled_flux;

  import { hslToHex } from "./hslToHex.js";

  const radius_multiplier = 70;

  const distance_multiplier = 100;

  // Color Calculation
  const continent_color = hslToHex(154, scaled_flux, 43);

  const water_colors = {
    F: "023e8a",
    E: "0077b6",
    D: "0096c7",
    C: "00b4d8",
    B: "48cae4",
    A: "90e0ef",
  };

  // defining svg
  const dimension = radius_multiplier * radius;
  // using name as indentifier for clip path to make it unique
  let svg = ` <svg width=${dimension} height=${dimension} class="m-3">
      <clipPath id=${name.replace(/ +/g, "_")}>
        <circle cx=${dimension / 2} cy=${dimension / 2} r=${dimension / 2} />
      </clipPath>
      <circle
        cx=${dimension / 2}
        cy=${dimension / 2}
        r=${dimension / 2}
        fill="#${water_colors[water_color]}"
      />
      <g id="pol" clip-path="url(#${name.replace(/ +/g, "_")})">
        <polygon points="0,0 ${dimension},0 ${dimension},${dimension}" fill="${continent_color}" />
      </g>
    </svg>`;
</script>

{#if scaled_distance_previous == 0}
  <div class="has-text-centered column" style="margin-top: 0">
    {@html svg}
    {#if object == "Earth"}
      <p>{object}</p>
    {:else}
      <p>{object}: {name}</p>
    {/if}
  </div>
{:else}
  <div
    class="has-text-centered column is-full"
    style="margin-top: {distance_multiplier * scaled_distance_previous}vh"
  >
    {@html svg}
    <!-- Earth has zero distance to itself, so no if cond needed here-->
    <p>{object}: {name}</p>
  </div>
{/if}
