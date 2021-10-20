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
classdef Linear<handle
    properties
        S_Par
        D_Par
    end
    methods(Static)
        function [Name,SaveName]=Instruct()
            Name='BP=m*PAT+c';
            SaveName='Evaluated_BP_LINEAR.mat';
        end
    end
    methods
        function obj =Linear()
            obj.S_Par=[];
            obj.D_Par=[];
        end
        
        function obj = Fit(obj,PAT,SBP,DBP)
            obj.S_Par=polyfit(PAT,SBP,1);
            obj.D_Par=polyfit(PAT,DBP,1);
        end
        
        function [estSBP,estDBP] = Predict(obj,PAT)
            estSBP=obj.S_Par(1)*PAT+obj.S_Par(2);
            estDBP=obj.D_Par(1)*PAT+obj.D_Par(2);
        end
        
                function [SBPMsg,DBPMsg]=Printmodel(obj)
                    SBPMsg=['SBP=' num2str(obj.S_Par(1),3) '*PAT+' num2str(obj.S_Par(2),3)];
                    DBPMsg=['DBP=' num2str(obj.D_Par(1),3) '*PAT+' num2str(obj.D_Par(2),3)];
        end
    end
end

