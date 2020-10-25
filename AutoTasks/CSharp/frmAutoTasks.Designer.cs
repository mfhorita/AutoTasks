namespace AutoTasks
{
    partial class frmAutoTasks
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAutoTasks));
            this.grpTasks = new System.Windows.Forms.GroupBox();
            this.btnAdicionar = new System.Windows.Forms.Button();
            this.btnExecutar = new System.Windows.Forms.Button();
            this.cboItem = new System.Windows.Forms.ComboBox();
            this.mskHorario = new System.Windows.Forms.MaskedTextBox();
            this.lblHorario = new System.Windows.Forms.Label();
            this.cboDiasExecucao = new System.Windows.Forms.ComboBox();
            this.lblDiasExecucao = new System.Windows.Forms.Label();
            this.chkDesabilitarTarefa = new System.Windows.Forms.CheckBox();
            this.chkMinimizar = new System.Windows.Forms.CheckBox();
            this.txtPrograma = new System.Windows.Forms.TextBox();
            this.lblPrograma = new System.Windows.Forms.Label();
            this.btnRemover = new System.Windows.Forms.Button();
            this.lblDesenvolvidoPor = new System.Windows.Forms.Label();
            this.lblVersao = new System.Windows.Forms.Label();
            this.NotifyIcon = new System.Windows.Forms.NotifyIcon(this.components);
            this.btnFechar = new System.Windows.Forms.Button();
            this.btnMinimizar = new System.Windows.Forms.Button();
            this.btnAplicar = new System.Windows.Forms.Button();
            this.TimerIcon = new System.Windows.Forms.Timer(this.components);
            this.TimerIconLoad = new System.Windows.Forms.Timer(this.components);
            this.grpTasks.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpTasks
            // 
            this.grpTasks.Controls.Add(this.btnAdicionar);
            this.grpTasks.Controls.Add(this.btnExecutar);
            this.grpTasks.Controls.Add(this.cboItem);
            this.grpTasks.Controls.Add(this.mskHorario);
            this.grpTasks.Controls.Add(this.lblHorario);
            this.grpTasks.Controls.Add(this.cboDiasExecucao);
            this.grpTasks.Controls.Add(this.lblDiasExecucao);
            this.grpTasks.Controls.Add(this.chkDesabilitarTarefa);
            this.grpTasks.Controls.Add(this.chkMinimizar);
            this.grpTasks.Controls.Add(this.txtPrograma);
            this.grpTasks.Controls.Add(this.lblPrograma);
            this.grpTasks.Controls.Add(this.btnRemover);
            this.grpTasks.Location = new System.Drawing.Point(12, 12);
            this.grpTasks.Name = "grpTasks";
            this.grpTasks.Size = new System.Drawing.Size(690, 141);
            this.grpTasks.TabIndex = 0;
            this.grpTasks.TabStop = false;
            // 
            // btnAdicionar
            // 
            this.btnAdicionar.Location = new System.Drawing.Point(642, 38);
            this.btnAdicionar.Name = "btnAdicionar";
            this.btnAdicionar.Size = new System.Drawing.Size(42, 21);
            this.btnAdicionar.TabIndex = 2;
            this.btnAdicionar.Text = "+";
            this.btnAdicionar.UseVisualStyleBackColor = true;
            this.btnAdicionar.Click += new System.EventHandler(this.btnAdicionar_Click);
            // 
            // btnExecutar
            // 
            this.btnExecutar.Location = new System.Drawing.Point(539, 90);
            this.btnExecutar.Name = "btnExecutar";
            this.btnExecutar.Size = new System.Drawing.Size(141, 36);
            this.btnExecutar.TabIndex = 8;
            this.btnExecutar.Text = "&Executar";
            this.btnExecutar.UseVisualStyleBackColor = true;
            this.btnExecutar.Click += new System.EventHandler(this.btnExecutar_Click);
            // 
            // cboItem
            // 
            this.cboItem.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboItem.FormattingEnabled = true;
            this.cboItem.Location = new System.Drawing.Point(80, 13);
            this.cboItem.Name = "cboItem";
            this.cboItem.Size = new System.Drawing.Size(42, 21);
            this.cboItem.TabIndex = 0;
            this.cboItem.SelectedIndexChanged += new System.EventHandler(this.cboItem_SelectedIndexChanged);
            this.cboItem.Click += new System.EventHandler(this.cboItem_Click);
            // 
            // mskHorario
            // 
            this.mskHorario.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.mskHorario.Location = new System.Drawing.Point(464, 101);
            this.mskHorario.Mask = "00:00";
            this.mskHorario.Name = "mskHorario";
            this.mskHorario.Size = new System.Drawing.Size(43, 20);
            this.mskHorario.TabIndex = 7;
            // 
            // lblHorario
            // 
            this.lblHorario.AutoSize = true;
            this.lblHorario.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHorario.Location = new System.Drawing.Point(414, 104);
            this.lblHorario.Name = "lblHorario";
            this.lblHorario.Size = new System.Drawing.Size(44, 13);
            this.lblHorario.TabIndex = 6;
            this.lblHorario.Text = "Horas:";
            // 
            // cboDiasExecucao
            // 
            this.cboDiasExecucao.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboDiasExecucao.FormattingEnabled = true;
            this.cboDiasExecucao.Location = new System.Drawing.Point(229, 99);
            this.cboDiasExecucao.Name = "cboDiasExecucao";
            this.cboDiasExecucao.Size = new System.Drawing.Size(157, 21);
            this.cboDiasExecucao.TabIndex = 6;
            // 
            // lblDiasExecucao
            // 
            this.lblDiasExecucao.AutoSize = true;
            this.lblDiasExecucao.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDiasExecucao.Location = new System.Drawing.Point(187, 104);
            this.lblDiasExecucao.Name = "lblDiasExecucao";
            this.lblDiasExecucao.Size = new System.Drawing.Size(36, 13);
            this.lblDiasExecucao.TabIndex = 4;
            this.lblDiasExecucao.Text = "Dias:";
            // 
            // chkDesabilitarTarefa
            // 
            this.chkDesabilitarTarefa.AutoSize = true;
            this.chkDesabilitarTarefa.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkDesabilitarTarefa.Location = new System.Drawing.Point(16, 87);
            this.chkDesabilitarTarefa.Name = "chkDesabilitarTarefa";
            this.chkDesabilitarTarefa.Size = new System.Drawing.Size(129, 17);
            this.chkDesabilitarTarefa.TabIndex = 4;
            this.chkDesabilitarTarefa.Text = "Tarefa desativada";
            this.chkDesabilitarTarefa.UseVisualStyleBackColor = true;
            // 
            // chkMinimizar
            // 
            this.chkMinimizar.AutoSize = true;
            this.chkMinimizar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkMinimizar.Location = new System.Drawing.Point(16, 109);
            this.chkMinimizar.Name = "chkMinimizar";
            this.chkMinimizar.Size = new System.Drawing.Size(109, 17);
            this.chkMinimizar.TabIndex = 5;
            this.chkMinimizar.Text = "Minimizar telas";
            this.chkMinimizar.UseVisualStyleBackColor = true;
            this.chkMinimizar.Visible = false;
            // 
            // txtPrograma
            // 
            this.txtPrograma.Location = new System.Drawing.Point(16, 39);
            this.txtPrograma.Multiline = true;
            this.txtPrograma.Name = "txtPrograma";
            this.txtPrograma.Size = new System.Drawing.Size(620, 42);
            this.txtPrograma.TabIndex = 1;
            // 
            // lblPrograma
            // 
            this.lblPrograma.AutoSize = true;
            this.lblPrograma.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPrograma.Location = new System.Drawing.Point(13, 16);
            this.lblPrograma.Name = "lblPrograma";
            this.lblPrograma.Size = new System.Drawing.Size(61, 13);
            this.lblPrograma.TabIndex = 0;
            this.lblPrograma.Text = "Executar:";
            // 
            // btnRemover
            // 
            this.btnRemover.Location = new System.Drawing.Point(642, 60);
            this.btnRemover.Name = "btnRemover";
            this.btnRemover.Size = new System.Drawing.Size(42, 21);
            this.btnRemover.TabIndex = 3;
            this.btnRemover.Text = "-";
            this.btnRemover.UseVisualStyleBackColor = true;
            this.btnRemover.Click += new System.EventHandler(this.btnRemover_Click);
            // 
            // lblDesenvolvidoPor
            // 
            this.lblDesenvolvidoPor.AutoSize = true;
            this.lblDesenvolvidoPor.Location = new System.Drawing.Point(9, 160);
            this.lblDesenvolvidoPor.Name = "lblDesenvolvidoPor";
            this.lblDesenvolvidoPor.Size = new System.Drawing.Size(217, 13);
            this.lblDesenvolvidoPor.TabIndex = 1;
            this.lblDesenvolvidoPor.Text = "Desenvolvido por Marcelo F. Delgado Horita";
            // 
            // lblVersao
            // 
            this.lblVersao.AutoSize = true;
            this.lblVersao.Location = new System.Drawing.Point(9, 182);
            this.lblVersao.Name = "lblVersao";
            this.lblVersao.Size = new System.Drawing.Size(76, 13);
            this.lblVersao.TabIndex = 2;
            this.lblVersao.Text = "Versão 2.0.0.0";
            // 
            // NotifyIcon
            // 
            this.NotifyIcon.Icon = ((System.Drawing.Icon)(resources.GetObject("NotifyIcon.Icon")));
            this.NotifyIcon.Visible = true;
            this.NotifyIcon.MouseClick += new System.Windows.Forms.MouseEventHandler(this.NotifyIcon_MouseClick);
            // 
            // btnFechar
            // 
            this.btnFechar.Location = new System.Drawing.Point(561, 159);
            this.btnFechar.Name = "btnFechar";
            this.btnFechar.Size = new System.Drawing.Size(141, 36);
            this.btnFechar.TabIndex = 11;
            this.btnFechar.Text = "&Fechar";
            this.btnFechar.UseVisualStyleBackColor = true;
            this.btnFechar.Click += new System.EventHandler(this.btnFechar_Click);
            // 
            // btnMinimizar
            // 
            this.btnMinimizar.Location = new System.Drawing.Point(414, 159);
            this.btnMinimizar.Name = "btnMinimizar";
            this.btnMinimizar.Size = new System.Drawing.Size(141, 36);
            this.btnMinimizar.TabIndex = 10;
            this.btnMinimizar.Text = "&Minimizar";
            this.btnMinimizar.UseVisualStyleBackColor = true;
            this.btnMinimizar.Click += new System.EventHandler(this.btnMinimizar_Click);
            // 
            // btnAplicar
            // 
            this.btnAplicar.Location = new System.Drawing.Point(267, 159);
            this.btnAplicar.Name = "btnAplicar";
            this.btnAplicar.Size = new System.Drawing.Size(141, 36);
            this.btnAplicar.TabIndex = 9;
            this.btnAplicar.Text = "&Aplicar";
            this.btnAplicar.UseVisualStyleBackColor = true;
            this.btnAplicar.Click += new System.EventHandler(this.btnAplicar_Click);
            // 
            // TimerIcon
            // 
            this.TimerIcon.Tick += new System.EventHandler(this.TimerIcon_Tick);
            // 
            // TimerIconLoad
            // 
            this.TimerIconLoad.Tick += new System.EventHandler(this.TimerIconLoad_Tick);
            // 
            // frmAutoTasks
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(714, 210);
            this.ControlBox = false;
            this.Controls.Add(this.btnAplicar);
            this.Controls.Add(this.btnMinimizar);
            this.Controls.Add(this.btnFechar);
            this.Controls.Add(this.lblVersao);
            this.Controls.Add(this.lblDesenvolvidoPor);
            this.Controls.Add(this.grpTasks);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmAutoTasks";
            this.Text = "AutoTasks (Agenda de Tarefas)";
            this.Load += new System.EventHandler(this.frmAutoTasks_Load);
            this.grpTasks.ResumeLayout(false);
            this.grpTasks.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox grpTasks;
        private System.Windows.Forms.Label lblDesenvolvidoPor;
        private System.Windows.Forms.Label lblVersao;
        private System.Windows.Forms.Button btnExecutar;
        private System.Windows.Forms.ComboBox cboItem;
        private System.Windows.Forms.MaskedTextBox mskHorario;
        private System.Windows.Forms.Label lblHorario;
        private System.Windows.Forms.ComboBox cboDiasExecucao;
        private System.Windows.Forms.Label lblDiasExecucao;
        private System.Windows.Forms.CheckBox chkDesabilitarTarefa;
        private System.Windows.Forms.CheckBox chkMinimizar;
        private System.Windows.Forms.TextBox txtPrograma;
        private System.Windows.Forms.Label lblPrograma;
        private System.Windows.Forms.NotifyIcon NotifyIcon;
        private System.Windows.Forms.Button btnRemover;
        private System.Windows.Forms.Button btnAdicionar;
        private System.Windows.Forms.Button btnFechar;
        private System.Windows.Forms.Button btnMinimizar;
        private System.Windows.Forms.Button btnAplicar;
        private System.Windows.Forms.Timer TimerIcon;
        private System.Windows.Forms.Timer TimerIconLoad;
    }
}

