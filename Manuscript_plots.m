% Create the plots for the manuscript

% Plotting variables
MarkerSize        = 10;
LineWidth         = 1.5;
LineWidthMarker   = 1.5; %width of edge of marker
FontSize          = 12;
colorVec          = [0 0.4470 0.7410; 0.9290 0.6940 0.1250];
percept_symp_str  = {'Object interact','Object shape','Object location','Perceptual swim','Blurry vision','Double vision','Eyestrain','Neck pain'};
physical_symp_str = {'Headache','Dizziness','Nausea'};

% position of corners of the shaded box
alpha_box = 0.06;
x2_b3 = [2.5,3.5]; %x length of rectangle
y4_b3 = [0,0]; % bottom of rectangle
y5_b3 = [6,6]; % top of rectangle


% concatenate measurements for plotting
Physical_all     = cat(3,Physical_t1,Physical_npre_after,Physical_adapt,Physical_npo_after,Physical_post);
Perceptual_all   = cat(3,Perceptual_t1,Perceptual_npre_after,Perceptual_adapt,Perceptual_npo_after,Perceptual_post);


% Average PERCEPTUAL symptoms over time
% calculations for the main session data
Just4lenses      = Perceptual_all(idx_04,:,:);
Perceptual_4_avg = mean(Just4lenses);
Perceptual_4_sd  = std(Just4lenses);
Perceptual_4_CI  = (1.96 .* Perceptual_4_sd) ./ sqrt(20);
% calculations for the control session data
Just0lenses      = Perceptual_all(idx_00,:,:);
Perceptual_0_avg = mean(Just0lenses);
Perceptual_0_sd  = std(Just0lenses);
Perceptual_0_CI  = (1.96 .* Perceptual_0_sd) ./ sqrt(20);


f1 = figure; hold on;
f1.Position = [100 40 1170 635];
counter = 0;
xnum = 5; % number of timepoints

