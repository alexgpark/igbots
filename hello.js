console.log("hello");

const puppeteer = require('puppeteer');

const browser = await puppeteer.launch();

const page = await browser.newPage();
await page.goto('https://trends.google.com/trends/explore?date=now 7-d&q=ethereum');

console.log(await page.content());
await page.screenshot({path: 'screenshot.png'});

await browser.close();
