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
classdef Remove_Min_Max<handle
    
    methods(Static)
        function [Name,ParameterList]=Instruct()
            Name='Remove Min and Max';
            ParameterList='';
        end
    end
    methods
        function message=Check(obj)
            message='';
        end
        function obj =Remove_Min_Max()
        end
        
        function outPAT =Execute(~,inPAT)
            if length(inPAT)>2
                outPAT=inPAT(inPAT~=max(inPAT)&inPAT~=min(inPAT));
            else
                outPAT=inPAT;
            end
        end
    end
end

