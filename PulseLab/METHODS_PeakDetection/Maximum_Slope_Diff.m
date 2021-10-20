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
classdef Maximum_Slope_Diff
    properties
        PPGd1Th
    end
    methods(Static)
        function [Name,ParameterList]=Instruct()
            Name='PPG Maximum_Slope_Differentiator';
            ParameterList='PPGd1Threshold';
        end
        function HintSig=Hint(SignalObject)
             DF=dsp.Differentiator('DesignForMinimumOrder',false,'FilterOrder',31);
            vPPG=mapminmax(SignalObject.Sig',0,1)';
            dPPG=DF(vPPG);
            dPPG(1:16)=[];
             dPPG(1:16)=0;
            dPPG=[dPPG;zeros(16,1)];
            HintSig=mapminmax(dPPG',0,1)';
        end
    end
    methods
        function message=Check(obj)
            message=num2str(obj.PPGd1Th);
        end
        function obj = Maximum_Slope_Diff(varargin)
            obj.PPGd1Th=varargin{1};
        end
        
        function Peaksidx=Execute(obj,SignalObject)
            %Peaks:Time Stamp with reference to the raw Signal
            %Peaksidx:Index with reference to the SignalObject
           DF=dsp.Differentiator('DesignForMinimumOrder',false,'FilterOrder',31);
            RATE=SignalObject.RATE;
            vPPG=mapminmax(SignalObject.Sig',0,1)';
            dPPG=DF(vPPG);
            dPPG(1:16)=[];
             dPPG(1:16)=0;
            dPPG=[dPPG;zeros(16,1)];
            dPPG=mapminmax(dPPG',0,1)';
            [~,Pcandiidx]=findpeaks(dPPG,'MinPeakHeight',obj.PPGd1Th);
            Peaksidx=[];
            for k=1:length(Pcandiidx)
                if vPPG(Pcandiidx(k))>0.2
                    if isempty(Peaksidx)
                        Peaksidx=[Peaksidx;Pcandiidx(k)];
                    elseif Pcandiidx(k)-Peaksidx(end)>0.25*RATE
                        Peaksidx=[Peaksidx;Pcandiidx(k)];
                    end
                end
            end
        end
    end
    
    
end

