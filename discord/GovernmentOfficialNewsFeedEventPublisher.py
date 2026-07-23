import requests
import os
from dotenv import load_dotenv

class EventPublisher:
    def __init__(self, artifact_url="", summary="", webhook_url=""):
        self.artifact_url = artifact_url
        self.summary = summary
        self.webhook_url = webhook_url

    def publish(self):
        embed = {
            "title": "Government Official News Feed Notification",
            "description": f"{self.summary}",
            "color": 15885602,
            "fields": [
                {
                    "name": "Download Link",
                    "value": f"{self.artifact_url}",
                    "inline": True
                }
            ],
            "footer": {
                "text": "Generated via GitHub Actions"
            }
        }

        data = {
            "avatar_url": "https://raw.githubusercontent.com/Tapri-Stack/GovernmentOfficialNewsFeedAggregatorSynopsisGeneratorEventSchedulerPortal/main/discord/assets/logo.jpg",
            "embeds": [embed]
        }

        response = requests.post(self.webhook_url, json=data)

        if response.status_code == 204:
            print("Message sent successfully!")
        else:
            print(f"Failed to send: {response.status_code}")

if __name__=='__main__':
    load_dotenv()
    publisher = EventPublisher(os.environ.get("GOVERNMENT_OFFICIAL_NEWS_FEED_ARTIFACT_URL"), os.environ.get("GOVERNMENT_OFFICIAL_NEWS_FEED_SUMMARY"), os.environ.get("GOVERNMENT_OFFICIAL_NEWS_EVENT_SUBSCRIBER_URL"))
    publisher.publish()
