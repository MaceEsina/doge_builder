require.config({
  paths: {
    "jQuery": "vendor/jquery-1.11.0.min",
    "Kinetic": "vendor/kinetic-v5.1.0.min"
  },
  shim: {
    "jQuery": {
      exports: "$"
    },
    "Kinetic": {
      exports: "Kinetic"
    }
  }
});

require(["jQuery", "workspace/assets", "workspace/layout", "workspace/canvas", "workspace/background"],
  function ($, assets, layout, canvas, bg) {
  $(document).ready(function(){
    // console.log("jQuery version:", $.fn.jquery);
    // console.log("Kinetic version:", Kinetic.version);
  });
});
