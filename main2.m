%{

1. 'File' > 'Import data' > 'Using EEGLAB functions and plugins'
   > 'From .XDF or .XDFZ file' > Select a .XDF file.

Optional: Make changes to how the analysis is run by
   changing the values below.

2. 'EDITOR' > 'Run'

%}

%% Reference Options
    % Leave empty for Average Reference e.i. []
    % or enter reference electrode e.i. ['Cz']
    
    reference_type = [];

%% Filter Options
    % Default settings should 0.5 or 1 for low_cuttoff
    % Default settings should 70 for high_cuttoff
    
    low_cuttoff = 0.5;
    high_cutoff = 70;
    
%% Topology Map Style
    % Color Maps: 'turbo'
    
    color_map = colormap('turbo');
    
%% ICA Options
    % Options: 'picard', 'runica', 'binica', 'jader', 'fastica'
    % Stick with 'picard', but try 'runica' if you're components are poor.
    
    ica_type = 'picard';

%% Dipole Fitting Options
%{
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣤⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⢄⣒⢏⣐⢐⢈⢀⠈⢀⢢⡀⢠⠈⢂⣫⢢⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠃⣗⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠐⠓⠊⠊⣄⠐⢠⢁⢈⠅⠂⢀⢈⠀⢀⢨⠘⣢⢐⠊⣯⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⣹⣄⠀⠀⠀⣄⣄⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⢄⢀⠀⠀⢠⠀⢀⠀⢀⢐⢠⢡⠡⡎⣯⡀⠀⢀⡠⢄⢒⠀⢉⢩⢩⠁⢁⠉⢠⢂⢤⣀⣀⣀⠀⠀⣇⢏⡄⠀⢀⣟⢮⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠠⣀⢀⢀⢀⠠⠄⢀⢈⢕⣵⠛⠉⢁⢀⢀⢐⢀⠈⠐⢀⠀⣀⢐⢀⣨⢂⠀⢀⢀⢈⢀⢈⢠⠈⢐⠐⠩⠻⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⡠⠤⢀⠀⠠⢠⢤⣀⠀⠀⠀⠉⠀⠊⠮⣮⠃⢉⠔⢀⣰⣀⠠⢀⢠⢠⣈⠀⠠⠐⠠⢀⣿⣿⢏⠀⣀⠠⠐⣀⣠⣐⠠⢰⠀⣀⡀⢀⠀⢒⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢀⢄⢈⠐⢈⢀⢀⠀⠐⡈⢀⢀⠠⠀⠈⢒⢄⠀⡄⢉⠀⡀⠀⠐⢀⢀⠠⡈⣾⣿⣷⢀⢪⢠⠀⠀⢐⢀⠁⢠⢀⢀⠀⢈⢘⣀⣀⠰⠤⢄⣐⠀⠀⣛⠏⠀⠀⠀⠀⠀⠀⠀⠀
⠊⢀⣠⢀⢀⢘⢀⠐⢀⠰⢀⢀⢀⠠⠀⢄⣈⢐⢠⠀⢨⢢⢈⢈⣂⢰⣞⢠⣈⠀⠐⠀⢀⠀⢀⢀⢀⠀⠀⢐⠴⠒⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⠀⢠⢀⢐⢀⢀⠀⢀⢀⢀⠨⠀⢐⠀⢀⢀⣀⢀⠠⢀⠀⢀⠀⠠⣀⢠⢀⠀⢠⠀⠈⢀⢀⠈⢀⣀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⢀⢨⢠⢀⢨⠸⠰⢀⢐⠀⢀⢠⢊⠠⢠⢨⢘⢂⣐⠀⠀⢀⢐⠂⢐⠑⢀⠀⠀⠀⢀⠐⠠⢀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⠀⢠⠠⢀⣈⣈⣈⢀⠠⢈⠀⠀⣐⠈⢀⢈⠀⢠⣠⢀⠠⣀⠀⠀⢀⣢⢀⣀⠀⢈⠀⢀⢀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣀⣈⠨⢸⢀⠀⢊⠀⠀⠀⠌⢀⠰⢀⠐⢀⢨⠈⢀⠊⠀⠈⠘⠘⠐⠠⢊⢘⠀⠠⢨⠐⠀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢠⢀⢠⢰⢀⢀⢀⠀⠀⡐⢀⢀⢈⢐⠀⢠⢠⠀⢀⢀⢀⢀⢀⢀⢀⠠⣀⠀⢀⠠⠀⢀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢈⢀⠐⢐⢀⢠⠐⢀⢐⢊⠀⠀⢀⢀⢈⢁⣀⢠⠀⢈⠀⢀⠀⠀⢀⢀⠀⢀⢀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣨⢀⢊⢠⢀⢀⢈⢐⠀⢀⠀⢀⠀⠈⢀⠀⢐⠀⠀⠀⢀⢀⢀⠀⢠⢰⢄⠀⠈⢀⠁⠀⢀⢁⢀⣂⣔⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠈⠈⠐⠊⢼⠨⢁⢘⣯⢦⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣀⢀⠀⠀⠀⠀⢀⠈⢠⡀⠐⢀⠀⠀⣈⢠⢠⣊⢀⠈⢀⢀⠂⠀⠑⢄⣀⢀⢈⣠⠬⠊⠁⠀⠁⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠪⣬⠎⣫⡄⠀⠀⠀⠀⠠
⠀⠂⠘⢰⢀⢠⢀⢀⢀⠈⢀⢀⠠⠀⢀⠐⡠⢘⠘⠂⠀⠔⠈⠀⠀⠀⠀⠀⠀⡞⢽⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢤⣀⠒⢲⢒⢒⠒⢁⢀⣰⢀⣉⢂⠂⠂⣠⠠
⢀⡀⢀⠠⢈⠀⣈⠈⢄⠠⢨⣀⠈⢀⡀⠨⠤⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠂⠁⠠⠘⢨⢐⢀⣀⠀⠈⢠⠐⠢⢿⠟⠀⢀⠈⡀⢊
⠀⠀⠈⢂⠠⢈⢀⢐⠀⠀⠀⠀⠠⠀⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⢴⢲⢒⠠⠐⢡⣀⢐⢂⠰⢠⢐⠀⠙⠿⠋⠀⠀⠀⢂⢰⠤⠒⠈⠉⠀⠀
⣰⣈⢘⢂⢐⢀⠀⡀⠈⢀⢀⢀⠀⠐⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣔⣛⢐⢘⢀⢠⣀⠀⢀⣐⢀⢀⢐⠀⠀⢘⠀⢈⢀⠀⢈⠈⠄⠉⠀⠀⠀⠀⠀⠀⠀
⢈⠈⢀⠈⢀⠐⢀⣀⢀⢀⢈⢀⠀⢀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣖⢃⣈⢳⢡⢈⠀⢈⠠⢀⠀⠀⠠⢀⢊⢄⢐⢀⢀⢠⢠⡠⢀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢣⢪⠨⠰⢐⢀⢀⠈⢐⣐⢈⠄⠢⢨⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣧⣃⢄⢀⣰⢢⠀⠀⢠⢠⠀⢀⣈⢀⠐⠨⢀⢀⢠⢈⠀⠈⢀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠈⠢⢈⠀⢈⠀⠐⢀⢀⠐⠐⠐⢀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣏⣇⣊⣧⢐⠠⢰⠀⢀⢐⢀⢀⢀⢀⢀⠀⠈⡈⢐⠨⡀⢀⠀⠀⣠⣩⣤⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠈⢌⠀⠀⠀⠌⢠⢐⢐⠀⠐⢐⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠂⣁⢢⢊⠀⠠⢀⠈⢀⢀⠀⢢⠀⢐⢀⠨⢬⠐⠒⠈⠀⠀⠀⠈⣿⠉⠏⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠂⢀⡈⠈⠀⠈⢠⣀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⢑⢘⣢⠠⢐⢀⡀⢐⢨⣄⢰⢀⢠⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⢄⠀⢠⠀⠈⢀⠐⢈⣿⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⣅⠀⠡⠢⢢⡤⠈⠀⠀⠉⡀⢀⠀⠨⢘⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⠒⠀⣨⣶⢿⣯⣯⣻⣻⣷⢯⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠢⣀⣠⣤⡿⣶⣤⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠉⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀
        TTTTTT  HH  HH  EEEEEE          EEEEEE  EEEEEE   GGGGG
          TT    HH  HH  EE              EE      EE      GG  
          TT    HHHHHH  EEEEEE          EEEEEE  EEEEEE  G  GGG  
          TT    HH  HH  EE              EE      EE      GG  GG
          TT    HH  HH  EEEEEE          EEEEEE  EEEEEE   GGG G

    PPPPPP  IIIIII  PPPPPP  EEEEEE  LL      IIIIII  NN  NN  EEEEEE
    PP  PP    II    PP  PP  EE      LL        II    NNN NN  EE
    PPPPPP    II    PPPPPP  EEEEEE  LL        II    NNNNNN  EEEEEE
    PP        II    PP      EE      LL        II    NN NNN  EE
    PP      IIIIII  PP      EEEEEE  LLLLLL  IIIIII  NN  NN  EEEEEE

**************************************************************************
*  Press the "Run" button under the "Editor" tab to start the pipeline. 
*  
**************************************************************************
%}
    
