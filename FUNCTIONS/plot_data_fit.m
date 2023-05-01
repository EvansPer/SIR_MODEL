function plot_data_fit(time,t,y,model_D_vs_R,model_D,model_recovered,model_total_infected,R_e)

    load("Norm_dataset.mat","total_removals","new_positives","active_infections","deaths","recovers","total_infected","time");
    
    figure;

    subplot(2,2,1);
    plot(time,active_infections,"*","LineWidth",1); hold on;
    plot(t,y(:,2),"--","LineWidth",1); hold off;
    legend("Active infections","SIR I(t)","Location","east");
    grid on;

    subplot(2,2,2);
    plot(time,total_removals,".","LineWidth",1); hold on;
    plot(t,y(:,3),"--","LineWidth",1); hold off;
    legend("Removed","SIR R_m(t)","Location","east");
    grid on;

    subplot(2,2,3);
    plot(time,recovers,"o","LineWidth",1); hold on;
    plot(t,model_recovered,"--","LineWidth",1); hold off;
    legend("Recevers","Model R(t)","Location","east");
    grid on;

    subplot(2,2,4);
    plot(time,total_infected,"Marker","hexagram","LineWidth",1); hold on;
    plot(t,model_total_infected,"--","LineWidth",1); hold off;
    legend("Total infected","SIR I_T(t)","Location","east");
    grid on;
    
    if ~exist("GRAPHS","dir")
    mkdir("GRAPHS");
    end

    data_vs_model = fullfile("GRAPHS","data_vs_model.jpg");
    saveas(gcf, data_vs_model);
   

    figure;
    plot(t,y,"LineWidth",1);
    legend("Susceptibles","Infeted","Removed","Location","east");
    grid on;

    SIR_model = fullfile("GRAPHS","SIR_model.jpg");
    saveas(gcf, SIR_model);

    
    figure;
    plot(t,R_e,"o","LineWidth",1);
    legend("Reproductive rate","Location","east");  
    grid on;

    R_e = fullfile("GRAPHS","R_e.jpg");
    saveas(gcf, R_e);
    

    figure;

    subplot(1,2,1);
    plot(total_removals,deaths,"*","LineWidth",1);
    hold on;
    plot(model_D_vs_R);
    hold off;
    legend("Raw data","Fit model","Location","east")
    grid on;
    
    subplot(1,2,2);
    plot(time,deaths,"diamond","LineWidth",1); hold on;
    plot(t,model_D,"--","LineWidth",1);
    hold off;
    legend("Deaths","Fit D(R_m)","Location","east");  
    grid on;
    
    model_R_plot = fullfile("GRAPHS","model_R_plot.jpg");
    saveas(gcf, model_R_plot);

end