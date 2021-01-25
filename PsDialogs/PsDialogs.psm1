# Modul: PsDialogs

# Aufruf powershell -Executionpolicy bypass -File test.ps1

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function showHinweisBox ([string]$message) {
	[System.Windows.Forms.MessageBox]::Show($message, "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
}

function showFehlerBox ([string]$message) {
	[System.Windows.Forms.MessageBox]::Show($message, "Fehler", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
}

function showWarnungBox ([string]$message) {
	[System.Windows.Forms.MessageBox]::Show($message, "Warnung", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
}

function showWarnungBoxWithCancelOption ([string]$message) {
	$result = [System.Windows.Forms.MessageBox]::Show($message, "Warnung", [System.Windows.Forms.MessageBoxButtons]::OKCancel, [System.Windows.Forms.MessageBoxIcon]::Warning)
	return $result;
}

function showAuswahlliste ($message, [array]$listitems) {
	$width = 800
	$height = 600

	$form = New-Object System.Windows.Forms.Form
	$form.Text = 'Auswahl'
	$form.Size = New-Object System.Drawing.Size($width,$height)
	$form.StartPosition = 'CenterScreen'

	$OKButton = New-Object System.Windows.Forms.Button
	$OKButton.Location = New-Object System.Drawing.Point(($width - 195), ($height - 80))
	$OKButton.Size = New-Object System.Drawing.Size(75,23)
	$OKButton.Text = 'OK'
	$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
	$form.AcceptButton = $OKButton
	$form.Controls.Add($OKButton)

	$CancelButton = New-Object System.Windows.Forms.Button
	$CancelButton.Location = New-Object System.Drawing.Point(($width - 110), ($height - 80))
	$CancelButton.Size = New-Object System.Drawing.Size(75,23)
	$CancelButton.Text = 'Abbrechen'
	$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
	$form.CancelButton = $CancelButton
	$form.Controls.Add($CancelButton)

	$label = New-Object System.Windows.Forms.Label
	$label.Location = New-Object System.Drawing.Point(10,20)
	$label.Size = New-Object System.Drawing.Size(($width - 20), 20)
	$label.Text = $message
	$form.Controls.Add($label)

	$listBox = New-Object System.Windows.Forms.ListBox
	$listBox.Location = New-Object System.Drawing.Point(10,40)
	$listBox.Size = New-Object System.Drawing.Size(($width - 40), 20)
	$listBox.Height = ($height - 130)

	for ($i=0; $i -lt $listitems.length; $i++){
	  [void] $listBox.Items.Add($listitems[$i])
	}
	$form.Controls.Add($listBox)

	$form.Topmost = $true
	$result = $form.ShowDialog()
	if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
		$x = $listBox.SelectedIndex
		return $x
	}
}

