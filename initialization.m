%% Load Data

function initialization( )

    fprintf( "\n" )
    disp( "*********************************************************" )
    disp( "*                      Loading Data                     *" )
    disp( "*********************************************************" )
    fprintf( "\n" )
    
    global EEG;
    global EEG_FILE;
    global EEG_FILE_PATH;
    global FILE_TYPE;
    global FULL_EEG_FILE_PATH;
    global EEG_INFO_TEXT;
    
    [EEG_FILE, EEG_FILE_PATH] = uigetfile('*.*');
    
    tic
    
    FULL_EEG_FILE_PATH = strcat(EEG_FILE_PATH, EEG_FILE);
    
    disp(strcat("File Name: ", EEG_FILE))
    disp(strcat("File Path: ",EEG_FILE_PATH))
    fprintf( "\n" )
    
    % Checks what type of file is present and loads the data as such.
    switch FILE_TYPE.Value

        case '.set' % Check if file is .set

            EEG = pop_loadset( FULL_EEG_FILE_PATH ); % Load data as .set
            fprintf( "\n" )
            disp( "File Format is .SET" )

        case '.xdf' % Check if file is .xdf

            EEG = pop_loadxdf( FULL_EEG_FILE_PATH ); % Load data as .xdf
            fprintf( "\n" )
            disp( "File Format is .XDF" )

        case '.edf' % Check if file is .edf

            EEG = pop_biosig( FULL_EEG_FILE_PATH ); % Load data as .edf
            fprintf( "\n" )
            disp( "File Format is .EDF" )

        otherwise % If is none of the above, throws error
            fprintf( "\n" )
            disp( "File Format is INVALID" )
            disp( "Stopping Script" )
    end
    
    EEG_INFO_TEXT.Value = "";
    
    fn=fieldnames(EEG);
    
    for i=1:numel(fn)
        if ~isempty(EEG.(fn{i})) & size(EEG.(fn{i}), 2) < 100
            
            strcat(string(fn{i}),": ", string(EEG.(fn{i})))
            text = [EEG_INFO_TEXT.Value; strcat(string(fn{i}),": ", string(EEG.(fn{i}))); " "];
            EEG_INFO_TEXT.Value = text;
        end
    end
    
    fprintf( "\n" )
    disp( strcat( "Execution Time = ", string( toc ), " seconds" ) )
    
end