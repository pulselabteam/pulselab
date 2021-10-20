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
classdef R_Peak
    properties
        ECGTh
        ECGd1Th
    end
    methods(Static)
        function [Name,ParameterList]=Instruct()
            Name='ECG R_Peak';
            ParameterList='ECGThreshold,ECG 1st Derivative Threshold';
        end
        function HintSig=Hint(SignalObject)
            vECG=mapminmax(SignalObject.Sig',0,1)';
            dECG=abs(diff(vECG));
            HintSig=mapminmax([dECG;dECG(end)]',0,1)';
        end
    end
    methods
        function message=Check(obj)
            message=[num2str(obj.ECGTh),',',num2str(obj.ECGd1Th)];
        end
        function obj = R_Peak(varargin)
            obj. ECGTh=varargin{1};
            obj. ECGd1Th=varargin{2};
        end
        function Rpeaksidx=Execute(obj,SignalObject)
            RATE=SignalObject.RATE;
            vECG=mapminmax(SignalObject.Sig',0,1)';
            dECG=abs(diff(vECG));
            dECG=mapminmax([dECG;dECG(end)]',0,1)';
            [~,Rcandiidx]=findpeaks(vECG,'MinPeakHeight',obj. ECGTh);
            Rpeaksidx=[];
            
            %Verify reasonable R peak with derivative of ECG
            for k=1:length(Rcandiidx)
                ts1=max([Rcandiidx(k)-round(0.02*RATE),1]);
                ts2= min([Rcandiidx(k)+round(0.02*RATE),length(dECG)]);
                
                samples=dECG(ts1:ts2);
                if max(samples)>obj. ECGd1Th
                    if isempty(Rpeaksidx)
                        Rpeaksidx=[Rpeaksidx;Rcandiidx(k)];
                    elseif Rcandiidx(k)-Rpeaksidx(end)>0.25*SignalObject.RATE
                        Rpeaksidx=[Rpeaksidx;Rcandiidx(k)];
                    end
                end
            end
        end
    end
end


