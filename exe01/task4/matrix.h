#ifndef MATRIX_H
#define MATRIX_H

#include <algorithm>
#include <cmath>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <iterator>

class matrix {
    friend std::ostream&    operator << ( std::ostream &os , const matrix &smat ) ;
    friend matrix     operator + ( const matrix &smat1 , const matrix &smat2 ) ;
    friend matrix     operator - ( const matrix &smat1 , const matrix &smat2 ) ;
    friend matrix     operator * ( const matrix &smat1 , const matrix &smat2 ) ;

	public:                                                                 // the constructors and destructor
		matrix() = delete ;
		matrix( unsigned int Orders ) ;
		matrix( unsigned Rows , unsigned Cols ) ;
		matrix( const matrix &mat ) ;
		matrix& operator = ( const matrix &smat ) ;
		~matrix() { destroy(); }

	public:
		unsigned        getRows() const { return rows ; }
		unsigned		getCols() const { return cols ; }
		double          getElem( unsigned row , unsigned col ) const { subscriptValid( row , col ) ; return address[ row * cols + col ] ; }
		void            setElem( unsigned row , unsigned col , double elem ) { subscriptValid( row , col ) ; address[ row * cols + col ] = elem ; }

	public:
		matrix&   operator += ( const matrix &mat ) ;
		matrix&   operator -= ( const matrix &mat ) ;
		matrix&   operator *= ( const matrix &mat ) ;
		matrix    transpose() const ;

	private:                                                                // private data members
		unsigned rows ;
		unsigned cols ;
        double *address ;

	private:
		void            destroy() { delete [] address ; }
        void            subscriptValid( unsigned row , unsigned col ) const { if( row >= rows || col >= cols ) throw std::runtime_error( "Subscript out of range." ) ; }
        std::ostream&   show( std::ostream &os = std::cout ) const ;
};

#endif // MATRIX_H