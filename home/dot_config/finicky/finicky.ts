import type { FinickyConfig } from "/Applications/Finicky.app/Contents/Resources/finicky.d.ts";

export default {
  defaultBrowser: "Twilight",
  options: {
    checkForUpdates: false,
    hideIcon: true,
  },
  handlers: [
    {
      match: "www.facebook.com/*",
      browser: "Facebook",
    },
    {
      match: ["maps.app.goo.gl/*", "www.google.com/maps/*"],
      browser: "Google 地圖",
    },
    {
      match: "instagram.com/*",
      browser: "Instagram",
    },
    {
      match: "chat.coscup.org/*",
      browser: "Mattermost",
    },
    {
      match: "*.threads.com/*",
      browser: "Threads",
    },
    {
      match: [
        "x.com/*",
        "twitter.com/*"
      ],
      browser: "Twitter",
    },
  ],
  rewrite: [
    {
      match: "facebed.rileychh.dev/*",
      url: url => {
        url.host = "www.facebook.com"
        return url
      }
    },
    {
      match: "fixthreads.seria.moe/*",
      url: url => {
        url.host = "www.threads.com"
        return url
      }
    },
    {
      match: "fxtwitter.com/*",
      url: url => {
        url.host = "x.com"
        return url
      }
    }
  ]
} satisfies FinickyConfig;
