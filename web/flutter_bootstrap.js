{{flutter_js}}
{{flutter_build_config}}

// Hard fallback: if Flutter fails to load within 35 seconds, remove splash
var _splashTimeout = setTimeout(function() {
  var loader = document.getElementById('loading-indicator');
  if (loader) {
    loader.classList.add('fade-out');
    setTimeout(function() { if (loader && loader.parentNode) loader.remove(); }, 500);
  }
}, 35000);

_flutter.loader.load({
  onEntrypointLoaded: async function (engineInitializer) {
    var loader = document.getElementById('loading-indicator');
    try {
      var appRunner = await engineInitializer.initializeEngine();
      await appRunner.runApp();
    } catch (err) {
      console.error('Flutter failed to start:', err);
    }
    // Always remove the loader once Flutter has attempted to run
    clearTimeout(_splashTimeout);
    if (loader) {
      loader.classList.add('fade-out');
      setTimeout(function() { if (loader && loader.parentNode) loader.remove(); }, 500);
    }
  }
});
