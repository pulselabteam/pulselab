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
classdef FB_FIR
    
    properties
        Cutoff
        Order
    end
    
    methods(Static)
        function [Name,ParameterList]=Instruct()
            Name='FIR';
            ParameterList='Low_Cut,High_Cut,Order';
        end
    end
    
    methods
        function obj =FB_FIR(varargin)
            obj.Cutoff=[varargin{1},varargin{2}];
            obj.Order=varargin{3};
        end
        function message=Check(obj)
            message=[num2str(obj.Cutoff(1)),',',num2str(obj.Cutoff(2)),',',num2str(obj.Order)];
        end
        
        function Execute(obj,SignalObject)
            vSig=SignalObject.Sig;
            RATE=SignalObject.RATE;
            if obj.Cutoff(1)==0
                FIR = fir1(obj.Order,obj.Cutoff(2)*2/RATE);
            else
                FIR = fir1(obj.Order,[obj.Cutoff(1)*2/RATE,obj.Cutoff(2)*2/RATE]);
            end
            SignalObject.Sig=filtfilt(FIR,1,vSig);
        end
        
        function FIR=Freqency_Response(obj,SignalObject)
            FIR = fir1(obj.Order,[obj.Cutoff(1)*2/SignalObject.RATE,obj.Cutoff(2)*2/SignalObject.RATE]);
        end
        
    end
end

