<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMain
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmMain))
        Me.lstFiles = New System.Windows.Forms.ListBox()
        Me.mnuList = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.RemoveToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem3 = New System.Windows.Forms.ToolStripSeparator()
        Me.AddFilesToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.EditeFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem4 = New System.Windows.Forms.ToolStripSeparator()
        Me.AboutToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.barStatus = New System.Windows.Forms.StatusStrip()
        Me.lblStatus = New System.Windows.Forms.ToolStripStatusLabel()
        Me.mnuMain = New System.Windows.Forms.MenuStrip()
        Me.FileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NewProjectToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NewFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem1 = New System.Windows.Forms.ToolStripSeparator()
        Me.OpenProjectToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem2 = New System.Windows.Forms.ToolStripSeparator()
        Me.AddFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem6 = New System.Windows.Forms.ToolStripSeparator()
        Me.ExitToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CompileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SimulateToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ShowWaveToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem7 = New System.Windows.Forms.ToolStripSeparator()
        Me.ChangeWorkingDirectoryToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ClearLogToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.HelpToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.HelpToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem5 = New System.Windows.Forms.ToolStripSeparator()
        Me.AboutToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.toolMain = New System.Windows.Forms.ToolStripContainer()
        Me.splitMain = New System.Windows.Forms.SplitContainer()
        Me.tabMain = New System.Windows.Forms.TabControl()
        Me.tabCode = New System.Windows.Forms.TabPage()
        Me.txtCode = New Alsing.Windows.Forms.SyntaxBoxControl()
        Me.SyntaxDocument1 = New Alsing.SourceCode.SyntaxDocument(Me.components)
        Me.tabSystem = New System.Windows.Forms.TabPage()
        Me.txtLog = New System.Windows.Forms.RichTextBox()
        Me.mnuList.SuspendLayout()
        Me.barStatus.SuspendLayout()
        Me.mnuMain.SuspendLayout()
        Me.toolMain.BottomToolStripPanel.SuspendLayout()
        Me.toolMain.ContentPanel.SuspendLayout()
        Me.toolMain.TopToolStripPanel.SuspendLayout()
        Me.toolMain.SuspendLayout()
        Me.splitMain.Panel1.SuspendLayout()
        Me.splitMain.Panel2.SuspendLayout()
        Me.splitMain.SuspendLayout()
        Me.tabMain.SuspendLayout()
        Me.tabCode.SuspendLayout()
        Me.tabSystem.SuspendLayout()
        Me.SuspendLayout()
        '
        'lstFiles
        '
        Me.lstFiles.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lstFiles.ContextMenuStrip = Me.mnuList
        Me.lstFiles.Dock = System.Windows.Forms.DockStyle.Fill
        Me.lstFiles.FormattingEnabled = True
        Me.lstFiles.Location = New System.Drawing.Point(0, 0)
        Me.lstFiles.Name = "lstFiles"
        Me.lstFiles.SelectionMode = System.Windows.Forms.SelectionMode.MultiExtended
        Me.lstFiles.Size = New System.Drawing.Size(205, 375)
        Me.lstFiles.TabIndex = 0
        '
        'mnuList
        '
        Me.mnuList.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RemoveToolStripMenuItem, Me.ToolStripMenuItem3, Me.AddFilesToolStripMenuItem, Me.EditeFileToolStripMenuItem, Me.ToolStripMenuItem4, Me.AboutToolStripMenuItem1})
        Me.mnuList.Name = "mnuList"
        Me.mnuList.Size = New System.Drawing.Size(123, 104)
        '
        'RemoveToolStripMenuItem
        '
        Me.RemoveToolStripMenuItem.Name = "RemoveToolStripMenuItem"
        Me.RemoveToolStripMenuItem.Size = New System.Drawing.Size(122, 22)
        Me.RemoveToolStripMenuItem.Text = "&Remove"
        '
        'ToolStripMenuItem3
        '
        Me.ToolStripMenuItem3.Name = "ToolStripMenuItem3"
        Me.ToolStripMenuItem3.Size = New System.Drawing.Size(119, 6)
        '
        'AddFilesToolStripMenuItem
        '
        Me.AddFilesToolStripMenuItem.Name = "AddFilesToolStripMenuItem"
        Me.AddFilesToolStripMenuItem.Size = New System.Drawing.Size(122, 22)
        Me.AddFilesToolStripMenuItem.Text = "&Add Files"
        '
        'EditeFileToolStripMenuItem
        '
        Me.EditeFileToolStripMenuItem.Name = "EditeFileToolStripMenuItem"
        Me.EditeFileToolStripMenuItem.Size = New System.Drawing.Size(122, 22)
        Me.EditeFileToolStripMenuItem.Text = "&Edit File"
        '
        'ToolStripMenuItem4
        '
        Me.ToolStripMenuItem4.Name = "ToolStripMenuItem4"
        Me.ToolStripMenuItem4.Size = New System.Drawing.Size(119, 6)
        '
        'AboutToolStripMenuItem1
        '
        Me.AboutToolStripMenuItem1.Name = "AboutToolStripMenuItem1"
        Me.AboutToolStripMenuItem1.Size = New System.Drawing.Size(122, 22)
        Me.AboutToolStripMenuItem1.Text = "&About"
        '
        'barStatus
        '
        Me.barStatus.Dock = System.Windows.Forms.DockStyle.None
        Me.barStatus.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.lblStatus})
        Me.barStatus.Location = New System.Drawing.Point(0, 0)
        Me.barStatus.Name = "barStatus"
        Me.barStatus.Size = New System.Drawing.Size(593, 22)
        Me.barStatus.TabIndex = 7
        Me.barStatus.Text = "StatusStrip1"
        '
        'lblStatus
        '
        Me.lblStatus.Name = "lblStatus"
        Me.lblStatus.Size = New System.Drawing.Size(60, 17)
        Me.lblStatus.Text = "[lblStatus]"
        '
        'mnuMain
        '
        Me.mnuMain.Dock = System.Windows.Forms.DockStyle.None
        Me.mnuMain.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.FileToolStripMenuItem, Me.ToolsToolStripMenuItem, Me.HelpToolStripMenuItem})
        Me.mnuMain.Location = New System.Drawing.Point(0, 0)
        Me.mnuMain.Name = "mnuMain"
        Me.mnuMain.Size = New System.Drawing.Size(593, 24)
        Me.mnuMain.TabIndex = 11
        Me.mnuMain.Text = "mnuMain"
        '
        'FileToolStripMenuItem
        '
        Me.FileToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.NewProjectToolStripMenuItem, Me.NewFileToolStripMenuItem, Me.ToolStripMenuItem1, Me.OpenProjectToolStripMenuItem, Me.ToolStripMenuItem2, Me.AddFileToolStripMenuItem, Me.ToolStripMenuItem6, Me.ExitToolStripMenuItem})
        Me.FileToolStripMenuItem.Name = "FileToolStripMenuItem"
        Me.FileToolStripMenuItem.Size = New System.Drawing.Size(37, 20)
        Me.FileToolStripMenuItem.Text = "&File"
        '
        'NewProjectToolStripMenuItem
        '
        Me.NewProjectToolStripMenuItem.Name = "NewProjectToolStripMenuItem"
        Me.NewProjectToolStripMenuItem.ShortcutKeys = CType((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.N), System.Windows.Forms.Keys)
        Me.NewProjectToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.NewProjectToolStripMenuItem.Text = "New &Project"
        '
        'NewFileToolStripMenuItem
        '
        Me.NewFileToolStripMenuItem.Name = "NewFileToolStripMenuItem"
        Me.NewFileToolStripMenuItem.ShortcutKeys = CType(((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.Shift) _
                    Or System.Windows.Forms.Keys.N), System.Windows.Forms.Keys)
        Me.NewFileToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.NewFileToolStripMenuItem.Text = "New &File"
        '
        'ToolStripMenuItem1
        '
        Me.ToolStripMenuItem1.Name = "ToolStripMenuItem1"
        Me.ToolStripMenuItem1.Size = New System.Drawing.Size(191, 6)
        '
        'OpenProjectToolStripMenuItem
        '
        Me.OpenProjectToolStripMenuItem.Name = "OpenProjectToolStripMenuItem"
        Me.OpenProjectToolStripMenuItem.ShortcutKeys = CType((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.O), System.Windows.Forms.Keys)
        Me.OpenProjectToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.OpenProjectToolStripMenuItem.Text = "&Open Project"
        '
        'ToolStripMenuItem2
        '
        Me.ToolStripMenuItem2.Name = "ToolStripMenuItem2"
        Me.ToolStripMenuItem2.Size = New System.Drawing.Size(191, 6)
        '
        'AddFileToolStripMenuItem
        '
        Me.AddFileToolStripMenuItem.Name = "AddFileToolStripMenuItem"
        Me.AddFileToolStripMenuItem.ShortcutKeys = CType(((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.Shift) _
                    Or System.Windows.Forms.Keys.A), System.Windows.Forms.Keys)
        Me.AddFileToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.AddFileToolStripMenuItem.Text = "&Add File"
        '
        'ToolStripMenuItem6
        '
        Me.ToolStripMenuItem6.Name = "ToolStripMenuItem6"
        Me.ToolStripMenuItem6.Size = New System.Drawing.Size(191, 6)
        '
        'ExitToolStripMenuItem
        '
        Me.ExitToolStripMenuItem.Name = "ExitToolStripMenuItem"
        Me.ExitToolStripMenuItem.ShortcutKeys = CType((System.Windows.Forms.Keys.Alt Or System.Windows.Forms.Keys.F4), System.Windows.Forms.Keys)
        Me.ExitToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.ExitToolStripMenuItem.Text = "&Exit"
        '
        'ToolsToolStripMenuItem
        '
        Me.ToolsToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.CompileToolStripMenuItem, Me.SimulateToolStripMenuItem, Me.ShowWaveToolStripMenuItem, Me.ToolStripMenuItem7, Me.ChangeWorkingDirectoryToolStripMenuItem, Me.ClearLogToolStripMenuItem})
        Me.ToolsToolStripMenuItem.Name = "ToolsToolStripMenuItem"
        Me.ToolsToolStripMenuItem.Size = New System.Drawing.Size(48, 20)
        Me.ToolsToolStripMenuItem.Text = "&Tools"
        '
        'CompileToolStripMenuItem
        '
        Me.CompileToolStripMenuItem.Name = "CompileToolStripMenuItem"
        Me.CompileToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F9
        Me.CompileToolStripMenuItem.Size = New System.Drawing.Size(288, 22)
        Me.CompileToolStripMenuItem.Text = "&Compile"
        '
        'SimulateToolStripMenuItem
        '
        Me.SimulateToolStripMenuItem.Name = "SimulateToolStripMenuItem"
        Me.SimulateToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F5
        Me.SimulateToolStripMenuItem.Size = New System.Drawing.Size(288, 22)
        Me.SimulateToolStripMenuItem.Text = "&Simulate"
        '
        'ShowWaveToolStripMenuItem
        '
        Me.ShowWaveToolStripMenuItem.Name = "ShowWaveToolStripMenuItem"
        Me.ShowWaveToolStripMenuItem.ShortcutKeys = CType((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.F5), System.Windows.Forms.Keys)
        Me.ShowWaveToolStripMenuItem.Size = New System.Drawing.Size(288, 22)
        Me.ShowWaveToolStripMenuItem.Text = "Show Wa&ve"
        '
        'ToolStripMenuItem7
        '
        Me.ToolStripMenuItem7.Name = "ToolStripMenuItem7"
        Me.ToolStripMenuItem7.Size = New System.Drawing.Size(285, 6)
        '
        'ChangeWorkingDirectoryToolStripMenuItem
        '
        Me.ChangeWorkingDirectoryToolStripMenuItem.Name = "ChangeWorkingDirectoryToolStripMenuItem"
        Me.ChangeWorkingDirectoryToolStripMenuItem.ShortcutKeys = CType(((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.Shift) _
                    Or System.Windows.Forms.Keys.D), System.Windows.Forms.Keys)
        Me.ChangeWorkingDirectoryToolStripMenuItem.Size = New System.Drawing.Size(288, 22)
        Me.ChangeWorkingDirectoryToolStripMenuItem.Text = "Change &Working Directory"
        '
        'ClearLogToolStripMenuItem
        '
        Me.ClearLogToolStripMenuItem.Name = "ClearLogToolStripMenuItem"
        Me.ClearLogToolStripMenuItem.ShortcutKeys = CType(((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.Shift) _
                    Or System.Windows.Forms.Keys.C), System.Windows.Forms.Keys)
        Me.ClearLogToolStripMenuItem.Size = New System.Drawing.Size(288, 22)
        Me.ClearLogToolStripMenuItem.Text = "Clear &Log"
        '
        'HelpToolStripMenuItem
        '
        Me.HelpToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.HelpToolStripMenuItem1, Me.ToolStripMenuItem5, Me.AboutToolStripMenuItem})
        Me.HelpToolStripMenuItem.Name = "HelpToolStripMenuItem"
        Me.HelpToolStripMenuItem.Size = New System.Drawing.Size(44, 20)
        Me.HelpToolStripMenuItem.Text = "&Help"
        '
        'HelpToolStripMenuItem1
        '
        Me.HelpToolStripMenuItem1.Name = "HelpToolStripMenuItem1"
        Me.HelpToolStripMenuItem1.ShortcutKeys = System.Windows.Forms.Keys.F1
        Me.HelpToolStripMenuItem1.Size = New System.Drawing.Size(152, 22)
        Me.HelpToolStripMenuItem1.Text = "&Help"
        '
        'ToolStripMenuItem5
        '
        Me.ToolStripMenuItem5.Name = "ToolStripMenuItem5"
        Me.ToolStripMenuItem5.Size = New System.Drawing.Size(149, 6)
        '
        'AboutToolStripMenuItem
        '
        Me.AboutToolStripMenuItem.Name = "AboutToolStripMenuItem"
        Me.AboutToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.AboutToolStripMenuItem.Text = "&About"
        '
        'toolMain
        '
        '
        'toolMain.BottomToolStripPanel
        '
        Me.toolMain.BottomToolStripPanel.Controls.Add(Me.barStatus)
        '
        'toolMain.ContentPanel
        '
        Me.toolMain.ContentPanel.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.toolMain.ContentPanel.Controls.Add(Me.splitMain)
        Me.toolMain.ContentPanel.Size = New System.Drawing.Size(593, 375)
        Me.toolMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.toolMain.Location = New System.Drawing.Point(0, 0)
        Me.toolMain.Name = "toolMain"
        Me.toolMain.Size = New System.Drawing.Size(593, 421)
        Me.toolMain.TabIndex = 12
        Me.toolMain.Text = "ToolStripContainer1"
        '
        'toolMain.TopToolStripPanel
        '
        Me.toolMain.TopToolStripPanel.Controls.Add(Me.mnuMain)
        '
        'splitMain
        '
        Me.splitMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.splitMain.Location = New System.Drawing.Point(0, 0)
        Me.splitMain.Name = "splitMain"
        '
        'splitMain.Panel1
        '
        Me.splitMain.Panel1.Controls.Add(Me.lstFiles)
        '
        'splitMain.Panel2
        '
        Me.splitMain.Panel2.Controls.Add(Me.tabMain)
        Me.splitMain.Size = New System.Drawing.Size(593, 375)
        Me.splitMain.SplitterDistance = 205
        Me.splitMain.TabIndex = 2
        '
        'tabMain
        '
        Me.tabMain.Controls.Add(Me.tabCode)
        Me.tabMain.Controls.Add(Me.tabSystem)
        Me.tabMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tabMain.Location = New System.Drawing.Point(0, 0)
        Me.tabMain.Name = "tabMain"
        Me.tabMain.SelectedIndex = 0
        Me.tabMain.Size = New System.Drawing.Size(384, 375)
        Me.tabMain.TabIndex = 3
        '
        'tabCode
        '
        Me.tabCode.Controls.Add(Me.txtCode)
        Me.tabCode.Location = New System.Drawing.Point(4, 22)
        Me.tabCode.Name = "tabCode"
        Me.tabCode.Padding = New System.Windows.Forms.Padding(3)
        Me.tabCode.Size = New System.Drawing.Size(376, 349)
        Me.tabCode.TabIndex = 0
        Me.tabCode.Text = "File"
        Me.tabCode.UseVisualStyleBackColor = True
        '
        'txtCode
        '
        Me.txtCode.ActiveView = Alsing.Windows.Forms.ActiveView.BottomRight
        Me.txtCode.AutoListPosition = Nothing
        Me.txtCode.AutoListSelectedText = "a123"
        Me.txtCode.AutoListVisible = False
        Me.txtCode.BackColor = System.Drawing.Color.White
        Me.txtCode.BorderStyle = Alsing.Windows.Forms.BorderStyle.None
        Me.txtCode.CopyAsRTF = False
        Me.txtCode.Dock = System.Windows.Forms.DockStyle.Fill
        Me.txtCode.Document = Me.SyntaxDocument1
        Me.txtCode.FontName = "Courier new"
        Me.txtCode.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.txtCode.InfoTipCount = 1
        Me.txtCode.InfoTipPosition = Nothing
        Me.txtCode.InfoTipSelectedIndex = 1
        Me.txtCode.InfoTipVisible = False
        Me.txtCode.Location = New System.Drawing.Point(3, 3)
        Me.txtCode.LockCursorUpdate = False
        Me.txtCode.Name = "txtCode"
        Me.txtCode.ReadOnly = True
        Me.txtCode.ShowScopeIndicator = False
        Me.txtCode.Size = New System.Drawing.Size(370, 343)
        Me.txtCode.SmoothScroll = False
        Me.txtCode.SplitviewH = -4
        Me.txtCode.SplitviewV = -4
        Me.txtCode.TabGuideColor = System.Drawing.Color.FromArgb(CType(CType(233, Byte), Integer), CType(CType(233, Byte), Integer), CType(CType(233, Byte), Integer))
        Me.txtCode.TabIndex = 0
        Me.txtCode.Text = "SyntaxBoxControl1"
        Me.txtCode.WhitespaceColor = System.Drawing.SystemColors.ControlDark
        '
        'SyntaxDocument1
        '
        Me.SyntaxDocument1.Lines = New String() {""}
        Me.SyntaxDocument1.MaxUndoBufferSize = 1000
        Me.SyntaxDocument1.Modified = False
        Me.SyntaxDocument1.UndoStep = 0
        '
        'tabSystem
        '
        Me.tabSystem.Controls.Add(Me.txtLog)
        Me.tabSystem.Location = New System.Drawing.Point(4, 22)
        Me.tabSystem.Name = "tabSystem"
        Me.tabSystem.Padding = New System.Windows.Forms.Padding(3)
        Me.tabSystem.Size = New System.Drawing.Size(376, 349)
        Me.tabSystem.TabIndex = 1
        Me.tabSystem.Text = "Log"
        Me.tabSystem.UseVisualStyleBackColor = True
        '
        'txtLog
        '
        Me.txtLog.Dock = System.Windows.Forms.DockStyle.Fill
        Me.txtLog.Font = New System.Drawing.Font("Courier New", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtLog.Location = New System.Drawing.Point(3, 3)
        Me.txtLog.Name = "txtLog"
        Me.txtLog.ReadOnly = True
        Me.txtLog.Size = New System.Drawing.Size(370, 343)
        Me.txtLog.TabIndex = 0
        Me.txtLog.Text = ""
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(593, 421)
        Me.Controls.Add(Me.toolMain)
        Me.HelpButton = True
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MainMenuStrip = Me.mnuMain
        Me.MinimumSize = New System.Drawing.Size(609, 413)
        Me.Name = "frmMain"
        Me.Text = "jVerilog"
        Me.mnuList.ResumeLayout(False)
        Me.barStatus.ResumeLayout(False)
        Me.barStatus.PerformLayout()
        Me.mnuMain.ResumeLayout(False)
        Me.mnuMain.PerformLayout()
        Me.toolMain.BottomToolStripPanel.ResumeLayout(False)
        Me.toolMain.BottomToolStripPanel.PerformLayout()
        Me.toolMain.ContentPanel.ResumeLayout(False)
        Me.toolMain.TopToolStripPanel.ResumeLayout(False)
        Me.toolMain.TopToolStripPanel.PerformLayout()
        Me.toolMain.ResumeLayout(False)
        Me.toolMain.PerformLayout()
        Me.splitMain.Panel1.ResumeLayout(False)
        Me.splitMain.Panel2.ResumeLayout(False)
        Me.splitMain.ResumeLayout(False)
        Me.tabMain.ResumeLayout(False)
        Me.tabCode.ResumeLayout(False)
        Me.tabSystem.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents lstFiles As System.Windows.Forms.ListBox
    Friend WithEvents barStatus As System.Windows.Forms.StatusStrip
    Friend WithEvents lblStatus As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents mnuList As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents RemoveToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem3 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents AddFilesToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents EditeFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem4 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents AboutToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuMain As System.Windows.Forms.MenuStrip
    Friend WithEvents FileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents NewProjectToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents NewFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents OpenProjectToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem2 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents AddFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem6 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents ExitToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CompileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SimulateToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ShowWaveToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents HelpToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents HelpToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem5 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents AboutToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem7 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents ChangeWorkingDirectoryToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents toolMain As System.Windows.Forms.ToolStripContainer
    Friend WithEvents splitMain As System.Windows.Forms.SplitContainer
    Friend WithEvents tabMain As System.Windows.Forms.TabControl
    Friend WithEvents tabCode As System.Windows.Forms.TabPage
    Friend WithEvents tabSystem As System.Windows.Forms.TabPage
    Friend WithEvents ClearLogToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents txtLog As System.Windows.Forms.RichTextBox
    Friend WithEvents txtCode As Alsing.Windows.Forms.SyntaxBoxControl
    Friend WithEvents SyntaxDocument1 As Alsing.SourceCode.SyntaxDocument

End Class
