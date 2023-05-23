function tests_runner()

% This function represents a Unit Testing framework that identifies all
% possible tests present inside the current folder ("test_*.m) and run them
% by means of the test suite function "runtests" inside a for cycle.

% It gets the path of the current script
    test_Folder = fileparts(mfilename('fullpath'));  
    test_Files = dir(fullfile(test_Folder, 'test_*.m'));
    
% It removes this script file from the list of test files
    script_Name = mfilename;
    script_index = strcmp({test_Files.name}, [script_Name '.m']);
    test_Files(script_index) = [];
    
    for i = 1:length(test_Files)
        test_Name = test_Files(i).name;
        runtests(fullfile(test_Folder, test_Name));
    end

end
