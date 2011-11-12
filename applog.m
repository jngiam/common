function applog(file, str)

% Print to Screen
fprintf(1, '%s\n', str);

if (~isempty(file))
    % Print to Log File
    fid = fopen(file, 'a');
    if (fid > 0)
        fprintf(fid, '%s\n', str);
        fclose(fid);
    else
        disp(['Warning unable to open ' file]);
    end
end
end