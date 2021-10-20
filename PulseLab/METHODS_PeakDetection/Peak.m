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
classdef Peak
    properties
        Th
    end
    methods(Static)
        function [Name,ParameterList]=Instruct()
            Name='Simple_Peak';
            ParameterList='Threshold';
        end
        function HintSig=Hint(~)
            HintSig=[];
        end
    end

    methods
        function message=Check(obj)
            message=num2str(obj.Th);
        end
        
        function obj = Peak(varargin)
            obj.Th=varargin{1};
        end
        function Peakidx=Execute(obj,SignalObject)
            RATE=SignalObject.RATE;
            vPPG=mapminmax(SignalObject.Sig',0,1)';
            [~,Peakidx]=findpeaks(vPPG,'MinPeakHeight',obj.Th,'MinPeakDistance',0.25*RATE);
        end
    end
end

