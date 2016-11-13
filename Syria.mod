set COUNTRIES;
/* countries */

set OCCUPATIONS;
/* occupation */

param demand{i in COUNTRIES, j in OCCUPATIONS};
/* occupation j demanded in country i*/

param supply{j in OCCUPATIONS};
/* occupation j available in Syria and supply to europe */

param accepted_limit{i in COUNTRIES};
/* accepted refugees in country i*/

param priority_C{i in COUNTRIES, j in OCCUPATIONS};
/* priority of occupation i in country j, calculated for all occupations in one country - row way */

param priority_O{i in COUNTRIES, j in OCCUPATIONS};
/* priority of occupation i in country j, calculated for all countries according to one occupation - column way */

param total_demand{j in OCCUPATIONS};
/* total demand for one occupation in all countries */

var x{i in COUNTRIES, j in OCCUPATIONS} >=0 integer;
/* number of refugees for occupation j in country i*/

maximize syria: sum{i in COUNTRIES, j in OCCUPATIONS} x[i,j];
/* total occupation allocated to refugees in country i */

s.t. accpeted_constraint{i in COUNTRIES}: sum{j in OCCUPATIONS} x[i,j] <= accepted_limit[i];
/* number of refugees ACCEPTED in country i according to its politic*/

s.t. demanded_constraint{i in COUNTRIES, j in OCCUPATIONS}: x[i,j] <= demand[i,j];
/* number of occupation i DEMANED in country j */

s.t. supply_constraint{j in OCCUPATIONS}: sum{i in COUNTRIES} x[i,j] <= supply[j];
/* number of occupation j which Syria able to SUPPLY to euro */

s.t. proportionC_constraint{i in COUNTRIES, j in OCCUPATIONS}: x[i,j] <= priority_C[i,j]*accepted_limit[i];
/* proportion of occupations in each country */

s.t. proportionO_constraint{i in COUNTRIES, j in OCCUPATIONS}: x[i,j] <= priority_O[i,j]*total_demand[j];
/* proportion of an occupation for all countries  */

solve;

display x;

display syria;

data;

set COUNTRIES:= Austria Belgium Bulgaria Croatia Cyprus Czech-Republic Denmark Estonia Finland France Germany Greece Hungary
Ireland Italy Latvia Lithuania Luxembourg Malta Netherlands Poland Portugal Romania Slovakia Slovenia Spain Sweden United-Kingdom;

set OCCUPATIONS:= Managers 	Professionals Technicians Clerks Service-Workers Skilled-Workers Craft Plant-Operators Elementary;

param demand:
                Managers 	Professionals 	Technicians Clerks	Service-Workers	Skilled-Workers	Craft		Plant-Operators	Elementary :=
Austria  				106000		336400					290700			77700		249900					146700					78000		78000						190700
Belgium					227600		446200					348500			154800	229000					37300						72000		72000						190100
Bulgaria				106200		277900					217700			129200	285400					196400					158500	158500					288000
Croatia					22600			29200						24600				19200		36300						3900						18500		18500						38800
Cyprus 					158300		350100					539300			168900	237700					21700						230700	230700					112700
Czech-Republic	1080700		3715100					3614900			2060500	2259700					452800					1362900	1362900					2060500
Denmark 				60900			542700					377800			80500		195300					27500						104500	104500					133900
Estonia					31600			74000						48500				25200		38400						5900						34700		34700						45600
Finland					81200			281300					147800			126200	280600					318900					148800	148800					133400
France					578100		1016800					1134700			678000	1506500					225700					668200	668200					908600
Germany					60300			330500					242100			75400		179300					81200						147600	147600					124700
Greece					1153300		2440500					2169000			426300	1512800					485100					515900	515900					1938900
Hungary					58500			233800					208400			82900		76500						63300						134100	134100					77800
Ireland					128100		372400					276600			94100		167300					17700						120500	120500					168100
Italy						111100		192300					137500			66600		136800					55700						148800	148800					114600
Latvia					1006300		2138900					1949400			986400	717900					278100					779700	779700					1138000
Lithuania				49200			164800					110200			12100		70300						65400						84400		84400						62700
Luxembourg			8900			68500						38000				25500		14600						4000						11600		11600						13100
Malta						46700			98000						65600				29000		63400						13100						60700		60700						65300
Netherlands			11600			16400						11400				8700		14200						1200						6900		6900						7000
Poland					392000		1136200					666300			383600	662000					81900						267600	267600					332500
Portugal				651900		1098900					853200			293900	380100					377300					597400	597400					522700
Romania					242800		284200					195200			86900		317000					372000					162000	162000					318000
Slovakia				54700			453800					203900			121600	356700					1742200					124300	124300					601100
Slovenia				207900		697000					476100			95200		457100					85800						204400	204400					131500
Spain						48400			94400						47500				9600		18900						15100						27500		27500						67900
Sweden					69800			112300					193400			54200		147300					5200						103800	103800					77600
United-Kingdom	2334600		3104700					2410700			1027900	2309300					512600					1013300	1013300				1949800;


