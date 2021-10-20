% PULSELAB - <a comprehensive MATLAB toolbox that covers all the necessary steps 
% for estimating the blood pressure from raw electrocardiogram (ECG) and 
% photoplethysmogram (PPG) signals, using pulse wave velocity (PWV)-based
% models>
%     ©2021 Rutgers, The State University of New Jersey.  Written by <Weinan Wang>
%   
%      This file is part of PULSELAB.
%  
%     PULSELAB is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%  
%     PULSELAB is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%  
%     You should have received a copy of the GNU General Public License
%     along with PULSELAB.  If not, see <https://www.gnu.org/licenses/>.
% 
classdef MBP<matlab.mixin.Copyable
    properties
        S_Par
        D_Par
    end
    methods(Static)
        function [Name,SaveName]=Instruct()
            Name='MBP=x1+2/0.031*ln(x2/PAT),PP=x3*(x1/PAT)^2';
            SaveName='Evaluated_BP_MBP.mat';
        end
    end
    
    methods
        function obj =MBP()
            obj.S_Par=[];
            obj.D_Par=[];
        end
        
        function obj = Fit(obj,PAT,SBP,DBP)
            PP=SBP-DBP;
            MBP=1/3*SBP+2/3*DBP;
            
            lnPAT=log(PAT);
            REVPAT=(1./PAT).^2;
            
            A=polyfit(lnPAT,MBP,1);
            B=polyfit(REVPAT,PP,1);
            
            obj.S_Par=[A(1),A(2)];
            obj.D_Par=[B(1),B(2)];
        end
        
        function [estSBP,estDBP] = Predict(obj,PAT)
            estMBP=obj.S_Par(1)*log(PAT)+obj.S_Par(2);
            estPP=obj.D_Par(1)*(1./PAT).^2+obj.D_Par(2);
            
            estBP=[1/3,2/3;1,-1]^-1*[estMBP';estPP'];
            estSBP=estBP(1,:)';
            estDBP=estBP(2,:)';
        end
        
        function [SBPMsg,DBPMsg]=PrintModel(obj)
                    SBPMsg=['MBP=' num2str(obj.S_Par(1),3) '*log(PAT)+' num2str(obj.S_Par(2),3)];
                    DBPMsg=['PP=' num2str(obj.D_Par(1),3) '*1/(PAT^2)+' num2str(obj.D_Par(2),3)];
        end
    end
end