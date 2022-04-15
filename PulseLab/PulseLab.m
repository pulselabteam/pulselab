classdef PulseLab < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        Window                          matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        IndividualBPFittingTab          matlab.ui.container.Tab
        RegressionResultsFromCurrentSubjectPanel  matlab.ui.container.Panel
        Evaluate_Instant                matlab.ui.control.Button
        PATNumLabel                     matlab.ui.control.Label
        TestPATSize_Instant             matlab.ui.control.NumericEditField
        PATBPModelLabel                 matlab.ui.control.Label
        ModelMethodDropDown             matlab.ui.control.DropDown
        SBPRegression_Instant           matlab.ui.control.UIAxes
        SBPBA_Instant                   matlab.ui.control.UIAxes
        DBPBA_Instant                   matlab.ui.control.UIAxes
        DBPRegression_Instant           matlab.ui.control.UIAxes
        SBPvariation                    matlab.ui.control.UIAxes
        DBPvariation                    matlab.ui.control.UIAxes
        DBPRegressionMetrics            matlab.ui.control.TextArea
        RegressionMetricsTextAreaLabel  matlab.ui.control.Label
        SBPRegressionMetrics            matlab.ui.control.TextArea
        OverallBPFittingTab             matlab.ui.container.Tab
        TestingResultsFromSelectedSubjectsPanel  matlab.ui.container.Panel
        SBPRegression_Ovarall           matlab.ui.control.UIAxes
        SBPBA_Overall                   matlab.ui.control.UIAxes
        DBPBA_Overall                   matlab.ui.control.UIAxes
        DBPRegression_Overall           matlab.ui.control.UIAxes
        TestPATNumLabel                 matlab.ui.control.Label
        TestPATSize_Overall             matlab.ui.control.NumericEditField
        ShowSubjectLabel                matlab.ui.control.Label
        ShowSubject                     matlab.ui.control.DropDown
        PATBPModelLabel_2               matlab.ui.control.Label
        ModelMethodDropDown_2           matlab.ui.control.DropDown
        SettingFolderLabel              matlab.ui.control.Label
        SavedFolder                     matlab.ui.control.DropDown
        ModeDropDown_3Label             matlab.ui.control.Label
        Mode_Overall                    matlab.ui.control.DropDown
        TrainingRatioEditField_2Label   matlab.ui.control.Label
        TrainingRatioEditField_2        matlab.ui.control.NumericEditField
        Evaluate_Overall                matlab.ui.control.Button
        AddTo                           matlab.ui.control.Button
        Remove                          matlab.ui.control.Button
        ResetButton_2                   matlab.ui.control.Button
        IncludedListBoxLabel            matlab.ui.control.Label
        IncludedListBox                 matlab.ui.control.ListBox
        ExcludedListBox                 matlab.ui.control.ListBox
        ExcludedListBoxLabel            matlab.ui.control.Label
        DBPRegressionMetrics_2          matlab.ui.control.TextArea
        RegressionMetricsTextAreaLabel_2  matlab.ui.control.Label
        SBPRegressionMetrics_2          matlab.ui.control.TextArea
        SpecificModelTestingTab         matlab.ui.container.Tab
        TrainAndTestOnSpecificSubjectPanel  matlab.ui.container.Panel
        Evaluate_Specific               matlab.ui.control.Button
        TrainPATSize                    matlab.ui.control.NumericEditField
        RegressionModelDropDownLabel_3  matlab.ui.control.Label
        ModelMethodDropDown_3           matlab.ui.control.DropDown
        SBPRegression_Specific          matlab.ui.control.UIAxes
        SBPBA_Specific                  matlab.ui.control.UIAxes
        DBPBA_Specific                  matlab.ui.control.UIAxes
        DBPRegression_Specific          matlab.ui.control.UIAxes
        ResetTrainTest                  matlab.ui.control.Button
        AddToTrain                      matlab.ui.control.Button
        AddToTest                       matlab.ui.control.Button
        TrainListBoxLabel               matlab.ui.control.Label
        TrainListBox                    matlab.ui.control.ListBox
        TestListBox                     matlab.ui.control.ListBox
        TestListBoxLabel                matlab.ui.control.Label
        ExcludedListBox_2               matlab.ui.control.ListBox
        ExcludedListBox_2Label          matlab.ui.control.Label
        TestPATSize                     matlab.ui.control.NumericEditField
        ModeDropDownLabel               matlab.ui.control.Label
        ModeDropDown_2                  matlab.ui.control.DropDown
        SettingFolderLabel_2            matlab.ui.control.Label
        SavedFolder_2                   matlab.ui.control.DropDown
        ShowSubjectLabel_2              matlab.ui.control.Label
        ShowSubject_2                   matlab.ui.control.DropDown
        TrainingRatioEditFieldLabel     matlab.ui.control.Label
        TrainingRatioEditField          matlab.ui.control.NumericEditField
        DBPRegressionMetrics_3          matlab.ui.control.TextArea
        RegressionMetricsTextAreaLabel_3  matlab.ui.control.Label
        SBPRegressionMetrics_3          matlab.ui.control.TextArea
        TabGroup2                       matlab.ui.container.TabGroup
        FileInputandSignalPreprocessingTab  matlab.ui.container.Tab
        PreprocessSettingsPanel         matlab.ui.container.Panel
        ApplyButton                     matlab.ui.control.Button
        ResetButton                     matlab.ui.control.Button
        ParameterListEditFieldLabel     matlab.ui.control.Label
        DenoiseParameterList            matlab.ui.control.EditField
        SettingsEditFieldLabel          matlab.ui.control.Label
        DenoiseInput                    matlab.ui.control.EditField
        PreprocessingMethodDropDownLabel  matlab.ui.control.Label
        PreprocessingMethodDropDown     matlab.ui.control.DropDown
        SourceSignalManagementPanel     matlab.ui.container.Panel
        SignalRemoveButton              matlab.ui.control.Button
        SignalAddButton                 matlab.ui.control.Button
        IntervalPositionLabel           matlab.ui.control.Label
        ReferenceTable                  matlab.ui.control.Table
        ReferenceBPsLabel               matlab.ui.control.Label
        SignalPlot                      matlab.ui.control.UIAxes
        SpectrumPlot                    matlab.ui.control.UIAxes
        SignalFileLabel                 matlab.ui.control.Label
        SignalFilename                  matlab.ui.control.DropDown
        REFLabel                        matlab.ui.control.Label
        RefIntNeg                       matlab.ui.control.NumericEditField
        sLabel                          matlab.ui.control.Label
        RefIntPos                       matlab.ui.control.NumericEditField
        sLabel_2                        matlab.ui.control.Label
        AddedSignalListBoxLabel         matlab.ui.control.Label
        AddedSignalList                 matlab.ui.control.ListBox
        FileLoadPanel                   matlab.ui.container.Panel
        FileLoadButton                  matlab.ui.control.Button
        DatabasePathLabel               matlab.ui.control.Label
        FileFolderPath                  matlab.ui.control.EditField
        DatasetDropDownLabel            matlab.ui.control.Label
        DatasetDropDown                 matlab.ui.control.DropDown
        StatusEditFieldLabel            matlab.ui.control.Label
        Status                          matlab.ui.control.EditField
        CreateNewButton                 matlab.ui.control.Button
        SavedSettingDropDownLabel       matlab.ui.control.Label
        SavedSettingDropDown            matlab.ui.control.DropDown
        BrowseButton                    matlab.ui.control.Button
        PeakDetectionandPATPTTExtractionTab  matlab.ui.container.Tab
        InWindowPeakDetectionSettingsPanel  matlab.ui.container.Panel
        WindowPositionLabel             matlab.ui.control.Label
        WindowPosition                  matlab.ui.control.Slider
        TabGroup3                       matlab.ui.container.TabGroup
        Signal1Tab                      matlab.ui.container.Tab
        Sig1PeakSet                     matlab.ui.control.Button
        QualityIndexDropDownLabel       matlab.ui.control.Label
        SQIMethod1                      matlab.ui.control.DropDown
        PeakDetectionMethodLabel        matlab.ui.control.Label
        Sig1PeakMethod                  matlab.ui.control.DropDown
        ParameterListEditField_2Label   matlab.ui.control.Label
        PeakExtraction1ParameterList    matlab.ui.control.EditField
        SettingsEditFieldLabel_2        matlab.ui.control.Label
        Sig1PeakInput                   matlab.ui.control.EditField
        AcceptEditFieldLabel            matlab.ui.control.Label
        toEditFieldLabel                matlab.ui.control.Label
        SQITable1                       matlab.ui.control.Table
        SQI1Low                         matlab.ui.control.NumericEditField
        SQI1High                        matlab.ui.control.NumericEditField
        Sig1SQIAdd                      matlab.ui.control.Button
        Sig1SQIRemove                   matlab.ui.control.Button
        SettingsEditFieldLabel_5        matlab.ui.control.Label
        Sig1SQIInput                    matlab.ui.control.EditField
        ParameterListEditField_2Label_2  matlab.ui.control.Label
        Sig1SQIParameterList            matlab.ui.control.EditField
        Signal1DropDownLabel            matlab.ui.control.Label
        Signal1DropDown                 matlab.ui.control.DropDown
        Signal2Tab                      matlab.ui.container.Tab
        Sig2PeakSet                     matlab.ui.control.Button
        Signal2Label                    matlab.ui.control.Label
        Signal2DropDown                 matlab.ui.control.DropDown
        QualityIndexDropDown_2Label     matlab.ui.control.Label
        SQIMethod2                      matlab.ui.control.DropDown
        PeakDetectionMethodLabel_2      matlab.ui.control.Label
        Sig2PeakMethod                  matlab.ui.control.DropDown
        ParameterListEditField_3Label   matlab.ui.control.Label
        PeakExtraction2ParameterList    matlab.ui.control.EditField
        SettingsEditFieldLabel_3        matlab.ui.control.Label
        Sig2PeakInput                   matlab.ui.control.EditField
        AcceptEditFieldLabel_2          matlab.ui.control.Label
        toEditFieldLabel_2              matlab.ui.control.Label
        SQITable2                       matlab.ui.control.Table
        SQI2Low                         matlab.ui.control.NumericEditField
        SQI2High                        matlab.ui.control.NumericEditField
        Sig2SQIAdd                      matlab.ui.control.Button
        Sig2SQIRemove                   matlab.ui.control.Button
        SettingsEditFieldLabel_6        matlab.ui.control.Label
        Sig2SQIInput                    matlab.ui.control.EditField
        ParameterListEditField_2Label_3  matlab.ui.control.Label
        Sig2SQIParameterList            matlab.ui.control.EditField
        PostprocessingTab               matlab.ui.container.Tab
        PostProcessTable                matlab.ui.control.Table
        PostProcessSet                  matlab.ui.control.Button
        SettingsEditFieldLabel_4        matlab.ui.control.Label
        PostProcessInput                matlab.ui.control.EditField
        PATProcessMethodLabel           matlab.ui.control.Label
        PostProcess                     matlab.ui.control.DropDown
        ParameterListEditField_3Label_2  matlab.ui.control.Label
        PostProcessParameterList        matlab.ui.control.EditField
        PostProcessPemove               matlab.ui.control.Button
        PATHistogram                    matlab.ui.control.UIAxes
        ExtractedWindowPATLabel         matlab.ui.control.Label
        PATList                         matlab.ui.control.ListBox
        SelectedPATLabel                matlab.ui.control.Label
        SelectedPATList                 matlab.ui.control.ListBox
        WindowLengthEditFieldLabel      matlab.ui.control.Label
        WindowLength                    matlab.ui.control.NumericEditField
        sLabel_3                        matlab.ui.control.Label
        Window1Plot                     matlab.ui.control.UIAxes
        Window2Plot                     matlab.ui.control.UIAxes
        FileOutputTab                   matlab.ui.container.Tab
        SubjectSettingsPanel            matlab.ui.container.Panel
        SavesettingstoEditFieldLabel    matlab.ui.control.Label
        SaveSettings                    matlab.ui.control.EditField
        SaveSettingsButton              matlab.ui.control.Button
        ApplyAll                        matlab.ui.control.Button
        SavetoLabel                     matlab.ui.control.Label
        ApplyAllSavePath                matlab.ui.control.EditField
        WorkingonEditFieldLabel         matlab.ui.control.Label
        WorkingonEditField              matlab.ui.control.EditField
        ApplythissettingtoDropDownLabel  matlab.ui.control.Label
        SubjectDropDown2                matlab.ui.control.DropDown
        PerformanceReportPanel          matlab.ui.container.Panel
        OverallPerformanceLabel         matlab.ui.control.Label
        OverallPerformanceFolder        matlab.ui.control.EditField
        OverallPerformanceSaveButton    matlab.ui.control.Button
        SpecificPerformanceSaveButton   matlab.ui.control.Button
        SpecificModelPerformanceLabel   matlab.ui.control.Label
        SpecificPerformanceFolder       matlab.ui.control.EditField
    end

    
    properties (Access = private)
        SignalSet
        SelectedIntervalIdx
        DenoiseMethod
        PeakMethod
        SQIMethod
        PostProcessMethod
        ModelMethod
        OverallEval
        SpecificEval
    end
    
    methods (Access = private)
        function Metrics=PerformanceEval(~,REF,EST)
            [R,~]=corrcoef(EST,REF);
            Metrics.R=R(1,2);
            
            ERR=EST-REF;
            Metrics.ME=mean(ERR);
            Metrics.MESD=std(ERR);
            Metrics.MAE=mean(abs(ERR));
            Metrics.MAESD=std(abs(ERR));
            Metrics.RMSE= sqrt(mean(ERR.^2));
        end
        function FunctionNames = FunctionAssemble(~,classnames,functionname,varargin)
            %Combine class name, function name, and input parameter,
            %returning the string to eval()
            if nargin==3
                parameters=[];
            else
                parameters=varargin{1};
            end
            for i=1:length(classnames)
                if ~isempty(functionname)
                    FunctionNames{i}=[classnames{i},'.',functionname,'(',parameters,')',';'];
                else
                    FunctionNames{i}=[classnames{i},'(',parameters,')',';'];
                end
            end
        end
        function FunctionName=LoadMethodFolder(~,PATH)
            %Return Strings of Files names in the folder, for class initialization
            ModelFiles=dir(PATH);
            for i=1:length(ModelFiles)
                Filename=strsplit(ModelFiles(i).name,'.');
                Funhandle=Filename{1};
                FunctionName{i}=Funhandle;
            end
        end
        function SortedCell = StringSort(~,Cell)
            if isempty(Cell)
                SortedCell=Cell;
                return;
            end
            for i=1:length(Cell)
                SortField=strsplit(Cell{i},'.');
                SortField=SortField{1};
                num(i)=str2num(cell2mat(regexp(SortField, '\d+', 'match')));
            end
            [~,idx]=sort(num);
            SortedCell=Cell(idx);
        end
        
        function Success=LoadObject(app)
            %Restore the workspace status when the Subject is saved;If
            %failed, start with a blank subject
            if isempty(app.DatasetDropDown.Value)||isempty(app.SavedSettingDropDown.Value)
                app.Status.Value='No Setting can be loaded.';
                Success=false;
                return;
            end
            app.Status.Value='Loading.';
            pause(0.1);
            SubjectName=app.DatasetDropDown.Value;
            FilePath=fullfile('./WORKROOT/',app.SavedSettingDropDown.Value,[SubjectName '.mat']);
            Subject=load(FilePath);
            SubjectField=fieldnames(Subject);
            app.SignalSet=Subject.(SubjectField{1});
            app.SignalSet.Recap();
            TimeList=app.SignalSet.GetTimeList();
            [RefSBP,RefDBP]=app.SignalSet.GetReference();
            app.ReferenceTable.ColumnName=cellstr(string(1:length(RefSBP)));
            app.ReferenceTable.Data=[TimeList;RefSBP;RefDBP];
            if ~isempty(app.SignalSet.RefInterval)
                app.RefIntNeg.Value=app.SignalSet.RefInterval(1);
                app.RefIntPos.Value=app.SignalSet.RefInterval(2);
            end
            app.Status.Value='Existed setting loaded.';
            Success=true;
        end
        
        function CreateObject(app)
            app.Status.Value='New Blank Setting Created.';
            app.SignalSet=Signal_Set();
        end
        
        function ReadAvaliableMethods(app)
            %Load a SigSet object from file
            app.DenoiseMethod=app.LoadMethodFolder('.\METHODS_PreProcess\*.m');
            FunctionNames = app.FunctionAssemble(app.DenoiseMethod,'Instruct');
            for i=1:length(FunctionNames)
                Formulars{i}=eval(FunctionNames{i});
            end
            app.PreprocessingMethodDropDown.Items=Formulars;
            app.PreprocessingMethodDropDown.ItemsData=1:length(app.DenoiseMethod);
            app.PreprocessingMethodDropDown.Value=1;
            [~,app.DenoiseParameterList.Value]=eval(FunctionNames{app.PreprocessingMethodDropDown.Value});
            
            app.PeakMethod=app.LoadMethodFolder('.\METHODS_PeakDetection\*.m');
            FunctionNames = app.FunctionAssemble(app.PeakMethod,'Instruct');
            for i=1:length(FunctionNames)
                Formulars{i}=eval(FunctionNames{i});
            end
            app.Sig1PeakMethod.Items=Formulars;
            app.Sig1PeakMethod.ItemsData=1:length(app.PeakMethod);
            app.Sig1PeakMethod.Value=1;
            [~,app.PeakExtraction1ParameterList.Value]=eval(FunctionNames{app.Sig1PeakMethod.Value});
            
            app.Sig2PeakMethod.Items=Formulars;
            app.Sig2PeakMethod.ItemsData=1:length(app.PeakMethod);
            app.Sig2PeakMethod.Value=1;
            [~,app.PeakExtraction2ParameterList.Value]=eval(FunctionNames{app.Sig2PeakMethod.Value});
            
            app.SQIMethod=app.LoadMethodFolder('.\METHODS_SignalQuality\*.m');
            FunctionNames = app.FunctionAssemble(app.SQIMethod,'Instruct');
            for i=1:length(FunctionNames)
                Formulars{i}=eval(FunctionNames{i});
            end
            app.SQIMethod1.Items=Formulars;
            app.SQIMethod1.ItemsData=1:length(app.SQIMethod);
            app.SQIMethod1.Value=1;
            
            app.SQIMethod2.Items=Formulars;
            app.SQIMethod2.ItemsData=1:length(app.SQIMethod);
            app.SQIMethod2.Value=1;
            
            app.PostProcessMethod=app.LoadMethodFolder('.\METHODS_PATPostProcess\*.m');
            FunctionNames = app.FunctionAssemble(app.PostProcessMethod,'Instruct');
            for i=1:length(FunctionNames)
                Formulars{i}=eval(FunctionNames{i});
            end
            app.PostProcess.Items=Formulars;
            app.PostProcess.ItemsData=1:length(app.PostProcessMethod);
            app.PostProcess.Value=1;
            
            app.ModelMethod=app.LoadMethodFolder('.\METHODS_BPModels\*.m');
            FunctionNames = app.FunctionAssemble(app.ModelMethod,'Instruct');
            for i=1:length(FunctionNames)
                Formulars{i}=eval(FunctionNames{i});
            end
            
            app.ModelMethodDropDown.Items=Formulars;
            app.ModelMethodDropDown.ItemsData=1:length(app.ModelMethod);
            app.ModelMethodDropDown.Value=1;
            app.ModelMethodDropDown_2.Items=Formulars;
            app.ModelMethodDropDown_2.ItemsData=1:length(app.ModelMethod);
            app.ModelMethodDropDown_2.Value=1;
            app.ModelMethodDropDown_3.Items=Formulars;
            app.ModelMethodDropDown_3.ItemsData=1:length(app.ModelMethod);
            app.ModelMethodDropDown_3.Value=1;
        end
        
        function RefreshPlot_Main(app,varargin)
            %Change Main Plot according to Signal and Interval Selection
            if ~isempty(app.AddedSignalList.Items)
                TimeList=app.SignalSet.GetTimeList();
                [RefSBP,RefDBP]=app.SignalSet.GetReference();
                app.ReferenceTable.ColumnName=cellstr(string(1:length(RefSBP)));
                app.ReferenceTable.Data=[TimeList;RefSBP;RefDBP];
            else
                app.ReferenceTable.ColumnName={};
                app.ReferenceTable.Data=[];
                app.RefIntNeg.Value=10;
                app.RefIntPos.Value=10;
            end
            if isempty(app.AddedSignalList.Value)
                cla(app.SignalPlot);
                cla(app.SpectrumPlot);
                return;
            end
            app.SignalSet.SetRefInterval([app.RefIntNeg.Value,app.RefIntPos.Value])
            if nargin>1
                indices = varargin{1};
                app.SelectedIntervalIdx=indices;
            else
                indices=app.SelectedIntervalIdx;
            end
            if ~isempty(indices)
                interval=indices(:,2);
                if all(interval == interval(1))&&interval(1)<=length(app.SignalSet.GetIntervalList())
                    idx=interval(1);
                    SubSignalSet=app.SignalSet.GetInterval(idx);
                    Signal_to_Display=SubSignalSet.GetSignal(app.AddedSignalList.Value);
                    [T,Samples]=Signal_to_Display.GetSamples();
                    plot(app.SignalPlot,T,Samples,'r');
                    xlim(app.SignalPlot,[min(T) max(T)+1]);
                    ylim(app.SignalPlot,[0 1]);
                    [Frequency,Power]=Signal_to_Display.Spectrum('scale','dB');
                    bar(app.SpectrumPlot,Frequency,Power,'b','BaseValue',min(Power));
                    xlim(app.SpectrumPlot,[0,50]);
                    ylim(app.SpectrumPlot,[min(Power),max(Power)]);
                    return;
                end
            end
            
            Signal=app.SignalSet.GetSignal(app.AddedSignalList.Value);
            [T,Samples]=Signal.GetSamples;
            plot(app.SignalPlot,T,Samples,'r');
            xlim(app.SignalPlot,[min(T) max(T)]);
            ylim(app.SignalPlot,[0 1]);
            
            Time_Interval=app.SignalSet.GetIntervalList();
            hold(app.SignalPlot,'on');
            for i=1:length(Time_Interval(:,1))
                ST=Time_Interval(:,1);
                ED=Time_Interval(:,2);
                xline(app.SignalPlot,ST(i),'r','linewidth',2.7);
                xline(app.SignalPlot,ED(i),'b','linewidth',2.7);
            end
            hold(app.SignalPlot,'off');
        end
        function RefreshPlot_Window(app,varargin)
            %Refresh the peak plot according to the selection of interval
            if isempty(app.AddedSignalList.Items)
                cla(app.Window1Plot);
                cla(app.Window2Plot);
                cla(app.PATHistogram);
                app.SQITable1.ColumnName={};
                app.SQITable1.Data=[];
                app.SQITable2.ColumnName={};
                app.SQITable2.Data=[];
                app.PATList.Items={};
                app.SelectedPATList.Items={};
                [Name,ParameterList,Parameters]=app.SignalSet.CheckPostProcess();
                app.PostProcessTable.ColumnName=cellstr(string(1:length(Name)));
                app.PostProcessTable.Data=[Name;ParameterList;Parameters];
                return;
            end
            app.SignalSet.SetRefInterval([app.RefIntNeg.Value,app.RefIntPos.Value])
            app.SignalSet.SetBuffer(app.WindowLength.Value);
            app.SignalSet.SetPATPair([app.Signal1DropDown.Value,app.Signal2DropDown.Value]);
            
            
            if nargin>1
                indices = varargin{1};
                app.SelectedIntervalIdx=indices;
            else
                indices=app.SelectedIntervalIdx;
            end
            
            if ~isempty(indices)
                interval=indices(:,2);
                if all(interval == interval(1))&&interval(1)<=length(app.SignalSet.GetIntervalList())
                    idx=interval(1);
                    SubSignalSet=app.SignalSet.GetInterval(idx);
                    nBuffer=SubSignalSet.GetBufferIndex();
                    app.WindowPosition.Limits=[1,nBuffer];
                    app.WindowPosition.MajorTicks=1:nBuffer;
                    WinSignalSet=SubSignalSet.Buffer(round(app.WindowPosition.Value));
                    
                    Signal_to_Display1=WinSignalSet.GetSignal(app.Signal1DropDown.Value);
                    Sig1Accept=Signal_to_Display1.Quality();
                    [T,Samples]=Signal_to_Display1.GetSamples();
                    HintName=app.FunctionAssemble(app.PeakMethod(app.Sig1PeakMethod.Value),'Hint','Signal_to_Display1');
                    try
                        d1=eval(HintName{1});
                    catch
                        d1=[];
                    end
                    plot(app.Window1Plot,T,Samples,'b','LineWidth',1.5);
                    if ~isempty(d1)
                        hold(app.Window1Plot,"on");
                        plot(app.Window1Plot,T,d1,'m','LineWidth',0.5);
                        hold(app.Window1Plot,"off");
                    end
                    xlim(app.Window1Plot,[min(T) max(T)]);
                    ylim(app.Window1Plot,[0 1]);
                    [Name,Accept,idx,Value,Range,ParameterList,Parameters]=Signal_to_Display1.CheckQualityIndex();
                    
                    app.SQITable1.ColumnName=cellstr(string(1:length(Name)));
                    app.SQITable1.Data=[Name;Accept;Range;Value;ParameterList;Parameters];
                    if ~isempty(idx)
                        hold(app.Window1Plot,"on");
                        plot(app.Window1Plot,T(idx),Samples(idx),'r','LineWidth',1.5);
                        hold(app.Window1Plot,"off");
                    end
                    if Sig1Accept
                        Peaks1idx=Signal_to_Display1.Peaks();
                    else
                        Peaks1idx=[];
                    end
                    
                    if ~isempty(Peaks1idx)
                        hold(app.Window1Plot,"on");
                        plot(app.Window1Plot,T(Peaks1idx),Samples(Peaks1idx),'ro','linewidth',3);
                        hold(app.Window1Plot,"off");
                    end
                    
                    Signal_to_Display2=WinSignalSet.GetSignal(app.Signal2DropDown.Value);
                    Sig2Accept=Signal_to_Display2.Quality();
                    [T,Samples]=Signal_to_Display2.GetSamples();
                    HintName=app.FunctionAssemble(app.PeakMethod(app.Sig2PeakMethod.Value),'Hint','Signal_to_Display2');
                    try
                        d2=eval(HintName{1});
                    catch
                        d2=[];
                    end
                    plot(app.Window2Plot,T,Samples,'b','LineWidth',1.5);
                    if ~isempty(d2)
                        hold(app.Window2Plot,"on");
                        plot(app.Window2Plot,T,d2,'m','LineWidth',0.5);
                        hold(app.Window2Plot,"off");
                    end
                    xlim(app.Window2Plot,[min(T) max(T)]);
                    ylim(app.Window2Plot,[0 1]);
                    [Name,Accept,idx,Value,Range,ParameterList,Parameters]=Signal_to_Display2.CheckQualityIndex();
                    
                    app.SQITable2.ColumnName=cellstr(string(1:length(Name)));
                    app.SQITable2.Data=[Name;Accept;Range;Value;ParameterList;Parameters];
                    if ~isempty(idx)
                        hold(app.Window2Plot,'on');
                        plot(app.Window2Plot,T(idx),Samples(idx),'r','LineWidth',1.5);
                        hold(app.Window2Plot,'off');
                    end
                    if  Sig2Accept
                        Peaks2idx=Signal_to_Display2.Peaks();
                    else
                        Peaks2idx=[];
                    end
                    if ~isempty(Peaks2idx)
                        hold(app.Window2Plot,'on');
                        plot(app.Window2Plot,T(Peaks2idx),Samples(Peaks2idx),'ro','linewidth',3);
                        hold(app.Window2Plot,'off');
                    end
                    [Name,ParameterList,Parameters]=app.SignalSet.CheckPostProcess(); 
                    app.PostProcessTable.ColumnName=cellstr(string(1:length(Name)));
                    app.PostProcessTable.Data=[Name;ParameterList;Parameters];
                    
                    PATs=WinSignalSet.ExtractPAT();
                    if ~isempty(PATs)
                        PAT=num2cell(PATs);
                        for n=1:length(PAT)
                            PATdisp{n}=num2str(PAT{n});
                        end
                    else
                        PATdisp={};
                    end
                    app.PATList.Items=PATdisp;
                    Per_Reference_PATs=SubSignalSet.ExtractPAT('Original');
                    Post_PATs=SubSignalSet.ExtractPAT();
                    if ~isempty(Post_PATs)
                        PostPAT=num2cell(Post_PATs);
                        for n=1:length(PostPAT)
                            PATPostdisp{n}=num2str(PostPAT{n});
                        end
                    else
                        PATPostdisp={};
                    end
                    app.SelectedPATList.Items=PATPostdisp;
                    if ~isempty(Per_Reference_PATs)
                        h=histogram(app.PATHistogram,Per_Reference_PATs,'BinEdges',min(Per_Reference_PATs):0.002:max(Per_Reference_PATs),'FaceColor','b');
                        hold(app.PATHistogram,'on')
                        if ~isempty(Post_PATs)
                            histogram(app.PATHistogram,Post_PATs,'BinEdges',min(Per_Reference_PATs):0.002:max(Per_Reference_PATs),'FaceColor','m');
                        end                        
                        if ~isempty(PATs)
                            histogram(app.PATHistogram,PATs,'BinEdges',min(Per_Reference_PATs):0.002:max(Per_Reference_PATs),'FaceColor','g');
                            set(app.PATHistogram,'xlim',[mean(PATs)-0.05,mean(PATs)+0.05]);
                        else
                            set(app.PATHistogram,'xlim',[mean(Per_Reference_PATs)-0.05,mean(Per_Reference_PATs)+0.05]);
                        end
                        hold(app.PATHistogram,'off')
                        set(app.PATHistogram,'ylim',[0,max(h.Values)]);
                    else
                        cla(app.PATHistogram);
                    end
                else                    
                    cla(app.SpectrumPlot);
                end
            end
        end
        function RefreshAddedSignal(app)
            %Renew the Signal list that can be selected for peak detection
            app.AddedSignalList.Items=app.SignalSet.GetNameList();
            app.AddedSignalList.ItemsData=1:length(app.SignalSet.GetNameList());
            app.Signal1DropDown.Items=app.AddedSignalList.Items;
            app.Signal1DropDown.ItemsData=app.AddedSignalList.ItemsData;
            app.Signal2DropDown.Items=app.AddedSignalList.Items;
            app.Signal2DropDown.ItemsData=app.AddedSignalList.ItemsData;
        end
        function RefreshSelectedMethod(app)
            %Renew method selection once one selection is made
            %Parameter List can always be retrieved
            FunctionNames = app.FunctionAssemble(app.DenoiseMethod,'Instruct');
            [~,app.DenoiseParameterList.Value]=eval(FunctionNames{app.PreprocessingMethodDropDown.Value});
            FunctionNames = app.FunctionAssemble(app.PeakMethod,'Instruct');
            [~,app.PeakExtraction1ParameterList.Value]=eval(FunctionNames{app.Sig1PeakMethod.Value});
            [~,app.PeakExtraction2ParameterList.Value]=eval(FunctionNames{app.Sig2PeakMethod.Value});
            FunctionNames = app.FunctionAssemble(app.SQIMethod,'Instruct');
            [~,app.Sig1SQIParameterList.Value]=eval(FunctionNames{app.SQIMethod1.Value});
            [~,app.Sig2SQIParameterList.Value]=eval(FunctionNames{app.SQIMethod2.Value});
            FunctionNames = app.FunctionAssemble(app.PostProcessMethod,'Instruct');
            [~,app.PostProcessParameterList.Value]=eval(FunctionNames{app.PostProcess.Value});
            
            %Setted Parameters are retrieved only when they exists
            if ~isempty(app.Signal1DropDown.Value)
                Sig1=app.SignalSet.GetSignal(app.Signal1DropDown.Value);
                app.Sig1PeakInput.Value=Sig1.CheckPeakDetect(app.Sig1PeakMethod.Items{app.Sig1PeakMethod.Value});
            else
                app.Sig1PeakInput.Value='';
            end
            
            if ~isempty(app.Signal2DropDown.Value)
                Sig2=app.SignalSet.GetSignal(app.Signal2DropDown.Value);
                app.Sig2PeakInput.Value=Sig2.CheckPeakDetect(app.Sig2PeakMethod.Items{app.Sig2PeakMethod.Value});
            else
                app.Sig2PeakInput.Value='';
            end
            if ~isempty(app.Signal1DropDown.Value)&&~isempty(app.Signal2DropDown.Value)
                app.SaveSettings.Value=fullfile(['./WORKROOT/Saved_Datasets_' app.Signal1DropDown.Items{app.Signal1DropDown.Value} '_' app.Signal2DropDown.Items{app.Signal2DropDown.Value}],[app.DatasetDropDown.Value '.mat']);
            else
                app.SaveSettings.Value='';
            end
        end
        function RefreshRegression_Instant(app)
            %Extract PAT, generate a split, and plot
            ModelObjectName=app.FunctionAssemble(app.ModelMethod(app.ModelMethodDropDown.Value),[],[]);
            ModelObject=eval(ModelObjectName{1});
            app.SignalSet.ExtractPAT();
            %app.SignalSet.Temp_Extract_PAT_With_HR();
            app.SignalSet.Split('Resubstitution');
            app.SignalSet.SetModel(ModelObject);
            [RefSBP,RefDBP,EstSBP,EstDBP,PAT]=app.SignalSet.ModelEvaluate();
            
            %Dump to workspace
            Individual_Fitting_Results.RefSBP=RefSBP;
            Individual_Fitting_Results.RefDBP=RefDBP;
            Individual_Fitting_Results.EstSBP=EstSBP;
            Individual_Fitting_Results.EstDBP=EstDBP;
            Individual_Fitting_Results.PAT=PAT;
            assignin('base','Individual_Fitting_Results',Individual_Fitting_Results);
            
            
            if ~isempty(RefSBP)
                PATNum=length(RefSBP);
                app.TestPATSize_Instant.Value=PATNum;
                SBPMetric=app.PerformanceEval(RefSBP,EstSBP);
                DBPMetric=app.PerformanceEval(RefDBP,EstDBP);
                Metric={'R','ME','MESD','MAE','MAESD'};
                for i=1:numel(Metric)
                    SBPMetrictext{i}=[Metric{i} ' : ' num2str(SBPMetric.(Metric{i}),'%.3f')];
                    DBPMetrictext{i}=[Metric{i} ' : ' num2str(DBPMetric.(Metric{i}),'%.3f')];
                end
                app.SBPRegressionMetrics.Value=['SBP Metrics:', SBPMetrictext];
                app.DBPRegressionMetrics.Value=['DBP Metrics:', DBPMetrictext];
                plot(app.SBPRegression_Instant,RefSBP,EstSBP,'ro')
                hold(app.SBPRegression_Instant,'on');
                line(app.SBPRegression_Instant,[min(RefSBP),max(RefSBP)],[min(RefSBP),max(RefSBP)],'linewidth',1.5,'color','b');
                hold(app.SBPRegression_Instant,'off');
                xlim(app.SBPRegression_Instant,[min([RefSBP;EstSBP]),max([RefSBP;EstSBP])]);
                ylim(app.SBPRegression_Instant,[min([RefSBP;EstSBP]),max([RefSBP;EstSBP])]);
                
                plot(app.DBPRegression_Instant,RefDBP,EstDBP,'ro')
                hold(app.DBPRegression_Instant,'on');
                line(app.DBPRegression_Instant,[min(RefDBP),max(RefDBP)],[min(RefDBP),max(RefDBP)],'linewidth',1.5,'color','b');
                hold(app.DBPRegression_Instant,'off');
                
                
                xlim(app.DBPRegression_Instant,[min([RefDBP;EstDBP]),max([RefDBP;EstDBP])]);
                ylim(app.DBPRegression_Instant,[min([RefDBP;EstDBP]),max([RefDBP;EstDBP])]);
                plot(app.SBPBA_Instant,RefSBP,EstSBP-RefSBP,'ro','linewidth',1);
                hold(app.SBPBA_Instant,'on');
                plot(app.SBPBA_Instant,[min(RefSBP),max(RefSBP)],[mean(EstSBP-RefSBP),mean(EstSBP-RefSBP)],'b','linewidth',2);
                plot(app.SBPBA_Instant,[min(RefSBP),max(RefSBP)],[mean(EstSBP-RefSBP)+1.96*std(EstSBP-RefSBP),mean(EstSBP-RefSBP)+1.96*std(EstSBP-RefSBP)],'m--','linewidth',2);
                plot(app.SBPBA_Instant,[min(RefSBP),max(RefSBP)],[mean(EstSBP-RefSBP)-1.96*std(EstSBP-RefSBP),mean(EstSBP-RefSBP)-1.96*std(EstSBP-RefSBP)],'m--','linewidth',2);
                
                ylim(app.SBPBA_Instant,[mean(EstSBP-RefSBP)-4*std(EstSBP-RefSBP),mean(EstSBP-RefSBP)+4*std(EstSBP-RefSBP)])
                hold(app.SBPBA_Instant,'off');
                
                plot(app.DBPBA_Instant,RefDBP,EstDBP-RefDBP,'ro','linewidth',1);
                hold(app.DBPBA_Instant,'on');
                plot(app.DBPBA_Instant,[min(RefDBP),max(RefDBP)],[mean(EstDBP-RefDBP),mean(EstDBP-RefDBP)],'b','linewidth',2,'DisplayName','ME');
                plot(app.DBPBA_Instant,[min(RefDBP),max(RefDBP)],[mean(EstDBP-RefDBP)+1.96*std(EstDBP-RefDBP),mean(EstDBP-RefDBP)+1.96*std(EstDBP-RefDBP)],'m--','linewidth',2,'DisplayName','SD');
                plot(app.DBPBA_Instant,[min(RefDBP),max(RefDBP)],[mean(EstDBP-RefDBP)-1.96*std(EstDBP-RefDBP),mean(EstDBP-RefDBP)-1.96*std(EstDBP-RefDBP)],'m--','linewidth',2);
                
                ylim(app.DBPBA_Instant,[mean(EstDBP-RefDBP)-4*std(EstDBP-RefDBP),mean(EstDBP-RefDBP)+4*std(EstDBP-RefDBP)])
                hold(app.DBPBA_Instant,'off');
                plot(app.SBPvariation,1:PATNum,RefSBP,'linewidth',1.5);
                plot(app.DBPvariation,1:PATNum,RefDBP,'linewidth',1.5);
                hold(app.SBPvariation,'on');
                hold(app.DBPvariation,'on');
                plot(app.SBPvariation,1:PATNum,EstSBP,'m','linewidth',0.3);
                plot(app.DBPvariation,1:PATNum,EstDBP,'m','linewidth',0.3);
                hold(app.SBPvariation,'off');
                hold(app.DBPvariation,'off');
            end
        end
        function RefreshSavedObjects_Load(app)
            if isempty(app.DatasetDropDown.Items)
                app.SavedSettingDropDown.Items={};
                return
            end
            Path='./WORKROOT';
            FolderNames=app.GetSubFolders(Path);
            idx=[];
            for i=1:length(FolderNames)
                if isfile(fullfile(Path,FolderNames{i},[app.DatasetDropDown.Value '.mat']))
                    idx=[idx;i];
                end
            end
            app.SavedSettingDropDown.Items=FolderNames(idx);
        end
        
        function RefreshSavedObjects_Overall(app)
            %Refresh subject list ready for overall comaparison
            %in./WORKROOT
            try
                Path='./WORKROOT';
                FolderNames=app.GetSubFolders(Path);
                app.SavedFolder.Items=FolderNames;
                FileNames=app.GetMatFiles(fullfile(Path,app.SavedFolder.Value));
                app.IncludedListBox.Items=intersect(app.IncludedListBox.Items,FileNames);
                app.ExcludedListBox.Items=setdiff(FileNames,app.IncludedListBox.Items);
                app.IncludedListBox.Items=app.StringSort(app.IncludedListBox.Items);
                app.ExcludedListBox.Items=app.StringSort(app.ExcludedListBox.Items);
            catch
            end
        end
        function RefreshSavedObjects_Specific(app)
            %Refresh subject list ready for overall comaparison
            %in./WORKROOT
            try
                Path='./WORKROOT';
                FolderNames=app.GetSubFolders(Path);
                app.SavedFolder_2.Items=FolderNames;
                FileNames=app.GetMatFiles(fullfile(Path,app.SavedFolder_2.Value));
                app.ExcludedListBox_2.Items=FileNames;
                app.ExcludedListBox_2.Items=app.StringSort(app.ExcludedListBox_2.Items);
            catch
            end
        end
        function RefreshRegression_Overall(app)
            %Plot evaluations from saved subjects files
            if isempty(app.OverallEval)
                cla(app.SBPRegression_Ovarall);
                cla(app.DBPRegression_Overall);
                cla(app.SBPBA_Overall);
                cla(app.DBPBA_Overall);
                return;
            end
            
            RefSBP=[];
            RefDBP=[];
            EstSBP=[];
            EstDBP=[];
            for i=1:length(app.OverallEval)
                RefSBP=[RefSBP;app.OverallEval(i).RefSBP];
                RefDBP=[RefDBP;app.OverallEval(i).RefDBP];
                EstSBP=[EstSBP;app.OverallEval(i).EstSBP];
                EstDBP=[EstDBP;app.OverallEval(i).EstDBP];
            end
            
            if ~isempty(RefSBP)
                cla(app.SBPRegression_Ovarall);
                cla(app.DBPRegression_Overall);
                cla(app.SBPBA_Overall);
                cla(app.DBPBA_Overall);
                
                plot(app.SBPRegression_Ovarall,RefSBP,EstSBP,'bo')
                hold(app.SBPRegression_Ovarall,'on');
                line(app.SBPRegression_Ovarall,[min(RefSBP),max(RefSBP)],[min(RefSBP),max(RefSBP)],'linewidth',1.5,'color','b');
                hold(app.SBPRegression_Ovarall,'off');
                xlim(app.SBPRegression_Ovarall,[min([RefSBP;EstSBP]),max([RefSBP;EstSBP])]);
                ylim(app.SBPRegression_Ovarall,[min([RefSBP;EstSBP]),max([RefSBP;EstSBP])]);
                
                plot(app.DBPRegression_Overall,RefDBP,EstDBP,'bo')
                hold(app.DBPRegression_Overall,'on');
                line(app.DBPRegression_Overall,[min(RefDBP),max(RefDBP)],[min(RefDBP),max(RefDBP)],'linewidth',1.5,'color','b');
                hold(app.DBPRegression_Overall,'off');
                
                
                xlim(app.DBPRegression_Overall,[min([RefDBP;EstDBP]),max([RefDBP;EstDBP])]);
                ylim(app.DBPRegression_Overall,[min([RefDBP;EstDBP]),max([RefDBP;EstDBP])]);
                plot(app.SBPBA_Overall,RefSBP,EstSBP-RefSBP,'bo','linewidth',1);
                hold(app.SBPBA_Overall,'on');
                plot(app.SBPBA_Overall,[min(RefSBP),max(RefSBP)],[mean(EstSBP-RefSBP),mean(EstSBP-RefSBP)],'b','linewidth',2);
                plot(app.SBPBA_Overall,[min(RefSBP),max(RefSBP)],[mean(EstSBP-RefSBP)+1.96*std(EstSBP-RefSBP),mean(EstSBP-RefSBP)+1.96*std(EstSBP-RefSBP)],'m--','linewidth',2);
                plot(app.SBPBA_Overall,[min(RefSBP),max(RefSBP)],[mean(EstSBP-RefSBP)-1.96*std(EstSBP-RefSBP),mean(EstSBP-RefSBP)-1.96*std(EstSBP-RefSBP)],'m--','linewidth',2);
                
                ylim(app.SBPBA_Overall,[mean(EstSBP-RefSBP)-4*std(EstSBP-RefSBP),mean(EstSBP-RefSBP)+4*std(EstSBP-RefSBP)])
                hold(app.SBPBA_Overall,'off');
                
                plot(app.DBPBA_Overall,RefDBP,EstDBP-RefDBP,'bo','linewidth',1);
                hold(app.DBPBA_Overall,'on');
                plot(app.DBPBA_Overall,[min(RefDBP),max(RefDBP)],[mean(EstDBP-RefDBP),mean(EstDBP-RefDBP)],'b','linewidth',2,'DisplayName','ME');
                plot(app.DBPBA_Overall,[min(RefDBP),max(RefDBP)],[mean(EstDBP-RefDBP)+1.96*std(EstDBP-RefDBP),mean(EstDBP-RefDBP)+1.96*std(EstDBP-RefDBP)],'m--','linewidth',2,'DisplayName','SD');
                plot(app.DBPBA_Overall,[min(RefDBP),max(RefDBP)],[mean(EstDBP-RefDBP)-1.96*std(EstDBP-RefDBP),mean(EstDBP-RefDBP)-1.96*std(EstDBP-RefDBP)],'m--','linewidth',2);
                
                ylim(app.DBPBA_Overall,[mean(EstDBP-RefDBP)-4*std(EstDBP-RefDBP),mean(EstDBP-RefDBP)+4*std(EstDBP-RefDBP)])
                hold(app.DBPBA_Overall,'off');
                
                if  ~strcmp(app.ShowSubject.Value,'All')
                    Files=app.IncludedListBox.Items;
                    ID=find(strcmp(app.ShowSubject.Value,Files));
                    RefSBP=app.OverallEval(ID).RefSBP;
                    RefDBP=app.OverallEval(ID).RefDBP;
                    EstSBP=app.OverallEval(ID).EstSBP;
                    EstDBP=app.OverallEval(ID).EstDBP;
                end
                
                SBPMetric=app.PerformanceEval(RefSBP,EstSBP);
                DBPMetric=app.PerformanceEval(RefDBP,EstDBP);
                Metric={'R','ME','MESD','MAE','MAESD'};
                for i=1:numel(Metric)
                    SBPMetrictext{i}=[Metric{i} ' : ' num2str(SBPMetric.(Metric{i}),'%.3f')];
                    DBPMetrictext{i}=[Metric{i} ' : ' num2str(DBPMetric.(Metric{i}),'%.3f')];
                end
                app.SBPRegressionMetrics_2.Value=['SBP Metrics:', SBPMetrictext];
                app.DBPRegressionMetrics_2.Value=['DBP Metrics:', DBPMetrictext];
                PATNum=length(RefSBP);
                app.TestPATSize_Overall.Value=PATNum;
                
                hold(app.SBPRegression_Ovarall,'on');
                plot(app.SBPRegression_Ovarall,RefSBP,EstSBP,'ro')
                hold(app.SBPRegression_Ovarall,'off');
                
                hold(app.DBPRegression_Overall,'on');
                plot(app.DBPRegression_Overall,RefDBP,EstDBP,'ro')
                hold(app.DBPRegression_Overall,'off');
                
                
                hold(app.SBPBA_Overall,'on');
                plot(app.SBPBA_Overall,RefSBP,EstSBP-RefSBP,'ro','linewidth',1,'DisplayName','Selected');
                hold(app.SBPBA_Overall,'off');
                
                
                hold(app.DBPBA_Overall,'on');
                plot(app.DBPBA_Overall,RefDBP,EstDBP-RefDBP,'ro','linewidth',1,'DisplayName','Selected');
                hold(app.DBPBA_Overall,'off');
                
                
                
            end
        end
        function RefreshRegression_Specific(app)
            %Plot evaluations from saved subjects files
            if isempty(app.SpecificEval)
                cla(app.SBPRegression_Specific);
                cla(app.DBPRegression_Specific);
                cla(app.SBPBA_Specific);
                cla(app.DBPBA_Specific);
                return;
            end
            
            RefSBP=[];
            RefDBP=[];
            EstSBP=[];
            EstDBP=[];
            for i=1:length(app.SpecificEval)
                RefSBP=[RefSBP;app.SpecificEval(i).RefSBP];
                RefDBP=[RefDBP;app.SpecificEval(i).RefDBP];
                EstSBP=[EstSBP;app.SpecificEval(i).EstSBP];
                EstDBP=[EstDBP;app.SpecificEval(i).EstDBP];
            end
            
            if ~isempty(RefSBP)
                cla(app.SBPRegression_Specific);
                cla(app.DBPRegression_Specific);
                cla(app.SBPBA_Specific);
                cla(app.DBPBA_Specific);
                
                plot(app.SBPRegression_Specific,RefSBP,EstSBP,'bo')
                hold(app.SBPRegression_Specific,'on');
                line(app.SBPRegression_Specific,[min(RefSBP),max(RefSBP)],[min(RefSBP),max(RefSBP)],'linewidth',1.5,'color','b');
                hold(app.SBPRegression_Specific,'off');
                xlim(app.SBPRegression_Specific,[min([RefSBP;EstSBP]),max([RefSBP;EstSBP])]);
                ylim(app.SBPRegression_Specific,[min([RefSBP;EstSBP]),max([RefSBP;EstSBP])]);
                
                plot(app.DBPRegression_Specific,RefDBP,EstDBP,'bo')
                hold(app.DBPRegression_Specific,'on');
                line(app.DBPRegression_Specific,[min(RefDBP),max(RefDBP)],[min(RefDBP),max(RefDBP)],'linewidth',1.5,'color','b');
                hold(app.DBPRegression_Specific,'off');
                
                
                xlim(app.DBPRegression_Specific,[min([RefDBP;EstDBP]),max([RefDBP;EstDBP])]);
                ylim(app.DBPRegression_Specific,[min([RefDBP;EstDBP]),max([RefDBP;EstDBP])]);
                plot(app.SBPBA_Specific,RefSBP,EstSBP-RefSBP,'bo','linewidth',1);
                hold(app.SBPBA_Specific,'on');
                plot(app.SBPBA_Specific,[min(RefSBP),max(RefSBP)],[mean(EstSBP-RefSBP),mean(EstSBP-RefSBP)],'b','linewidth',2);
                plot(app.SBPBA_Specific,[min(RefSBP),max(RefSBP)],[mean(EstSBP-RefSBP)+1.96*std(EstSBP-RefSBP),mean(EstSBP-RefSBP)+1.96*std(EstSBP-RefSBP)],'m--','linewidth',2);
                plot(app.SBPBA_Specific,[min(RefSBP),max(RefSBP)],[mean(EstSBP-RefSBP)-1.96*std(EstSBP-RefSBP),mean(EstSBP-RefSBP)-1.96*std(EstSBP-RefSBP)],'m--','linewidth',2);
                
                ylim(app.SBPBA_Specific,[mean(EstSBP-RefSBP)-4*std(EstSBP-RefSBP),mean(EstSBP-RefSBP)+4*std(EstSBP-RefSBP)])
                hold(app.SBPBA_Specific,'off');
                
                plot(app.DBPBA_Specific,RefDBP,EstDBP-RefDBP,'bo','linewidth',1);
                hold(app.DBPBA_Specific,'on');
                plot(app.DBPBA_Specific,[min(RefDBP),max(RefDBP)],[mean(EstDBP-RefDBP),mean(EstDBP-RefDBP)],'b','linewidth',2,'DisplayName','ME');
                plot(app.DBPBA_Specific,[min(RefDBP),max(RefDBP)],[mean(EstDBP-RefDBP)+1.96*std(EstDBP-RefDBP),mean(EstDBP-RefDBP)+1.96*std(EstDBP-RefDBP)],'m--','linewidth',2,'DisplayName','SD');
                plot(app.DBPBA_Specific,[min(RefDBP),max(RefDBP)],[mean(EstDBP-RefDBP)-1.96*std(EstDBP-RefDBP),mean(EstDBP-RefDBP)-1.96*std(EstDBP-RefDBP)],'m--','linewidth',2);
                
                ylim(app.DBPBA_Specific,[mean(EstDBP-RefDBP)-4*std(EstDBP-RefDBP),mean(EstDBP-RefDBP)+4*std(EstDBP-RefDBP)])
                hold(app.DBPBA_Specific,'off');
                
                if  ~strcmp(app.ShowSubject_2.Value,'All')
                    Files=app.TestListBox.Items;
                    ID=find(strcmp(app.ShowSubject_2.Value,Files));
                    RefSBP=app.SpecificEval(ID).RefSBP;
                    RefDBP=app.SpecificEval(ID).RefDBP;
                    EstSBP=app.SpecificEval(ID).EstSBP;
                    EstDBP=app.SpecificEval(ID).EstDBP;
                end
                
                
                
                SBPMetric=app.PerformanceEval(RefSBP,EstSBP);
                DBPMetric=app.PerformanceEval(RefDBP,EstDBP);
                Metric={'R','ME','MESD','MAE','MAESD'};
                for i=1:numel(Metric)
                    SBPMetrictext{i}=[Metric{i} ' : ' num2str(SBPMetric.(Metric{i}),'%.3f')];
                    DBPMetrictext{i}=[Metric{i} ' : ' num2str(DBPMetric.(Metric{i}),'%.3f')];
                end
                app.SBPRegressionMetrics_3.Value=['SBP Metrics:', SBPMetrictext];
                app.DBPRegressionMetrics_3.Value=['DBP Metrics:', DBPMetrictext];
                
                hold(app.SBPRegression_Specific,'on');
                plot(app.SBPRegression_Specific,RefSBP,EstSBP,'ro')
                hold(app.SBPRegression_Specific,'off');
                
                hold(app.DBPRegression_Specific,'on');
                plot(app.DBPRegression_Specific,RefDBP,EstDBP,'ro')
                hold(app.DBPRegression_Overall,'off');
                
                
                hold(app.SBPBA_Specific,'on');
                plot(app.SBPBA_Specific,RefSBP,EstSBP-RefSBP,'ro','linewidth',1,'DisplayName','Selected');
                hold(app.SBPBA_Specific,'off');
                
                
                hold(app.DBPBA_Specific,'on');
                plot(app.DBPBA_Specific,RefDBP,EstDBP-RefDBP,'ro','linewidth',1,'DisplayName','Selected');
                hold(app.DBPBA_Specific,'off');
            end
        end
        function RefreshSourceObjects(app)
            %Find avaliable subject folder and signal file name
            try                
                FolderNames=app.GetSubFolders(app.FileFolderPath.Value);
                for i=1:length(FolderNames)
                    num(i)=str2num(FolderNames{i}(regexp(FolderNames{i},'\d')));
                end
                [~,idx]=sort(num);
                app.DatasetDropDown.Items=FolderNames(idx);
                app.SubjectDropDown2.Items=['All',FolderNames(idx)];
                FileNames=app.GetMatFiles(fullfile(app.FileFolderPath.Value,app.DatasetDropDown.Value));
                FileNames(strcmp(FileNames,'Dataset.mat'))=[];
                app.SignalFilename.Items=FileNames;
            catch err
                app.DatasetDropDown.Items={};
                app.SignalFilename.Items={};
            end
        end
        
        function SubjectEvaluation_Overall(app)
            %Read stored PAT value, split, train and test
            Files=app.IncludedListBox.Items;
            app.OverallEval=[];
            if isempty(Files)
                return;
            end
            for i=1:length(Files)
                SubjectName=Files{i};
                FilePath=fullfile('./WORKROOT',app.SavedFolder.Value,SubjectName);
                Subject=load(FilePath);
                SubjectField=fieldnames(Subject);
                Subject=Subject.(SubjectField{1});
                ModelObjectName=app.FunctionAssemble(app.ModelMethod(app.ModelMethodDropDown_2.Value),[],[]);
                ModelObject=eval(ModelObjectName{1});
                Subject.SetModel(ModelObject);
                switch app.Mode_Overall.Value
                    case 'Split'
                        Subject.Split('HoldOut',1-app.TrainingRatioEditField_2.Value);
                    case 'Regression'
                        Subject.Split('Resubstitution');
                end
                app.OverallEval(i).Subject_Name=SubjectName;
                [app.OverallEval(i).RefSBP,app.OverallEval(i).RefDBP,app.OverallEval(i).EstSBP,app.OverallEval(i).EstDBP,app.OverallEval(i).PAT]=Subject.ModelEvaluate();
                assignin('base','Overall_Fitting_Results',app.OverallEval);
            end
            
        end
        function SubjectEvaluation_Specific(app)
            MergedTrainingSet=Signal_Set();
            app.SpecificEval=[];
            if isempty(app.TrainListBox.Items)||isempty(app.TestListBox.Items)
                return;
            end
            if strcmp(app.ModeDropDown_2.Value,'Full')
                Train_List=app.TrainListBox.Items;
                Test_List=app.TestListBox.Items;
                AllTrainExtraction=[];
                for i=1:length(Train_List)
                    FilePath=fullfile('./WORKROOT',app.SavedFolder_2.Value,Train_List{i});
                    SubjectFile=load(FilePath);
                    SubjectField=fieldnames(SubjectFile);
                    Subject=SubjectFile.(SubjectField{1});
                    AllTrainExtraction=[AllTrainExtraction;Subject.Extraction];
                end
                MergedTrainingSet.Extraction=AllTrainExtraction;
                ModelObjectName=app.FunctionAssemble(app.ModelMethod(app.ModelMethodDropDown_3.Value),[],[]);
                ModelObject=eval(ModelObjectName{1});
                MergedTrainingSet.SetModel(ModelObject);
                MergedTrainingSet.TrainModel('All');
                NumTest=0;
                for i=1:length(Test_List)
                    FilePath=fullfile('./WORKROOT',app.SavedFolder_2.Value,Test_List{i});
                    SubjectFile=load(FilePath);
                    SubjectField=fieldnames(SubjectFile);
                    CurrentSubject=SubjectFile.(SubjectField{1});
                    TrainedModelObject=MergedTrainingSet.ModelSetting;
                    CurrentSubject.SetModel(TrainedModelObject);
                    app.SpecificEval(i).Subject_Name=Test_List{i};
                    [app.SpecificEval(i).RefSBP,app.SpecificEval(i).RefDBP,app.SpecificEval(i).EstSBP,app.SpecificEval(i).EstDBP,app.SpecificEval(i).PAT]=CurrentSubject.TestModel('All');
                    NumTest=NumTest+length(app.SpecificEval(i).RefSBP);
                end
                
            elseif strcmp(app.ModeDropDown_2.Value,'Split')
                All_Subjects_List=union(app.TrainListBox.Items,app.TestListBox.Items,'stable');
                All_Subjects_List=app.StringSort(All_Subjects_List);
                [~,~,idxSubjectTrain]=intersect(app.TrainListBox.Items,All_Subjects_List);
                [~,~,idxSubjectTest]=intersect(app.TestListBox.Items,All_Subjects_List);
                app.TestListBox.Items=All_Subjects_List(idxSubjectTest);
                app.ShowSubject_2.Items=['All',All_Subjects_List(idxSubjectTest)];
                for i=1:length(All_Subjects_List)
                    SubjectName=All_Subjects_List{i};
                    FilePath=fullfile('./WORKROOT',app.SavedFolder_2.Value,SubjectName);
                    SubjectFile=load(FilePath);
                    SubjectField=fieldnames(SubjectFile);
                    Subject(i)=SubjectFile.(SubjectField{1});
                    Subject(i).Split('HoldOut',1-app.TrainingRatioEditField.Value);
                end
                AllTrainExtraction=[];
                for i=idxSubjectTrain'
                    [TrainEXT,~]=Subject(i).GetSplit();
                    AllTrainExtraction=[AllTrainExtraction;TrainEXT];
                end
                MergedTrainingSet.Extraction=AllTrainExtraction;
                ModelObjectName=app.FunctionAssemble(app.ModelMethod(app.ModelMethodDropDown_3.Value),[],[]);
                ModelObject=eval(ModelObjectName{1});
                MergedTrainingSet.SetModel(ModelObject);
                MergedTrainingSet.TrainModel('All');
                k=1;
                NumTest=0;
                for i=idxSubjectTest'
                    CurrentSubject=Subject(i);
                    TrainedModelObject=MergedTrainingSet.ModelSetting;
                    CurrentSubject.SetModel(TrainedModelObject);
                    app.SpecificEval(k).Subject_Name=All_Subjects_List{i};
                    [app.SpecificEval(k).RefSBP,app.SpecificEval(k).RefDBP,app.SpecificEval(k).EstSBP,app.SpecificEval(k).EstDBP,app.SpecificEval(k).PAT]=CurrentSubject.TestModel();
                    NumTest=NumTest+length(app.SpecificEval(k).RefSBP);
                    k=k+1;
                end
            end
            app.TrainPATSize.Value=length(AllTrainExtraction(:,1));
            app.TestPATSize.Value=NumTest;
            assignin('base','Specific_Fitting_Results',app.SpecificEval);
        end
        function RefreshPeakSetting_Subject(app)
            %Sync the selections with current status of saved subjects if
            %possible
            if ~isempty(app.SignalSet.BufferLength)
                app.WindowLength.Value=app.SignalSet.BufferLength/app.SignalSet.Sig_List{1}.RATE;
            end
            if ~isempty(app.SignalSet.PATPairIndex)
                app.Signal1DropDown.Value=app.SignalSet.PATPairIndex(1);
                app.Signal2DropDown.Value=app.SignalSet.PATPairIndex(2);
                Sig1=app.SignalSet.GetSignal(app.SignalSet.PATPairIndex(1));
                Sig2=app.SignalSet.GetSignal(app.SignalSet.PATPairIndex(2));
                if ~isempty(Sig1.PeakDetectSetting)
                    Signal1Peak=Sig1.PeakDetectSetting.Instruct();
                    app.Sig1PeakMethod.Value=find(strcmp(Signal1Peak,app.Sig1PeakMethod.Items));
                end
                if ~isempty(Sig2.PeakDetectSetting)
                    Signal2Peak=Sig2.PeakDetectSetting.Instruct();
                    app.Sig2PeakMethod.Value=find(strcmp(Signal2Peak,app.Sig1PeakMethod.Items));
                end
                if ~isempty(app.SignalSet.PostProcessSetting)
                    [Name,ParameterList,Parameters]=app.SignalSet.CheckPostProcess();
                    app.PostProcessTable.ColumnName=cellstr(string(1:length(Name)));
                    app.PostProcessTable.Data=[Name;ParameterList;Parameters];
                end
            end
        end
        
        function RefreshPeakSetting_Signal(app)
            %After selecting another signal, try to select the peak
            %detection method that has been setted for that Signal
            Sig1=app.SignalSet.GetSignal(app.SignalSet.PATPairIndex(1));
            Sig2=app.SignalSet.GetSignal(app.SignalSet.PATPairIndex(2));
            if ~isempty(Sig1.PeakDetectSetting)
                Signal1Peak=Sig1.PeakDetectSetting.Instruct();
                app.Sig1PeakMethod.Value=find(strcmp(Signal1Peak,app.Sig1PeakMethod.Items));
            end
            if ~isempty(Sig2.PeakDetectSetting)
                Signal2Peak=Sig2.PeakDetectSetting.Instruct();
                app.Sig2PeakMethod.Value=find(strcmp(Signal2Peak,app.Sig1PeakMethod.Items));
            end
        end
        
        
        
        function RefreshDenoiseSetting(app)
            %When selecting a signal, display the denoise setting and its
            %parameters
            if ~isempty(app.AddedSignalList.Value)
                Signal=app.SignalSet.GetSignal(app.AddedSignalList.Value);
                app.DenoiseInput.Value=Signal.CheckDenoise(app.PreprocessingMethodDropDown.Items{app.PreprocessingMethodDropDown.Value});
            else
                app.DenoiseInput.Value='';
            end
        end
        
        
        
        
        
        function PerformanceReport_Overall(app)
            RefSBP_Overall=[];
            RefDBP_Overall=[];
            EstSBP_Overall=[];
            EstDBP_Overall=[];
            for ID=1:length(app.IncludedListBox.Items)
                RefSBP=app.OverallEval(ID).RefSBP;
                RefDBP=app.OverallEval(ID).RefDBP;
                EstSBP=app.OverallEval(ID).EstSBP;
                EstDBP=app.OverallEval(ID).EstDBP;
                RefSBP_Overall=[RefSBP_Overall;RefSBP];
                RefDBP_Overall=[RefDBP_Overall;RefDBP];
                EstSBP_Overall=[EstSBP_Overall;EstSBP];
                EstDBP_Overall=[EstDBP_Overall;EstDBP];
                SBPMetrics{ID}=app.PerformanceEval(RefSBP,EstSBP);
                DBPMetrics{ID}=app.PerformanceEval(RefDBP,EstDBP);
                Subject_ID{ID}=app.IncludedListBox.Items{ID};
            end
            ID=ID+1;
            Subject_ID{ID}='Overall';
            SBPMetrics{ID}=app.PerformanceEval(RefSBP_Overall,EstSBP_Overall);
            DBPMetrics{ID}=app.PerformanceEval(RefDBP_Overall,EstDBP_Overall);
            Title={'Subject_ID','R_SBP','RMSE_SBP','ME_SBP','SD_SBP','MAE_SBP','SD_SBP','R_DBP','RMSE_DBP','ME_DBP','SD_DBP','MAE_DBP','SD_DBP'};
            Table_Body=zeros(ID,12);
            for i=1:numel(SBPMetrics)
                SMetrics=SBPMetrics{i};
                DMetrics=DBPMetrics{i};
                Metrics={'R','RMSE','ME','MESD','MAE','MAESD'};
                for j=1:numel(Metrics)
                    Table_Body(i,j)=SMetrics.(Metrics{j});
                end
                for j=1:numel(Metrics)
                    Table_Body(i,numel(Metrics)+j)=DMetrics.(Metrics{j});
                end
            end
            Table_Body=[Subject_ID',num2cell(Table_Body)];
            Table=[Title;Table_Body];
            writecell(Table,app.OverallPerformanceFolder.Value);
        end
        
        function PerformanceReport_Specific(app)
            RefSBP_Overall=[];
            RefDBP_Overall=[];
            EstSBP_Overall=[];
            EstDBP_Overall=[];
            for ID=1:length(app.TestListBox.Items)
                %                 Files=app.IncludedListBox.Items;
                %                 ID=find(strcmp(app.ShowSubject.Value,Files));
                RefSBP=app.SpecificEval(ID).RefSBP;
                RefDBP=app.SpecificEval(ID).RefDBP;
                EstSBP=app.SpecificEval(ID).EstSBP;
                EstDBP=app.SpecificEval(ID).EstDBP;
                RefSBP_Overall=[RefSBP_Overall;RefSBP];
                RefDBP_Overall=[RefDBP_Overall;RefDBP];
                EstSBP_Overall=[EstSBP_Overall;EstSBP];
                EstDBP_Overall=[EstDBP_Overall;EstDBP];
                SBPMetrics{ID}=app.PerformanceEval(RefSBP,EstSBP);
                DBPMetrics{ID}=app.PerformanceEval(RefDBP,EstDBP);
                Subject_ID{ID}=app.IncludedListBox.Items{ID};
            end
            ID=ID+1;
            Subject_ID{ID}='Overall';
            SBPMetrics{ID}=app.PerformanceEval(RefSBP_Overall,EstSBP_Overall);
            DBPMetrics{ID}=app.PerformanceEval(RefDBP_Overall,EstDBP_Overall);
            Title={'Subject_ID','R_SBP','RMSE_SBP','ME_SBP','SD_SBP','MAE_SBP','SD_SBP','R_DBP','RMSE_DBP','ME_DBP','SD_DBP','MAE_DBP','SD_DBP'};
            Table_Body=zeros(ID,12);
            for i=1:numel(SBPMetrics)
                SMetrics=SBPMetrics{i};
                DMetrics=DBPMetrics{i};
                Metrics={'R','RMSE','ME','MESD','MAE','MAESD'};
                for j=1:numel(Metrics)
                    Table_Body(i,j)=SMetrics.(Metrics{j});
                end
                for j=1:numel(Metrics)
                    Table_Body(i,numel(Metrics)+j)=DMetrics.(Metrics{j});
                end
            end
            Table_Body=[Subject_ID',num2cell(Table_Body)];
            Table=[Title;Table_Body];
            writecell(Table,app.SpecificPerformanceFolder.Value);
        end
        
        function FolderNames = GetSubFolders(~,Path)
            Files=dir(Path);
            subDirs = {Files([Files(:).isdir]).name};
            FolderNames = subDirs(~startsWith(subDirs,"."));
        end
        function FileNames=GetMatFiles(~,Path)
            FileNames={dir(fullfile(Path,'*.mat')).name};
        end

    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.SelectedIntervalIdx=[];
            app.ReadAvaliableMethods();
            app.RefreshSourceObjects();
            app.RefreshSavedObjects_Load();
            app.RefreshSavedObjects_Overall();
            app.RefreshSavedObjects_Specific();
            app.OverallEval=[];
            app.SpecificEval=[];
            app.Status.Value='No Dataset Loaded';
            if ~isfolder('.\WORKROOT')
                mkdir('.\WORKROOT')
            end
            if ~isempty(app.SavedFolder.Items)
                app.OverallPerformanceFolder.Value=fullfile('.\WORKROOT',[app.SavedFolder.Value,'.xlsx']);
            end
            app.SpecificPerformanceFolder.Value=fullfile('.\WORKROOT','Trained_Model_Performance.xlsx');
            app.ApplyAllSavePath.Value='.\WORKROOT\Saved_Datasets_Unified';
        end

        % Value changed function: RefIntPos
        function RefIntPosValueChanged(app, event)
            app.RefreshPlot_Main();
            app.RefreshPlot_Window();
        end

        % Value changed function: RefIntNeg
        function RefIntNegValueChanged(app, event)
            app.RefreshPlot_Main();
            app.RefreshPlot_Window();
        end

        % Button pushed function: SignalAddButton
        function SignalAddButtonPushed(app, event)
            %% Waveform
            app.SignalSet.Append(Signal(fullfile(app.FileFolderPath.Value,app.DatasetDropDown.Value),app.SignalFilename.Value));
            app.SignalSet.SetReferenceFromFile('Dataset.mat');
            app.RefreshAddedSignal();
            TimeList=app.SignalSet.GetTimeList();
            [RefSBP,RefDBP]=app.SignalSet.GetReference();
            app.ReferenceTable.ColumnName=cellstr(string(1:length(RefSBP)));
            app.ReferenceTable.Data=[TimeList;RefSBP;RefDBP];
        end

        % Button pushed function: SignalRemoveButton
        function SignalRemoveButtonPushed(app, event)
            app.SignalSet.Pop();
            app.RefreshAddedSignal();
            app.RefreshPlot_Main();
        end

        % Value changed function: FileFolderPath
        function FileFolderPathValueChanged(app, event)
            app.RefreshSourceObjects();
            app.RefreshSavedObjects_Load();
        end

        % Value changed function: AddedSignalList
        function AddedSignalListValueChanged(app, event)
            app.RefreshPlot_Main();
            app.RefreshPlot_Window();
            app.RefreshDenoiseSetting();
        end

        % Value changed function: PreprocessingMethodDropDown
        function PreprocessingMethodDropDownValueChanged(app, event)
            app.RefreshSelectedMethod();
            app.RefreshDenoiseSetting();
        end

        % Value changed function: Sig1PeakMethod
        function Sig1PeakMethodValueChanged(app, event)
            app.RefreshSelectedMethod();
            app.RefreshPlot_Window();
        end

        % Value changed function: Sig2PeakMethod
        function Sig2PeakMethodValueChanged(app, event)
            app.RefreshSelectedMethod();
            app.RefreshPlot_Window();
        end

        % Button pushed function: ApplyButton
        function ApplyButtonPushed(app, event)
            DenoiseObjectName=app.FunctionAssemble(app.DenoiseMethod(app.PreprocessingMethodDropDown.Value),[],app.DenoiseInput.Value);
            DenoiseObject=eval(DenoiseObjectName{1});
            Signal=app.SignalSet.GetSignal(app.AddedSignalList.Value);
            Signal.SetDenoise(DenoiseObject);
            Signal.Denoise();
            app.RefreshPlot_Main();
            app.RefreshPlot_Window();
        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            Signal=app.SignalSet.GetSignal(app.AddedSignalList.Value);
            Signal.Reset();
            app.RefreshPlot_Main();
            app.RefreshPlot_Window();
        end

        % Cell selection callback: ReferenceTable
        function ReferenceTableCellSelection(app, event)
            app.WindowPosition.Value=1;
            app.RefreshPlot_Main(event.Indices)
            app.RefreshPlot_Window(event.Indices)
        end

        % Value changed function: WindowPosition
        function WindowPositionValueChanged(app, event)
            app.WindowPosition.Value=round(app.WindowPosition.Value);
            app.RefreshPlot_Window();
        end

        % Value changing function: WindowPosition
        function WindowPositionValueChanging(app, event)
            app.WindowPosition.Value=round(event.Value);
            app.RefreshPlot_Window();
        end

        % Button pushed function: Sig1SQIAdd
        function Sig1SQIAddPushed(app, event)
            InputString=[num2str(app.SQI1Low.Value),',',num2str(app.SQI1High.Value)];
            if ~isempty(app.Sig1SQIInput.Value)
                InputString=[InputString,',',app.Sig1SQIInput.Value];
            end
            SQIObjectName=app.FunctionAssemble(app.SQIMethod(app.SQIMethod1.Value),[],InputString);
            SQIObject=eval(SQIObjectName{1});
            Signal=app.SignalSet.GetSignal(app.Signal1DropDown.Value);
            Signal.AppendQualityIndex(SQIObject);
            app.RefreshPlot_Window();
        end

        % Button pushed function: Sig1SQIRemove
        function Sig1SQIRemovePushed(app, event)
            Signal=app.SignalSet.GetSignal(app.Signal1DropDown.Value);
            Signal.PopQualityIndex();
            app.RefreshPlot_Window();
        end

        % Value changed function: SQIMethod1
        function SQIMethod1ValueChanged(app, event)
            app.RefreshSelectedMethod();     
            app.Sig1SQIInput.Value='';
        end

        % Button pushed function: Sig2SQIAdd
        function Sig2SQIAddPushed(app, event)
            InputString=[num2str(app.SQI2Low.Value),',',num2str(app.SQI2High.Value)];
            if ~isempty(app.Sig2SQIInput.Value)
                InputString=[InputString,',',app.Sig2SQIInput.Value];
            end
            SQIObjectName=app.FunctionAssemble(app.SQIMethod(app.SQIMethod2.Value),[],InputString);
            SQIObject=eval(SQIObjectName{1});
            Signal=app.SignalSet.GetSignal(app.Signal2DropDown.Value);
            Signal.AppendQualityIndex(SQIObject);
            app.RefreshPlot_Window();
        end

        % Button pushed function: Sig2SQIRemove
        function Sig2SQIRemovePushed(app, event)
            Signal=app.SignalSet.GetSignal(app.Signal2DropDown.Value);
            Signal.PopQualityIndex();
            app.RefreshPlot_Window();
        end

        % Value changed function: SQIMethod2
        function SQIMethod2ValueChanged(app, event)
            app.RefreshSelectedMethod(); 
            app.Sig2SQIInput.Value='';
        end

        % Value changed function: Signal1DropDown
        function Signal1DropDownValueChanged(app, event)
            app.SignalSet.SetPATPair([app.Signal1DropDown.Value,app.Signal2DropDown.Value]);
            app.RefreshPeakSetting_Signal();
            app.RefreshPlot_Window();
            app.RefreshSelectedMethod();
            app.SaveSettings.Value=fullfile(['./WORKROOT/Saved_Datasets_' app.Signal1DropDown.Items{app.Signal1DropDown.Value} '_' app.Signal2DropDown.Items{app.Signal2DropDown.Value}],[app.DatasetDropDown.Value '.mat']);
        end

        % Value changed function: Signal2DropDown
        function Signal2DropDownValueChanged(app, event)
            app.SignalSet.SetPATPair([app.Signal1DropDown.Value,app.Signal2DropDown.Value]);
            app.RefreshPeakSetting_Signal();
            app.RefreshPlot_Window();
            app.RefreshSelectedMethod();
            app.SaveSettings.Value=fullfile(['./WORKROOT/Saved_Datasets_' app.Signal1DropDown.Items{app.Signal1DropDown.Value} '_' app.Signal2DropDown.Items{app.Signal2DropDown.Value}],[app.DatasetDropDown.Value '.mat']);
        end

        % Button pushed function: Sig1PeakSet
        function Sig1PeakSetPushed(app, event)
            PeakDetectObjectName=app.FunctionAssemble(app.PeakMethod(app.Sig1PeakMethod.Value),[],app.Sig1PeakInput.Value);
            PeakDetectObject=eval(PeakDetectObjectName{1});
            Signal=app.SignalSet.GetSignal(app.Signal1DropDown.Value);
            Signal.SetPeakDetect(PeakDetectObject);
            app.RefreshPlot_Window();
        end

        % Button pushed function: Sig2PeakSet
        function Sig2PeakSetPushed(app, event)
            PeakDetectObjectName=app.FunctionAssemble(app.PeakMethod(app.Sig2PeakMethod.Value),[],app.Sig2PeakInput.Value);
            PeakDetectObject=eval(PeakDetectObjectName{1});
            Signal=app.SignalSet.GetSignal(app.Signal2DropDown.Value);
            Signal.SetPeakDetect(PeakDetectObject);
            app.RefreshPlot_Window();
        end

        % Button pushed function: PostProcessSet
        function PostProcessSetButtonPushed(app, event)
            PostProcessObjectName=app.FunctionAssemble(app.PostProcessMethod(app.PostProcess.Value),[],app.PostProcessInput.Value);
            PostProcessObject=eval(PostProcessObjectName{1});
            app.SignalSet.AppendPostProcess(PostProcessObject);
            app.RefreshPlot_Window();
        end

        % Button pushed function: PostProcessPemove
        function PostProcessPemoveButtonPushed(app, event)
            app.SignalSet.PopPostProcess();
            app.RefreshPlot_Window();
        end

        % Value changed function: PostProcess
        function PostProcessValueChanged(app, event)
            app.RefreshSelectedMethod();
            app.PostProcessInput.Value='';
        end

        % Button pushed function: Evaluate_Instant
        function Evaluate_InstantPushed(app, event)
            app.RefreshRegression_Instant();
        end

        % Button pushed function: SaveSettingsButton
        function SaveSettingsButtonPushed(app, event)
            if isempty(app.SignalSet.Extraction)
                app.SignalSet.ExtractPAT();
            end
            SnapShot=app.SignalSet.Snapshot();
            foldername=strsplit(app.SaveSettings.Value,'\');
            foldername(end)=[];
            Path=strjoin(foldername,'\');
            if ~isfolder(Path)
                mkdir(Path);
            end
            save(app.SaveSettings.Value,"SnapShot");
            app.RefreshSavedObjects_Overall();
            app.RefreshSavedObjects_Specific();
            app.RefreshSavedObjects_Load();
        end

        % Button pushed function: AddTo
        function AddToPushed(app, event)
            toAdd=app.ExcludedListBox.Value;
            if isempty(toAdd)
                return
            end
            toAddidx=find(strcmp(app.ExcludedListBox.Items,app.ExcludedListBox.Value));
            ExcludeItems=app.ExcludedListBox.Items;
            ExcludeItems(toAddidx)=[];
            app.ExcludedListBox.Items=ExcludeItems;
            Current=app.IncludedListBox.Items;
            Current=[Current,toAdd];
            Current=app.StringSort(Current);
            app.IncludedListBox.Items=Current;
            if ~isempty(Current)
                Current=['All',Current];
            end
            app.ShowSubject.Items=Current;
        end

        % Button pushed function: Remove
        function RemovePushed(app, event)
            toRemove=app.IncludedListBox.Value;
            if isempty(toRemove)
                return
            end
            toRemoveidx=find(strcmp(app.IncludedListBox.Items,app.IncludedListBox.Value));
            IncludeItems=app.IncludedListBox.Items;
            IncludeItems(toRemoveidx)=[];
            app.IncludedListBox.Items=IncludeItems;
            if ~isempty(IncludeItems)
                IncludeItems=['All',IncludeItems];
            end
            app.ShowSubject.Items=IncludeItems;
            
            Current=app.ExcludedListBox.Items;
            Current=[Current,toRemove];
            Current=app.StringSort(Current);
            app.ExcludedListBox.Items=Current;
        end

        % Button pushed function: AddToTrain
        function AddToTrainButtonPushed(app, event)
            toAdd=app.ExcludedListBox_2.Value;
            Current=app.TrainListBox.Items;
            if isempty(toAdd)||ismember(toAdd,Current)
                return
            end
            Current=[Current,toAdd];
            Current=app.StringSort(Current);
            app.TrainListBox.Items=Current;
        end

        % Button pushed function: AddToTest
        function AddToTestButtonPushed(app, event)
            toAdd=app.ExcludedListBox_2.Value;
            Current=app.TestListBox.Items;
            if isempty(toAdd)||ismember(toAdd,Current)
                return
            end
            Current=[Current,toAdd];
            Current=app.StringSort(Current);
            app.TestListBox.Items=Current;
            if ~isempty(Current)
                Current=['All',Current];
            end
            app.ShowSubject_2.Items=Current;
        end

        % Button pushed function: ResetTrainTest
        function ResetTrainTestButtonPushed(app, event)
            app.TrainListBox.Items={};
            app.TestListBox.Items={};
            app.ShowSubject_2.Items={};
        end

        % Button pushed function: Evaluate_Overall
        function Evaluate_OverallButtonPushed(app, event)
            app.SubjectEvaluation_Overall();
            app.RefreshRegression_Overall();
        end

        % Value changed function: ShowSubject
        function ShowSubjectValueChanged(app, event)
            app.RefreshRegression_Overall();
        end

        % Value changed function: SavedFolder
        function SavedFolderValueChanged(app, event)
            app.RefreshSavedObjects_Overall();
            IncludeItems=app.IncludedListBox.Items;
            if ~isempty(IncludeItems)
                IncludeItems=['All',IncludeItems];
            end
            app.ShowSubject.Items=IncludeItems;
            app.OverallPerformanceFolder.Value=fullfile('.\WORKROOT',[app.SavedFolder.Value,'.xlsx']);
        end

        % Value changed function: ModeDropDown_2
        function ModeDropDown_2ValueChanged(app, event)
            if strcmp(app.ModeDropDown_2.Value,'Split')
                app.TrainingRatioEditField.Visible='on';
                app.TrainingRatioEditFieldLabel.Visible='on';
            else
                app.TrainingRatioEditField.Visible='off';
                app.TrainingRatioEditFieldLabel.Visible='off';
            end
        end

        % Button pushed function: Evaluate_Specific
        function Evaluate_SpecificButtonPushed(app, event)
            app.SubjectEvaluation_Specific();
            app.RefreshRegression_Specific();
        end

        % Value changed function: ShowSubject_2
        function ShowSubject_2ValueChanged(app, event)
            app.RefreshRegression_Specific();
        end

        % Value changed function: SavedFolder_2
        function SavedFolder_2ValueChanged(app, event)
            app.RefreshSavedObjects_Specific();
            app.TrainListBox.Items={};
            app.TestListBox.Items={};
            app.ShowSubject_2.Items={};
        end

        % Button pushed function: FileLoadButton
        function FileLoadButtonPushed(app, event)
            app.RefreshSourceObjects();
            if app.LoadObject()
                app.RefreshAddedSignal();
                app.RefreshPeakSetting_Subject();
                app.RefreshSelectedMethod();
                app.RefreshPlot_Main();
                app.RefreshPlot_Window();
                app.RefreshDenoiseSetting();
            end
        end

        % Value changed function: Mode_Overall
        function Mode_OverallValueChanged(app, event)
            switch app.Mode_Overall.Value
                case 'Split'
                    app.TrainingRatioEditField_2.Visible='on';
                    app.TrainingRatioEditField_2Label.Visible='on';
                otherwise
                    app.TrainingRatioEditField_2.Visible='off';
                    app.TrainingRatioEditField_2Label.Visible='off';
            end
        end

        % Button pushed function: ResetButton_2
        function ResetButton_2Pushed(app, event)
            app.IncludedListBox.Items={};
            app.RefreshSavedObjects_Overall();
        end

        % Value changed function: DatasetDropDown
        function DatasetDropDownValueChanged(app, event)
            app.RefreshSavedObjects_Load();
        end

        % Button pushed function: CreateNewButton
        function CreateNewButtonPushed(app, event)
            app.RefreshSourceObjects();
            app.CreateObject();
            app.RefreshAddedSignal();
            app.RefreshPeakSetting_Subject();
            app.RefreshSelectedMethod();
            app.RefreshPlot_Main();
            app.RefreshPlot_Window();
            app.RefreshDenoiseSetting();
        end

        % Button pushed function: OverallPerformanceSaveButton
        function OverallPerformanceSaveButtonPushed(app, event)
            app.PerformanceReport_Overall();
        end

        % Button pushed function: SpecificPerformanceSaveButton
        function SpecificPerformanceSaveButtonPushed(app, event)
            app.PerformanceReport_Specific();
        end

        % Button pushed function: ApplyAll
        function ApplyAllButtonPushed(app, event)
            if strcmp(app.SubjectDropDown2.Value,'All')
                for i=1:numel(app.DatasetDropDown.Items)
                    app.WorkingonEditField.Value=app.DatasetDropDown.Items{i};
                    pause(0.1);
                    Folder=fullfile(app.FileFolderPath.Value,app.DatasetDropDown.Items{i});
                    New_Subject=app.SignalSet.Imitate(Folder);
                    SnapShot=New_Subject.Snapshot();
                    if ~isfolder(app.ApplyAllSavePath.Value)
                        mkdir(app.ApplyAllSavePath.Value);
                    end
                    save(fullfile(app.ApplyAllSavePath.Value,[app.DatasetDropDown.Items{i},'.mat']),'SnapShot');
                end
            else
                app.WorkingonEditField.Value=app.SubjectDropDown2.Value;
                pause(0.1);
                Folder=fullfile(app.FileFolderPath.Value,app.SubjectDropDown2.Value);
                New_Subject=app.SignalSet.Imitate(Folder);
                SnapShot=New_Subject.Snapshot();
                if ~isfolder(app.ApplyAllSavePath.Value)
                    mkdir(app.ApplyAllSavePath.Value);
                end
                save(fullfile(app.ApplyAllSavePath.Value,[app.SubjectDropDown2.Value,'.mat']),'SnapShot');
            end
            app.RefreshSavedObjects_Overall();
            app.RefreshSavedObjects_Specific();
            app.RefreshSavedObjects_Load();
            app.WorkingonEditField.Value='Completed.';
        end

        % Button pushed function: BrowseButton
        function BrowseButtonPushed(app, event)
            Folder_Path=uigetdir(pwd);
            if Folder_Path
                app.FileFolderPath.Value=Folder_Path;
                app.FileFolderPathValueChanged();
            end
        end

        % Value changed function: WindowLength
        function WindowLengthValueChanged(app, event)
            app.RefreshPlot_Window();
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create Window and hide until all components are created
            app.Window = uifigure('Visible', 'off');
            app.Window.Position = [100 100 1328 730];
            app.Window.Name = 'PulseLab';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.Window);
            app.TabGroup.Position = [671 11 650 710];

            % Create IndividualBPFittingTab
            app.IndividualBPFittingTab = uitab(app.TabGroup);
            app.IndividualBPFittingTab.Title = 'Individual BP Fitting';

            % Create RegressionResultsFromCurrentSubjectPanel
            app.RegressionResultsFromCurrentSubjectPanel = uipanel(app.IndividualBPFittingTab);
            app.RegressionResultsFromCurrentSubjectPanel.Title = 'Regression Results From Current Subject';
            app.RegressionResultsFromCurrentSubjectPanel.Position = [11 15 630 660];

            % Create Evaluate_Instant
            app.Evaluate_Instant = uibutton(app.RegressionResultsFromCurrentSubjectPanel, 'push');
            app.Evaluate_Instant.ButtonPushedFcn = createCallbackFcn(app, @Evaluate_InstantPushed, true);
            app.Evaluate_Instant.Position = [511 17 90 22];
            app.Evaluate_Instant.Text = 'Evaluate & Plot';

            % Create PATNumLabel
            app.PATNumLabel = uilabel(app.RegressionResultsFromCurrentSubjectPanel);
            app.PATNumLabel.HorizontalAlignment = 'right';
            app.PATNumLabel.Position = [392 17 56 22];
            app.PATNumLabel.Text = 'PAT Num';

            % Create TestPATSize_Instant
            app.TestPATSize_Instant = uieditfield(app.RegressionResultsFromCurrentSubjectPanel, 'numeric');
            app.TestPATSize_Instant.Editable = 'off';
            app.TestPATSize_Instant.Position = [457 17 47 22];

            % Create PATBPModelLabel
            app.PATBPModelLabel = uilabel(app.RegressionResultsFromCurrentSubjectPanel);
            app.PATBPModelLabel.HorizontalAlignment = 'right';
            app.PATBPModelLabel.Position = [361 48 82 22];
            app.PATBPModelLabel.Text = 'PAT-BP Model';

            % Create ModelMethodDropDown
            app.ModelMethodDropDown = uidropdown(app.RegressionResultsFromCurrentSubjectPanel);
            app.ModelMethodDropDown.Items = {};
            app.ModelMethodDropDown.Position = [449 48 152 22];
            app.ModelMethodDropDown.Value = {};

            % Create SBPRegression_Instant
            app.SBPRegression_Instant = uiaxes(app.RegressionResultsFromCurrentSubjectPanel);
            title(app.SBPRegression_Instant, 'Estimated & Reference SBP')
            xlabel(app.SBPRegression_Instant, 'Reference(mmHg)')
            ylabel(app.SBPRegression_Instant, 'Estimation(mmHg)')
            app.SBPRegression_Instant.DataAspectRatio = [1 1 1];
            app.SBPRegression_Instant.PlotBoxAspectRatio = [1 1 1];
            app.SBPRegression_Instant.Position = [31 459 280 171];

            % Create SBPBA_Instant
            app.SBPBA_Instant = uiaxes(app.RegressionResultsFromCurrentSubjectPanel);
            title(app.SBPBA_Instant, 'Bland-Altman Plot for SBP')
            xlabel(app.SBPBA_Instant, 'Refrence(mmHg)')
            ylabel(app.SBPBA_Instant, 'Error(mmHg)')
            app.SBPBA_Instant.PlotBoxAspectRatio = [1.64331210191083 1 1];
            app.SBPBA_Instant.Position = [31 287 280 171];

            % Create DBPBA_Instant
            app.DBPBA_Instant = uiaxes(app.RegressionResultsFromCurrentSubjectPanel);
            title(app.DBPBA_Instant, 'Bland-Altman Plot for DBP')
            xlabel(app.DBPBA_Instant, 'Reference(mmHg)')
            ylabel(app.DBPBA_Instant, 'Error(mmHg)')
            app.DBPBA_Instant.PlotBoxAspectRatio = [1.63694267515924 1 1];
            app.DBPBA_Instant.Position = [321 287 280 171];

            % Create DBPRegression_Instant
            app.DBPRegression_Instant = uiaxes(app.RegressionResultsFromCurrentSubjectPanel);
            title(app.DBPRegression_Instant, 'Estimated & Reference DBP')
            xlabel(app.DBPRegression_Instant, 'Reference(mmHg)')
            ylabel(app.DBPRegression_Instant, 'Estimation(mmHg)')
            app.DBPRegression_Instant.DataAspectRatio = [1 1 1];
            app.DBPRegression_Instant.PlotBoxAspectRatio = [1 1 1];
            app.DBPRegression_Instant.Position = [321 459 280 171];

            % Create SBPvariation
            app.SBPvariation = uiaxes(app.RegressionResultsFromCurrentSubjectPanel);
            title(app.SBPvariation, 'SBP Variation')
            xlabel(app.SBPvariation, 'Num of records')
            ylabel(app.SBPvariation, 'BP value(mmHg)')
            app.SBPvariation.PlotBoxAspectRatio = [1.83571428571429 1 1];
            app.SBPvariation.Position = [31 114 260 170];

            % Create DBPvariation
            app.DBPvariation = uiaxes(app.RegressionResultsFromCurrentSubjectPanel);
            title(app.DBPvariation, 'DBP Variation')
            xlabel(app.DBPvariation, 'Num of records')
            ylabel(app.DBPvariation, 'BP value(mmHg)')
            app.DBPvariation.PlotBoxAspectRatio = [1.83571428571429 1 1];
            app.DBPvariation.Position = [321 114 260 170];

            % Create DBPRegressionMetrics
            app.DBPRegressionMetrics = uitextarea(app.RegressionResultsFromCurrentSubjectPanel);
            app.DBPRegressionMetrics.Position = [183 8 128 72];

            % Create RegressionMetricsTextAreaLabel
            app.RegressionMetricsTextAreaLabel = uilabel(app.RegressionResultsFromCurrentSubjectPanel);
            app.RegressionMetricsTextAreaLabel.Position = [41 84 108 22];
            app.RegressionMetricsTextAreaLabel.Text = 'Regression Metrics';

            % Create SBPRegressionMetrics
            app.SBPRegressionMetrics = uitextarea(app.RegressionResultsFromCurrentSubjectPanel);
            app.SBPRegressionMetrics.Position = [31 8 128 72];

            % Create OverallBPFittingTab
            app.OverallBPFittingTab = uitab(app.TabGroup);
            app.OverallBPFittingTab.Title = 'Overall BP Fitting';

            % Create TestingResultsFromSelectedSubjectsPanel
            app.TestingResultsFromSelectedSubjectsPanel = uipanel(app.OverallBPFittingTab);
            app.TestingResultsFromSelectedSubjectsPanel.Title = 'Testing Results From Selected Subjects';
            app.TestingResultsFromSelectedSubjectsPanel.Position = [11 15 630 660];

            % Create SBPRegression_Ovarall
            app.SBPRegression_Ovarall = uiaxes(app.TestingResultsFromSelectedSubjectsPanel);
            title(app.SBPRegression_Ovarall, 'Estimated & Reference SBP')
            xlabel(app.SBPRegression_Ovarall, 'Reference')
            ylabel(app.SBPRegression_Ovarall, 'Estimation')
            app.SBPRegression_Ovarall.DataAspectRatio = [1 1 1];
            app.SBPRegression_Ovarall.PlotBoxAspectRatio = [1 1 1];
            app.SBPRegression_Ovarall.Position = [31 459 280 171];

            % Create SBPBA_Overall
            app.SBPBA_Overall = uiaxes(app.TestingResultsFromSelectedSubjectsPanel);
            title(app.SBPBA_Overall, 'Bland-Altman Plot of SBP')
            xlabel(app.SBPBA_Overall, 'Refrence')
            ylabel(app.SBPBA_Overall, 'Error')
            app.SBPBA_Overall.PlotBoxAspectRatio = [1.64331210191083 1 1];
            app.SBPBA_Overall.Position = [31 279 280 171];

            % Create DBPBA_Overall
            app.DBPBA_Overall = uiaxes(app.TestingResultsFromSelectedSubjectsPanel);
            title(app.DBPBA_Overall, 'Bland-Altman Plot of DBP')
            xlabel(app.DBPBA_Overall, 'Reference')
            ylabel(app.DBPBA_Overall, 'Error')
            app.DBPBA_Overall.PlotBoxAspectRatio = [1.63694267515924 1 1];
            app.DBPBA_Overall.Position = [321 279 280 171];

            % Create DBPRegression_Overall
            app.DBPRegression_Overall = uiaxes(app.TestingResultsFromSelectedSubjectsPanel);
            title(app.DBPRegression_Overall, 'Estimated & Reference DBP')
            xlabel(app.DBPRegression_Overall, 'Reference')
            ylabel(app.DBPRegression_Overall, 'Estimation')
            app.DBPRegression_Overall.DataAspectRatio = [1 1 1];
            app.DBPRegression_Overall.PlotBoxAspectRatio = [1 1 1];
            app.DBPRegression_Overall.Position = [321 459 280 171];

            % Create TestPATNumLabel
            app.TestPATNumLabel = uilabel(app.TestingResultsFromSelectedSubjectsPanel);
            app.TestPATNumLabel.Position = [333 13 81 22];
            app.TestPATNumLabel.Text = 'Test PAT Num';

            % Create TestPATSize_Overall
            app.TestPATSize_Overall = uieditfield(app.TestingResultsFromSelectedSubjectsPanel, 'numeric');
            app.TestPATSize_Overall.Editable = 'off';
            app.TestPATSize_Overall.Position = [418 13 53 22];

            % Create ShowSubjectLabel
            app.ShowSubjectLabel = uilabel(app.TestingResultsFromSelectedSubjectsPanel);
            app.ShowSubjectLabel.HorizontalAlignment = 'right';
            app.ShowSubjectLabel.Position = [321 248 79 22];
            app.ShowSubjectLabel.Text = 'Show Subject';

            % Create ShowSubject
            app.ShowSubject = uidropdown(app.TestingResultsFromSelectedSubjectsPanel);
            app.ShowSubject.Items = {};
            app.ShowSubject.ValueChangedFcn = createCallbackFcn(app, @ShowSubjectValueChanged, true);
            app.ShowSubject.Position = [414 248 117 22];
            app.ShowSubject.Value = {};

            % Create PATBPModelLabel_2
            app.PATBPModelLabel_2 = uilabel(app.TestingResultsFromSelectedSubjectsPanel);
            app.PATBPModelLabel_2.HorizontalAlignment = 'right';
            app.PATBPModelLabel_2.Position = [385 68 82 22];
            app.PATBPModelLabel_2.Text = 'PAT-BP Model';

            % Create ModelMethodDropDown_2
            app.ModelMethodDropDown_2 = uidropdown(app.TestingResultsFromSelectedSubjectsPanel);
            app.ModelMethodDropDown_2.Items = {};
            app.ModelMethodDropDown_2.Position = [471 68 142 22];
            app.ModelMethodDropDown_2.Value = {};

            % Create SettingFolderLabel
            app.SettingFolderLabel = uilabel(app.TestingResultsFromSelectedSubjectsPanel);
            app.SettingFolderLabel.HorizontalAlignment = 'right';
            app.SettingFolderLabel.Position = [61 248 80 22];
            app.SettingFolderLabel.Text = 'Setting Folder';

            % Create SavedFolder
            app.SavedFolder = uidropdown(app.TestingResultsFromSelectedSubjectsPanel);
            app.SavedFolder.Items = {};
            app.SavedFolder.ValueChangedFcn = createCallbackFcn(app, @SavedFolderValueChanged, true);
            app.SavedFolder.Position = [156 248 133 22];
            app.SavedFolder.Value = {};

            % Create ModeDropDown_3Label
            app.ModeDropDown_3Label = uilabel(app.TestingResultsFromSelectedSubjectsPanel);
            app.ModeDropDown_3Label.Position = [483 39 36 22];
            app.ModeDropDown_3Label.Text = 'Mode';

            % Create Mode_Overall
            app.Mode_Overall = uidropdown(app.TestingResultsFromSelectedSubjectsPanel);
            app.Mode_Overall.Items = {'Split', 'Regression'};
            app.Mode_Overall.ValueChangedFcn = createCallbackFcn(app, @Mode_OverallValueChanged, true);
            app.Mode_Overall.Position = [522 39 91 22];
            app.Mode_Overall.Value = 'Split';

            % Create TrainingRatioEditField_2Label
            app.TrainingRatioEditField_2Label = uilabel(app.TestingResultsFromSelectedSubjectsPanel);
            app.TrainingRatioEditField_2Label.Position = [483 13 80 22];
            app.TrainingRatioEditField_2Label.Text = 'Training Ratio';

            % Create TrainingRatioEditField_2
            app.TrainingRatioEditField_2 = uieditfield(app.TestingResultsFromSelectedSubjectsPanel, 'numeric');
            app.TrainingRatioEditField_2.Position = [562 13 51 22];
            app.TrainingRatioEditField_2.Value = 0.3;

            % Create Evaluate_Overall
            app.Evaluate_Overall = uibutton(app.TestingResultsFromSelectedSubjectsPanel, 'push');
            app.Evaluate_Overall.ButtonPushedFcn = createCallbackFcn(app, @Evaluate_OverallButtonPushed, true);
            app.Evaluate_Overall.Position = [262 110 100 22];
            app.Evaluate_Overall.Text = 'Evaluate & Plot';

            % Create AddTo
            app.AddTo = uibutton(app.TestingResultsFromSelectedSubjectsPanel, 'push');
            app.AddTo.ButtonPushedFcn = createCallbackFcn(app, @AddToPushed, true);
            app.AddTo.Position = [262 195 100 22];
            app.AddTo.Text = 'Add to>>';

            % Create Remove
            app.Remove = uibutton(app.TestingResultsFromSelectedSubjectsPanel, 'push');
            app.Remove.ButtonPushedFcn = createCallbackFcn(app, @RemovePushed, true);
            app.Remove.Position = [262 167 100 22];
            app.Remove.Text = '<<Remove';

            % Create ResetButton_2
            app.ResetButton_2 = uibutton(app.TestingResultsFromSelectedSubjectsPanel, 'push');
            app.ResetButton_2.ButtonPushedFcn = createCallbackFcn(app, @ResetButton_2Pushed, true);
            app.ResetButton_2.Position = [262 138 100 22];
            app.ResetButton_2.Text = 'Reset';

            % Create IncludedListBoxLabel
            app.IncludedListBoxLabel = uilabel(app.TestingResultsFromSelectedSubjectsPanel);
            app.IncludedListBoxLabel.HorizontalAlignment = 'right';
            app.IncludedListBoxLabel.Position = [379 219 51 22];
            app.IncludedListBoxLabel.Text = 'Included';

            % Create IncludedListBox
            app.IncludedListBox = uilistbox(app.TestingResultsFromSelectedSubjectsPanel);
            app.IncludedListBox.Items = {};
            app.IncludedListBox.Position = [379 110 100 105];
            app.IncludedListBox.Value = {};

            % Create ExcludedListBox
            app.ExcludedListBox = uilistbox(app.TestingResultsFromSelectedSubjectsPanel);
            app.ExcludedListBox.Items = {};
            app.ExcludedListBox.Position = [144 110 100 105];
            app.ExcludedListBox.Value = {};

            % Create ExcludedListBoxLabel
            app.ExcludedListBoxLabel = uilabel(app.TestingResultsFromSelectedSubjectsPanel);
            app.ExcludedListBoxLabel.HorizontalAlignment = 'right';
            app.ExcludedListBoxLabel.Position = [141 219 55 22];
            app.ExcludedListBoxLabel.Text = 'Excluded';

            % Create DBPRegressionMetrics_2
            app.DBPRegressionMetrics_2 = uitextarea(app.TestingResultsFromSelectedSubjectsPanel);
            app.DBPRegressionMetrics_2.Position = [183 8 128 72];

            % Create RegressionMetricsTextAreaLabel_2
            app.RegressionMetricsTextAreaLabel_2 = uilabel(app.TestingResultsFromSelectedSubjectsPanel);
            app.RegressionMetricsTextAreaLabel_2.Position = [41 84 108 22];
            app.RegressionMetricsTextAreaLabel_2.Text = 'Regression Metrics';

            % Create SBPRegressionMetrics_2
            app.SBPRegressionMetrics_2 = uitextarea(app.TestingResultsFromSelectedSubjectsPanel);
            app.SBPRegressionMetrics_2.Position = [31 8 128 72];

            % Create SpecificModelTestingTab
            app.SpecificModelTestingTab = uitab(app.TabGroup);
            app.SpecificModelTestingTab.Title = 'Specific Model Testing';

            % Create TrainAndTestOnSpecificSubjectPanel
            app.TrainAndTestOnSpecificSubjectPanel = uipanel(app.SpecificModelTestingTab);
            app.TrainAndTestOnSpecificSubjectPanel.Title = 'Train And Test On Specific Subject';
            app.TrainAndTestOnSpecificSubjectPanel.Position = [11 15 630 660];

            % Create Evaluate_Specific
            app.Evaluate_Specific = uibutton(app.TrainAndTestOnSpecificSubjectPanel, 'push');
            app.Evaluate_Specific.ButtonPushedFcn = createCallbackFcn(app, @Evaluate_SpecificButtonPushed, true);
            app.Evaluate_Specific.Position = [222 107 100 22];
            app.Evaluate_Specific.Text = 'Evaluate & Plot';

            % Create TrainPATSize
            app.TrainPATSize = uieditfield(app.TrainAndTestOnSpecificSubjectPanel, 'numeric');
            app.TrainPATSize.Editable = 'off';
            app.TrainPATSize.Position = [387 217 54 22];

            % Create RegressionModelDropDownLabel_3
            app.RegressionModelDropDownLabel_3 = uilabel(app.TrainAndTestOnSpecificSubjectPanel);
            app.RegressionModelDropDownLabel_3.HorizontalAlignment = 'right';
            app.RegressionModelDropDownLabel_3.Position = [364 73 102 22];
            app.RegressionModelDropDownLabel_3.Text = 'Regression Model';

            % Create ModelMethodDropDown_3
            app.ModelMethodDropDown_3 = uidropdown(app.TrainAndTestOnSpecificSubjectPanel);
            app.ModelMethodDropDown_3.Items = {};
            app.ModelMethodDropDown_3.Position = [474 73 138 22];
            app.ModelMethodDropDown_3.Value = {};

            % Create SBPRegression_Specific
            app.SBPRegression_Specific = uiaxes(app.TrainAndTestOnSpecificSubjectPanel);
            title(app.SBPRegression_Specific, 'Estimated & Reference SBP')
            xlabel(app.SBPRegression_Specific, 'Reference')
            ylabel(app.SBPRegression_Specific, 'Estimation')
            app.SBPRegression_Specific.DataAspectRatio = [1 1 1];
            app.SBPRegression_Specific.PlotBoxAspectRatio = [1 1 1];
            app.SBPRegression_Specific.Position = [31 459 280 171];

            % Create SBPBA_Specific
            app.SBPBA_Specific = uiaxes(app.TrainAndTestOnSpecificSubjectPanel);
            title(app.SBPBA_Specific, 'Bland-Altman Plot of SBP')
            xlabel(app.SBPBA_Specific, 'Refrence')
            ylabel(app.SBPBA_Specific, 'Error')
            app.SBPBA_Specific.PlotBoxAspectRatio = [1.64331210191083 1 1];
            app.SBPBA_Specific.Position = [31 279 280 171];

            % Create DBPBA_Specific
            app.DBPBA_Specific = uiaxes(app.TrainAndTestOnSpecificSubjectPanel);
            title(app.DBPBA_Specific, 'Bland-Altman Plot of DBP')
            xlabel(app.DBPBA_Specific, 'Reference')
            ylabel(app.DBPBA_Specific, 'Error')
            app.DBPBA_Specific.PlotBoxAspectRatio = [1.63694267515924 1 1];
            app.DBPBA_Specific.Position = [321 279 280 171];

            % Create DBPRegression_Specific
            app.DBPRegression_Specific = uiaxes(app.TrainAndTestOnSpecificSubjectPanel);
            title(app.DBPRegression_Specific, 'Estimated & Reference DBP')
            xlabel(app.DBPRegression_Specific, 'Reference')
            ylabel(app.DBPRegression_Specific, 'Estimation')
            app.DBPRegression_Specific.DataAspectRatio = [1 1 1];
            app.DBPRegression_Specific.PlotBoxAspectRatio = [1 1 1];
            app.DBPRegression_Specific.Position = [321 459 280 171];

            % Create ResetTrainTest
            app.ResetTrainTest = uibutton(app.TrainAndTestOnSpecificSubjectPanel, 'push');
            app.ResetTrainTest.ButtonPushedFcn = createCallbackFcn(app, @ResetTrainTestButtonPushed, true);
            app.ResetTrainTest.Position = [222 135 100 22];
            app.ResetTrainTest.Text = 'Reset';

            % Create AddToTrain
            app.AddToTrain = uibutton(app.TrainAndTestOnSpecificSubjectPanel, 'push');
            app.AddToTrain.ButtonPushedFcn = createCallbackFcn(app, @AddToTrainButtonPushed, true);
            app.AddToTrain.Position = [222 191 100 22];
            app.AddToTrain.Text = 'Add to train>>';

            % Create AddToTest
            app.AddToTest = uibutton(app.TrainAndTestOnSpecificSubjectPanel, 'push');
            app.AddToTest.ButtonPushedFcn = createCallbackFcn(app, @AddToTestButtonPushed, true);
            app.AddToTest.Position = [222 163 100 22];
            app.AddToTest.Text = 'Add to test>>';

            % Create TrainListBoxLabel
            app.TrainListBoxLabel = uilabel(app.TrainAndTestOnSpecificSubjectPanel);
            app.TrainListBoxLabel.Position = [341 217 32 22];
            app.TrainListBoxLabel.Text = 'Train';

            % Create TrainListBox
            app.TrainListBox = uilistbox(app.TrainAndTestOnSpecificSubjectPanel);
            app.TrainListBox.Items = {};
            app.TrainListBox.Position = [341 106 100 107];
            app.TrainListBox.Value = {};

            % Create TestListBox
            app.TestListBox = uilistbox(app.TrainAndTestOnSpecificSubjectPanel);
            app.TestListBox.Items = {};
            app.TestListBox.Position = [453 106 100 108];
            app.TestListBox.Value = {};

            % Create TestListBoxLabel
            app.TestListBoxLabel = uilabel(app.TrainAndTestOnSpecificSubjectPanel);
            app.TestListBoxLabel.Position = [453 218 28 22];
            app.TestListBoxLabel.Text = 'Test';

            % Create ExcludedListBox_2
            app.ExcludedListBox_2 = uilistbox(app.TrainAndTestOnSpecificSubjectPanel);
            app.ExcludedListBox_2.Items = {};
            app.ExcludedListBox_2.Position = [104 107 100 107];
            app.ExcludedListBox_2.Value = {};

            % Create ExcludedListBox_2Label
            app.ExcludedListBox_2Label = uilabel(app.TrainAndTestOnSpecificSubjectPanel);
            app.ExcludedListBox_2Label.HorizontalAlignment = 'right';
            app.ExcludedListBox_2Label.Position = [101 218 55 22];
            app.ExcludedListBox_2Label.Text = 'Excluded';

            % Create TestPATSize
            app.TestPATSize = uieditfield(app.TrainAndTestOnSpecificSubjectPanel, 'numeric');
            app.TestPATSize.Editable = 'off';
            app.TestPATSize.Position = [499 218 54 22];

            % Create ModeDropDownLabel
            app.ModeDropDownLabel = uilabel(app.TrainAndTestOnSpecificSubjectPanel);
            app.ModeDropDownLabel.Position = [452 43 36 22];
            app.ModeDropDownLabel.Text = 'Mode';

            % Create ModeDropDown_2
            app.ModeDropDown_2 = uidropdown(app.TrainAndTestOnSpecificSubjectPanel);
            app.ModeDropDown_2.Items = {'Split', 'Full'};
            app.ModeDropDown_2.ValueChangedFcn = createCallbackFcn(app, @ModeDropDown_2ValueChanged, true);
            app.ModeDropDown_2.Position = [512 43 100 22];
            app.ModeDropDown_2.Value = 'Split';

            % Create SettingFolderLabel_2
            app.SettingFolderLabel_2 = uilabel(app.TrainAndTestOnSpecificSubjectPanel);
            app.SettingFolderLabel_2.HorizontalAlignment = 'right';
            app.SettingFolderLabel_2.Position = [61 248 80 22];
            app.SettingFolderLabel_2.Text = 'Setting Folder';

            % Create SavedFolder_2
            app.SavedFolder_2 = uidropdown(app.TrainAndTestOnSpecificSubjectPanel);
            app.SavedFolder_2.Items = {};
            app.SavedFolder_2.ValueChangedFcn = createCallbackFcn(app, @SavedFolder_2ValueChanged, true);
            app.SavedFolder_2.Position = [156 248 133 22];
            app.SavedFolder_2.Value = {};

            % Create ShowSubjectLabel_2
            app.ShowSubjectLabel_2 = uilabel(app.TrainAndTestOnSpecificSubjectPanel);
            app.ShowSubjectLabel_2.HorizontalAlignment = 'right';
            app.ShowSubjectLabel_2.Position = [321 248 79 22];
            app.ShowSubjectLabel_2.Text = 'Show Subject';

            % Create ShowSubject_2
            app.ShowSubject_2 = uidropdown(app.TrainAndTestOnSpecificSubjectPanel);
            app.ShowSubject_2.Items = {};
            app.ShowSubject_2.ValueChangedFcn = createCallbackFcn(app, @ShowSubject_2ValueChanged, true);
            app.ShowSubject_2.Position = [414 248 117 22];
            app.ShowSubject_2.Value = {};

            % Create TrainingRatioEditFieldLabel
            app.TrainingRatioEditFieldLabel = uilabel(app.TrainAndTestOnSpecificSubjectPanel);
            app.TrainingRatioEditFieldLabel.Position = [452 12 80 22];
            app.TrainingRatioEditFieldLabel.Text = 'Training Ratio';

            % Create TrainingRatioEditField
            app.TrainingRatioEditField = uieditfield(app.TrainAndTestOnSpecificSubjectPanel, 'numeric');
            app.TrainingRatioEditField.Position = [561 12 51 22];
            app.TrainingRatioEditField.Value = 0.3;

            % Create DBPRegressionMetrics_3
            app.DBPRegressionMetrics_3 = uitextarea(app.TrainAndTestOnSpecificSubjectPanel);
            app.DBPRegressionMetrics_3.Position = [183 8 128 72];

            % Create RegressionMetricsTextAreaLabel_3
            app.RegressionMetricsTextAreaLabel_3 = uilabel(app.TrainAndTestOnSpecificSubjectPanel);
            app.RegressionMetricsTextAreaLabel_3.Position = [41 84 108 22];
            app.RegressionMetricsTextAreaLabel_3.Text = 'Regression Metrics';

            % Create SBPRegressionMetrics_3
            app.SBPRegressionMetrics_3 = uitextarea(app.TrainAndTestOnSpecificSubjectPanel);
            app.SBPRegressionMetrics_3.Position = [31 8 128 72];

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.Window);
            app.TabGroup2.Position = [11 11 650 710];

            % Create FileInputandSignalPreprocessingTab
            app.FileInputandSignalPreprocessingTab = uitab(app.TabGroup2);
            app.FileInputandSignalPreprocessingTab.Title = 'File Input and Signal Preprocessing';

            % Create PreprocessSettingsPanel
            app.PreprocessSettingsPanel = uipanel(app.FileInputandSignalPreprocessingTab);
            app.PreprocessSettingsPanel.Title = 'Preprocess Settings';
            app.PreprocessSettingsPanel.Position = [11 15 630 90];

            % Create ApplyButton
            app.ApplyButton = uibutton(app.PreprocessSettingsPanel, 'push');
            app.ApplyButton.ButtonPushedFcn = createCallbackFcn(app, @ApplyButtonPushed, true);
            app.ApplyButton.Position = [391 8 100 22];
            app.ApplyButton.Text = 'Apply';

            % Create ResetButton
            app.ResetButton = uibutton(app.PreprocessSettingsPanel, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.Position = [501 8 100 22];
            app.ResetButton.Text = 'Reset';

            % Create ParameterListEditFieldLabel
            app.ParameterListEditFieldLabel = uilabel(app.PreprocessSettingsPanel);
            app.ParameterListEditFieldLabel.HorizontalAlignment = 'right';
            app.ParameterListEditFieldLabel.Position = [21 38 80 22];
            app.ParameterListEditFieldLabel.Text = 'Parameter List';

            % Create DenoiseParameterList
            app.DenoiseParameterList = uieditfield(app.PreprocessSettingsPanel, 'text');
            app.DenoiseParameterList.Editable = 'off';
            app.DenoiseParameterList.Position = [112 38 232 22];

            % Create SettingsEditFieldLabel
            app.SettingsEditFieldLabel = uilabel(app.PreprocessSettingsPanel);
            app.SettingsEditFieldLabel.HorizontalAlignment = 'right';
            app.SettingsEditFieldLabel.Position = [51 8 46 22];
            app.SettingsEditFieldLabel.Text = 'Settings';

            % Create DenoiseInput
            app.DenoiseInput = uieditfield(app.PreprocessSettingsPanel, 'text');
            app.DenoiseInput.Position = [112 8 232 22];

            % Create PreprocessingMethodDropDownLabel
            app.PreprocessingMethodDropDownLabel = uilabel(app.PreprocessSettingsPanel);
            app.PreprocessingMethodDropDownLabel.HorizontalAlignment = 'center';
            app.PreprocessingMethodDropDownLabel.Position = [365 38 126 22];
            app.PreprocessingMethodDropDownLabel.Text = 'Preprocessing Method';

            % Create PreprocessingMethodDropDown
            app.PreprocessingMethodDropDown = uidropdown(app.PreprocessSettingsPanel);
            app.PreprocessingMethodDropDown.Items = {};
            app.PreprocessingMethodDropDown.ValueChangedFcn = createCallbackFcn(app, @PreprocessingMethodDropDownValueChanged, true);
            app.PreprocessingMethodDropDown.Position = [501 38 100 22];
            app.PreprocessingMethodDropDown.Value = {};

            % Create SourceSignalManagementPanel
            app.SourceSignalManagementPanel = uipanel(app.FileInputandSignalPreprocessingTab);
            app.SourceSignalManagementPanel.Title = 'Source Signal Management';
            app.SourceSignalManagementPanel.Position = [11 115 630 460];

            % Create SignalRemoveButton
            app.SignalRemoveButton = uibutton(app.SourceSignalManagementPanel, 'push');
            app.SignalRemoveButton.ButtonPushedFcn = createCallbackFcn(app, @SignalRemoveButtonPushed, true);
            app.SignalRemoveButton.Position = [241 18 64 22];
            app.SignalRemoveButton.Text = 'Remove';

            % Create SignalAddButton
            app.SignalAddButton = uibutton(app.SourceSignalManagementPanel, 'push');
            app.SignalAddButton.ButtonPushedFcn = createCallbackFcn(app, @SignalAddButtonPushed, true);
            app.SignalAddButton.Position = [171 18 64 22];
            app.SignalAddButton.Text = 'Add';

            % Create IntervalPositionLabel
            app.IntervalPositionLabel = uilabel(app.SourceSignalManagementPanel);
            app.IntervalPositionLabel.HorizontalAlignment = 'center';
            app.IntervalPositionLabel.Position = [331 15 100 25];
            app.IntervalPositionLabel.Text = 'Interval Position';

            % Create ReferenceTable
            app.ReferenceTable = uitable(app.SourceSignalManagementPanel);
            app.ReferenceTable.ColumnName = {''};
            app.ReferenceTable.RowName = {'Time/s'; 'RefSBP/mmHg'; 'RefDBP/mmHg'};
            app.ReferenceTable.CellSelectionCallback = createCallbackFcn(app, @ReferenceTableCellSelection, true);
            app.ReferenceTable.Position = [129 63 492 117];

            % Create ReferenceBPsLabel
            app.ReferenceBPsLabel = uilabel(app.SourceSignalManagementPanel);
            app.ReferenceBPsLabel.Position = [129 178 86 22];
            app.ReferenceBPsLabel.Text = 'Reference BPs';

            % Create SignalPlot
            app.SignalPlot = uiaxes(app.SourceSignalManagementPanel);
            title(app.SignalPlot, 'Signal')
            xlabel(app.SignalPlot, 'Time(s)')
            ylabel(app.SignalPlot, 'Amplitude(V)')
            app.SignalPlot.PlotBoxAspectRatio = [6 3 1];
            app.SignalPlot.Position = [11 207 354 223];

            % Create SpectrumPlot
            app.SpectrumPlot = uiaxes(app.SourceSignalManagementPanel);
            title(app.SpectrumPlot, 'FFT Amplitudes')
            xlabel(app.SpectrumPlot, 'Frequency(Hz)')
            ylabel(app.SpectrumPlot, 'Amplitude(log scale)')
            app.SpectrumPlot.PlotBoxAspectRatio = [4 3 1];
            app.SpectrumPlot.Position = [371 207 252 223];

            % Create SignalFileLabel
            app.SignalFileLabel = uilabel(app.SourceSignalManagementPanel);
            app.SignalFileLabel.Position = [11 18 59 22];
            app.SignalFileLabel.Text = 'Signal File';

            % Create SignalFilename
            app.SignalFilename = uidropdown(app.SourceSignalManagementPanel);
            app.SignalFilename.Items = {};
            app.SignalFilename.Position = [74 18 80 22];
            app.SignalFilename.Value = {};

            % Create REFLabel
            app.REFLabel = uilabel(app.SourceSignalManagementPanel);
            app.REFLabel.FontSize = 15;
            app.REFLabel.Position = [431 15 195 25];
            app.REFLabel.Text = '|<             >|REF|<             >|';

            % Create RefIntNeg
            app.RefIntNeg = uieditfield(app.SourceSignalManagementPanel, 'numeric');
            app.RefIntNeg.ValueChangedFcn = createCallbackFcn(app, @RefIntNegValueChanged, true);
            app.RefIntNeg.Position = [450 15 26 25];
            app.RefIntNeg.Value = 10;

            % Create sLabel
            app.sLabel = uilabel(app.SourceSignalManagementPanel);
            app.sLabel.Position = [482 15 18 24.98];
            app.sLabel.Text = 's';

            % Create RefIntPos
            app.RefIntPos = uieditfield(app.SourceSignalManagementPanel, 'numeric');
            app.RefIntPos.ValueChangedFcn = createCallbackFcn(app, @RefIntPosValueChanged, true);
            app.RefIntPos.Position = [558 15 25.98 24.98];
            app.RefIntPos.Value = 10;

            % Create sLabel_2
            app.sLabel_2 = uilabel(app.SourceSignalManagementPanel);
            app.sLabel_2.Position = [588 15 18 24.98];
            app.sLabel_2.Text = 's';

            % Create AddedSignalListBoxLabel
            app.AddedSignalListBoxLabel = uilabel(app.SourceSignalManagementPanel);
            app.AddedSignalListBoxLabel.Position = [11 178 73 22];
            app.AddedSignalListBoxLabel.Text = 'Added Signal';

            % Create AddedSignalList
            app.AddedSignalList = uilistbox(app.SourceSignalManagementPanel);
            app.AddedSignalList.Items = {};
            app.AddedSignalList.ValueChangedFcn = createCallbackFcn(app, @AddedSignalListValueChanged, true);
            app.AddedSignalList.Position = [11 63 100 117];
            app.AddedSignalList.Value = {};

            % Create FileLoadPanel
            app.FileLoadPanel = uipanel(app.FileInputandSignalPreprocessingTab);
            app.FileLoadPanel.Title = 'File Load';
            app.FileLoadPanel.Position = [11 585 630 90];

            % Create FileLoadButton
            app.FileLoadButton = uibutton(app.FileLoadPanel, 'push');
            app.FileLoadButton.ButtonPushedFcn = createCallbackFcn(app, @FileLoadButtonPushed, true);
            app.FileLoadButton.Position = [518 8 100 22];
            app.FileLoadButton.Text = 'Load';

            % Create DatabasePathLabel
            app.DatabasePathLabel = uilabel(app.FileLoadPanel);
            app.DatabasePathLabel.Position = [8 37 87 24];
            app.DatabasePathLabel.Text = 'Database Path';

            % Create FileFolderPath
            app.FileFolderPath = uieditfield(app.FileLoadPanel, 'text');
            app.FileFolderPath.ValueChangedFcn = createCallbackFcn(app, @FileFolderPathValueChanged, true);
            app.FileFolderPath.Position = [100 37 135 24];

            % Create DatasetDropDownLabel
            app.DatasetDropDownLabel = uilabel(app.FileLoadPanel);
            app.DatasetDropDownLabel.Position = [322 38 47 22];
            app.DatasetDropDownLabel.Text = 'Dataset';

            % Create DatasetDropDown
            app.DatasetDropDown = uidropdown(app.FileLoadPanel);
            app.DatasetDropDown.Items = {};
            app.DatasetDropDown.ValueChangedFcn = createCallbackFcn(app, @DatasetDropDownValueChanged, true);
            app.DatasetDropDown.Position = [407 39 100 22];
            app.DatasetDropDown.Value = {};

            % Create StatusEditFieldLabel
            app.StatusEditFieldLabel = uilabel(app.FileLoadPanel);
            app.StatusEditFieldLabel.Position = [8 8 40 22];
            app.StatusEditFieldLabel.Text = 'Status';

            % Create Status
            app.Status = uieditfield(app.FileLoadPanel, 'text');
            app.Status.Editable = 'off';
            app.Status.Position = [57 8 240 22];

            % Create CreateNewButton
            app.CreateNewButton = uibutton(app.FileLoadPanel, 'push');
            app.CreateNewButton.ButtonPushedFcn = createCallbackFcn(app, @CreateNewButtonPushed, true);
            app.CreateNewButton.Position = [518 38 100 22];
            app.CreateNewButton.Text = 'Create New';

            % Create SavedSettingDropDownLabel
            app.SavedSettingDropDownLabel = uilabel(app.FileLoadPanel);
            app.SavedSettingDropDownLabel.Position = [321 8 80 22];
            app.SavedSettingDropDownLabel.Text = 'Saved Setting';

            % Create SavedSettingDropDown
            app.SavedSettingDropDown = uidropdown(app.FileLoadPanel);
            app.SavedSettingDropDown.Items = {};
            app.SavedSettingDropDown.Position = [408 8 100 22];
            app.SavedSettingDropDown.Value = {};

            % Create BrowseButton
            app.BrowseButton = uibutton(app.FileLoadPanel, 'push');
            app.BrowseButton.ButtonPushedFcn = createCallbackFcn(app, @BrowseButtonPushed, true);
            app.BrowseButton.Position = [241 38 56 22];
            app.BrowseButton.Text = 'Browse';

            % Create PeakDetectionandPATPTTExtractionTab
            app.PeakDetectionandPATPTTExtractionTab = uitab(app.TabGroup2);
            app.PeakDetectionandPATPTTExtractionTab.Title = 'Peak Detection and PAT/PTT Extraction';

            % Create InWindowPeakDetectionSettingsPanel
            app.InWindowPeakDetectionSettingsPanel = uipanel(app.PeakDetectionandPATPTTExtractionTab);
            app.InWindowPeakDetectionSettingsPanel.Title = 'In-Window Peak Detection Settings';
            app.InWindowPeakDetectionSettingsPanel.Position = [11 15 630 450];

            % Create WindowPositionLabel
            app.WindowPositionLabel = uilabel(app.InWindowPeakDetectionSettingsPanel);
            app.WindowPositionLabel.HorizontalAlignment = 'right';
            app.WindowPositionLabel.Position = [4 408 94 22];
            app.WindowPositionLabel.Text = 'Window Position';

            % Create WindowPosition
            app.WindowPosition = uislider(app.InWindowPeakDetectionSettingsPanel);
            app.WindowPosition.Limits = [1 2];
            app.WindowPosition.MajorTicks = [1 2 3];
            app.WindowPosition.ValueChangedFcn = createCallbackFcn(app, @WindowPositionValueChanged, true);
            app.WindowPosition.ValueChangingFcn = createCallbackFcn(app, @WindowPositionValueChanging, true);
            app.WindowPosition.MinorTicks = [1 2 3];
            app.WindowPosition.Position = [12 403 607 3];
            app.WindowPosition.Value = 1;

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.InWindowPeakDetectionSettingsPanel);
            app.TabGroup3.Position = [9 10 250 353];

            % Create Signal1Tab
            app.Signal1Tab = uitab(app.TabGroup3);
            app.Signal1Tab.Title = 'Signal1';

            % Create Sig1PeakSet
            app.Sig1PeakSet = uibutton(app.Signal1Tab, 'push');
            app.Sig1PeakSet.ButtonPushedFcn = createCallbackFcn(app, @Sig1PeakSetPushed, true);
            app.Sig1PeakSet.Position = [201 6 45 22];
            app.Sig1PeakSet.Text = 'Set';

            % Create QualityIndexDropDownLabel
            app.QualityIndexDropDownLabel = uilabel(app.Signal1Tab);
            app.QualityIndexDropDownLabel.Position = [11 267 76 22];
            app.QualityIndexDropDownLabel.Text = 'Quality Index';

            % Create SQIMethod1
            app.SQIMethod1 = uidropdown(app.Signal1Tab);
            app.SQIMethod1.Items = {};
            app.SQIMethod1.ValueChangedFcn = createCallbackFcn(app, @SQIMethod1ValueChanged, true);
            app.SQIMethod1.Position = [94 267 150 22];
            app.SQIMethod1.Value = {};

            % Create PeakDetectionMethodLabel
            app.PeakDetectionMethodLabel = uilabel(app.Signal1Tab);
            app.PeakDetectionMethodLabel.Position = [11 62 130 22];
            app.PeakDetectionMethodLabel.Text = 'Peak Detection Method';

            % Create Sig1PeakMethod
            app.Sig1PeakMethod = uidropdown(app.Signal1Tab);
            app.Sig1PeakMethod.Items = {};
            app.Sig1PeakMethod.ValueChangedFcn = createCallbackFcn(app, @Sig1PeakMethodValueChanged, true);
            app.Sig1PeakMethod.Position = [141 61 105 22];
            app.Sig1PeakMethod.Value = {};

            % Create ParameterListEditField_2Label
            app.ParameterListEditField_2Label = uilabel(app.Signal1Tab);
            app.ParameterListEditField_2Label.HorizontalAlignment = 'right';
            app.ParameterListEditField_2Label.Position = [11 33 80 22];
            app.ParameterListEditField_2Label.Text = 'Parameter List';

            % Create PeakExtraction1ParameterList
            app.PeakExtraction1ParameterList = uieditfield(app.Signal1Tab, 'text');
            app.PeakExtraction1ParameterList.Editable = 'off';
            app.PeakExtraction1ParameterList.Position = [96 33 150 22];

            % Create SettingsEditFieldLabel_2
            app.SettingsEditFieldLabel_2 = uilabel(app.Signal1Tab);
            app.SettingsEditFieldLabel_2.HorizontalAlignment = 'right';
            app.SettingsEditFieldLabel_2.Position = [11 6 46 22];
            app.SettingsEditFieldLabel_2.Text = 'Settings';

            % Create Sig1PeakInput
            app.Sig1PeakInput = uieditfield(app.Signal1Tab, 'text');
            app.Sig1PeakInput.Position = [96 6 97 22];

            % Create AcceptEditFieldLabel
            app.AcceptEditFieldLabel = uilabel(app.Signal1Tab);
            app.AcceptEditFieldLabel.Position = [176 184 28 22];
            app.AcceptEditFieldLabel.Text = 'Low';

            % Create toEditFieldLabel
            app.toEditFieldLabel = uilabel(app.Signal1Tab);
            app.toEditFieldLabel.Position = [176 152 28 22];
            app.toEditFieldLabel.Text = 'High';

            % Create SQITable1
            app.SQITable1 = uitable(app.Signal1Tab);
            app.SQITable1.ColumnName = {''};
            app.SQITable1.RowName = {'SQI'; 'Accept'; 'Range'; 'Value'; 'ParaList'; 'ParaValue'};
            app.SQITable1.FontWeight = 'bold';
            app.SQITable1.FontSize = 8.5;
            app.SQITable1.Position = [11 92 160 114];

            % Create SQI1Low
            app.SQI1Low = uieditfield(app.Signal1Tab, 'numeric');
            app.SQI1Low.Position = [211 184 33 22];

            % Create SQI1High
            app.SQI1High = uieditfield(app.Signal1Tab, 'numeric');
            app.SQI1High.Position = [211 152 33 22];

            % Create Sig1SQIAdd
            app.Sig1SQIAdd = uibutton(app.Signal1Tab, 'push');
            app.Sig1SQIAdd.ButtonPushedFcn = createCallbackFcn(app, @Sig1SQIAddPushed, true);
            app.Sig1SQIAdd.Position = [174 122 72 22];
            app.Sig1SQIAdd.Text = 'Add';

            % Create Sig1SQIRemove
            app.Sig1SQIRemove = uibutton(app.Signal1Tab, 'push');
            app.Sig1SQIRemove.ButtonPushedFcn = createCallbackFcn(app, @Sig1SQIRemovePushed, true);
            app.Sig1SQIRemove.Position = [174 92 72 22];
            app.Sig1SQIRemove.Text = 'Remove';

            % Create SettingsEditFieldLabel_5
            app.SettingsEditFieldLabel_5 = uilabel(app.Signal1Tab);
            app.SettingsEditFieldLabel_5.HorizontalAlignment = 'right';
            app.SettingsEditFieldLabel_5.Position = [11 212 46 22];
            app.SettingsEditFieldLabel_5.Text = 'Settings';

            % Create Sig1SQIInput
            app.Sig1SQIInput = uieditfield(app.Signal1Tab, 'text');
            app.Sig1SQIInput.Position = [96 212 148 22];

            % Create ParameterListEditField_2Label_2
            app.ParameterListEditField_2Label_2 = uilabel(app.Signal1Tab);
            app.ParameterListEditField_2Label_2.HorizontalAlignment = 'right';
            app.ParameterListEditField_2Label_2.Position = [11 239 80 22];
            app.ParameterListEditField_2Label_2.Text = 'Parameter List';

            % Create Sig1SQIParameterList
            app.Sig1SQIParameterList = uieditfield(app.Signal1Tab, 'text');
            app.Sig1SQIParameterList.Editable = 'off';
            app.Sig1SQIParameterList.Position = [96 239 148 22];

            % Create Signal1DropDownLabel
            app.Signal1DropDownLabel = uilabel(app.Signal1Tab);
            app.Signal1DropDownLabel.Position = [11 297 46 22];
            app.Signal1DropDownLabel.Text = 'Signal1';

            % Create Signal1DropDown
            app.Signal1DropDown = uidropdown(app.Signal1Tab);
            app.Signal1DropDown.Items = {};
            app.Signal1DropDown.ValueChangedFcn = createCallbackFcn(app, @Signal1DropDownValueChanged, true);
            app.Signal1DropDown.Position = [94 297 150 22];
            app.Signal1DropDown.Value = {};

            % Create Signal2Tab
            app.Signal2Tab = uitab(app.TabGroup3);
            app.Signal2Tab.Title = 'Signal2';

            % Create Sig2PeakSet
            app.Sig2PeakSet = uibutton(app.Signal2Tab, 'push');
            app.Sig2PeakSet.ButtonPushedFcn = createCallbackFcn(app, @Sig2PeakSetPushed, true);
            app.Sig2PeakSet.Position = [201 6 45 22];
            app.Sig2PeakSet.Text = 'Set';

            % Create Signal2Label
            app.Signal2Label = uilabel(app.Signal2Tab);
            app.Signal2Label.Position = [11 297 46 22];
            app.Signal2Label.Text = 'Signal2';

            % Create Signal2DropDown
            app.Signal2DropDown = uidropdown(app.Signal2Tab);
            app.Signal2DropDown.Items = {};
            app.Signal2DropDown.ValueChangedFcn = createCallbackFcn(app, @Signal2DropDownValueChanged, true);
            app.Signal2DropDown.Position = [94 297 150 22];
            app.Signal2DropDown.Value = {};

            % Create QualityIndexDropDown_2Label
            app.QualityIndexDropDown_2Label = uilabel(app.Signal2Tab);
            app.QualityIndexDropDown_2Label.Position = [11 267 76 22];
            app.QualityIndexDropDown_2Label.Text = 'Quality Index';

            % Create SQIMethod2
            app.SQIMethod2 = uidropdown(app.Signal2Tab);
            app.SQIMethod2.Items = {};
            app.SQIMethod2.ValueChangedFcn = createCallbackFcn(app, @SQIMethod2ValueChanged, true);
            app.SQIMethod2.Position = [94 267 150 22];
            app.SQIMethod2.Value = {};

            % Create PeakDetectionMethodLabel_2
            app.PeakDetectionMethodLabel_2 = uilabel(app.Signal2Tab);
            app.PeakDetectionMethodLabel_2.Position = [11 62 130 22];
            app.PeakDetectionMethodLabel_2.Text = 'Peak Detection Method';

            % Create Sig2PeakMethod
            app.Sig2PeakMethod = uidropdown(app.Signal2Tab);
            app.Sig2PeakMethod.Items = {};
            app.Sig2PeakMethod.ValueChangedFcn = createCallbackFcn(app, @Sig2PeakMethodValueChanged, true);
            app.Sig2PeakMethod.Position = [141 61 105 22];
            app.Sig2PeakMethod.Value = {};

            % Create ParameterListEditField_3Label
            app.ParameterListEditField_3Label = uilabel(app.Signal2Tab);
            app.ParameterListEditField_3Label.HorizontalAlignment = 'right';
            app.ParameterListEditField_3Label.Position = [11 33 80 22];
            app.ParameterListEditField_3Label.Text = 'Parameter List';

            % Create PeakExtraction2ParameterList
            app.PeakExtraction2ParameterList = uieditfield(app.Signal2Tab, 'text');
            app.PeakExtraction2ParameterList.Editable = 'off';
            app.PeakExtraction2ParameterList.Position = [96 33 150 22];

            % Create SettingsEditFieldLabel_3
            app.SettingsEditFieldLabel_3 = uilabel(app.Signal2Tab);
            app.SettingsEditFieldLabel_3.HorizontalAlignment = 'right';
            app.SettingsEditFieldLabel_3.Position = [11 6 46 22];
            app.SettingsEditFieldLabel_3.Text = 'Settings';

            % Create Sig2PeakInput
            app.Sig2PeakInput = uieditfield(app.Signal2Tab, 'text');
            app.Sig2PeakInput.Position = [96 6 97 22];

            % Create AcceptEditFieldLabel_2
            app.AcceptEditFieldLabel_2 = uilabel(app.Signal2Tab);
            app.AcceptEditFieldLabel_2.Position = [176 184 28 22];
            app.AcceptEditFieldLabel_2.Text = 'Low';

            % Create toEditFieldLabel_2
            app.toEditFieldLabel_2 = uilabel(app.Signal2Tab);
            app.toEditFieldLabel_2.Position = [176 152 28 22];
            app.toEditFieldLabel_2.Text = 'High';

            % Create SQITable2
            app.SQITable2 = uitable(app.Signal2Tab);
            app.SQITable2.ColumnName = {''};
            app.SQITable2.RowName = {'SQI'; 'Accept'; 'Range'; 'Value'; 'ParaList'; 'ParaValue'};
            app.SQITable2.FontWeight = 'bold';
            app.SQITable2.FontSize = 8.5;
            app.SQITable2.Position = [11 92 160 114];

            % Create SQI2Low
            app.SQI2Low = uieditfield(app.Signal2Tab, 'numeric');
            app.SQI2Low.Position = [211 184 33 22];

            % Create SQI2High
            app.SQI2High = uieditfield(app.Signal2Tab, 'numeric');
            app.SQI2High.Position = [211 152 33 22];

            % Create Sig2SQIAdd
            app.Sig2SQIAdd = uibutton(app.Signal2Tab, 'push');
            app.Sig2SQIAdd.ButtonPushedFcn = createCallbackFcn(app, @Sig2SQIAddPushed, true);
            app.Sig2SQIAdd.Position = [174 122 72 22];
            app.Sig2SQIAdd.Text = 'Add';

            % Create Sig2SQIRemove
            app.Sig2SQIRemove = uibutton(app.Signal2Tab, 'push');
            app.Sig2SQIRemove.ButtonPushedFcn = createCallbackFcn(app, @Sig2SQIRemovePushed, true);
            app.Sig2SQIRemove.Position = [174 92 72 22];
            app.Sig2SQIRemove.Text = 'Remove';

            % Create SettingsEditFieldLabel_6
            app.SettingsEditFieldLabel_6 = uilabel(app.Signal2Tab);
            app.SettingsEditFieldLabel_6.HorizontalAlignment = 'right';
            app.SettingsEditFieldLabel_6.Position = [11 212 46 22];
            app.SettingsEditFieldLabel_6.Text = 'Settings';

            % Create Sig2SQIInput
            app.Sig2SQIInput = uieditfield(app.Signal2Tab, 'text');
            app.Sig2SQIInput.Position = [96 212 148 22];

            % Create ParameterListEditField_2Label_3
            app.ParameterListEditField_2Label_3 = uilabel(app.Signal2Tab);
            app.ParameterListEditField_2Label_3.HorizontalAlignment = 'right';
            app.ParameterListEditField_2Label_3.Position = [11 239 80 22];
            app.ParameterListEditField_2Label_3.Text = 'Parameter List';

            % Create Sig2SQIParameterList
            app.Sig2SQIParameterList = uieditfield(app.Signal2Tab, 'text');
            app.Sig2SQIParameterList.Editable = 'off';
            app.Sig2SQIParameterList.Position = [96 239 148 22];

            % Create PostprocessingTab
            app.PostprocessingTab = uitab(app.TabGroup3);
            app.PostprocessingTab.Title = 'Postprocessing';

            % Create PostProcessTable
            app.PostProcessTable = uitable(app.PostprocessingTab);
            app.PostProcessTable.ColumnName = {''};
            app.PostProcessTable.RowName = {'PostProcess'; 'ParaList'; 'ParaValue'};
            app.PostProcessTable.FontWeight = 'bold';
            app.PostProcessTable.FontSize = 8.5;
            app.PostProcessTable.Position = [13 160 224 153];

            % Create PostProcessSet
            app.PostProcessSet = uibutton(app.PostprocessingTab, 'push');
            app.PostProcessSet.ButtonPushedFcn = createCallbackFcn(app, @PostProcessSetButtonPushed, true);
            app.PostProcessSet.Position = [13 15 105 22];
            app.PostProcessSet.Text = 'Set';

            % Create SettingsEditFieldLabel_4
            app.SettingsEditFieldLabel_4 = uilabel(app.PostprocessingTab);
            app.SettingsEditFieldLabel_4.Position = [13 56 46 22];
            app.SettingsEditFieldLabel_4.Text = 'Settings';

            % Create PostProcessInput
            app.PostProcessInput = uieditfield(app.PostprocessingTab, 'text');
            app.PostProcessInput.Position = [99 56 138 22];

            % Create PATProcessMethodLabel
            app.PATProcessMethodLabel = uilabel(app.PostprocessingTab);
            app.PATProcessMethodLabel.Position = [13 118 117 22];
            app.PATProcessMethodLabel.Text = 'PAT Process Method';

            % Create PostProcess
            app.PostProcess = uidropdown(app.PostprocessingTab);
            app.PostProcess.Items = {};
            app.PostProcess.ValueChangedFcn = createCallbackFcn(app, @PostProcessValueChanged, true);
            app.PostProcess.Position = [133 118 104 22];
            app.PostProcess.Value = {};

            % Create ParameterListEditField_3Label_2
            app.ParameterListEditField_3Label_2 = uilabel(app.PostprocessingTab);
            app.ParameterListEditField_3Label_2.Position = [13 88 80 22];
            app.ParameterListEditField_3Label_2.Text = 'Parameter List';

            % Create PostProcessParameterList
            app.PostProcessParameterList = uieditfield(app.PostprocessingTab, 'text');
            app.PostProcessParameterList.Editable = 'off';
            app.PostProcessParameterList.Position = [99 88 138 22];

            % Create PostProcessPemove
            app.PostProcessPemove = uibutton(app.PostprocessingTab, 'push');
            app.PostProcessPemove.ButtonPushedFcn = createCallbackFcn(app, @PostProcessPemoveButtonPushed, true);
            app.PostProcessPemove.Position = [132 15 105 22];
            app.PostProcessPemove.Text = 'Remove';

            % Create PATHistogram
            app.PATHistogram = uiaxes(app.InWindowPeakDetectionSettingsPanel);
            title(app.PATHistogram, 'Segment PAT Histogram')
            xlabel(app.PATHistogram, 'PAT/s')
            ylabel(app.PATHistogram, 'Count')
            app.PATHistogram.PlotBoxAspectRatio = [2.42063492063492 1 1];
            app.PATHistogram.Position = [269 130 352 181];

            % Create ExtractedWindowPATLabel
            app.ExtractedWindowPATLabel = uilabel(app.InWindowPeakDetectionSettingsPanel);
            app.ExtractedWindowPATLabel.Position = [311 98 127 22];
            app.ExtractedWindowPATLabel.Text = 'Extracted Window PAT';

            % Create PATList
            app.PATList = uilistbox(app.InWindowPeakDetectionSettingsPanel);
            app.PATList.Items = {};
            app.PATList.Position = [311 10 127 88];
            app.PATList.Value = {};

            % Create SelectedPATLabel
            app.SelectedPATLabel = uilabel(app.InWindowPeakDetectionSettingsPanel);
            app.SelectedPATLabel.Position = [484 98 77 22];
            app.SelectedPATLabel.Text = 'Selected PAT';

            % Create SelectedPATList
            app.SelectedPATList = uilistbox(app.InWindowPeakDetectionSettingsPanel);
            app.SelectedPATList.Items = {};
            app.SelectedPATList.Position = [484 10 131 88];
            app.SelectedPATList.Value = {};

            % Create WindowLengthEditFieldLabel
            app.WindowLengthEditFieldLabel = uilabel(app.InWindowPeakDetectionSettingsPanel);
            app.WindowLengthEditFieldLabel.HorizontalAlignment = 'right';
            app.WindowLengthEditFieldLabel.Position = [358 341 88 22];
            app.WindowLengthEditFieldLabel.Text = 'Window Length';

            % Create WindowLength
            app.WindowLength = uieditfield(app.InWindowPeakDetectionSettingsPanel, 'numeric');
            app.WindowLength.ValueChangedFcn = createCallbackFcn(app, @WindowLengthValueChanged, true);
            app.WindowLength.Position = [452 341 48 22];
            app.WindowLength.Value = 2;

            % Create sLabel_3
            app.sLabel_3 = uilabel(app.InWindowPeakDetectionSettingsPanel);
            app.sLabel_3.Position = [507 341 25 22];
            app.sLabel_3.Text = 's';

            % Create Window1Plot
            app.Window1Plot = uiaxes(app.PeakDetectionandPATPTTExtractionTab);
            title(app.Window1Plot, 'Signal 1')
            xlabel(app.Window1Plot, 'Time')
            ylabel(app.Window1Plot, 'Amplitude')
            app.Window1Plot.PlotBoxAspectRatio = [6 3 1];
            app.Window1Plot.Position = [11 466 310 219];

            % Create Window2Plot
            app.Window2Plot = uiaxes(app.PeakDetectionandPATPTTExtractionTab);
            title(app.Window2Plot, 'Signal 2')
            xlabel(app.Window2Plot, 'Time')
            ylabel(app.Window2Plot, 'Amplitude')
            app.Window2Plot.PlotBoxAspectRatio = [6 3 1];
            app.Window2Plot.Position = [331 466 310 219];

            % Create FileOutputTab
            app.FileOutputTab = uitab(app.TabGroup2);
            app.FileOutputTab.Title = 'File Output';

            % Create SubjectSettingsPanel
            app.SubjectSettingsPanel = uipanel(app.FileOutputTab);
            app.SubjectSettingsPanel.Title = 'Subject Settings';
            app.SubjectSettingsPanel.Position = [11 555 620 120];

            % Create SavesettingstoEditFieldLabel
            app.SavesettingstoEditFieldLabel = uilabel(app.SubjectSettingsPanel);
            app.SavesettingstoEditFieldLabel.Position = [21 68 91 22];
            app.SavesettingstoEditFieldLabel.Text = 'Save settings to';

            % Create SaveSettings
            app.SaveSettings = uieditfield(app.SubjectSettingsPanel, 'text');
            app.SaveSettings.Position = [184 68 287 22];

            % Create SaveSettingsButton
            app.SaveSettingsButton = uibutton(app.SubjectSettingsPanel, 'push');
            app.SaveSettingsButton.ButtonPushedFcn = createCallbackFcn(app, @SaveSettingsButtonPushed, true);
            app.SaveSettingsButton.Position = [491 68 100 22];
            app.SaveSettingsButton.Text = 'Save';

            % Create ApplyAll
            app.ApplyAll = uibutton(app.SubjectSettingsPanel, 'push');
            app.ApplyAll.ButtonPushedFcn = createCallbackFcn(app, @ApplyAllButtonPushed, true);
            app.ApplyAll.Position = [491 8 100 22];
            app.ApplyAll.Text = 'Save';

            % Create SavetoLabel
            app.SavetoLabel = uilabel(app.SubjectSettingsPanel);
            app.SavetoLabel.Position = [21 8 46 22];
            app.SavetoLabel.Text = 'Save to';

            % Create ApplyAllSavePath
            app.ApplyAllSavePath = uieditfield(app.SubjectSettingsPanel, 'text');
            app.ApplyAllSavePath.Position = [184 8 287 22];

            % Create WorkingonEditFieldLabel
            app.WorkingonEditFieldLabel = uilabel(app.SubjectSettingsPanel);
            app.WorkingonEditFieldLabel.HorizontalAlignment = 'right';
            app.WorkingonEditFieldLabel.Position = [295 38 66 22];
            app.WorkingonEditFieldLabel.Text = 'Working on';

            % Create WorkingonEditField
            app.WorkingonEditField = uieditfield(app.SubjectSettingsPanel, 'text');
            app.WorkingonEditField.Editable = 'off';
            app.WorkingonEditField.Position = [371 38 100 22];

            % Create ApplythissettingtoDropDownLabel
            app.ApplythissettingtoDropDownLabel = uilabel(app.SubjectSettingsPanel);
            app.ApplythissettingtoDropDownLabel.Position = [21 38 110 22];
            app.ApplythissettingtoDropDownLabel.Text = 'Apply this setting to';

            % Create SubjectDropDown2
            app.SubjectDropDown2 = uidropdown(app.SubjectSettingsPanel);
            app.SubjectDropDown2.Items = {};
            app.SubjectDropDown2.Position = [184 38 100 22];
            app.SubjectDropDown2.Value = {};

            % Create PerformanceReportPanel
            app.PerformanceReportPanel = uipanel(app.FileOutputTab);
            app.PerformanceReportPanel.Title = 'Performance Report';
            app.PerformanceReportPanel.Position = [11 455 620 90];

            % Create OverallPerformanceLabel
            app.OverallPerformanceLabel = uilabel(app.PerformanceReportPanel);
            app.OverallPerformanceLabel.Position = [21 38 116 22];
            app.OverallPerformanceLabel.Text = 'Overall Performance';

            % Create OverallPerformanceFolder
            app.OverallPerformanceFolder = uieditfield(app.PerformanceReportPanel, 'text');
            app.OverallPerformanceFolder.Position = [184 38 287 22];

            % Create OverallPerformanceSaveButton
            app.OverallPerformanceSaveButton = uibutton(app.PerformanceReportPanel, 'push');
            app.OverallPerformanceSaveButton.ButtonPushedFcn = createCallbackFcn(app, @OverallPerformanceSaveButtonPushed, true);
            app.OverallPerformanceSaveButton.Position = [491 38 100 22];
            app.OverallPerformanceSaveButton.Text = 'Save';

            % Create SpecificPerformanceSaveButton
            app.SpecificPerformanceSaveButton = uibutton(app.PerformanceReportPanel, 'push');
            app.SpecificPerformanceSaveButton.ButtonPushedFcn = createCallbackFcn(app, @SpecificPerformanceSaveButtonPushed, true);
            app.SpecificPerformanceSaveButton.Position = [491 8 100 22];
            app.SpecificPerformanceSaveButton.Text = 'Save';

            % Create SpecificModelPerformanceLabel
            app.SpecificModelPerformanceLabel = uilabel(app.PerformanceReportPanel);
            app.SpecificModelPerformanceLabel.Position = [21 8 156 22];
            app.SpecificModelPerformanceLabel.Text = 'Specific Model Performance';

            % Create SpecificPerformanceFolder
            app.SpecificPerformanceFolder = uieditfield(app.PerformanceReportPanel, 'text');
            app.SpecificPerformanceFolder.Position = [184 8 287 22];

            % Show the figure after all components are created
            app.Window.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = PulseLab

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.Window)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.Window)
        end
    end
end