using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.IO;
using System.Text;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace AutoTasks
{
    public partial class frmAutoTasks : Form
    {

        [DllImport("kernel32")]
        private static extern long WritePrivateProfileString(string section, string key, string val, string filePath);

        [DllImport("kernel32")]
        private static extern int GetPrivateProfileString(string section, string key, string def, StringBuilder retVal, int size, string filePath);

        public frmAutoTasks()
        {
            InitializeComponent();
        }

        private void frmAutoTasks_Load(object sender, EventArgs e)
        {
            //Carrega combo de dias
            CarregaDiasDeExecucao();

            for (int i = 1; i <= 20; i++)
            {
                if (LerIni("Executar", "Programa" + String.Format("{0:00}", i)) != string.Empty)
                {
                    cboItem.Items.Insert(cboItem.Items.Count, String.Format("{0:00}", i));
                }
            }

            cboItem.SelectedIndex = 0;
            LeParametros(Convert.ToInt32(cboItem.SelectedItem));

            //Configura Agenda
            TimerIcon.Enabled = true;
            TimerIcon.Interval = 60000; //Referente a 60 segundos 
            TimerIcon.Start();

            //Desabilita\Habilita remover programas
            ControleDeAdicionarOuRemoverItens();

            //Begin Resize
            this.Top = (Screen.GetWorkingArea(this).Height - this.Height) / 2;
            this.Left = (Screen.GetWorkingArea(this).Width - this.Width) / 2;

            //Após Carregamento
            TimerIconLoad.Enabled = true;
            TimerIconLoad.Interval = 1000; //Refetente a 1 segundo
            TimerIconLoad.Start();

        }

        private string LerIni(string sSection, string sKey)
        {
            string sFileName = Path.GetFullPath("AutoTasks.cfg");
            StringBuilder temp = new StringBuilder(255);
            int i = GetPrivateProfileString(sKey, sSection, "", temp, 255, sFileName);
            return temp.ToString();
        }

        public void WriteIniFile(String sTitle, String sItem, String sRes, String sFileName)
        {
            WritePrivateProfileString(sTitle, sItem, sRes, sFileName);
        }

        private void TimerIcon_Tick(object sender, EventArgs e)
        {
            try
            {

                //Guarda a posição selecionada
                int iPosition = cboItem.SelectedIndex;

                //Verifica o momento para
                // executar o programa agendado
                for (int i = 0; i <= cboItem.Items.Count - 1; i++)
                {

                    cboItem.SelectedIndex = i;

                    if (chkDesabilitarTarefa.Checked == false)
                    {
                        if (this.txtPrograma.Text != string.Empty && this.mskHorario.Text != string.Empty)
                        {
                            if (DateTime.Now.Hour == Convert.ToInt32(mskHorario.Text.Substring(0, 2)) && DateTime.Now.Minute == Convert.ToInt32(mskHorario.Text.Substring(3, 2)))
                            {
                                ExecucaoDoPrograma(txtPrograma.Text, chkMinimizar.Checked);
                            }
                        }
                    }
                }

                //Volta a posição selecionada
                cboItem.SelectedIndex = iPosition;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK);
            }
        }

        private void btnFechar_Click(object sender, EventArgs e)
        {
            if (btnFechar.Text == "&Cancelar")
            {
                if (MessageBox.Show("Deseja cancelar as alterações?", "Questão", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    if (cboItem.SelectedIndex != -1)
                    {

                        cboItem.Items.Clear();

                        for (int i = 1; i <= 20; i++)
                        {
                            if (LerIni("Executar", "Programa" + String.Format("{0:00}", i)) != string.Empty)
                            {
                                cboItem.Items.Insert(cboItem.Items.Count, String.Format("{0:00}", i));
                            }
                        }

                        cboItem.SelectedIndex = cboItem.Items.Count - 1;

                        cboItem.Enabled = true;
                        btnRemover.Enabled = true;
                        btnAdicionar.Enabled = true;
                        btnFechar.Text = "&Fechar";

                    }
                }
            }
            else
            {
                if (MessageBox.Show("Confirma fechar o AutoTasks?", "Questão", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    this.Close();
                }
            }
        }

        private void btnMinimizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
            this.Visible = false;
        }

        private void CarregaDiasDeExecucao()
        {
            cboDiasExecucao.Items.Clear();
            cboDiasExecucao.Items.Insert(0, "Domingo");
            cboDiasExecucao.Items.Insert(1, "Segunda-feira");
            cboDiasExecucao.Items.Insert(2, "Terça-feira");
            cboDiasExecucao.Items.Insert(3, "Quarta-feira");
            cboDiasExecucao.Items.Insert(4, "Quinta-feira");
            cboDiasExecucao.Items.Insert(5, "Sexta-feira");
            cboDiasExecucao.Items.Insert(6, "Sábado");
            cboDiasExecucao.Items.Insert(7, "<Todos>");
            cboDiasExecucao.Items.Insert(8, "<Segunda à Sexta>");
        }

        private void btnExecutar_Click(object sender, EventArgs e)
        {
            if (txtPrograma.Text != string.Empty)
            {
                ExecucaoDoPrograma(txtPrograma.Text, chkMinimizar.Checked);
            }
        }

        private void btnRemover_Click(object sender, EventArgs e)
        {
            if (cboItem.SelectedIndex != -1)
            {
                if (MessageBox.Show("Confirma a remoção do programa de número " + cboItem.SelectedItem + " ?", "Questão", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {

                    int i = Convert.ToInt32(cboItem.SelectedItem);

                    //Remove o item selecionado
                    cboItem.Items.Remove(cboItem.SelectedItem);
                    cboItem.SelectedIndex = cboItem.Items.Count - 1;

                    //Gravar no Arquivo CFG (Config)
                    WriteIniFile("Programa" + String.Format("{0:00}", i), "Executar", string.Empty, Path.GetFullPath("AutoTasks.cfg"));
                    WriteIniFile("Programa" + String.Format("{0:00}", i), "Horario", string.Empty, Path.GetFullPath("AutoTasks.cfg"));
                    //WriteIniFile("Programa" + String.Format("{0:00}", i), "MinimizarTelas", string.Empty, Path.GetFullPath("AutoTasks.cfg"));
                    WriteIniFile("Programa" + String.Format("{0:00}", i), "DesabilitarTarefa", string.Empty, Path.GetFullPath("AutoTasks.cfg"));
                    WriteIniFile("Programa" + String.Format("{0:00}", i), "DiasExecucao", string.Empty, Path.GetFullPath("AutoTasks.cfg"));

                    //Desabilita\Habilita remover programas
                    ControleDeAdicionarOuRemoverItens();

                }
            }
        }

        private void btnAdicionar_Click(object sender, EventArgs e)
        {

            if (cboItem.SelectedIndex != -1)
            {

                for (int i = 1; i <= 20; i++)
                {
                    if (LerIni("Executar", "Programa" + String.Format("{0:00}", i)) == string.Empty)
                    {
                        cboItem.Items.Insert(i-1, String.Format("{0:00}", i));
                        cboItem.SelectedItem = String.Format("{0:00}", i);
                        break;
                    }

                    //Desabilita\Habilita remover programas
                    ControleDeAdicionarOuRemoverItens();

                    txtPrograma.Text = "";
                    cboItem.Enabled = false;
                    btnRemover.Enabled = false;
                    btnAdicionar.Enabled = false;
                    btnFechar.Text = "&Cancelar";
                }
            }
        }

        private void btnAplicar_Click(object sender, EventArgs e)
        {

            //Gravar no Arquivo CFG (Config)
            WriteIniFile("Programa" + string.Format(cboItem.Text, "00"), "Executar", txtPrograma.Text, Path.GetFullPath("AutoTasks.cfg"));
            WriteIniFile("Programa" + string.Format(cboItem.Text, "00"), "Horario", mskHorario.Text, Path.GetFullPath("AutoTasks.cfg"));
            //WriteIniFile("Programa" + string.Format(cboItem.Text, "00"), "MinimizarTelas", chkMinimizar.Checked.ToString(), Path.GetFullPath("AutoTasks.cfg"));
            WriteIniFile("Programa" + string.Format(cboItem.Text, "00"), "DesabilitarTarefa", chkDesabilitarTarefa.Checked.ToString(), Path.GetFullPath("AutoTasks.cfg"));
            WriteIniFile("Programa" + string.Format(cboItem.Text, "00"), "DiasExecucao", Convert.ToString(cboDiasExecucao.SelectedIndex), Path.GetFullPath("AutoTasks.cfg"));

            //Desabilita\Habilita remover programas
            ControleDeAdicionarOuRemoverItens();

            //Confirmação do salvamento
            MessageBox.Show("Salvo com sucesso!", "Aplicar", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

            cboItem.Enabled = true;
            btnRemover.Enabled = true;
            btnAdicionar.Enabled = true;
            btnFechar.Text = "&Fechar";

        }

        private void cboItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboItem_Click(sender, e);
        }

        private void cboItem_Click(object sender, EventArgs e)
        {
            if (cboItem.SelectedIndex != -1)
            {
                LeParametros(cboItem.SelectedIndex);
            }
        }

        private void ExecucaoDoPrograma(String sComando, Boolean bMinimizarTelas)
        {
            int iDiaCombo = cboDiasExecucao.Items.IndexOf(cboDiasExecucao.SelectedItem);
            int iDiaAtual = (int)DateTime.Today.DayOfWeek;
            
            if ((iDiaAtual == iDiaCombo) || (iDiaCombo == 7) || (iDiaCombo == 8 && iDiaAtual >= 1 && iDiaAtual <= 5))
            {

                //Minimizar Telas
                //if (bMinimizarTelas == true)
                //{
                //    //Tecla do Windows
                //    SendKeys.Send("#m");
                //}

                //Executar Programa
                String[] sPrograma = sComando.Split(new[] {";"}, StringSplitOptions.None);
                Process myProcess = new Process();
                myProcess.StartInfo.FileName = sPrograma[0];
                myProcess.StartInfo.WindowStyle = ProcessWindowStyle.Maximized;
                if (sComando.Contains(";") == true)
                {
                    myProcess.StartInfo.Arguments = sPrograma[1];
                }
                myProcess.Start();

            }
        }

        private void LeParametros(int iItem)
        {
            txtPrograma.Text = LerIni("Executar", "Programa" + String.Format("{0:00}", cboItem.SelectedItem));

            if (LerIni("Horario", "Programa" + String.Format("{0:00}", cboItem.SelectedItem)) == string.Empty)
            {
                mskHorario.Text = "00:00";
            } else {
                mskHorario.Text = LerIni("Horario", "Programa" + String.Format("{0:00}", cboItem.SelectedItem));
            }

            // Check para minimizar telas
            //if (LerIni("MinimizarTelas", "Programa" + String.Format("{0:00}", cboItem.SelectedItem)) != string.Empty)
            //{
            //    chkMinimizar.Checked = Convert.ToBoolean(LerIni("MinimizarTelas", "Programa" + String.Format("{0:00}", cboItem.SelectedItem)));
            //} else
            //{
            //    chkMinimizar.Checked = false;
            //}

            //Check para desabilitar ou não a tarefa
            if (LerIni("DesabilitarTarefa", "Programa" + String.Format("{0:00}", cboItem.SelectedItem)) != string.Empty)
            {
                chkDesabilitarTarefa.Checked = Convert.ToBoolean(LerIni("DesabilitarTarefa", "Programa" + String.Format("{0:00}", cboItem.SelectedItem)));
            }
            else
            {
                chkDesabilitarTarefa.Checked = false;
            }
            
            //Lista de dias da semana para executar a tarefa
            if (LerIni("DiasExecucao", "Programa" + String.Format("{0:00}", cboItem.SelectedItem)) != string.Empty)
            {
                cboDiasExecucao.SelectedIndex = Convert.ToInt32(LerIni("DiasExecucao", "Programa" + String.Format("{0:00}", cboItem.SelectedItem)));
            }
            else
            {
                cboDiasExecucao.SelectedIndex = 0;
            }

        }

        private void ControleDeAdicionarOuRemoverItens()
        {

            //Desabilita\Habilita remover programas
            if (cboItem.Items.Count == 1)
            {
                btnRemover.Enabled = false;
            } else {
                btnRemover.Enabled = true;
            }

            //Desabilita\Habilita adicionar programas
            if (cboItem.Items.Count == 20)
            {
                btnAdicionar.Enabled = false;
            } else {
                btnAdicionar.Enabled = true;
            }
        }

        private void NotifyIcon_MouseClick(object sender, MouseEventArgs e)
        {
            this.Visible = true;
            this.WindowState = FormWindowState.Normal;
        }

        private void TimerIconLoad_Tick(object sender, EventArgs e)
        {

            this.WindowState = FormWindowState.Minimized;
            this.Visible = false;

            TimerIconLoad.Enabled = false;
            TimerIconLoad.Stop();

        }
    }
}
