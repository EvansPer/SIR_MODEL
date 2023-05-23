function tests_runner()

% This function represents a Unit Testing framework that identifies all
% possible tests present inside the current folder ("test_*.m) and run them
% by means of the test suite function "runtests" inside a for cycle.

% It gets the path of the current script
    testFolder = fileparts(mfilename('fullpath'));  
    testFiles = dir(fullfile(testFolder, 'test_*.m'));
    
% It removes this script file from the list of test files
    scriptName = mfilename;
    scriptIdx = strcmp({testFiles.name}, [scriptName '.m']);
    testFiles(scriptIdx) = [];
    
    for i = 1:length(testFiles)
        testName = testFiles(i).name;
        runtests(fullfile(testFolder, testName));
    end

end
