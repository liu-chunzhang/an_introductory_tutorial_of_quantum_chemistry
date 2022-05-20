#include <iostream>
#include <chrono>
#include <ctime>
#include <ratio>
#include "unistd.h"
using namespace std;

int main() {
    std::chrono::steady_clock::time_point starttime= std::chrono::steady_clock::now();
    sleep(2);
    std::chrono::steady_clock::time_point endtime = std::chrono::steady_clock::now();
    //std::chrono::duration<double> dtime = std::chrono::duration_cast<std::chrono::duration<double>( endtime - starttime) ;
//std::cout << dtime.count() << std::endl;                                
    std::cout << (endtime-starttime).count() << "tick count" << std::endl;
    return 0;
}
