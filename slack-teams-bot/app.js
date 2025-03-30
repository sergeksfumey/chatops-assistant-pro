const { App } = require('@slack/bolt');
const axios = require('axios');
const app = new App({ token: process.env.SLACK_BOT_TOKEN, signingSecret: process.env.SLACK_SIGNING_SECRET });

app.command('/restartvm', async ({ command, ack, respond }) => {
  await ack();
  const response = await axios.post('https://<function-url>', { text: command.text });
  await respond(response.data);
});

(async () => { await app.start(process.env.PORT || 3000); })();