cd 'C:\Users\admin\Desktop\The-EEG-Pipeline-MATLAB\Input'

%% Sets Channel Locations
EEG=pop_chanedit(EEG,...
    'lookup','C:\\Program Files\\EEGLAB\\eeglab2021.1\\plugins\\dipfit5.1\\standard_BEM\\elec\\standard_1005.elc',...
    'changefield',{1 'labels' 'FP1'},'changefield',{2 'labels' 'FP2'},...
    'changefield',{3 'labels' 'F3'},'changefield',{4 'labels' 'F4'},...
    'changefield',{5 'labels' 'C3'},'changefield',{6 'labels' 'C4'},...
    'changefield',{7 'labels' 'P3'},'changefield',{8 'labels' 'P4'},...
    'changefield',{9 'labels' 'O1'},'changefield',{10 'labels' 'O2'},...
    'changefield',{11 'labels' 'F7'},'changefield',{12 'labels' 'F8'},...
    'changefield',{13 'labels' 'T3'},'changefield',{14 'labels' 'T4'},...
    'changefield',{15 'labels' 'T5'},'changefield',{16 'labels' 'T6'},...
    'changefield',{17 'labels' 'Fz'},'changefield',{18 'labels' 'Cz'},...
    'changefield',{19 'labels' 'Pz'});

