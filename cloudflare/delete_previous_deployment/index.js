export default {
  async fetch(request, env, ctx) {
    if (request.method !== 'POST') {
      return new Response('Method Not Allowed', { status: 405 });
    }

    const body = await request.json();

    const githubToken = env.GITHUB_TOKEN;
    const repo = env.GITHUB_REPO;
    const workflow = env.GITHUB_WORKFLOW;

    const url = `https://api.github.com/repos/${repo}/actions/workflows/${workflow}/dispatches`;
    const res = await fetch(url, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${githubToken}`,
        'Accept': 'application/vnd.github+json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        ref: 'main'
      })
    });

    if (res.ok) {
      return new Response('GitHub workflow triggered', { status: 200 });
    } else {
      const err = await res.text();
      return new Response('GitHub API error: ' + err, { status: 500 });
    }
  }
};
