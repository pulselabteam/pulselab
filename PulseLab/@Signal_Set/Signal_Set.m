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

classdef Signal_Set<handle
    properties
        Sig_List
        Ref
        RefInterval
        BufferLength
        PATPairIndex
        ModelSetting
        SplitSetting
        PostProcessSetting
        Extraction
      
    end
    
    methods
         %% Required for GUI
        function obj = Signal_Set(varargin)
            if nargin==0
                obj.Sig_List={};
                obj.RefInterval=[];
                obj.Ref={};
                obj.BufferLength=[];
                obj.PATPairIndex=[];
                obj.ModelSetting=[];
                obj.Extraction=[];
                obj.SplitSetting=[];
                obj.PostProcessSetting={};
            else
                obj.Sig_List=varargin{1};
                obj.Ref=varargin{2};
                obj.RefInterval=varargin{3};
                obj.BufferLength=varargin{4};
                obj.PATPairIndex=varargin{5};
                obj.ModelSetting=varargin{6};
                obj.PostProcessSetting=varargin{7};
                obj.SplitSetting=varargin{8};
                obj.Extraction=varargin{9};
            end
        end
        function NewSigSet=Inherit(obj)
            %Inherit All settings, except signal, references,model settings
            %and extraction
            NewSigSet=Signal_Set({},[],obj.RefInterval,obj.BufferLength,obj.PATPairIndex,[],obj.PostProcessSetting,[],[]);
        end
        function Append(obj,Signal)
            obj.Sig_List=[obj.Sig_List,{Signal}];
        end
        function Pop(obj)
            if ~isempty(obj.Sig_List)
                idx=length(obj.Sig_List);
                obj.Sig_List(end)=[];
                if isempty(obj.PATPairIndex)||idx==obj.PATPairIndex(1)||idx==obj.PATPairIndex(2)
                    obj.PATPairIndex=[];
                end
            end
            if isempty(obj.Sig_List)
                obj.Ref=[];
            end
        end
        function SetRefInterval(obj,Interval)
            obj.RefInterval=Interval;
        end
        function SetPATPair(obj,Pair)
            obj.PATPairIndex=Pair;
        end
        function SetReferenceFromFile(obj, Filename)
                RefFile=load(fullfile(obj.Sig_List{1}.FolderPath,Filename));
                RefField=fieldnames(RefFile);
                obj.Ref=RefFile.(RefField{1});
        end
        function SetBuffer(obj,BufferLen)
            obj.BufferLength=round(BufferLen*obj.Sig_List{1}.RATE);
        end
        function SetModel(obj,ModelObject)
            obj.ModelSetting=ModelObject;
        end
         function AppendPostProcess(obj,PostProcessObject)%Push a method of signal quality index to the back of the list of signal quality index
            obj.PostProcessSetting=[obj.PostProcessSetting,{PostProcessObject}];
        end
        function PopPostProcess(obj)%Remove the method of signal quality index at the end of the list
            if ~isempty(obj.PostProcessSetting)
                obj.PostProcessSetting(end)=[];
            end
        end 
        function names=GetNameList(obj)
            if ~isempty(obj.Sig_List)
                for i=1:length(obj.Sig_List)
                    names{i}=obj.Sig_List{i}.GetName;
                end
            else
                names={};
            end
        end
        function BPTime=GetTimeList(obj)
            BPTime=obj.Ref.BPTIME;
        end
        function TimeList=GetIntervalList(obj)
            neg= obj.RefInterval(1);
            pos= obj.RefInterval(2);
            Mid=obj.Ref.BPTIME;
            ST=max(0,Mid-neg);
            ED=min(Mid+pos,obj.Sig_List{1}.T(end));
            TimeList=[ST',ED'];
        end
        function SigSet=GetInterval(obj,idx)
            neg= obj.RefInterval(1);
            pos= obj.RefInterval(2);
            Mid=obj.Ref.BPTIME(idx);
            SigSet=obj.Inherit();
            for i=1:length(obj.Sig_List)
                ST=max(0,Mid-neg);
                ED=min(Mid+pos,obj.Sig_List{i}.T(end));
                SigSet.Sig_List{i}=obj.Sig_List{i}.GetWindowByTime(ST,ED);
            end
            SigSet.Ref.BPTIME=obj.Ref.BPTIME(idx);
            SigSet.Ref.SBP=obj.Ref.SBP(idx);
            SigSet.Ref.DBP=obj.Ref.DBP(idx);
        end
        function Signal=GetSignal(obj,idx)
                Signal=obj.Sig_List{idx};
        end
        function [RefSBP,RefDBP]=GetReference(obj)
            RefSBP=obj.Ref.SBP;
            RefDBP=obj.Ref.DBP;
        end
        function nBuffer=GetBufferIndex(obj)
            [Buffer,~]=buffer(1:length(obj.Sig_List{1}.T),obj.BufferLength);
            nBuffer=size(Buffer,2);
        end
        function [Name,ParameterList,Parameters]=CheckPostProcess(obj)
            if ~isempty(obj.PostProcessSetting)
                for i=1:length(obj.PostProcessSetting)
                    [Name{i},ParameterList{i}]=obj.PostProcessSetting{i}.Instruct();
                    Parameters{i}=obj.PostProcessSetting{i}.Check();
                end
            else
                Name={};
                ParameterList={};
                Parameters={};
            end
        end
        function SigSet=Buffer(obj,Bufferidx)
            Buffer=buffer(1:length(obj.Sig_List{1}.T),obj.BufferLength);
            idx=Buffer(:,Bufferidx);
            SigSet=obj.Inherit();
            for i=1:length(obj.Sig_List)
                SigSet.Sig_List{i}=obj.Sig_List{i}.GetWindowByIndex(idx);
            end
            SigSet.Ref=obj.Ref;
            SigSet.BufferLength=[];
            SigSet.PostProcessSetting=[];
        end
        function PAT=FindPAT(obj,Peakidx1,Peakidx2)
            RATE=obj. Sig_List{1}.RATE;
            PAT=[];
            for i=1:length(Peakidx1)
                pos= find(Peakidx2>Peakidx1(i),1,'first');
                if ~isempty(pos)
                    PAT=[PAT;(Peakidx2(pos)-Peakidx1(i))/RATE];
                end
            end
        end
        function PATs=ExtractPAT(obj,varargin)
            Sig1idx= obj.PATPairIndex(1);
            Sig2idx= obj.PATPairIndex(2);
            EXTs=[];
            PATs=[];
            if (~isempty(obj.Sig_List)&&~isempty(obj.Ref)&&~isempty(obj.RefInterval)&&~isempty(obj.PATPairIndex))
                for Intervalidx=1:length(obj.Ref.BPTIME)
                    if length(obj.Ref.BPTIME)>1
                        IntervalSigSet=GetInterval(obj,Intervalidx);
                    else
                        IntervalSigSet=obj;
                    end
                    RefSBP=IntervalSigSet.Ref.SBP;
                    RefDBP=IntervalSigSet.Ref.DBP;
                    IntervalPATs=[];
                    if isempty(obj.BufferLength)
                        WinSigSet=obj;
                        Signal1=WinSigSet.GetSignal(Sig1idx);
                        Signal2=WinSigSet.GetSignal(Sig2idx);
                        Sig1Accept=Signal1.Quality();
                        Sig2Accept=Signal2.Quality();
                        if (Sig1Accept&&Sig2Accept)
                            Peaks1=Signal1.Peaks();
                            Peaks2=Signal2.Peaks();
                            WINPATs=obj.FindPAT(Peaks1,Peaks2);
                            IntervalPATs=WINPATs;
                        end
                    else
                        for Windowidx=1:IntervalSigSet.GetBufferIndex()
                            WinSigSet=IntervalSigSet.Buffer(Windowidx);
                            Signal1=WinSigSet.GetSignal(Sig1idx);
                            Signal2=WinSigSet.GetSignal(Sig2idx);
                            Sig1Accept=Signal1.Quality();
                            Sig2Accept=Signal2.Quality();
                            if (Sig1Accept&&Sig2Accept)
                                Peaks1=Signal1.Peaks();
                                Peaks2=Signal2.Peaks();
                                WINPATs=obj.FindPAT(Peaks1,Peaks2);
                                IntervalPATs=[IntervalPATs;WINPATs];
                            end
                        end
                    end
                    if ~isempty(obj.PostProcessSetting)&&nargin==1
                        for i=1:length(obj.PostProcessSetting)
                            IntervalPATs=obj.PostProcessSetting{i}.Execute(IntervalPATs);
                        end
                    end
                    IntervalEXT=[IntervalPATs,zeros(size(IntervalPATs))+RefSBP,zeros(size(IntervalPATs))+RefDBP];
                    EXTs=[EXTs;IntervalEXT];
                    PATs=[PATs;IntervalPATs];
                end
                obj.Extraction=EXTs;
            end
        end
        function Split(obj,varargin)
            if ~isempty(obj.Extraction)&&nargin==2
                 obj.SplitSetting= cvpartition(obj.Extraction(:,1),varargin{1});
            elseif nargin==3
                 obj.SplitSetting= cvpartition(obj.Extraction(:,1),varargin{1},varargin{2});
            end
        end
        function [RefSBP,RefDBP,ExtSBP,ExtDBP,PAT]=ModelEvaluate(obj)
            RefSBP=[];
            RefDBP=[];
            ExtSBP=[];
            ExtDBP=[];
            PAT=[];
            Sequence=[];
            if (~isempty(obj.Extraction)&&~isempty(obj.SplitSetting))
                for i=1: obj.SplitSetting.NumTestSets
                    idxTrain=find(training(obj.SplitSetting,i));
                    idxTest=find(test(obj.SplitSetting,i));
                    obj.ModelSetting.Fit(obj.Extraction(idxTrain,1),obj.Extraction(idxTrain,2),obj.Extraction(idxTrain,3));
                    [eSBP,eDBP]=obj.ModelSetting.Predict(obj.Extraction(idxTest,1));
                    PAT=[PAT;obj.Extraction(idxTest,1)];
                    RefSBP=[RefSBP;obj.Extraction(idxTest,2)];
                    RefDBP=[RefDBP;obj.Extraction(idxTest,3)];
                    ExtSBP=[ExtSBP;eSBP];
                    ExtDBP=[ExtDBP;eDBP];
                    Sequence=[Sequence;idxTest];
                end
                [~,sequence_idx]=sort(Sequence);
                RefSBP=RefSBP(sequence_idx);
                RefDBP=RefDBP(sequence_idx);
                ExtSBP=ExtSBP(sequence_idx);
                ExtDBP=ExtDBP(sequence_idx);
                PAT=PAT(sequence_idx);
            end
        end
        function [TrainEXT,TestEXT]=GetSplit(obj)
            if ~isempty(obj.SplitSetting)&&obj.SplitSetting.NumTestSets==1
                Trainidx=training(obj.SplitSetting,1);
                Testidx=test(obj.SplitSetting,1);
                TrainEXT=obj.Extraction(Trainidx,:);
                TestEXT=obj.Extraction(Testidx,:);
            else
                TrainEXT=[];
                TestEXT=[];
            end
        end
        function [Trainidx,Testidx]=GetSplitIndex(obj)
            if ~isempty(obj.SplitSetting)&&obj.SplitSetting.NumTestSets==1
                Trainidx=fing(training(obj.SplitSetting,1));
                Testidx=find(test(obj.SplitSetting,1));
            else
                Trainidx=[];
                Testidx=[];
            end
        end
        function TrainModel(obj,varargin)
            if nargin>1
                obj.ModelSetting.Fit(obj.Extraction(:,1),obj.Extraction(:,2),obj.Extraction(:,3));
            else
                if ~isempty(obj.SplitSetting)&&obj.SplitSetting.NumTestSets==1
                    Trainidx=training(obj.SplitSetting,1);
                    obj.ModelSetting.Fit(obj.Extraction(Trainidx,1),obj.Extraction(Trainidx,2),obj.Extraction(Trainidx,3));
                end
            end
        end
        function [RefSBP,RefDBP,ExtSBP,ExtDBP,PAT]=TestModel(obj,varargin)
            if nargin>1
                [ExtSBP,ExtDBP]=obj.ModelSetting.Predict(obj.Extraction(:,1));
                PAT=obj.Extraction(:,1);
                RefSBP=obj.Extraction(:,2);
                RefDBP=obj.Extraction(:,3);
            else
                if ~isempty(obj.SplitSetting)&&obj.SplitSetting.NumTestSets==1
                    Testidx=test(obj.SplitSetting,1);
                    [ExtSBP,ExtDBP]=obj.ModelSetting.Predict(obj.Extraction(Testidx,1));
                     PAT=obj.Extraction(Testidx,1);
                    RefSBP=obj.Extraction(Testidx,2);
                    RefDBP=obj.Extraction(Testidx,3);
                else
                    ExtSBP=[];
                    ExtDBP=[];
                    RefSBP=[];
                    RefDBP=[];
                    PAT=[];
                end
            end
        end
        function NewSigSet=Snapshot(obj)
            NewSigSet=Signal_Set({},obj.Ref,obj.RefInterval,obj.BufferLength,obj.PATPairIndex,[],obj.PostProcessSetting,obj.SplitSetting,obj.Extraction);
            for i=1:length(obj.Sig_List)
                NewSigSet.Append(obj.Sig_List{i}.Snapshot)
            end
        end
        function Recap(obj)
            for i=1:length(obj.Sig_List)
                obj.Sig_List{i}.Recap();
            end
        end
        function New_Subject=Imitate(obj,NewFolderPath)
            %Create a new subject with difference source signal path while
            %remaining all other settings
            This_Object=obj.Snapshot();
            This_SigList=This_Object.Sig_List;
            for i=1:length(This_SigList)
              This_SigList{i}.FolderPath=NewFolderPath;
            end
            New_Subject=obj.Inherit();
            New_Subject.Sig_List=This_SigList;
            New_Subject.Recap();
            New_Subject.SetReferenceFromFile('Dataset.mat');
            New_Subject.ExtractPAT();
        end
        %% Extended Methods
    end
end
