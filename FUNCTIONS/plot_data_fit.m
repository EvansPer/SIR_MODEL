function plot_data_fit(time,t,y,model_D_vs_R,model_D,model_recovered,model_total_infected)

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



%     plot(t,y);
%     legend("Susceptibles","Infeted","Removed");
%     
%     R_e = y(:,1).*a/b;
%     figure;
%     plot(t,R_e,"o");
%     legend("R_e");  
%     
%     
%     figure;
%     plot(time,new_positives,"+");
%     legend("New pos"); 
    
    
%     
%     figure;
%     plot(total_removals,deaths,"*");
%     hold on;
%     plot(model_D_vs_R);
%     
%     hold off;
%     
%     
%     
%     figure;
%     plot(time,deaths,"diamond"); hold on;
%     plot(t,model_D,"--");
%     hold off;
%     legend("Deaths","Fit D(R_m)");  
    
  
end