param priority_C:
                Managers 	Professionals 	Technicians Clerks	Service-Workers	Skilled-Workers	Craft		Plant-Operators	Elementary :=
Austria  				0.068			0.216						0.187				0.050		0.161						0.094						0.050		0.050						0.123
Belgium					0.128			0.251						0.196				0.087		0.129						0.021						0.041		0.041						0.107
Bulgaria				0.058			0.153						0.120				0.071		0.157						0.108						0.087		0.087						0.158
Croatia					0.107			0.138						0.116				0.091		0.172						0.018						0.087		0.087						0.183
Cyprus 					0.077			0.171						0.263				0.082		0.116						0.011						0.113		0.113						0.055
Czech-Republic	0.060			0.207						0.201				0.115		0.126						0.025						0.076		0.076						0.115
Denmark 				0.037			0.333						0.232				0.049		0.120						0.017						0.064		0.064						0.082
Estonia					0.093			0.219						0.143				0.074		0.113						0.017						0.102		0.102						0.135
Finland					0.049			0.169						0.089				0.076		0.168						0.191						0.089		0.089						0.080
France					0.078			0.138						0.154				0.092		0.204						0.031						0.090		0.090						0.123
Germany					0.043			0.238						0.174				0.054		0.129						0.058						0.106		0.106						0.090
Greece					0.103			0.219						0.194				0.038		0.136						0.043						0.046		0.046						0.174
Hungary					0.055			0.219						0.195				0.078		0.072						0.059						0.125		0.125						0.073
Ireland					0.087			0.254						0.189				0.064		0.114						0.012						0.082		0.082						0.115
Italy						0.100			0.173						0.124				0.060		0.123						0.050						0.134		0.134						0.103
Latvia					0.103			0.219						0.199				0.101		0.073						0.028						0.080		0.080						0.116
Lithuania				0.070			0.234						0.157				0.017		0.100						0.093						0.120		0.120						0.089
Luxembourg			0.045			0.350						0.194				0.130		0.075						0.020						0.059		0.059						0.067
Malta						0.093			0.195						0.131				0.058		0.126						0.026						0.121		0.121						0.130
Netherlands			0.138			0.195						0.135				0.103		0.168						0.014						0.082		0.082						0.083
Poland					0.094			0.271						0.159				0.092		0.158						0.020						0.064		0.064						0.079
Portugal				0.121			0.205						0.159				0.055		0.071						0.070						0.111		0.111						0.097
Romania					0.113			0.133						0.091				0.041		0.148						0.174						0.076		0.076						0.149
Slovakia				0.014			0.120						0.054				0.032		0.094						0.461						0.033		0.033						0.159
Slovenia				0.081			0.272						0.186				0.037		0.179						0.034						0.080		0.080						0.051
Spain						0.136			0.265						0.133				0.027		0.053						0.042						0.077		0.077						0.190
Sweden					0.080			0.129						0.223				0.062		0.170						0.006						0.120		0.120						0.089
United-Kingdom	0.149			0.198						0.154				0.066		0.147						0.033						0.065		0.065						0.124;

param priority_O:
                Managers 	Professionals 	Technicians 	Clerks		Service-Workers		Skilled-Workers		Craft			Plant-Operators		Elementary :=
