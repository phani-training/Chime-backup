#include <memory>
#include "utils\logger\logger.h"
#include "utils\logger\console_logger.h"
#include "session\meeting_session_credentials.h"
#include "session\meeting_session_urls.h"
#include "session\meeting_session_configuration.h"
#include "session\meeting_session.h"
#include "build/DesktopCapture.h"
#include "build/RestApi.h"
#include "build/DataMessageObserver.h"

std::string prompt(std::string question) {
	std::string strInput = "";
	std::cout << question << std::endl;
	std::cin >> strInput;
	return strInput;
}


DWORD WINAPI MessageSendingFeature(LPVOID param) {

	std::unique_ptr<chime::Logger> logger = std::make_unique<chime::ConsoleLogger>(chime::LogLevel::kDebug);
	Uri request{ L"https://pulud6u8je.execute-api.us-east-1.amazonaws.com/Prod/create?m=123" };
	MeetingDetails details = GetMeetingDetails(request);

	std::string attendee_id = details.attendee_id;
	std::string external_user_id = details.external_user_id;
	std::string join_token = details.join_token;
	std::cout << details.attendee_id << std::endl;
	chime::MeetingSessionCredentials credentials{ attendee_id,
											 external_user_id,
											 join_token };


	std::string audio_host_url = details.audio_host_url;
	std::string signaling_url = details.signaling_url;


	chime::MeetingSessionURLs urls{ audio_host_url,
							   signaling_url };

	std::string meeting_id = details.meeting_id;
	std::string external_meeting_id = "123";


	chime::MeetingSessionConfiguration configuration{ meeting_id,
												 external_meeting_id,
												 std::move(credentials),
												 std::move(urls) };


	std::shared_ptr<chime::MeetingSessionDependencies> session_dependencies =
		std::make_shared<chime::MeetingSessionDependencies>();
	session_dependencies->logger = std::move(logger);


	std::unique_ptr<chime::MeetingSession> meeting_session =
		chime::MeetingSession::Create(std::move(configuration), session_dependencies);
	DataMessageObserver observer;
	meeting_session->audio_video->AddAudioVideoObserver(&observer);
	meeting_session->audio_video->Start();
	system("cls");
	std::cout << "Meeting has started" << std::endl;

	while (true) {
		chime::DataMessageToSend data_message_to_send{};
		data_message_to_send.topic = "chat"; // topic to send
		std::string strInput = prompt("Enter the Message to send");
		data_message_to_send.data = strInput; // data to send
		data_message_to_send.lifetime_ms = 300000; // max five minutes
		meeting_session->audio_video->SendDataMessage(data_message_to_send);
		system("cls");
	}
	return 0;
}
int main() {

	DWORD dwThread1,dwThread2;
	HANDLE hThread = ::CreateThread(NULL,
		0,
		(LPTHREAD_START_ROUTINE)&MessageSendingFeature,
		reinterpret_cast<LPVOID>(0), 1, &dwThread1);

	HANDLE hThread2 = ::CreateThread(NULL,
		0,
		(LPTHREAD_START_ROUTINE)&desktopCaptureFeature,
		reinterpret_cast<LPVOID>(0), 1, &dwThread2);

	WaitForSingleObject(hThread, INFINITE);
	WaitForSingleObject(hThread2, INFINITE);
	//messageSendingFeature();
	//desktopCaptureFeature();
	return 0;
}


//todo: Need to create 2 functions as seperate threads
//todo: Remove the console and make it Windowless
//todo: Add a Taskbar icon that will handle all the actions like stop, run etc. 

