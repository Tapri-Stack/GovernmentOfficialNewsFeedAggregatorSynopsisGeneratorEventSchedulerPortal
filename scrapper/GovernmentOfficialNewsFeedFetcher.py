from concurrent.futures import ThreadPoolExecutor, as_completed
from threading import Event
from datetime import date, timedelta
import requests
import io

PATTERN = "{yyyy}/{mm}/{dd}/Page/{date}_{page:03d}_cap.jpg"
REFERER = "https://bcclepaper.indiatimes.com/"

class Scrapper:
    def __init__(self, source_url="") -> None:
        self.source_url = source_url
    
    def _download_page(self, date, page, stop_event):
        if stop_event.is_set():
            return page_num, None

        dd, mm, yyyy = date.split("_")

        today_url = PATTERN.format(
            yyyy=yyyy,
            mm=mm,
            dd=dd,
            date=date,
            page=page
        )

        headers = {
            "referer": REFERER,
            "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
        }

        r = requests.get(self.source_url + today_url, headers=headers)
        if not r.content.startswith(b"\xff\xd8"):
            stop_event.set()
            return page, None
        
        return page, io.BytesIO(r.content)


    def fetch(self, delta=0) -> list:
        print(self.source_url)
        today = (date.today() - timedelta(days=delta)).strftime("%d_%m_%Y")

        stop_event = Event() 
        results = []

        batch_size = 10
        current_page = 1
        max_limit = 100
        with ThreadPoolExecutor(max_workers=batch_size) as executor:
            while not stop_event.is_set() and current_page <= max_limit:
                batch_pages = range(current_page, current_page + batch_size)
                
                futures = [executor.submit(self._download_page, today, p, stop_event) for p in batch_pages]
                
                for future in as_completed(futures):
                    page_num, img = future.result()
                    if img:
                        results.append((page_num, img))

                current_page += batch_size
        
        results.sort(key=lambda x:x[0])
        images = [img for p,img in results]
        return images

if __name__=='__main__':
    scrapper = Scrapper()
    scrapper.fetch()
