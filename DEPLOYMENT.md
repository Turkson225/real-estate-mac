# Deployment

The repository contains the application source as
`real-estate-routes-main.zip`. The GitHub Actions workflow extracts it,
builds the SPA, and publishes it to GitHub Pages whenever `main` changes.

The expected site URL is:

`https://turkson225.github.io/real-estate-mac/`

The workflow accepts the optional repository secrets
`VITE_SUPABASE_URL` and `VITE_SUPABASE_PUBLISHABLE_KEY`. If they are not
provided, it uses the publishable Supabase values already included in the
source archive and removes the environment file before the build workspace is
discarded. No service-role key is used by the Pages build.

If you use Supabase authentication, add the Pages URL to the project's
allowed site URLs and redirect URLs.