Austria  				0.012			0.017			      0.017		      0.010			0.019							0.026							0.011			0.011							0.016
Belgium					0.025			0.022			      0.021					0.021			0.018							0.007							0.010			0.010							0.016
Bulgaria				0.012			0.014			      0.013					0.017			0.022							0.034							0.021			0.021							0.024
Croatia					0.002			0.001			      0.001					0.003			0.003							0.001							0.003			0.003							0.003
Cyprus 					0.017			0.017			      0.032					0.023			0.018							0.004							0.031			0.031							0.010
Czech-Republic	0.119			0.185			      0.213					0.278			0.175							0.080							0.184			0.184							0.174
Denmark					0.007			0.027			      0.022					0.011			0.015							0.005							0.014			0.014							0.011
Estonia					0.003			0.004			      0.003					0.003			0.003							0.001							0.005			0.005							0.004
Finland					0.009			0.014			      0.009					0.017			0.022							0.056							0.020			0.020							0.011
France					0.064			0.051			      0.067					0.092			0.117							0.040							0.090			0.090							0.077
Germany					0.007			0.016			      0.014					0.010			0.014							0.014							0.020			0.020							0.011
Greece					0.127			0.121			      0.128					0.058			0.117							0.085							0.070			0.070							0.164
Hungary					0.006			0.012			      0.012					0.011			0.006							0.011							0.018			0.018							0.007
Ireland					0.014			0.019			      0.016					0.013			0.013							0.003							0.016			0.016							0.014
Italy					  0.012			0.010			      0.008					0.009			0.011							0.010							0.020			0.020							0.010
Latvia					0.111			0.106			      0.115					0.133			0.056							0.049							0.106			0.106							0.096
Lithuania				0.005			0.008			      0.006					0.002			0.005							0.011							0.011			0.011							0.005
Luxembourg			0.001			0.003			      0.002					0.003			0.001							0.001							0.002			0.002							0.001
Malta					  0.005			0.005			      0.004					0.004			0.005							0.002							0.008			0.008							0.006
Netherlands			0.001			0.001			      0.001					0.001			0.001							0.000							0.001			0.001							0.001
Poland					0.043			0.057			      0.039					0.052			0.051							0.014							0.036			0.036							0.028
Portugal				0.072			0.055			      0.050					0.040			0.029							0.066							0.081			0.081							0.044
Romania					0.027			0.014			      0.011					0.012			0.025							0.065							0.022			0.022							0.027
Slovakia				0.006			0.023			      0.012					0.016			0.028							0.306							0.017			0.017							0.051
Slovenia				0.023			0.035			      0.028					0.013			0.035							0.015							0.028			0.028							0.011
Spain					  0.005			0.005			      0.003					0.001			0.001							0.003							0.004			0.004							0.006
Sweden					0.008			0.006			      0.011					0.007			0.011							0.001							0.014			0.014							0.007
United-Kingdom	0.257			0.154			      0.142					0.139			0.179							0.090							0.137			0.137							0.165;

param total_demand:=
					Managers        9089300
					Professionals   20107300
					Technicians     16999000
					Clerks 					7400100
					Service-Workers 12920300
					Skilled-Workers 5693700
					Craft 					7387300
					Plant-Operators 7387300
					Elementary 			11813600;

param supply:=
          Managers        90092
          Professionals   599580
          Technicians     258462
						Clerks 					314716
					Service-Workers 728283
					Skilled-Workers 559273
					Craft 					1455589
					Plant-Operators 613813
					Elementary 			577571;

param accepted_limit:=
          Austria					4192
					Belgium					4656
					Bulgaria 				2000
					Croatia					2768
					Cyprus 					624
					Czech-Republic	4768
					Denmark					0
					Estonia					2816
					Finland					2752
					France					22672
					Germany					29472
					Greece					3040
					Hungary					2864
					Ireland					0
					Italy						18944
					Latvia					1936
					Lithuania				1856
					Luxembourg			1360
					Malta						1104
					Netherlands			6960
					Poland					9024
					Portugal				6224
					Romania					6000
					Slovakia				2848
					Slovenia				1840
					Spain						14560
					Sweden					4672
					United-Kingdom	0;
end;
