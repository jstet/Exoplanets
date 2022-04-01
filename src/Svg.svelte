<script>
  export let name;
  export let object;
  export let radius;
  export let distance;

  const radius_multiplier = 20;
  const distance_multiplier = 350;

  let crcl = `<circle cx='50' cy='50' r=${
    radius_multiplier * radius
  } fill='blue' />`;
</script>

{#if distance == 0}
  <div class="has-text-centered column" style="margin-top: 0">
    <div class="is-flex is-justify-content-center">
      <svg height="100" width="100" class="m-3">
        {@html crcl}
      </svg>
    </div>
    {#if object == "Earth"}
      <p>{object}</p>
    {:else}
      <p>{object}: {name}</p>
    {/if}
  </div>
{:else}
  <div
    class="has-text-centered column is-full"
    style="margin-top: {distance_multiplier * distance}vh"
  >
    <div class="is-flex is-justify-content-center">
      <svg height="100" width="100" class="m-3">
        {@html crcl}
      </svg>
    </div>
    <!-- Earth has zero distance to itself, so no if cond needed here-->
    <p>{object}: {name}</p>
  </div>
{/if}
