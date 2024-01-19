#pragma once
#include <windows.h>
#include <dxgi1_2.h>
#include <d3d11.h>
#include <wincodec.h>
#include <cwchar>
#include <chrono>
#include <iomanip>
#include <sstream>
#include <fstream>
#include <comdef.h>

#pragma comment(lib, "dxgi.lib")
#pragma comment(lib, "d3d11.lib")
#pragma comment(lib, "windowscodecs.lib")

std::ofstream logFile;

std::string HrToString(HRESULT hr) {
    _com_error err(hr);
    _bstr_t bstrErrMsg = err.ErrorMessage(); // use _bstr_t to convert TCHAR* to wchar_t*
    std::wstring errMsg(bstrErrMsg); // convert wchar_t* to std::wstring
    return std::string(errMsg.begin(), errMsg.end());
}


void LogMessage(const std::string& message) {
    logFile << message << std::endl;
}


std::wstring GenerateTimestampFilename() {
    auto now = std::chrono::system_clock::now();
    auto time_t_now = std::chrono::system_clock::to_time_t(now);
    std::tm bt{};
    localtime_s(&bt, &time_t_now);

    std::wostringstream woss;
    woss << L"C:\\chime\\screenshot_"
        << std::put_time(&bt, L"%Y%m%d%H%M%S")
        << L".png";
    return woss.str();
}

bool SaveTextureToPng(ID3D11Texture2D* pTexture, ID3D11DeviceContext* pContext, const wchar_t* filePath) {
    HRESULT hr;
    ID3D11Device* device = nullptr;

    ID3D11Texture2D* pStagingTexture;
    D3D11_TEXTURE2D_DESC desc;
    pTexture->GetDesc(&desc);
    DXGI_FORMAT formatd = desc.Format;

    LogMessage("Texture description retrieved.");

    desc.CPUAccessFlags = D3D11_CPU_ACCESS_READ;
    desc.Usage = D3D11_USAGE_STAGING;
    desc.BindFlags = 0;
    desc.MiscFlags = 0;

    pTexture->GetDevice(&device);
    if (!device) {
        LogMessage("Error: Device is null.");
        return false;
    }

    LogMessage("Device retrieved successfully.");

    device->CreateTexture2D(&desc, nullptr, &pStagingTexture);
    pContext->CopyResource(pStagingTexture, pTexture);

    D3D11_MAPPED_SUBRESOURCE resource;
    hr = pContext->Map(pStagingTexture, 0, D3D11_MAP_READ, 0, &resource);
    if (FAILED(hr)) {
        LogMessage("Error: Failed to map the staging texture.");
        return false;
    }

    IWICImagingFactory* wicFactory = nullptr;
    IWICBitmapEncoder* wicEncoder = nullptr;
    IWICBitmapFrameEncode* wicFrame = nullptr;
    IWICStream* wicStream = nullptr;

    hr = CoCreateInstance(CLSID_WICImagingFactory, nullptr, CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&wicFactory));
    if (FAILED(hr)) {
        LogMessage("Error: Failed to create WIC Imaging Factory.");
        return false;
    }

    hr = wicFactory->CreateStream(&wicStream);
    if (FAILED(hr)) {
        LogMessage("Error: Failed to create WIC stream.");
        return false;
    }

    hr = wicStream->InitializeFromFilename(filePath, GENERIC_WRITE);
    if (FAILED(hr)) {
        LogMessage("Error: Failed to initialize WIC stream from filename.");
        return false;
    }

    hr = wicFactory->CreateEncoder(GUID_ContainerFormatPng, nullptr, &wicEncoder);
    if (FAILED(hr)) {
        LogMessage("Error: Failed to create WIC encoder.");
        return false;
    }

    hr = wicEncoder->Initialize(wicStream, WICBitmapEncoderNoCache);
    if (FAILED(hr)) {
        LogMessage("Error: Failed to initialize WIC encoder.");
        return false;
    }

    hr = wicEncoder->CreateNewFrame(&wicFrame, nullptr);
    if (FAILED(hr)) {
        LogMessage("Error: Failed to create new frame for WIC encoder.");
        return false;
    }

    hr = wicFrame->Initialize(nullptr);
    if (FAILED(hr)) {
        LogMessage("Error: Failed to initialize WIC frame.");
        return false;
    }

    WICPixelFormatGUID format = GUID_WICPixelFormat32bppBGRA;
    hr = wicFrame->SetPixelFormat(&format);
    if (FAILED(hr)) {
        LogMessage("Error: Failed to set pixel format for WIC frame.");
        return false;
    }

    hr = wicFrame->SetSize(desc.Width, desc.Height);
    if (FAILED(hr)) {
        LogMessage("Error: Failed to set size for WIC frame.");
        return false;
    }

    hr = wicFrame->WritePixels(desc.Height, resource.RowPitch, resource.RowPitch * desc.Height, static_cast<BYTE*>(resource.pData));
    if (FAILED(hr)) {
        LogMessage("Error: Failed to write pixels to WIC frame.");
        return false;
    }

    hr = wicFrame->Commit();
    if (FAILED(hr)) {
        LogMessage("Error: Failed to commit the WIC frame.");
        return false;
    }

    hr = wicEncoder->Commit();
    if (FAILED(hr)) {
        LogMessage("Error: Failed to commit the WIC encoder.");
        return false;
    }

    LogMessage("Image saved successfully.");

    // Cleanup
    if (wicFactory) wicFactory->Release();
    if (wicEncoder) wicEncoder->Release();
    if (wicFrame) wicFrame->Release();
    if (wicStream) wicStream->Release();

    pContext->Unmap(pStagingTexture, 0);
    pStagingTexture->Release();

    return true;
}


