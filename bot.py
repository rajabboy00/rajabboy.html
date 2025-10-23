from dotenv import load_dotenv
load_dotenv()
TOKEN = os.getenv("BOT_TOKEN")
WEATHER_API_KEY = os.getenv("WEATHER_API_KEY")
import logging
from telegram import Update
from telegram.ext import Application, CommandHandler, MessageHandler, filters, ContextTypes
import datetime
import requests
import os

# Logging sozlamalari
logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    level=logging.INFO
)

# Bot tokeningizni shu yerga qo'ying (yoki .env fayldan oling)
TOKEN = "SIZNING_BOT_TOKENINGIZ"
WEATHER_API_KEY = "OPENWEATHER_API_KALITI"  # https://openweathermap.org/api dan oling

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text(
        "Salom! Men super botman. Quyidagi buyruqlardan foydalaning:\n"
        "/help — Yordam\n"
        "/time — Hozirgi vaqt\n"
        "/weather Toshkent — Ob-havo\n"
        "Yoki istalgan xabar yuboring!"
    )

async def help_command(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text(
        "Mavjud buyruqlar:\n"
        "/start — Botni ishga tushirish\n"
        "/help — Yordam\n"
        "/echo [matn] — Matnni takrorlash\n"
        "/time — Hozirgi vaqt\n"
        "/weather [shahar] — Ob-havo ma'lumoti"
    )

async def echo(update: Update, context: ContextTypes.DEFAULT_TYPE):
    text = ' '.join(context.args) if context.args else "Hech narsa yozmadingiz!"
    await update.message.reply_text(f"Siz yozdingiz: {text}")

async def get_time(update: Update, context: ContextTypes.DEFAULT_TYPE):
    now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    await update.message.reply_text(f"Hozirgi vaqt: {now}")

async def weather(update: Update, context: ContextTypes.DEFAULT_TYPE):
    if not context.args:
        await update.message.reply_text("Shahar nomini kiriting: /weather Toshkent")
        return

    city = ' '.join(context.args)
    url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={WEATHER_API_KEY}&units=metric&lang=uz"
    try:
        response = requests.get(url)
        data = response.json()
        if data["cod"] != 200:
            await update.message.reply_text("Shahar topilmadi!")
            return
        temp = data["main"]["temp"]
        desc = data["weather"][0]["description"]
        await update.message.reply_text(f"{city}da hozir {temp}°C, {desc}")
    except Exception as e:
        await update.message.reply_text("Ob-havo ma'lumotini olishda xatolik yuz berdi.")
        logging.error(e)

async def handle_message(update: Update, context: ContextTypes.DEFAULT_TYPE):
    text = update.message.text
    user = update.message.from_user
    logging.info(f"Foydalanuvchi {user.id} ({user.first_name}): {text}")
    await update.message.reply_text("Xabaringiz qabul qilindi! Rahmat!")

async def handle_document(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text("Fayl qabul qilindi! Hozircha saqlanmaydi, lekin keyinroq qo'shiladi.")

async def handle_photo(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text("Rasm qabul qilindi! Ajoyib surat 👍")

def main():
    if not TOKEN:
        raise ValueError("BOT tokeni kerak! TOKEN o'zgaruvchisini sozlang.")
    
    app = Application.builder().token(TOKEN).build()

    # Handlerlar
    app.add_handler(CommandHandler("start", start))
    app.add_handler(CommandHandler("help", help_command))
    app.add_handler(CommandHandler("echo", echo))
    app.add_handler(CommandHandler("time", get_time))
    app.add_handler(CommandHandler("weather", weather))
    app.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, handle_message))
    app.add_handler(MessageHandler(filters.Document.ALL, handle_document))
    app.add_handler(MessageHandler(filters.PHOTO, handle_photo))

    print("Bot ishga tushdi...")
    app.run_polling()

if __name__ == '__main__':
    main()
