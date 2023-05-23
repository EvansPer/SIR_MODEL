function test_SIR_simulation_validation()

% This test verifies that, provided some real variables generated by
% a SIR simulation, by calling the functions in "SIR_simulation" the proper results are returned:

% Test 1
% - sir_parame_determination returns the correct y matrix.

% Test 2
% - model_R returns the proper vector size

% If that's not the case, an error message arises.

% INIT PARAMETERS:
% - active_infection_exp: 1xm column vector (m >= duration) containing real
%   values of a simulation 
% - new_positives_exp: 1xm column vector (m >= duration) containing real
%   values of a simulation 
% - recoveres_exp: 1xm column vector (m >= duration) containing real
%   values of a simulation 
% - deaths_exp: 1xm column vector (m >= duration) containing real
%   values of a simulation 
% - data: mx10 matrix containing all previous vectors and vectors of zeros
%   to reach the dimension 10 
% - duration: int positive number determining the window time analysis
% - tspan: 1x2 row vector with initial and final time
% - y0: 1x3 row vector containing ODE Cauchy problem initial condition of the SIR model
% - options: non mandatory, structure that sets the upper bound for the step size integration
% - A,B: 1xn (n generic) vectors containing the increasing and decreasing expnential parameters
% - threshold: float positive number set to identify A and B (if set to
%   small, convergence may not be reached). It defines the accuracy of the superposition 
%   between the raw data and the model generated by the function sir_param_determination. 
    
    addpath(genpath(fullfile(pwd,"..","FUNCTIONS")));
    
    active_infection_exp = [221	311	385	588	821	1049	1577	1835	2263	2706	3296	3916	5061	6387	7985	8514	10590	12839	14955	17750	20603	23073	26062	28710	33190	37860	42681	46638	50418	54030	57521	62013	66414	70065	73880	75528	77635	80572	83049	85388	88274	91246	93187	94067	95262	96877	98273	100269	102253	103616	104291	105418	106607	106962	107771	108257	108237	107709	107699	106848	106527	105847	106103	105813	105205	104657	101551	100943	100704	100179	99980	98467	91528	89624	87961	84842	83324	82488	81266	78457	76440	72070	70187	68351	66553	65129	62752	60960	59322	57752	56594	55300	52942	50966	47986	46175	43691	42097	41367	39893	39297	38429	36976	35877	35262	34730	32872	31710	30637	28997	27485	26274	25909	24569	23925	23101	21543	21212	20972	20637	19573	18655	18303	17638	16836	16681	16496	15563	15255	15060	14884	14621	14642	14709	14242	13595	13459	13428	13303	13179	13157	12919	12493	12473	12456	12368	12440	12404	12248	12322	12404	12301	12442	12565	12581	12609	12616	12230	12422	12457	12456	12474	12482	12646	12694	12924	12953	13263	13368	13561	13791	14081	14249	14406	14733	14867	15089	15360	16014	16678	17503	18438	19195	19714	20753	21932	23035	24156	25205	26078	26754	27817	28915	30099	31194	32078	32993	33789	34734];
    new_positives_exp = [221	93	78	250	238	240	566	342	466	587	769	778	1247	1492	1797	977	2313	2651	2547	3497	3590	3233	3526	4207	5322	5986	6557	5560	4789	5249	5210	6153	5959	5974	5217	4050	4053	4782	4668	4585	4805	4316	3599	3039	3836	4204	3951	4694	4092	3153	2972	2667	3786	3493	3491	3047	2256	2729	3370	2646	3021	2357	2324	1739	2091	2086	1872	1965	1900	1389	1221	1075	1444	1401	1327	1083	802	744	1402	888	992	789	875	675	451	813	665	642	652	669	531	300	397	584	593	516	416	355	178	318	321	177	518	270	197	280	283	202	379	163	346	338	303	210	329	333	251	262	224	218	122	190	296	259	175	174	126	142	187	201	223	235	192	208	138	193	229	276	188	234	169	114	163	230	233	249	219	190	129	282	306	252	275	255	170	212	289	386	379	295	239	159	190	384	402	552	347	463	259	412	481	523	574	629	479	320	403	642	845	947	1071	1210	953	878	1367	1411	1462	1444	1365	996	978	1326	1397	1733	1694	1297	1108	1370	1434];
    recovers_exp = [1	1	3	45	46	50	83	149	160	276	414	523	589	622	724	1004	1045	1258	1439	1966	2335	2749	2941	4025	4440	5129	6072	7024	7432	8326	9362	10361	10950	12384	13030	14620	15729	16847	18278	19758	20996	21815	22837	24392	26491	28470	30455	32534	34211	35435	37130	38092	40164	42727	44927	47055	48877	51600	54543	57576	60498	63120	64928	66624	68941	71252	75945	78249	79914	81654	82879	85231	93245	96276	99023	103031	105186	106587	109039	112541	115288	120205	122810	125176	127326	129401	132282	134560	136720	138840	140479	141981	144658	147101	150604	152844	155633	157507	158355	160092	160938	161895	163781	165078	165837	166584	168646	169939	171338	173085	174865	176370	177010	178526	179455	180544	181907	182453	182893	183426	184585	186111	186725	187615	188584	188891	189196	190248	190717	191083	191467	191944	192108	192241	192815	193640	193978	194273	194579	194928	195106	195441	196016	196246	196483	196806	196949	197162	197431	197628	197842	198192	198320	198446	198593	198756	199031	199796	199974	200229	200460	200589	200766	200976	201323	201642	201947	202098	202248	202461	202697	202923	203326	203640	203786	203968	204142	204506	204686	204960	205203	205470	205662	206015	206329	206554	206902	207224	207536	207653	207944	208201	208490	209027	209610	210015	210238	210801	211272];
    deaths_exp = [7	10	12	17	21	29	34	52	79	107	148	197	233	366	463	631	827	1016	1266	1441	1809	2158	2503	2978	3405	4032	4825	5476	6077	6820	7503	8165	9134	10023	10779	11591	12428	13155	13915	14681	15362	15887	16523	17127	17669	18279	18849	19468	19899	20465	21067	21645	22170	22745	23227	23660	24114	24648	25085	25549	25969	26384	26644	26977	27359	27682	27967	28236	28710	28884	29079	29315	29684	29958	30201	30395	30560	30739	30911	31106	31368	31610	31763	31908	32007	32169	32330	32486	32616	32735	32785	32877	32955	33072	33142	33229	33340	33415	33475	33530	33601	33689	33774	33846	33899	33964	34043	34114	34167	34223	34301	34345	34371	34405	34448	34514	34561	34610	34634	34657	34675	34644	34678	34708	34716	34738	34744	34767	34788	34818	34833	34854	34861	34869	34899	34914	34926	34938	34945	34954	34967	34984	34997	35017	35028	35042	35045	35058	35073	35082	35092	35097	35102	35107	35112	35123	35129	35132	35141	35146	35154	35166	35171	35181	35187	35190	35203	35205	35209	35215	35225	35231	35234	35392	35396	35400	35405	35412	35418	35427	35430	35437	35441	35445	35458	35463	35472	35473	35477	35483	35491	35497	35507	35518	35533	35541	35553	35563	35577];
    n = length(active_infection_exp);

    data =  [linspace(1,n,n)',zeros(n,1),zeros(n,1),zeros(n,1),zeros(n,1),active_infection_exp',zeros(n,1),new_positives_exp',recovers_exp',deaths_exp'];
    
    duration = 161;
    tspan = [0 161];
    y0 = [0.999 0.001 0];
    options = odeset("MaxStep",4.1); 
    A = 0:0.01:1;                    
    B = 0:0.001:0.1;                 
    threshold = 0.007; 
   
    [new_positives,active_infections,total_removals,total_infected,deaths,recovers] = normalization(data,duration);
    [t,y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);
    [model_D_vs_R, model_D, model_recovered] = model_R(y,total_removals,deaths);
    

    % Test 1 
    assert(all(y(:,1) - y0(1) < 1e-10), "Error: Initial conditions of y are incorrect");
    assert(all(y(:,1) >= 0), "Error: S(t) contains negative values");
    
    % Test 2 
    assert(isequal(size(model_D), [161 1]), "Error: model_D vector has incorrect size");
       
    

end
