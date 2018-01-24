console.log("hello");

const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('https://trends.google.com/trends/explore?date=now 7-d&q=XRP');
  await page.screenshot({path: 'test.png'});

  await browser.close();
})();