import requests
import os
from dotenv import load_dotenv

class EventPublisher:
    def __init__(self, artifact_url, webhook_url):
        self.artifact_url = artifact_url
        self.webhook_url = webhook_url

    def publish(self):
        data = {
            "content": f"New Government Official Newsletter is ready! Download it here: {self.artifact_url}"
        }

        response = requests.post(self.webhook_url, json=data)

        if response.status_code == 204:
            print("Message sent successfully!")
        else:
            print(f"Failed to send: {response.status_code}")

if __name__=='__main__':
    publisher = EventPublisher(os.environ.get("GOVERNMENT_OFFICIAL_NEWS_FEED_ARTIFACT_URL"), os.environ.get("GOVERNMENT_OFFICIAL_NEWS_EVENT_SUBSCRIBER_URL"))
    publisher.publish()
