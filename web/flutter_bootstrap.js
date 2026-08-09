{{flutter_js}}
{{flutter_build_config}}

const serviceWorkerVersion = '{{flutter_service_worker_version}}';

_flutter.loader.load({
  serviceWorkerSettings: {
    serviceWorkerVersion: serviceWorkerVersion.replace(/"/g, ''),
  },
  onEntrypointLoaded: async function (engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();

    // Remove the splash screen loader
    const loader = document.getElementById('loading-indicator');
    if (loader) {
      loader.classList.add('fade-out');
      setTimeout(() => {
        loader.remove();
      }, 500); // Wait for the 500ms fade-out transition to complete
    }

    await appRunner.runApp();
  }
});

