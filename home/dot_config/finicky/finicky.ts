import type { FinickyConfig } from "/Applications/Finicky.app/Contents/Resources/finicky.d.ts";

export default {
  defaultBrowser: "Twilight",
  options: {
    checkForUpdates: false,
    hideIcon: true,
  },
  handlers: [
    {
      match: "instagram.com/*",
      browser: "Instagram",
    },
    {
      match: "www.facebook.com/*",
      browser: "Facebook",
    },
    {
      match: ["maps.app.goo.gl/*", "www.google.com/maps/*"],
      browser: "Google Maps",
    },
    {
      match: "threads.com/*",
      browser: "Threads",
    },
    {
      match: "chat.coscup.org/*",
      browser: "Mattermost",
    },
  ],
} satisfies FinickyConfig;