EEG = eeg_checkset( EEG );
EEG=pop_chanedit(EEG,...
     'lookup','C:\\Program Files\\EEGLAB\\eeglab2021.1\\plugins\\dipfit5.1\\standard_BEM\\elec\\standard_1005.elc');
 
EEG = eeg_checkset( EEG );

eeglab redraw

%% Change Montage
EEG = pop_reref( EEG, reference_type);
     EEG = eeg_checkset( EEG );

%% Make/Set Directories
eeglab redraw

cd 'C:\Users\admin\Desktop\The-EEG-Pipeline-MATLAB\Output'

mkdir 'Figures'

cd 'C:\Users\admin\Desktop\The-EEG-Pipeline-MATLAB\Output\Figures'

%{
%% Plot Pre Filtered Data
plotTopoMaps(EEG, color_map, '1. Absolute Power Topology Maps - Unprocessed');

plotSpectra(EEG, "1. Raw Individual Spectra - Unprocessed");

plotSpectraWithHeads(EEG, "1. Raw Spectra - Unprocessed")

EEGDriftRemoved = pop_eegfiltnew(EEG, 'locutoff',low_cuttoff);

plotEEGSignalData(EEGDriftRemoved, "1. EEG Signal - Unprocessed")
%}

%% Clean Data - First Pass
cleanEEG = clean_artifacts(EEG,...
    'ChannelCriterion', 'off',...
    'LineNoiseCriterion', 'off',...
    'BurstCriterion', 10,...
    'WindowCriterion', 0.25);

vis_artifacts(cleanEEG ,EEG);
% set(gcf,'units','normalized','outerposition',[0 0 1 1])
saveas(gcf, "2. EEG Signal - Artifacts First Pass Superposition.png")
close

EEG = cleanEEG;

%{
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off'); 
EEG = pop_eegfiltnew(EEG, 'locutoff',low_cuttoff,'hicutoff', high_cutoff);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'gui','off'); 
%}

eeglab redraw

%{
%% Plot Post Filtered Data
plotTopoMaps(EEG, color_map, '2. Absolute Power Topology Maps - Artifacts First Pass');

plotSpectra(EEG, "2. Raw Individual Spectra - Artifacts First Pass");

plotSpectraWithHeads(EEG, "2. Raw Spectra - Artifacts First Pass")

plotEEGSignalData(EEG, "2. EEG Signal - Artifacts First Pass")
%}

