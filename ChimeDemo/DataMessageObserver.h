#pragma once
#include "../lib/include/audiovideo/audio_video_observer.h"
#include "utils/logger/logger.h"
#include "utils/logger/console_logger.h"
#include<string>
using namespace chime;


class DataMessageObserver : public chime::AudioVideoObserver {
public:
	chime::ConsoleLogger logger;
	virtual void OnDataMessagesReceived(const std::vector<DataMessageReceived>& messages) {
		auto firstMsg = messages.front();
		std::string strInfo = "Received Message from " + firstMsg.attendee.external_user_id + ":";
		logger.Info(strInfo);
		for (const auto& message : messages) {
			std:: string strContent = message.data;
			logger.Info(strContent);
		}
	}

	virtual void OnAttendeeJoined(const Attendee& attendee) 
	{
		std::string details = "This meeting is now joined by " + attendee.external_user_id;
		logger.Info(details);
	}
};