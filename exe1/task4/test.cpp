#include <chrono>
#include <iostream>
#include <random>
#include <ratio>
#include "matrix.h"
#include "mkl.h"

int main(int argv, char**argc){

	static std::default_random_engine e;
	static std::uniform_real_distribution<double> u(-2.0, 2.0) ;

	const unsigned matrixsize = 1000 ;

	matrix a(matrixsize) , b(matrixsize);
	for( unsigned i = 0 ; i != matrixsize ; ++i )
		for( unsigned j = 0 ; j != matrixsize ; ++j )
			a.setElem( i , j , u(e) ) ;

	unsigned numberOfRepetitions = 0 ;	
	std::chrono::steady_clock::time_point startTime = std::chrono::steady_clock::now() , endTime  ;
	
	do{
		++numberOfRepetitions ;
		b = a * a ;
        endTime = std::chrono::steady_clock::now(); 
    } while( endTime < ( startTime + std::chrono::seconds( 5 ) ) );

    std::chrono::duration<double,std::milli> durationtime = std::chrono::duration_cast<std::chrono::duration<double>>( endTime - startTime ) ;
    std::cout << "The data of my matrix multiplication:" << std::endl;
    std::cout << "Total time:" << durationtime.count() << "ms" << std::endl;
    std::cout << "Average time:" << ( durationtime / numberOfRepetitions ).count() << "ms" << std::endl;
    
	double *A = static_cast<double*>( mkl_malloc( matrixsize * matrixsize * sizeof( double ), 64 ));
    double *B = static_cast<double*>( mkl_malloc( matrixsize * matrixsize * sizeof( double ), 64 ));

    if( !A || !B ) {
        std::cerr << "Could not allocate memory for matrices." << std::endl;
        mkl_free(A);
    	mkl_free(B);
        exit(1);
    }

    for( unsigned i = 0; i != matrixsize ; ++i )
    	for( unsigned j = 0; j != matrixsize ; ++j )
    		A[ i * matrixsize + j ] = u(e) ;    

	numberOfRepetitions = 0 ;
	startTime = std::chrono::steady_clock::now() ;
	do{
		++numberOfRepetitions ;
		cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, matrixsize, matrixsize, matrixsize, 1.0, A, matrixsize, A, matrixsize, 0.0, B, matrixsize);
        endTime = std::chrono::steady_clock::now();
	}while( endTime < ( startTime + std::chrono::seconds( 5 ) ) );
	
    durationtime = std::chrono::duration_cast<std::chrono::duration<double>>( endTime - startTime ) ;
    std::cout << "The data of mkl matrix multiplication:" << std::endl;
    std::cout << "Total time:" << durationtime.count() << "ms" << std::endl;
    std::cout << "Average time:" << ( durationtime / numberOfRepetitions ).count() << "ms" << std::endl;

    mkl_free(A);
    mkl_free(B);

	return 0;
}