%run ICA
EEG = eeg_checkset( EEG );
EEG = pop_runica(EEG, 'icatype', 'picard', 'maxiter' , 2500)
% EEG = pop_runica(EEG, 'extended', 1)
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

eeglab redraw

% EEG = calc_PowPowCAT(EEG, 40, 2, 1, 5000)

% plotCovarianceMatrices(EEG, color_map);

%run amica
% monkeynumchan=EEG.nbchan; %get current number of channels for amica arguements on next lines
% nameAMICAdirectory=[cd filesep currentID77 'Pipelineamicaout' ]; %define subject specific folder for AMICA output
% arglist=[   {'outdir'  ,  'AMICAout',   'num_chans' ,   monkeynumchan, 'pcakeep'  ,monkeynumchan  ,  'max_threads'  ,2}]
% [W,S,mods] = runamica15(EEG.data(:,:), arglist{:});     % runs amica
% EEG.icaweights = W; EEG.icasphere = S(1:size(W,1),:);%transfers amica to current ICA weights
% EEG.icawinv = mods.A(:,:,1); EEG.mods = mods; %transfers other amica to current ICA windows

%run DipFit
cd 'C:\Users\admin\Desktop\The-EEG-Pipeline-MATLAB\Output\Figures'

mkdir 'ICA'

cd 'C:\Users\admin\Desktop\The-EEG-Pipeline-MATLAB\Output\Figures\ICA'

EEG = pop_dipfit_settings( EEG,...
    'hdmfile', 'C:\\Program Files\\EEGLAB\\eeglab2021.1\\plugins\\dipfit5.1\\standard_BEM\\standard_vol.mat',...
    'coordformat', 'MNI',...
    'mrifile', 'C:\\Program Files\\EEGLAB\\eeglab2021.1\\plugins\\dipfit5.1\\standard_mri.mat',...
    'chanfile', 'C:\\Program Files\\EEGLAB\\eeglab2021.1\\plugins\\dipfit5.1\\standard_BEM\\elec\\standard_1005.elc',...
    'model', 'standardBEM',...
    'coord_transform', [0 0 0 0 0 -1.5708 1 1 1],...
    'chansel', [1:19]);

EEG.dipfit.headmodel = 'C:\\Program Files\\EEGLAB\\eeglab2021.1\\plugins\\dipfit5.1\\standard_BEM\\standard_vol_head_model.mat';
EEG.dipfit.sourcemodel.file = 'C:\\Program Files\\EEGLAB\\eeglab2021.1\\plugins\\dipfit5.1\\standard_BEM\\standard_vol_leadfield.mat';
EEG.dipfit.sourcemodel.coordtransform = [0 0 0 0 0 -1.5708 1 1 1];

[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG = pop_multifit(EEG, [1:18],...
    'threshold',100,'plotopt',{'normlen' 'on'});

[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);


p = fileparts(which('eeglab'));

% 'headmodel', EEG.dipfit.hdmfile, 'elec2mni', EEG.dipfit.coord_transform)
% 'leadfield', 'C:\\Program Files\\EEGLAB\\eeglab2021.1\\plugins\\dipfit5.1\\standard_BEM\\standard_vol_leadfield.mat',...

EEG =roi_activity(EEG,...
    'leadfield', EEG.dipfit.hdmfile.leadField,...
    'headmodel',EEG.dipfit.hdmfile,...
    'model','LCMV',...
    'modelparams',{0.05},...
    'sourcemodelatlas','LORETA-Talairach-BAs',...
    'nPCA',3,...
    'fooof', 'on',...
    'fooof_frange', [1 40]);



EEG = pop_roi_connect(EEG,...
    'methods', { 'MIM', 'TRGC'},...
    'snippet', 'on',...
    'snip_length', 60,...
    'fcsave_format', 'mean_snips')

EEG = pop_roi_connectplot(EEG,...
    'measure', 'roipsd',...
    'plotcortex', 'on',...
    'plotbarplot', 'on',...
     'plotmatrix', 'on',...
    'freqrange', [8 12]) % alpha band;

return;

%% Plot Dipoles
figure; pop_dipplot(EEG, [1:19],...
    'plot', 'on',...
    'gui', 'off',...
    'num', 'on',...
    'projimg', 'off',...
    'projlines', 'on',...
    'normlen', 'on',...
    'dipnames', {'1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19'},...
    'view', [1 -1 1]);

