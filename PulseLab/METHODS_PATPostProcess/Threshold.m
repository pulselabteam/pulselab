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
classdef Threshold<handle
    %REMOVE_OUTLIERS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        TH
    end
     methods(Static)
        function [Name,ParameterList]=Instruct()
            Name='Threshold';
            ParameterList='[LowThreshold,HighThreshold]';
        end
    end
    methods
        function message=Check(obj)
            message=['[',num2str(obj.TH(1)),',', num2str(obj.TH(2)),']'];
        end
        function obj = Threshold(Th)
            obj.TH=Th;
        end
        
        function outPAT =Execute(obj,inPAT)
            if ~isempty(inPAT)
            outPAT=inPAT(inPAT>obj.TH(1)&inPAT<obj.TH(2));
            else
                outPAT=[];
            end
        end
    end
end

