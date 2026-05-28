const mineflayer = require('mineflayer');

const serverIp = process.argv[2];
const port = parseInt(process.argv[3]);
const username = process.argv[4];

function createBot() {
    const bot = mineflayer.createBot({
        host: serverIp,
        port: port,
        username: username,
        version: false,
        viewDistance: "tiny"
    });

    bot.on('login', () => {
        console.log(`[SUCCESS] Bot ${username} entered the server.`);
    });

    // ميزة كشف سبب الطرد الفوري
    bot.on('kicked', (reason, loggedIn) => {
        // تحويل سبب الطرد إلى نص مقروء وطباعته في الكونسول لمعاينته في Railway Logs
        const cleanReason = JSON.stringify(reason);
        console.log(`[KICKED ALERT] السيرفر قام بطرد البوت ${username}! السبب المذكور: ${cleanReason}`);
    });

    bot.on('end', (reason) => {
        console.log(`[DISCONNECTED] Bot ${username} connection ended. Reason: ${reason}`);
        bot.removeAllListeners();
        // إعادة اتصال بعد 15 ثانية
        setTimeout(createBot, 15000);
    });

    bot.on('error', (err) => {
        console.error(`[ERROR] ${username}:`, err.message);
    });
}

createBot();