int CaptureScreenshot() {

    HRESULT hr;

    LogMessage("CaptureScreenshot started.");

    IDXGIAdapter1* targetAdapter = nullptr;
    IDXGIFactory1* factory = nullptr;
    hr = CreateDXGIFactory1(__uuidof(IDXGIFactory1), (void**)&factory);

    if (SUCCEEDED(hr) && factory) {
        LogMessage("DXGI Factory successfully created.");
        IDXGIAdapter1* adapter = nullptr;
        for (UINT i = 0; DXGI_ERROR_NOT_FOUND != factory->EnumAdapters1(i, &adapter); ++i) {
            IDXGIOutput* output = nullptr;

            // Check if this adapter has any outputs (displays)
            if (adapter->EnumOutputs(0, &output) != DXGI_ERROR_NOT_FOUND) {
                LogMessage("Adapter with output found.");
                targetAdapter = adapter;
                targetAdapter->AddRef();
                //LogMessage("Added Ref");
                //if (output) {
                //    output->Release();
                //    output = nullptr;
                //}
                //LogMessage("Released Output");
                //break;
            }
            /*  if (adapter)
              {
                  adapter->Release();
                  adapter = nullptr;
              }
              LogMessage("Released Adapter");*/
        }
        /* if (factory)
         {
             factory->Release();
             factory = nullptr;
         }
         LogMessage("Released factory");*/

    }

    if (targetAdapter) {
        LogMessage("Proceeding with the target adapter.");

        D3D_FEATURE_LEVEL featureLevel;
        ID3D11Device* device = nullptr;
        ID3D11DeviceContext* context = nullptr;

        hr = D3D11CreateDevice(targetAdapter, D3D_DRIVER_TYPE_UNKNOWN, nullptr, 0, nullptr, 0, D3D11_SDK_VERSION, &device, &featureLevel, &context);

        if (FAILED(hr)) {
            LogMessage("Error: Failed to create D3D11 device.");
            return -1;
        }
        LogMessage("D3D11 device created successfully.");

        IDXGIDevice* dxgiDevice = nullptr;
        hr = device->QueryInterface(__uuidof(IDXGIDevice), (void**)&dxgiDevice);
        if (FAILED(hr))
        {
            LogMessage("Error: Failed to device->QueryInterface");
            return -1;
        }
        LogMessage("device->QueryInterface completed");

        IDXGIAdapter* dxgiAdapter = nullptr;
        hr = dxgiDevice->GetParent(__uuidof(IDXGIAdapter), (void**)&dxgiAdapter);
        if (FAILED(hr))
        {
            LogMessage("Error: Failed to device->GetParent");
            return -1;
        }
        LogMessage("device->GetParent completed");

        Sleep(500);
        IDXGIOutput* dxgiOutput = nullptr;
        hr = dxgiAdapter->EnumOutputs(0, &dxgiOutput);
        if (FAILED(hr))
        {
            LogMessage("Error: Failed to device->EnumOutputs with HRESULT: " + HrToString(hr));
            return -1;
        }
        LogMessage("device->EnumOutputs completed");



        IDXGIOutput1* dxgiOutput1 = nullptr;
        hr = dxgiOutput->QueryInterface(__uuidof(IDXGIOutput1), (void**)&dxgiOutput1);
        if (FAILED(hr))
        {
            LogMessage("Error: Failed to device->QueryInterface");
            return -1;
        }
        LogMessage("device->QueryInterface completed");

        IDXGIOutputDuplication* desktopDup = nullptr;
        hr = dxgiOutput1->DuplicateOutput(device, &desktopDup);

        if (FAILED(hr)) {
            LogMessage("Error: Failed to duplicate the output.");
            return -1;
        }
        LogMessage("Duplicate output completed");

        DXGI_OUTDUPL_FRAME_INFO frameInfo;
        IDXGIResource* desktopResource = nullptr;

        LogMessage("Waiting for a moment before acquiring the next frame...");
        Sleep(1000);

        hr = desktopDup->AcquireNextFrame(INFINITE, &frameInfo, &desktopResource);

        if (SUCCEEDED(hr)) {
            LogMessage("Frame acquired successfully.");

            ID3D11Texture2D* pTexture = nullptr;
            hr = desktopResource->QueryInterface(__uuidof(ID3D11Texture2D), (void**)&pTexture);
            if (SUCCEEDED(hr)) {
                LogMessage("Resource converted to ID3D11Texture2D.");
                auto filename = GenerateTimestampFilename();
                SaveTextureToPng(pTexture, context, filename.c_str());
                pTexture->Release();
            }
            else {
                LogMessage("Error: Failed to convert the resource to ID3D11Texture2D.");
            }

            desktopDup->ReleaseFrame();
            desktopResource->Release();
        }
        else {
            LogMessage("Error: Failed to acquire the next frame.");
        }

        LogMessage("Releasing resources...");
        desktopDup->Release();
        dxgiOutput1->Release();
        dxgiOutput->Release();
        dxgiAdapter->Release();
        dxgiDevice->Release();
        if (device) device->Release();
        if (context) context->Release();
        targetAdapter->Release();
    }

    LogMessage("CaptureScreenshot ended.");
    return 0;
}


int desktopCaptureFeature() {
    //Initialize log file
    logFile.open("C:\\chime\\screenshot_service_log.txt", std::ios::app);
    if (!logFile.is_open()) {
        // If we can't open the log file, we should ideally use an alternative logging mechanism, like the Windows event log.
        // For this example, we'll just return, but you should handle this more gracefully in a production environment.
        return -1;
    }

    LogMessage("Service started...");

    HRESULT hr = CoInitialize(NULL);
    if (FAILED(hr)) {
        LogMessage("Error initializing COM: " + HrToString(hr));
        logFile.close();
        return -1;
    }

    try {
        while (true) {
            CaptureScreenshot();
            Sleep(10000);  // 10 seconds
        }
    }
    catch (const std::exception& ex) {
        LogMessage("Exception caught: " + std::string(ex.what()));
    }
    catch (...) {
        LogMessage("Unknown exception caught.");
    }

    CoUninitialize();

    LogMessage("Service stopped.");

    // Close the log file
    logFile.close();
    return 0;
}
