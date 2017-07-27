namespace ConfigMgrTSAction
{
    partial class RunPowerShellControl
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

        #region Component Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.labelType = new System.Windows.Forms.Label();
            this.labelName = new System.Windows.Forms.Label();
            this.labelDescriptions = new System.Windows.Forms.Label();
            this.textBoxType = new System.Windows.Forms.TextBox();
            this.textBoxName = new System.Windows.Forms.TextBox();
            this.textBoxDescription = new System.Windows.Forms.TextBox();
            this.labelMessage = new System.Windows.Forms.Label();
            this.textBoxPowerShell = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // labelType
            // 
            this.labelType.AutoSize = true;
            this.labelType.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelType.Location = new System.Drawing.Point(7, 7);
            this.labelType.Name = "labelType";
            this.labelType.Size = new System.Drawing.Size(34, 13);
            this.labelType.TabIndex = 0;
            this.labelType.Text = "Type:";
            // 
            // labelName
            // 
            this.labelName.AutoSize = true;
            this.labelName.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelName.Location = new System.Drawing.Point(7, 31);
            this.labelName.Name = "labelName";
            this.labelName.Size = new System.Drawing.Size(38, 13);
            this.labelName.TabIndex = 1;
            this.labelName.Text = "Name:";
            // 
            // labelDescriptions
            // 
            this.labelDescriptions.AutoSize = true;
            this.labelDescriptions.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelDescriptions.Location = new System.Drawing.Point(7, 61);
            this.labelDescriptions.Name = "labelDescriptions";
            this.labelDescriptions.Size = new System.Drawing.Size(68, 13);
            this.labelDescriptions.TabIndex = 2;
            this.labelDescriptions.Text = "Descriptions:";
            // 
            // textBoxType
            // 
            this.textBoxType.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxType.BackColor = System.Drawing.SystemColors.Control;
            this.textBoxType.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxType.Location = new System.Drawing.Point(114, 4);
            this.textBoxType.Name = "textBoxType";
            this.textBoxType.ReadOnly = true;
            this.textBoxType.Size = new System.Drawing.Size(246, 20);
            this.textBoxType.TabIndex = 3;
            this.textBoxType.Text = "Run PowerShell command or script";
            // 
            // textBoxName
            // 
            this.textBoxName.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxName.Location = new System.Drawing.Point(114, 31);
            this.textBoxName.Name = "textBoxName";
            this.textBoxName.Size = new System.Drawing.Size(246, 20);
            this.textBoxName.TabIndex = 4;
            this.textBoxName.TextChanged += new System.EventHandler(this.textBoxName_TextChanged);
            // 
            // textBoxDescription
            // 
            this.textBoxDescription.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxDescription.Location = new System.Drawing.Point(114, 61);
            this.textBoxDescription.Multiline = true;
            this.textBoxDescription.Name = "textBoxDescription";
            this.textBoxDescription.Size = new System.Drawing.Size(246, 83);
            this.textBoxDescription.TabIndex = 5;
            this.textBoxDescription.TextChanged += new System.EventHandler(this.textBoxDescription_TextChanged);
            // 
            // labelMessage
            // 
            this.labelMessage.AutoSize = true;
            this.labelMessage.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelMessage.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.labelMessage.Location = new System.Drawing.Point(7, 167);
            this.labelMessage.Name = "labelMessage";
            this.labelMessage.Size = new System.Drawing.Size(152, 13);
            this.labelMessage.TabIndex = 6;
            this.labelMessage.Text = "&PowerShell command or script:";
            // 
            // textBoxPowerShell
            // 
            this.textBoxPowerShell.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxPowerShell.Location = new System.Drawing.Point(10, 183);
            this.textBoxPowerShell.MaxLength = 512;
            this.textBoxPowerShell.Multiline = true;
            this.textBoxPowerShell.Name = "textBoxPowerShell";
            this.textBoxPowerShell.Size = new System.Drawing.Size(356, 89);
            this.textBoxPowerShell.TabIndex = 7;
            this.textBoxPowerShell.TextChanged += new System.EventHandler(this.textBoxPowerShell_TextChanged);
            // 
            // RunPowerShellControl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.labelMessage);
            this.Controls.Add(this.textBoxPowerShell);
            this.Controls.Add(this.textBoxDescription);
            this.Controls.Add(this.textBoxName);
            this.Controls.Add(this.textBoxType);
            this.Controls.Add(this.labelDescriptions);
            this.Controls.Add(this.labelName);
            this.Controls.Add(this.labelType);
            this.Name = "RunPowerShellControl";
            this.Load += new System.EventHandler(this.ConfigMgrTSActionControl_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelType;
        private System.Windows.Forms.Label labelName;
        private System.Windows.Forms.Label labelDescriptions;
        private System.Windows.Forms.TextBox textBoxType;
        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.TextBox textBoxDescription;
        private System.Windows.Forms.Label labelMessage;
        private System.Windows.Forms.TextBox textBoxPowerShell;
    }
}
