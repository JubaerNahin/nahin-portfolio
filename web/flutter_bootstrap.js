{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  onEntrypointLoaded: async function (engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();

    await appRunner.runApp();

    // Remove the splash screen loader AFTER the app has started rendering
    const loader = document.getElementById('loading-indicator');
    if (loader) {
      loader.classList.add('fade-out');
      setTimeout(() => {
        loader.remove();
      }, 500); // Wait for the 500ms fade-out transition to complete
    }
  }
});

