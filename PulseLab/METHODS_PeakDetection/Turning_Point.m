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
classdef Turning_Point
    properties
        PPGd1Th
    end
    methods(Static)
        function [Name,ParameterList]=Instruct()
            Name='PPG Turning Point';
            ParameterList='PPGd1Threshold';
        end
        function HintSig=Hint(SignalObject)
            vPPG=mapminmax(SignalObject.Sig',0,1)';
            dPPG=diff(vPPG);
            HintSig=mapminmax([dPPG;dPPG(end)]',0,1)';
        end
    end
    methods
        function message=Check(obj)
            message=num2str(obj.PPGd1Th);
        end
        function obj = Turning_Point(varargin)
            obj.PPGd1Th=varargin{1};
        end
        function Peaksidx=Execute(obj,SignalObject)
            %Peaks:Time Stamp with reference to the raw Signal
            %Peaksidx:Index with reference to the SignalObject
            RATE=SignalObject.RATE;
            vPPG=mapminmax(SignalObject.Sig',0,1)';
            dPPG=diff(vPPG);
            dPPG=mapminmax([dPPG;dPPG(end)]',0,1)';
            [~,Pcandiidx]=findpeaks(1-vPPG);
            Peaksidx=[];
            
            %P
            for k=1:length(Pcandiidx)
                ts1=max([Pcandiidx(k),1]);
                ts2= min([Pcandiidx(k)+round(0.1*RATE),length(dPPG)]);
                
                samples=dPPG(ts1:ts2,1);
                if max(samples)>obj.PPGd1Th
                    Peaksidx=[Peaksidx;Pcandiidx(k)];
                end
            end
        end
        
    end
    
    
end



