%% Path setup for the single image illumination project
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2006-2010 Jean-Francois Lalonde
% Carnegie Mellon University
% Do not distribute
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear global;
global logFileRoot;

% host-dependent paths
[a, host] = system('hostname');

logFileRoot = getPathName('logs');
path3rdParty = getPathName('code', '3rd_party');
pathMyCode = getPathName('code', 'mycode');
pathUtils = getPathName('codeUtils');

%% Turn off some annoying warnings
warning off Images:initSize:adjustingMag;

randSeed = sum(100*clock) + sum(host);
if ~isempty(strfind(version, '7.7'))
    RandStream.setDefaultStream(RandStream('mt19937ar','seed', randSeed))
else
    rand('twister', randSeed);
end

% Restore to initial state
restoredefaultpath;

%% Setup project paths
addpath(genpath(pathMyCode));
addpath(genpath(pathUtils));
addpath(genpath(path3rdParty));