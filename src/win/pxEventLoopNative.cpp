// pxCore CopyRight 2007-2009 John Robinson
// Portable Framebuffer and Windowing Library
// pxEventLoopNative.cpp

#define PX_NATIVE
#include "../pxEventLoop.h"

#include <windows.h>

void pxEventLoop::run()
{
    MSG msg;

    // Main message loop:
    while (GetMessage(&msg, NULL, 0, 0)) 
    {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
}

void pxEventLoop::exit()
{
    PostQuitMessage(0);
}


/////////////////////////////////////
// Windows specific entrypoint

// Used when /SUBSYSTEM:WINDOWS
int CALLBACK WinMain(
  HINSTANCE hInstance,
  HINSTANCE hInstNULL,
#ifdef UNDER_CE
    LPWSTR lpCmdLine,
#else
    LPSTR lpCmdLine,
#endif
  int       nCmdShow)
{
	pxMain();
	return 0;
}

// Used when /SUBSYSTEM:CONSOLE
#ifdef UNICODE
int wmain(int argc, wchar_t** argv)
#else
int main(int argc, char** argv)
#endif
{
    pxMain();
    return 0;
}