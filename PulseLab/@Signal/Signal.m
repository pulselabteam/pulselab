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
classdef Signal<handle
    % A piece of consecutive recording of a signal
    properties
        Name%Filename
        FolderPath%Folder directory
        RATE%Sampling rate
        T%Time instances that matches samples of signal
        Sig%Samples of signal, Filtered/Not Filtered
        RawSig%Raw samples of signal for signal reset
        FilteredFlag%Indicator of whether Sig is filtered
        DenoiseSetting%Denoise Method Object
        PeakDetectSetting%Peak Detection Method Object
        QualityIndexSetting%Array of Signal Quality Index Subjects, relationship is AND
    end
    
    methods
 %% Required for GUI
        function obj = Signal(varargin)%Create a new Signal object
            if nargin==2%Create a new Signal object with filename and folderpath
                FolderPath=varargin{1};
                Name=varargin{2};
                obj.Name=Name;
                obj.FolderPath=FolderPath;
               
                SigFile=load(fullfile(FolderPath,Name));
                SigField=fieldnames(SigFile);
                Signal=SigFile.(SigField{1});
                obj.T=Signal(:,1);
                obj.Sig=Signal(:,2);
                obj.RATE=1/mean(rmoutliers(diff(obj.T),'median'));
                obj.DenoiseSetting=[];
                obj.PeakDetectSetting=[];
                obj.QualityIndexSetting={};
                obj.FilteredFlag=false;
                obj.RawSig=obj.Sig;
            elseif nargin==10%Create a new Signal object with all parameters specified
                obj.Name=varargin{1};
                obj.FolderPath=varargin{2};
                obj.RATE=varargin{3};
                obj.T=varargin{4};
                obj.Sig=varargin{5};
                obj.RawSig=varargin{6};
                obj.FilteredFlag=varargin{7};
                obj.DenoiseSetting=varargin{8};
                obj.PeakDetectSetting=varargin{9};
                obj.QualityIndexSetting=varargin{10};
            end
            
        end
        function NewSignal=Inherit(obj)%Create a new Signal subject by inheriting all information from an existed subject, except the signal.
            %Used to create a sub-interval of an existed signal, or to
            %compress the object for saving as file.
            NewSignal = Signal(obj.Name,obj.FolderPath,obj.RATE,[],[],[],obj.FilteredFlag,obj.DenoiseSetting,obj.PeakDetectSetting,obj.QualityIndexSetting);
        end
        function NewSignal=Copy(obj)%Create an exact copy of an existed Signal subject.
            NewSignal = Signal(obj.Name,obj.FolderPath,obj.RATE,obj.T,obj.Sig,obj.RawSig,obj.FilteredFlag,obj.DenoiseSetting,obj.PeakDetectSetting,obj.QualityIndexSetting);
        end
        function Reset(obj)%Reset Sig to RawSig
            if obj.FilteredFlag
                obj.Sig=obj.RawSig;
                obj.FilteredFlag=false;
            end
        end
        function name=GetName(obj)%Return Signal filename without the .mat extension
            name=strsplit(obj.Name,'.');
            name=name{1};
        end
        function [T,Samples]=GetSamples(obj,varargin)% Get plotable samples of signal, re-mapped between 0 and 1
            p=inputParser();
            addParameter(p,'raw',false,@islogical);
            addParameter(p,'normalize',true,@islogical);
            addParameter(p,'normalize_to',[0,1],@(x) all(size(x)==[1,2])&&(x(1)<x(2)));
            parse(p,varargin{:});
            T=obj.T;
            if p.Results.raw
                Samples=obj.RawSig;
            else
                Samples=obj.Sig;
            end
            if p.Results.normalize
                    Samples=mapminmax(Samples',p.Results.normalize_to(1),p.Results.normalize_to(2))';
            end
        end
        function Signal=GetWindowByTime(obj,TimeStart,TimeEnd)% Get a new Signal subject whose signal samples is truncated as a sub-interval of an existed Signal subject. All other parameters remain the same
            %Position of truncation is determined from the absolute start
            %and end time in the timelist T
            p=inputParser();
            addRequired(p,'TS',@(x) x>=obj.T(1));
            addRequired(p,'TE',@(x) x<=obj.T(end));
            parse(p,TimeStart,TimeEnd);
            
            TSidx=find(obj.T>=p.Results.TS,1,'first');
            TEidx=find(obj.T<=p.Results.TE,1,'last');
            TSidx=max(TSidx,1);
            TEidx=min(TEidx,length(obj.Sig));
            idx=TSidx:TEidx;
            Signal=obj.Inherit();
            Signal.T=obj.T(idx);
            Signal.Sig=obj.Sig(idx);
            Signal.RawSig=obj.RawSig(idx);
        end
        function Signal=GetWindowByIndex(obj,idx)% Get a new Signal subject whose signal samples is truncated as a sub-interval of an existed Signal subject. All other parameters remain the same
            %Position of truncation is determined from specified array index
             p=inputParser();
            addRequired(p,'idx',@(x) min(x)>=1&&max(x)<=numel(obj.T));
            parse(p,idx);
            
            Signal=obj.Inherit();
            Signal.T=obj.T(p.Results.idx);
            Signal.Sig=obj.Sig(p.Results.idx);
            Signal.RawSig=obj.RawSig(p.Results.idx);
        end
        function Normalize(obj)
            obj.Sig=mapminmax(obj.Sig',0,1)';
        end
        function [Frequency,PSD]=Spectrum(obj,varargin)%Obtain Power Spectral Density
            ScalePar={'linear','db'};
            p=inputParser();
            addParameter(p,'range',[0,50],@(x) x(1)>0&&x(2)<obj.RATE/2);
            addParameter(p,'scale','linear',@(x) any(validatestring(lower(x),ScalePar)));
            parse(p,varargin{:});
            
            vSig=obj.Sig;
            FFT = fft(vSig);
            N = length(vSig);          % number of samples
            Frequency =0:obj.RATE/N:obj.RATE/2;     % frequency bins
            PSD = abs(FFT);
            PSD(2:end-1) = 2*PSD(2:end-1);
            
            idx1=find(p.Results.range(1)>=Frequency,1,'first');
            idx2=find(p.Results.range(2)<=Frequency,1,'last');
            idx=idx1:idx2;
            Frequency=Frequency(idx);
            switch lower(p.Results.scale)
                case 'db'
                    PSD=log10(PSD(idx));
                case 'linear'
                    PSD=PSD(idx);
            end
        end
        function SetDenoise(obj,DenoiseObject)%Indicate a method for denoising by passing a Denoise Method object to the Signal object
            obj.DenoiseSetting=DenoiseObject;
        end
        function SetPeakDetect(obj,PeakDetectObject)%Indicate a method for peak detection by passing a PeakDetection Method object to the Signal object
            obj.PeakDetectSetting=PeakDetectObject;
        end
        function AppendQualityIndex(obj,QualityIndexObject)%Push a method of signal quality index to the back of the list of signal quality index
            QualityIndexName=QualityIndexObject.Instruct;
            if ~isempty(obj.QualityIndexSetting)
                for i=1:length(obj.QualityIndexSetting)
                    NameExist=obj.QualityIndexSetting{i}.Instruct();
                    if  strcmp(QualityIndexName,NameExist)
                        obj.QualityIndexSetting{i}=QualityIndexObject;
                        return;
                    end
                end
            end
            obj.QualityIndexSetting=[obj.QualityIndexSetting,{QualityIndexObject}];
        end
        function PopQualityIndex(obj)%Remove the method of signal quality index at the end of the list
            if ~isempty(obj.QualityIndexSetting)
                obj.QualityIndexSetting(end)=[];
            end
        end
        function Denoise(obj)
            if obj.FilteredFlag
                obj.Reset();
            end
            if ~isempty(obj.DenoiseSetting)
                obj.DenoiseSetting.Execute(obj);
                obj.FilteredFlag=true;
            end
        end%Use the setted denoise method to denoise the signal
        function parameters=CheckDenoise(obj,varargin)
            if isempty(obj.DenoiseSetting)
                parameters='';
                return
            end
            if nargin>1
                if strcmp(obj.DenoiseSetting.Instruct(),varargin{1})
                    parameters=obj.DenoiseSetting.Check();
                else
                    parameters='';
                end
            else
                parameters=obj.DenoiseSetting.Check();
            end
        end%Return the setted parameters for denoise to be displayed on the GUI
        function parameters=CheckPeakDetect(obj,varargin)
            if isempty(obj.PeakDetectSetting)
                parameters='';
                return
            end
            if nargin>1
                if strcmp(obj.PeakDetectSetting.Instruct(),varargin{1})
                    parameters=obj.PeakDetectSetting.Check();
                else
                    parameters='';
                end
            else
                parameters=obj.PeakDetectSetting.Check();
            end
        end%Return the setted parameters for peak detection to be displayed on the GUI
        function Peaksidx=Peaks(obj)
            NewObj=obj.Copy();
            NewObj.Normalize();
            if ~isempty(NewObj.PeakDetectSetting)
                Peaksidx=NewObj.PeakDetectSetting.Execute(NewObj);
            else
                Peaksidx=[];
            end
        end%Use the setted peak detection method to return the index that correspond to peaks
        function accept=Quality(obj)%Judge if the signal fullfile all setted signal quality indices
            if ~isempty(obj.QualityIndexSetting)
                for i=1:length(obj.QualityIndexSetting)
                    subaccept(i)=obj.QualityIndexSetting{i}.Execute(obj);
                end
                if all(subaccept)
                    accept=true;
                else
                    accept=false;
                end
            else
                accept=true;
            end
        end
        function [Name,Accept,Idx,Value,Range,ParameterList,Parameters]=CheckQualityIndex(obj)
            if ~isempty(obj.QualityIndexSetting)
                Idx=[];
                for i=1:length(obj.QualityIndexSetting)
                    [Name{i},ParameterList{i}]=obj.QualityIndexSetting{i}.Instruct();
                    Parameters{i}=obj.QualityIndexSetting{i}.Check();
                    [accept,idx,value]=obj.QualityIndexSetting{i}.Execute(obj);
                    if ~accept
                        Idx=idx;
                    end
                    Accept{i}=num2str(accept);
                    Value{i}=num2str(value);
                    Range{i}=[num2str(obj.QualityIndexSetting{i}.Low),',',num2str(obj.QualityIndexSetting{i}.High)];
                end
            else
                Name={};
                Value={};
                Range={};
                Accept={};
                ParameterList={};
                Parameters={};
                Idx=[];
            end
        end%Return a table of the parameters for all signal quality indices to be displayed on the GUI
        function SnapShotSubject=Snapshot(obj)
            SnapShotSubject=obj.Inherit();
        end%Compress the Signal Object by removing the samples so the object can be saved as small size .mat file
        function Recap(obj)
            SigFile=load(fullfile(obj.FolderPath,obj.Name));
            SigField=fieldnames(SigFile);
            Signal=SigFile.(SigField{1});
            obj.T=Signal(:,1);
            obj.Sig=Signal(:,2);
            obj.RawSig=Signal(:,2);
            if obj.FilteredFlag
                 obj.DenoiseSetting.Execute(obj);
            end
        end%Reconstruct the Signal Object from a SanpShot by loading the original samples from the filename and path and re-do denoising
    
%% Extended Methods
    end
end

