%% Set Paths and Create Directories
function preparation()

    tic
    fprintf( "\n" )
    disp( "*********************************************************" )
    disp( "*    Setting Directories, Path, and Global Variables    *" )
    disp( "*********************************************************" )
    fprintf( "\n ")
    
    global EEG;
    global EEG_FILE;
    global EEG_FILE_PATH;
    global FILE_PATH;
    global FILE_TYPE;
    global FULL_EEG_FILE_PATH;
    
    
    % Initializes the path in which the file to be processed exists
    FILE_PATH = ( "C:\Users\admin\Desktop\The-EEG-Pipeline-MATLAB" );

        % Adds the initialized file path to path in MATLAB
        addpath( FILE_PATH );

        % Sets the current directory as the file path
        cd( FILE_PATH );

        disp( strcat( "Using path: ", FILE_PATH ) )
        
    mkdir figures

    fprintf( "\n" )
    disp( strcat( "Execution Time = ", string( toc ), " seconds" ) )
    fprintf( "\n" )

end