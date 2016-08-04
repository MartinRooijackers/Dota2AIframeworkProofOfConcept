#include <iostream>
#include <fstream>
#include <string>

//#include <boost/interprocess/sync/file_lock.hpp>

using namespace std;

ifstream fin;
ifstream finLock;
ofstream fout;
ofstream foutLock;


int HP;

void MakeDecision( int unitID )
{


	    //std::to_string(42);
		fin.open("PHPtoC++" + std::to_string(unitID) + ".txt");
		fin>>HP;
		fin.close();

		//finLock.open("C:/Dota2AI/PHPtoC++Lock.txt");
		finLock.close();

		string ToRemove1 = "PHPtoC++" + std::to_string(unitID) + ".txt";
		string ToRemove2 =  "PHPtoC++Lock" + std::to_string(unitID) + ".txt";

		remove( ToRemove1.c_str() );
		remove( ToRemove2.c_str() );
		cout<<unitID<<" "<<HP<<endl;
		std::string Action = "ATTACK";
		if( HP < 400 ){
			Action = "RETREAT";
		}

		fout.open("C++toPHP" + std::to_string(unitID) + ".txt" );
		fout<<Action;
		fout.close();

		fout.open("C++toPHPLock" + std::to_string(unitID) + ".txt" );
		//fout<<Action;
		fout.close();




}


bool fileExists(const std::string& filename) {
  std::ifstream ifile(filename.c_str());
  return (bool)ifile;
}


int main(){



	//   "C:/Dota2AI/" 
	while( 1 ){


		for(int i=0; i<3000; i++ ){
			std::string fileNameCheck = "PHPtoC++Lock" + std::to_string(i) + ".txt";
			if( fileExists( fileNameCheck ) == true ) {
				 MakeDecision( i );
			}
		}
		_sleep( 1 );
		/*
		//TODO: use a Pipe or Sockets for interprocess communication
		finLock.open("PHPtoC++Lock.txt");
		while( finLock.fail() ){
			//cout<<"file opening failed";
			finLock.open("PHPtoC++Lock.txt");
		}


		fin.open("PHPtoC++.txt");
		fin>>HP;
		fin.close();

		//finLock.open("C:/Dota2AI/PHPtoC++Lock.txt");
		finLock.close();

		remove( "PHPtoC++.txt" );
		remove( "PHPtoC++Lock.txt" );
		cout<<HP;
		std::string Action = "ATTACK";
		if( HP < 400 ){
			Action = "RETREAT";
		}

		fout.open("C++toPHP.txt" );
		fout<<Action;
		fout.close();

		fout.open("C++toPHPLock.txt" );
		//fout<<Action;
		fout.close();


		//break;
		*/
	}


	int a;
	cin>>a;
	return 0;
}