camzoom(0.7);
set(gcf, 'Color', 'w');
set(findall(gcf,'-property','FontSize'),'FontSize',25)
set(gcf,'units','normalized','outerposition',[0 0 1 1])
saveas(gcf,'Dipoles.png');
close

location_labels = EEG.dipfit.model(1).areadk

for dipole = 1:EEG.nbchan
    dipname = {int2str(dipole)};
    figure; pop_dipplot(EEG, [dipole],...
    'plot', 'on',...
    'gui', 'off',...
    'num', 'on',...
    'projimg', 'on',...
    'projlines', 'on',...
    'normlen', 'on',...
    'dipnames', dipname,...
    'view', [1 -1 1]);

text(0.1, 0.1, EEG.dipfit.model(dipole).areadk, 'Units', 'normalized', 'Color', 'black', 'FontSize', 20);
camzoom(0.7);
set(gcf, 'Color', 'w');
set(findall(gcf,'-property','FontSize'),'FontSize',25)
set(gcf,'units','normalized','outerposition',[0 0 1 1])
saveas(gcf, strcat('IC', int2str(dipole), ' Dipole.png'));
close
end

%Do ICLabel Classifications
EEG = pop_iclabel(EEG, 'default');
% threshold = [0 0; 0.9 1; 0.9 1; 0 0; 0 0; 0 0; 0 0];
% EEG = pop_icflag(EEG, threshold)
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
% Only plot the components that were found, avoiding an empty graph, error
% message and uncaught exception
ica_weights_size = size(EEG.icaweights);
num_ics = ica_weights_size(1);

pop_viewprops( EEG, 0, [1:num_ics], {'freqrange', [1 50]}, {}, 1, 'ICLabel');
colormap(color_map);
saveas(gcf, "ICA Properties.png")
close

% Plot Individual ICs
for loopthroughICS = 1:(size(EEG.icawinv,2))
    numberofIC = num2str(loopthroughICS);
    pop_prop_extended( EEG, 0, loopthroughICS, NaN, {'freqrange' [1 40] });
    colormap(color_map);
    set(gcf,'units','normalized','outerposition',[0 0 1 1])
    saveas(gcf, ['IC' numberofIC ' Details.png'] )
    close
    
end

%Plot Components
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 0, 1, 1);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
colormap(color_map);
saveas(gcf, "Component Activities.png")
close

cd 'C:\Users\admin\Desktop\The-EEG-Pipeline-MATLAB\Output\Figures'

%Plot EEG Data
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
saveas(gcf, "Preprocessed Channel Activities.png")
close

%Plot EEG Spectra and Head Maps 1-20 hz
EEG = eeg_checkset( EEG );
figure; pop_spectopo(EEG, 1, [0      603996.0938], 'EEG' , 'freq', [1:20], 'freqrange',[1 40],'electrodes','off');
colormap(color_map);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
saveas(gcf, "Preprocessed Spectra.png")
close

cd 'C:\Users\admin\Desktop\The-EEG-Pipeline-MATLAB\Output'

mkdir 'LORETA'

cd 'C:\Users\admin\Desktop\The-EEG-Pipeline-MATLAB\Output\LORETA'

% Export LORETA
pop_eeglab2loreta( EEG, 'compnum', 1:num_ics );

eeglab redraw

cd 'C:\Users\admin\Desktop\The-EEG-Pipeline-MATLAB\Output\Figures'

disp("DONE");