% loop over questions, excluding eyestrain and neck pain
for qest = 1:6 

    counter = counter + 1;

    subplot(2,3,counter); hold on;

    title(percept_symp_str{qest});

    % shaded region
    II=patch([x2_b3 fliplr(x2_b3)],[y4_b3 fliplr(y5_b3)], 'k', 'LineStyle','none');II.FaceAlpha = alpha_box; %red shaded region to indicate adaptation

    % Plot data - Just draw the lines
    Day_00                 = plot(1:xnum,squeeze(Perceptual_0_avg(1,qest,1:xnum)),'-','Color',colorVec(1,:),'LineWidth',LineWidth);
    Er                     = errorbar(1:xnum, squeeze(Perceptual_0_avg(1,qest,1:xnum)), -squeeze(Perceptual_0_CI(1,qest,1:xnum)),...
                             squeeze(Perceptual_0_CI(1,qest,1:xnum))); Er.Color=[0 0 0]; Er.LineStyle = "none";
    Day_00.MarkerEdgeColor = colorVec(1,:); %specify color of the markers

    Day_04                 = plot(1:xnum,squeeze(Perceptual_4_avg(1,qest,1:xnum)),'-','Color',colorVec(2,:),'LineWidth',LineWidth);
     Er                    = errorbar(1:xnum, squeeze(Perceptual_4_avg(1,qest,1:xnum)), -squeeze(Perceptual_4_CI(1,qest,1:xnum)),...
                             squeeze(Perceptual_4_CI(1,qest,1:xnum))); Er.Color=[0 0 0]; Er.LineStyle = "none";
    Day_04.MarkerEdgeColor = colorVec(2,:);


    % Plot the vlaues for the 04 lenses. Plotting the circles
    % seperately so that the first and last points do not have circles
    Day_04 = plot(2:4,squeeze(Perceptual_4_avg(1,qest,2:4)),'o','Color','k',"MarkerFaceColor",colorVec(2,:),"MarkerEdgeColor",colorVec(2,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day_00 = plot(2:4,squeeze(Perceptual_0_avg(1,qest,2:4)),'o','Color','k',"MarkerFaceColor",colorVec(1,:),"MarkerEdgeColor",colorVec(1,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    
    % Plot open circles on the first and last data point
    Day_04 = plot(1,squeeze(Perceptual_4_avg(1,qest,1)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(2,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day_04 = plot(5,squeeze(Perceptual_4_avg(1,qest,5)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(2,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day_00 = plot(1,squeeze(Perceptual_0_avg(1,qest,1)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(1,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day_00 = plot(5,squeeze(Perceptual_0_avg(1,qest,5)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(1,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;

    if counter == 1
        ylabel('Symptom severity (1-5)');
    end

    ylim([1,2.5]);
    xlim([0.5,5.5]);
    xticks([1:5]);
    xticklabels({'Baseline','Stimulation 1','Adaptation','Stimulation 2','Post-test'});
    set(gca,'box','off','FontSize',FontSize,'plotboxaspectratio',[1.3 1 1]);

end


% Average PHYSICAL symptoms over time
% calculations for the main session data
Just4lenses    = Physical_all(idx_04,:,:);
Physical_4_avg = mean(Just4lenses);
Physical_4_sd  = std(Just4lenses);
Physical_4_CI  = (1.96 .* Physical_4_sd) ./ sqrt(20);
% calculations for the control session data
Just0lenses    = Physical_all(idx_00,:,:);
Physical_0_avg = mean(Just0lenses);
Physical_0_sd  = std(Just0lenses);
Physical_0_CI  = (1.96 .* Physical_0_sd) ./ sqrt(20);


f1 = figure; hold on;
f1.Position = [100 40 1170 635];
counter = 0;
xnum = 5;

% loop over questions
for qest = 1:3 

    counter = counter + 1;

    subplot(1,3,counter); hold on;

    title(physical_symp_str{qest});

    % shaded region
    II=patch([x2_b3 fliplr(x2_b3)],[y4_b3 fliplr(y5_b3)], 'k', 'LineStyle','none');II.FaceAlpha = alpha_box; %red shaded region to indicate adaptation

    % Plot data - Just draw the lines
    Day_00                 = plot(1:xnum,squeeze(Physical_0_avg(1,qest,1:xnum)),'-','Color',colorVec(1,:),'LineWidth',LineWidth);
    Er                     = errorbar(1:xnum, squeeze(Physical_0_avg(1,qest,1:xnum)), -squeeze(Physical_0_CI(1,qest,1:xnum)),...
                             squeeze(Physical_0_CI(1,qest,1:xnum))); Er.Color=[0 0 0]; Er.LineStyle = "none";
    Day_00.MarkerEdgeColor = colorVec(1,:); %specify color of the markers

    Day_04                 = plot(1:xnum,squeeze(Physical_4_avg(1,qest,1:xnum)),'-','Color',colorVec(2,:),'LineWidth',LineWidth);
    Er                     = errorbar(1:xnum, squeeze(Physical_4_avg(1,qest,1:xnum)), -squeeze(Physical_4_CI(1,qest,1:xnum)),...
                             squeeze(Physical_4_CI(1,qest,1:xnum))); Er.Color=[0 0 0]; Er.LineStyle = "none";
    Day_04.MarkerEdgeColor = colorVec(2,:);

    % Plot the vlaues for the 04 lenses. Plotting the circles
    % separately so that the first and last points do not have circles
    Day_04 = plot(2:4,squeeze(Physical_4_avg(1,qest,2:4)),'o','Color','k',"MarkerFaceColor",colorVec(2,:),"MarkerEdgeColor",colorVec(2,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day_00 = plot(2:4,squeeze(Physical_0_avg(1,qest,2:4)),'o','Color','k',"MarkerFaceColor",colorVec(1,:),"MarkerEdgeColor",colorVec(1,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;

    % Plot open circles on the first and last data point
    Day_04 = plot(1,squeeze(Physical_4_avg(1,qest,1)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(2,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day_04 = plot(5,squeeze(Physical_4_avg(1,qest,5)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(2,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day_00 = plot(1,squeeze(Physical_0_avg(1,qest,1)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(1,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day_00 = plot(5,squeeze(Physical_0_avg(1,qest,5)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(1,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;

    if counter == 1
        ylabel('Symptom severity (1-5)');
    end
    ylim([1,2.5]);
    xlim([0.5,5.5]);
    xticks([1:5]);
    xticklabels({'Baseline','Stimulation 1','Adaptation','Stimulation 2','Post-test'});
    set(gca,'box','off','FontSize',FontSize,'plotboxaspectratio',[1.3 1 1]);

end

% Naturalistic symptoms before and after adaptation
% Was the naturalistic task worse or better after adaptation?
% Take the difference score between the first and second adaptation. 
% Positive would mean that the post has more symptoms than the pre. 

%Physical symptoms
Physical_nat_after_dif_unordered = Physical_npo_after - Physical_npre_after;
Physical_nat_after_dif_00        = Physical_nat_after_dif_unordered(idx_00,:);
Physical_nat_after_dif_04        = Physical_nat_after_dif_unordered(idx_04,:);
Physical_nat_after_dif           = cat(3,Physical_nat_after_dif_00,Physical_nat_after_dif_04); %concatinate in the third dimention col=symptom  3rd=00,04
Physical_nat_after_dif_mean      = mean(Physical_nat_after_dif);
Physical_nat_after_dif_sd        = std(Physical_nat_after_dif);
Physical_nat_after_dif_ci        = (1.96.*Physical_nat_after_dif_sd)./sqrt(20);

%Perceptual symptoms
Perceptual_nat_after_dif_unordered = Perceptual_npo_after - Perceptual_npre_after;
Perceptual_nat_after_dif_00        = Perceptual_nat_after_dif_unordered(idx_00,:);
Perceptual_nat_after_dif_04        = Perceptual_nat_after_dif_unordered(idx_04,:);
Perceptual_nat_after_dif           = cat(3,Perceptual_nat_after_dif_00,Perceptual_nat_after_dif_04); %concatinate in the third dimention col=symptom  3rd=00,04
Perceptual_nat_after_dif_mean      = mean(Perceptual_nat_after_dif);
Perceptual_nat_after_dif_sd        = std(Perceptual_nat_after_dif);
Perceptual_nat_after_dif_ci        = (1.96.*Perceptual_nat_after_dif_sd)./sqrt(20);

f4 = figure; hold on;
f4.Position  = [100 40 1015 355]; %determines the size of the figure so that it is the same each time.
for thisplot = 1:2 %loop over physical or perceptual symtptoms

    dataoffset = 1; %x distance between the 00 and 04 data
    barwidth   = 0.3;

    if thisplot == 1 %physical symptoms
        thisdata  = Physical_nat_after_dif_mean;
        thisx     = linspace(1,7,length(thisdata));
        thissd    = Physical_nat_after_dif_sd;
        thisci    = Physical_nat_after_dif_ci;
        thisticks = thisx+(dataoffset./2); %we want the x labels to be between the values
    else %perceptual symptoms
        thisdata  = Perceptual_nat_after_dif_mean(:,1:6,:); %except eyestrain and neck pain
        thisx     = linspace(1,20,length(thisdata));
        thissd    = Perceptual_nat_after_dif_sd(:,1:6,:);
        thisci    = Perceptual_nat_after_dif_ci(:,1:6,:);
        thisticks = thisx + (dataoffset./2); %we want the x labels to be between the values
    end

    subplot(1,2,thisplot); hold on;
    plot(-1:13,zeros(1,15),'k-');

    for len = 1:2

        % offset the x positions if lens = 2
        if len == 2
            thisx = thisx + dataoffset;
        end
        
        bar(thisx,thisdata(:,:,len),barwidth,'FaceColor',colorVec(len,:),'EdgeColor','none');
        Er = errorbar(thisx,thisdata(:,:,len), -thisci(:,:,len), thisci(:,:,len)); Er.Color=[0 0 0]; Er.LineStyle = "none";
    end

    if thisplot == 1 %physical
        xticks(thisticks);
        xticklabels({'Headache','Dizziness','Nausea'});
        ylabel('Symptom differences (after adapt - before adapt)');
        title('Physical symptoms');
        set(gca,'box','off','FontSize',FontSize);
        xlim([0,9]);
        ylim([-0.4,1]);

    elseif thisplot == 2 %perceptual
        xticks(thisticks);
        xticklabels({'Obj. interaction','Obj. distorted','Obj. location ','Visual swim','Blurry vision','Double vision','Eyestrain'});
        ylabel('Symptom differences (after adapt - before adapt)');
        title('Perceptual symptoms');
        set(gca,'box','off','FontSize',FontSize);
        xlim([0,22]);    
        ylim([-0.4,1]);  
    end
end


% Eyestrain

f6 = figure; hold on;
f6.Position = [100 40 1015 355]; %determines the size of the figure so that it is the same each time.

title('Eyestrain');

counter = 0;
xnum = 5;

% just plot eyestrain question
for qest = 7 

    counter = counter + 1;

    % shaded region
    II=patch([x2_b3 fliplr(x2_b3)],[y4_b3 fliplr(y5_b3)], 'k', 'LineStyle','none');II.FaceAlpha = alpha_box; %red shaded region to indicate adaptation

    % Plot data - Just draw the lines
    Day_00                 = plot(1:xnum,squeeze(Perceptual_0_avg(1,qest,1:xnum)),'-','Color',colorVec(1,:),'LineWidth',LineWidth);
    Er                     = errorbar(1:xnum, squeeze(Perceptual_0_avg(1,qest,1:xnum)), -squeeze(Perceptual_0_CI(1,qest,1:xnum)),...
                             squeeze(Perceptual_0_CI(1,qest,1:xnum))); Er.Color=[0 0 0]; Er.LineStyle = "none";
    Day_00.MarkerEdgeColor = colorVec(1,:); %specify color of the markers

    Day_04                 = plot(1:xnum,squeeze(Perceptual_4_avg(1,qest,1:xnum)),'-','Color',colorVec(2,:),'LineWidth',LineWidth);
    Er                     = errorbar(1:xnum, squeeze(Perceptual_4_avg(1,qest,1:xnum)), -squeeze(Perceptual_4_CI(1,qest,1:xnum)),...
                             squeeze(Perceptual_4_CI(1,qest,1:xnum))); Er.Color=[0 0 0]; Er.LineStyle = "none";
    Day_04.MarkerEdgeColor = colorVec(2,:);

    % Plot the vlaues for the 04 lenses. Plotting the circles
    % separately so that the first and last points do not have circles
    Day_04m = plot(2:4,squeeze(Perceptual_4_avg(1,qest,2:4)),'o','Color','k',"MarkerFaceColor",colorVec(2,:),"MarkerEdgeColor",colorVec(2,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day_00m = plot(2:4,squeeze(Perceptual_0_avg(1,qest,2:4)),'o','Color','k',"MarkerFaceColor",colorVec(1,:),"MarkerEdgeColor",colorVec(1,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;

    % Plot open circles on the first and last data point
    Day04 = plot(1,squeeze(Perceptual_4_avg(1,qest,1)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(2,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day04 = plot(5,squeeze(Perceptual_4_avg(1,qest,5)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(2,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day00 = plot(1,squeeze(Perceptual_0_avg(1,qest,1)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(1,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;
    Day00 = plot(5,squeeze(Perceptual_0_avg(1,qest,5)),'o','Color','k',"MarkerFaceColor","none","MarkerEdgeColor",colorVec(1,:),"MarkerSize",MarkerSize,"LineWidth",LineWidthMarker); hold on;


    if counter == 1
        ylabel('Symptom severity (1-5)');
    end
    ylim([1,2.8]);
    xlim([0.5,5.5]);
    xticks([1:5]);
    xticklabels({'Baseline','Stimulation 1','Adaptation','Stimulation 2','Post-test'});
    set(gca,'box','off','FontSize',FontSize,'plotboxaspectratio',[1.3 1 1]);
   legend([Day_00,Day_04],'Control','Main');

end

%% Post hoc correlational tests

% Fusional reserve and eye strain

% Make a fusional
%reserve metric (average 8 fusional reserve values for each subject:
%convergent 40cm, divergent 40cm, convergent 6m, divergent 6m X horizontal
%and vertical
FR_metric = mean([Vert_FR_6m_break,Horez_FR_6m_break,Vert_FR_40cm_break,Horez_FR_40cm_break],2);

% Use eye strain from the adaptation task
Eyestrain_exp = Perceptual_adapt(idx_04,7); %experimental session
Eyestrain_con = Perceptual_adapt(idx_00,7); %control session

%Plot fusional reserve metric and eye strain produced in the experimental
%session and control session.
figure, hold on;
for session = 1:2

    subplot(1,2,session); hold on;

    if session == 1
        thisdata = Eyestrain_con;
        title('Control session');
    elseif session == 2
        thisdata = Eyestrain_exp;
         title('Experimental session');
    end

    scatter(FR_metric, thisdata,MarkerSize,"o","MarkerFaceColor",colorVec(session,:),"MarkerEdgeColor",colorVec(session,:));

    %least squares line
    h1 = lsline;
    h1.Color = 'r';

    %calculate correlation between double vision and
    %fusional reserve. Note: I had to add a column of ones
    [b,bint,r,rint,stats] = regress(thisdata, [ones(20,1),FR_metric]);
    pval                  = strcat('p = ', num2str(stats(3)));
    r_squared             = strcat('r^2 = ', num2str(stats(1)));
    text(2,4.5,r_squared);
    text(2,4,pval);

    xlabel('Fusional reserve metric');
    ylabel('Eyestrain in the adaptation task');
    ylim([1,5]);
    xlim([0,14.5]);

end

% Fusional reserve and double vision

% we just use double vision from the adaptation task
Double_exp = Perceptual_adapt(idx_04,6); %experimental session
Double_con = Perceptual_adapt(idx_00,6); %control session

figure, hold on;
for session = 1:2

    subplot(1,2,session); hold on;

    if session == 1
        thisdata = Double_con;
        title('Control session');
    elseif session == 2
        thisdata = Double_exp;
         title('Experimental session');
    end

    scatter(FR_metric, thisdata,MarkerSize,"o","MarkerFaceColor",colorVec(session,:),"MarkerEdgeColor",colorVec(session,:));

    %least squares line
    h1 = lsline;
    h1.Color = 'r';

    %calculate correlation between double vision and
    %fusional reserve. Note: I had to add a column of ones
    [b,bint,r,rint,stats] = regress(thisdata, [ones(20,1),FR_metric]);
    pval                  = strcat('p = ', num2str(stats(3)));
    r_squared             = strcat('r^2 = ', num2str(stats(1)));
    text(2,2.4,r_squared);
    text(2,2.2,pval);

    xlabel('Fusional reserve metric');
    ylabel('Double Vision in the adaptation task');
    ylim([1,2.5]);
    xlim([0,14.5]);

end

% MSSQ and symptoms (nausea, dizziness)

% nausea
Nausea_exp = Physical_adapt(idx_04,3); %experimental session
Nausea_con = Physical_adapt(idx_00,3); %control session

figure, hold on;
for session = 1:2

    subplot(1,2,session); hold on;

    if session == 1
        thisdata = Nausea_con;
        title('Control session');
    elseif session == 2
        thisdata = Nausea_exp;
         title('Experimental session');
    end

    scatter(MSSQ, thisdata,MarkerSize,"o","MarkerFaceColor",colorVec(session,:),"MarkerEdgeColor",colorVec(session,:));

    %least squares line
    h1 = lsline;
    h1.Color = 'r';

    %calculate correlation
    [b,bint,r,rint,stats] = regress(thisdata, [ones(20,1),MSSQ]);
    pval                  = strcat('p = ', num2str(stats(3)));
    r_squared             = strcat('r^2 = ', num2str(stats(1)));
    text(2,4.5,r_squared);
    text(2,4,pval);

    xlabel('MSSQ');
    ylabel('Nausea in the adaptation task');
    ylim([1,5]);
    xlim([0,14.5]);

end


% dizziness
Dizz_exp = Physical_adapt(idx_04,2); %experimental session
Dizz_con = Physical_adapt(idx_00,2); %control session

figure, hold on;
for session = 1:2

    subplot(1,2,session); hold on;

    if session == 1
        thisdata = Dizz_con;
        title('Control session');
    elseif session == 2
        thisdata = Dizz_exp;
         title('Experimental session');
    end

    scatter(MSSQ, thisdata,MarkerSize,"o","MarkerFaceColor",colorVec(session,:),"MarkerEdgeColor",colorVec(session,:));

    %least squares line
    h1       = lsline;
    h1.Color = 'r';

    %calculate correlation
    [b,bint,r,rint,stats] = regress(thisdata, [ones(20,1),MSSQ]);
    pval                  = strcat('p = ', num2str(stats(3)));
    r_squared             = strcat('r^2 = ', num2str(stats(1)));
    text(2,4.5,r_squared);
    text(2,4,pval);

    xlabel('MSSQ');
    ylabel('Dizziness in the adaptation task');
    ylim([1,5]);
    xlim([0,14.5]);

end



