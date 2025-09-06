import threading
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager

# List of YouTube video URLs
video_urls = [
    "https://youtu.be/C2U2-P93G3Q",
    "https://youtu.be/uRRxI1fQajU",
    "https://youtu.be/8fGW0L1AHHc",
    "https://youtu.be/0elJmK2iS3U",
    "https://youtu.be/4dj6jOzvWng"
]


def play_video(url):
    options = webdriver.ChromeOptions()
    options.add_argument("--start-maximized")
    options.add_argument("--disable-infobars")
    options.add_argument("--mute-audio")  # Optional: Mute audio
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)

    try:
        driver.get(url)
        time.sleep(5)
        play_button = driver.find_element(By.CLASS_NAME, "ytp-play-button")
        play_button.click()
        print(f"Playing: {url}")
    except Exception as e:
        print(f"Error playing {url}: {e}")

    # Let the video play for 60 seconds (or adjust as needed)
    time.sleep(60)
    driver.quit()


# Launch threads for each video
threads = []
for url in video_urls:
    t = threading.Thread(target=play_video, args=(url,))
    t.start()
    threads.append(t)

# Wait for all threads to finish
for t in threads:
    t.join()

print("All videos finished.")