%% Plot Topo Maps
function plotTopoMaps(EEG, color_map, mapsTitle)

    absolute_power_topo_figure = figure;
    tiled_layout = tiledlayout(4,3);
    title(tiled_layout, mapsTitle);
    % Raw 0.5-70 Hz
    nexttile;
    filtered_raw_data = pop_eegfiltnew(EEG, 'locutoff',0.5,'hicutoff', 70);
    filtered_raw_data_transform = abs(hilbert(filtered_raw_data.data));
    averaged_filtered_raw_data = mean(filtered_raw_data_transform(:, 1:end, :));
    raw_plot = topoplot(averaged_filtered_raw_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('Raw (0.5-70 Hz)');
    colorbar;

    % Delta 0.5-4 Hz
    nexttile;
    filtered_delta_data = pop_eegfiltnew(EEG, 'locutoff',0.5,'hicutoff', 4);
    filtered_delta_data_transform = abs(hilbert(filtered_delta_data.data));
    averaged_filtered_delta_data = mean(filtered_delta_data_transform(:, 1:end, :));
    delta_plot = topoplot(averaged_filtered_delta_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('Delta (0.5-4 Hz)');
    colorbar;

    % Theta 4-8 Hz
    nexttile;
    filtered_theta_data = pop_eegfiltnew(EEG, 'locutoff',4,'hicutoff', 8);
    filtered_theta_data_transform = abs(hilbert(filtered_theta_data.data));
    averaged_filtered_theta_data = mean(filtered_theta_data_transform(:, 1:end, :));
    theta_plot = topoplot(averaged_filtered_theta_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('Theta (4-8 Hz)');
    colorbar;

    % Alpha 8 - 12 Hz
    nexttile;
    filtered_alpha_data = pop_eegfiltnew(EEG, 'locutoff',10,'hicutoff', 12);
    filtered_alpha_data_transform = abs(hilbert(filtered_alpha_data.data));
    averaged_filtered_alpha_data = mean(filtered_alpha_data_transform(:, 1:end, :));
    alpha_plot = topoplot(averaged_filtered_alpha_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('Alpha (8-12 Hz)');
    colorbar;

    % Alpha 1 8 - 10 Hz
    nexttile;
    filtered_alpha1_data = pop_eegfiltnew(EEG, 'locutoff',8,'hicutoff', 10);
    filtered_alpha1_data_transform = abs(hilbert(filtered_alpha1_data.data));
    averaged_filtered_alpha1_data = mean(filtered_alpha1_data_transform(:, 1:end, :));
    alpha1_plot = topoplot(averaged_filtered_alpha1_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('Alpha 1 (8-10 Hz)');
    colorbar;

    % Alpha 2 10 - 12 Hz
    nexttile;
    filtered_alpha2_data = pop_eegfiltnew(EEG, 'locutoff',10,'hicutoff', 12);
    filtered_alpha2_data_transform = abs(hilbert(filtered_alpha2_data.data));
    averaged_filtered_alpha2_data = mean(filtered_alpha2_data_transform(:, 1:end, :));
    alpha2_plot = topoplot(averaged_filtered_alpha2_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('Alpha 2 (10-12 Hz)');
    colorbar;


    % Beta 12 - 38 Hz
    nexttile;
    filtered_beta_data = pop_eegfiltnew(EEG, 'locutoff',12,'hicutoff', 38);
    filtered_beta_data_transform = abs(hilbert(filtered_beta_data.data));
    averaged_filtered_beta_data = mean(filtered_beta_data_transform(:, 1:end, :));
    beta_plot = topoplot(averaged_filtered_beta_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('Beta (12-38 Hz)');
    colorbar;

    % Beta 1 12 - 15 Hz
    nexttile;
    filtered_beta1_data = pop_eegfiltnew(EEG, 'locutoff',12,'hicutoff', 15);
    filtered_beta1_data_transform = abs(hilbert(filtered_beta1_data.data));
    averaged_filtered_beta1_data = mean(filtered_beta1_data_transform(:, 1:end, :));
    beta1_plot = topoplot(averaged_filtered_beta1_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('Beta 1 (12-15 Hz)');
    colorbar;

    % Beta 2 15 - 18 Hz
    nexttile;
    filtered_beta2_data = pop_eegfiltnew(EEG, 'locutoff',15,'hicutoff', 18);
    filtered_beta2_data_transform = abs(hilbert(filtered_beta_data.data));
    averaged_filtered_beta2_data = mean(filtered_beta2_data_transform(:, 1:end, :));
    beta2_plot = topoplot(averaged_filtered_beta2_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('Beta 2 (15-18 Hz)');
    colorbar;

    % High Beta 18 - 38 Hz
    nexttile;
    filtered_betah_data = pop_eegfiltnew(EEG, 'locutoff',18,'hicutoff', 38);
    filtered_betah_data_transform = abs(hilbert(filtered_betah_data.data));
    averaged_filtered_betah_data = mean(filtered_betah_data_transform(:, 1:end, :));
    betah_plot = topoplot(averaged_filtered_betah_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('High Beta (18-38 Hz)');
    colorbar;

    % Gamma 38 - 70 Hz
    nexttile;
    filtered_gamma_data = pop_eegfiltnew(EEG, 'locutoff',38,'hicutoff', 70);
    filtered_gamma_data_transform = abs(hilbert(filtered_gamma_data.data));
    averaged_filtered_gamma_data = mean(filtered_gamma_data_transform(:, 1:end, :));
    gamma_plot = topoplot(averaged_filtered_gamma_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('Gamma (38-70 Hz)');
    colorbar;

    % Gamma 70+ Hz
    nexttile;
    filtered_gamma_data = pop_eegfiltnew(EEG, 'locutoff',70);
    filtered_gamma_data_transform = abs(hilbert(filtered_gamma_data.data));
    averaged_filtered_gamma_data = mean(filtered_gamma_data_transform(:, 1:end, :));
    gamma_plot = topoplot(averaged_filtered_gamma_data, EEG.chanlocs, 'electrodes', 'on', 'maplimits', 'minmax', 'colormap', color_map);
    title('70+ Hz');
    colorbar;

    set(gcf,'units','normalized','outerposition',[0 0 0.5 1])
    saveas(gcf, strcat(mapsTitle, ".png"));
    close
end

function plotSpectraWithHeads(EEG, spectraTitle)
    EEG = eeg_checkset( EEG );
    figure; 
    pop_spectopo(EEG, 1, [0      603996.0938], 'EEG' , 'freq', [1:20], 'freqrange',[1 40],'electrodes','off');
    colormap(color_map);
    set(gcf,'units','normalized','outerposition',[0 0 1 1])
    saveas(gcf, strcat(spectraTitle, ".png"))
    close
end

function plotEEGSignalData(EEG, signalTitle)
    EEG = eeg_checkset( EEG );
    pop_eegplot( EEG, 1, 1, 1);
    set(gcf,'units','normalized','outerposition',[0 0 1 1])
    saveas(gcf, strcat(signalTitle, ".png"))
    close
end

function plotSpectra(EEG, spectraTitle)
    spectra_figure = figure;
    tiled_layout = tiledlayout(5,4);
    title(tiled_layout, spectraTitle);
    
    for channel = 1:EEG.nbchan
        nexttile;
        spectopo(EEG.data(channel,:), 0, 256, 'limits', [0 40 nan nan]);
        title(EEG.chanlocs(channel).labels);
        ylabel('');
        xlabel('');
        set(gca,'fontsize',10)
    end
    
    set(gcf,'units','normalized','outerposition',[0 0 0.5 1])
    saveas(gcf, strcat(spectraTitle, ".png"));
    close
end

function plotDipoles(EEG, comps, title)

dipnames = cell(length(comps));

for name = 1:length(comps)
    dipnames{name} = string(comps(name));
end

pop_dipplot(EEG, comps,...
    'plot', 'on',...
    'num', 'on',...
    'projimg', 'off',...
    'projlines', 'on',...
    'normlen', 'on',...
    'dipnames', dipnames,...
    'view', [1 -1 1])
set(gcf, 'Color', 'w');
set(findall(gcf,'-property','FontSize'),'FontSize',25)
set(gcf,'units','normalized','outerposition',[0 0 1 1])
saveas(gcf, strcat(title, ".png") )
close

end

function plotCovarianceMatrices(EEG, color_map)

    for ic = 1:EEG.nbchan
        imagesc(EEG.etc.PowPowCAT.covMatrix(:,:,ic), [-0.8 0.8]);
        colormap(color_map);

        axis xy
        axis square

        % Zoom in a little bit
        gcaPosition = get(gca, 'position');
        gcaPosition([3 4]) = gcaPosition([3 4]);
        set(gca, 'position', gcaPosition);

        tickLabels = round(EEG.etc.PowPowCAT.freqs(10:10:length(EEG.etc.PowPowCAT.freqs))*10)/10;
        tickLabels(tickLabels>10) = round(tickLabels(tickLabels>10));

        set(gca, 'XTick', 10:10:length(EEG.etc.PowPowCAT.freqs),...
            'XTickLabel', tickLabels,...
            'YTick', 10:10:length(EEG.etc.PowPowCAT.freqs),...
            'YTickLabel', tickLabels, 'fontsize', 8)

        title(['IC ' num2str(ic) ' Covariance Matrix'], 'fontsize', 12)
        set(gcf,'units','normalized','outerposition',[0 0 1 1])
        saveas(gcf, strcat('IC ', num2str(ic), ' Covariance Matrix.png') )
        close
    end
end

