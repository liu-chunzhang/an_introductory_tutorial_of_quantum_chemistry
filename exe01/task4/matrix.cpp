#include "matrix.h"

// the constructors and destructor
matrix::matrix( unsigned int Orders ) : rows( Orders > 0 ? Orders : 1 ) , cols( rows ) , address( new double[ Orders * Orders ]() )  { }

matrix::matrix( unsigned Rows , unsigned Cols ) : rows( Rows > 0 ? Rows : 1 ) , cols( Cols > 0 ? Cols : 1) , address( new double[ rows * cols ]() )  { }

matrix::matrix( const matrix &smat ) : rows( smat.rows ) , cols( smat.cols ) , address( new double[ rows * cols ]() )   {
	std::copy( smat.address	, smat.address + rows * cols , address ) ;
	// function finished
}

matrix& matrix::operator = ( const matrix &smat ) {
	if( this != &smat ){
		destroy();
		rows = smat.rows ;
        cols = smat.rows ;
		address = new double [ rows * cols ]() ;
		std::copy_n( smat.address , rows * cols , address ) ;
	}
    return *this ;
}

// some character functions of normal matrix

// some functions for matrix algebraic calculation( member functions )
matrix& matrix::operator += ( const matrix &smat ) {
    if( smat.rows != rows || smat.cols != cols )
        throw std::runtime_error("The size of matrix is not suitable!") ;
    std::transform( address , address + rows * cols , smat.address , address , std::plus<double>() ) ;
    return *this ;
}

matrix& matrix::operator -= ( const matrix &smat ) {
    if( smat.rows != rows || smat.cols != cols )
        throw std::runtime_error("The size of matrix is not suitable!") ;
    std::transform( address , address + rows * cols , smat.address , address , std::minus<double>() ) ;
    return *this ;
}

matrix& matrix::operator *= ( const matrix &smat ) {
    if( smat.rows != cols )
        throw std::runtime_error("The size of matrix is not suitable!") ;
    matrix result( rows , smat.cols ) ;
    for( unsigned Row = 0 ; Row != rows ; ++Row )
        for( unsigned Temp = 0 ; Temp != cols ; ++Temp )
            for( unsigned Col = 0 ; Col != smat.cols ; ++Col )
                result.address[ Row * smat.cols + Col ] += address[ Row * cols + Temp ] * smat.address[ Temp * smat.cols + Col ] ;
    std::copy_n( result.address , rows * smat.cols , address ) ;
    return *this ;
}

matrix matrix::transpose() const {
    matrix temp( *this ) ;
    for( unsigned Row = 0 ; Row != rows ; ++Row )
        for( unsigned Col = 0 ; Col != cols ; ++Col )
            std::swap( temp.address[ Row * cols + Col ] , temp.address[ Col * cols + Row ] ) ;
    return temp ;
}

// matrix basic calculation--non-member function( non-member functions )
matrix operator + ( const matrix &smat1 , const matrix &smat2 ) {
    matrix result( smat1 ) ;
    result += smat2 ;
    return result ;
}

matrix operator - ( const matrix &smat1 , const matrix &smat2 ) {
    matrix result( smat1 ) ;
    result -= smat2 ;
    return result ;
}

matrix operator * ( const matrix &smat1 , const matrix &smat2 ) {
    matrix result( smat1 ) ;
    result *= smat2 ;
    return result ;
}

// private functions for validity check
std::ostream& matrix::show( std::ostream &os ) const {
    for( unsigned Row = 0 ; Row != rows ; ++Row ){
        for( unsigned Col = 0 ; Col != cols ; ++Col )
            os << std::setw( 8 ) << getElem( Row , Col );
        os << std::endl;
    }
    return os ;
}

// other non-member functions for matrix
std::ostream& operator << ( std::ostream &os , const matrix &smat ) {
    return smat.show( os ) ;
}

