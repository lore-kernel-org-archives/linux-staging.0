Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901D4389E02
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 10:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333832; cv=none; b=AhmdTCQlBCjZptPSoj8Azb+g4dYWDrGh2I/vMyQ3ZL2y4Ly5flOKX8pk3X8+NrLKX5pg8LqpBAtXYJG1On9o4veydk4cIfmDeqDK8nPsX+46bJJ1ciNXNSWvWRLr2XqP/mVfCXWi32P+gnIxTXBBXGPAmPxomLhWZk6QxZKAVO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333832; c=relaxed/simple;
	bh=NwkQPMpaW8ciuVoZIQwjvF3tbP6Eey8R1hn/QsI6xVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rK/oAxoVcicY63MjxqwN0lpLUVju1E+kgzSRgj5JpfWDSg9A+75cby7T32K7dvlHz45Aq8EebIKZQe5I7cB323Zw4UxTB4uMDEqdqT3CRn5mtjRRYhA1giVBsLP1TGFarnNy95deX7FEVdRWHWTTkgN238qQkHgg6q/OxJNYDS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbaB89Jk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbaB89Jk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cab973140bso34788165ad.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Jul 2026 03:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783333830; x=1783938630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3g0UoWMOjtG1TNbStm0ioEvD0A6G9j9nRCkVCE/Z6JU=;
        b=XbaB89Jk/iUcnaJ5wZdD7YsRwmdtI/PMb+rtT+mUN7b9L5pzeQQx3waOLXKKqz4ysO
         E/DkhdXNVA6+nHAJ5Xnb+6cE/ZcBfjAyyjqMqhZj3+wLhWqcd643o3K/x2k5BGRhvzwz
         +u6gbFK/a3jF6i2T9ZLK1viopOr1MmB4UFr4T+PeXKOLokgCLplWbogP5qkSMmY0zstN
         llnJ436XyDAooy5/3WQxhJUYoWqARZ1yTrrmxEBrrQT1ZTdEIBderv13xH5MXHCk19K+
         flEgihIHaUe6KAxOSqwYIaRmeJS7ONPTsNO7rfFEYCmVsYB1uCUk9QF6yNHNmD9K4ICV
         sTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333830; x=1783938630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3g0UoWMOjtG1TNbStm0ioEvD0A6G9j9nRCkVCE/Z6JU=;
        b=TKic9d/BjpROBLfpD+hp4YuI/skDf6KRMMtsw90MgLaCOvy4LBWRtifGpC0ZAyJsQJ
         XwLglERejWfsavn5xQ+f6wg4JrNTeHA8YtURABSson1oDd+sj6t6VgClROaZmT6ws9W/
         gKIVhBYGdHmOgjy8gcU4eWRc8TT6GIrPCHSOXHJ7OP95px1aoKx1vr+U0K03bKIDU1Xk
         A2qmY/6iPb6Z+fRCq3tH1SHSVEO8Q6GvHarJyT9zY8PCZvvEPms0wMhc1zErrJEb+6nZ
         WzZXBUugpfs/M0/idfKNiQ+QeU3Y8bJCbVFQvlre/tCrYnDH5PJ369ncl4zZb42K/ytN
         5kSA==
X-Forwarded-Encrypted: i=1; AHgh+Rps/m4WjYz2QY/H2LOatoBhSuvO8zuJ1TtJNvKJlozHw55jl1jYQDKtFu22+mmEg/fG/5FgxIAj/4ssuYmq@lists.linux.dev
X-Gm-Message-State: AOJu0Yw33ox3BCasMjrNthwuK46DAQXQobYsADEMTPPluDRvmimdKwel
	nYLWHK9tI3MO1IXEFHym6g998fFzVO4TSaIPBIxrtyxS04Ejbv32vbRH
X-Gm-Gg: AfdE7cnrxH5vg72POublqEsIU7zja/bHfn8PyQS88I3cf1N3zvKyv8sxJTX9fQzqFQV
	YSDzVZJrXKA0ucEqAdj2wfNiEWoHN0T/0NjoIGO8evx8swE17Qto4/Q4P+gUOGpjbSi8wyIdViI
	upRpZcHEKQcjZA/Fdp4CR1gbcWr3CFmz7WeMCKfxS5BxIDpXhhA3siWWtRjxHYfIM/d4qYvCN9b
	jc9s5HdYBG5fmG6w0jxcfMpQl2V3/MzCfT80os/4lLubxb58rIynUUwWJzHU6tjApq4j10CGtB5
	Fk0FixHJE/pAhf8bYnTaWULSTBwHKaLoVBh7pxzRzRwJ6OZ1S1oeGSXI8/2EKdhJRgRgcjtO71C
	A+RH+CYi06p+xO5FH0Ob5VXdP+DL2oSXk05s5Ap9Swcw/OugInWjFanSbbzh6opPwGrzYEC6A+7
	cpwWGD+ng0dfLBmiU/6kFZMNR58H20bulI+Ns7/OLd79QpYP/1Uiq3ymb741BaUaj49C+c0nrkC
	W6oj51vBJLrowvIPbq0QijnsZ9N4w==
X-Received: by 2002:a17:903:8c8:b0:2cc:76fd:6537 with SMTP id d9443c01a7336-2cc76fd8d66mr74462035ad.2.1783333829552;
        Mon, 06 Jul 2026 03:30:29 -0700 (PDT)
Received: from dileep-HP-Pavilion-Laptop-15-eg2xxx.. ([2405:201:5c1b:705f:8d2c:9348:4a23:7ef4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cc9ebfd8d3sm13138735ad.82.2026.07.06.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:30:28 -0700 (PDT)
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	dileepsankhla.ds@gmail.com,
	chelsyratnawat2001@gmail.com,
	abdelrahmanfekry375@gmail.com,
	matt@mattwardle.net,
	azpijr@gmail.com,
	error27@gmail.com,
	kees@kernel.org,
	pontescpedro@gmail.com,
	starpt.official@gmail.com,
	karthikey3608@gmail.com,
	roehling@debian.org,
	feng@innora.ai,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: media: atomisp: Drop unnecessary else block after return/break
Date: Mon,  6 Jul 2026 16:08:10 +0530
Message-ID: <20260706103810.71919-1-dileepsankhla.ds@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant else blocks following return or break statements. As
control flow exits in these cases, the else branch is unnecessary.
Dropping it improves code readability.

No functional change.

Signed-off-by: Dileep Sankhla <dileepsankhla.ds@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  |  22 ++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  30 ++---
 .../hive_isp_css_common/host/input_system.c   | 103 ++++++++-------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |   3 +-
 .../kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c   |   6 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |  16 +--
 .../media/atomisp/pci/sh_css_firmware.c       |   4 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 118 +++++++++---------
 8 files changed, 149 insertions(+), 153 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f209..8f885f72e195 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -125,10 +125,9 @@ static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
 					     stream_id, css_pipe_id)) {
 		list_add(&metadata_buf->list, metadata_list);
 		return -EINVAL;
-	} else {
-		list_add_tail(&metadata_buf->list,
-			      &asd->metadata_in_css[md_type]);
 	}
+
+	list_add_tail(&metadata_buf->list, &asd->metadata_in_css[md_type]);
 	asd->metadata_bufs_in_css[stream_id][css_pipe_id]++;
 
 	return 0;
@@ -165,12 +164,13 @@ static int atomisp_q_one_s3a_buffer(struct atomisp_sub_device *asd,
 		/* got from head, so return back to the head */
 		list_add(&s3a_buf->list, s3a_list);
 		return -EINVAL;
-	} else {
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats_in_css);
-		if (s3a_list == &asd->s3a_stats_ready)
-			dev_dbg(asd->isp->dev, "drop one s3a stat with exp_id %d\n", exp_id);
 	}
 
+	list_add_tail(&s3a_buf->list, &asd->s3a_stats_in_css);
+	if (s3a_list == &asd->s3a_stats_ready)
+		dev_dbg(asd->isp->dev, "drop one s3a stat with exp_id %d\n",
+			exp_id);
+
 	asd->s3a_bufs_in_css[css_pipe_id]++;
 	return 0;
 }
@@ -206,12 +206,12 @@ static int atomisp_q_one_dis_buffer(struct atomisp_sub_device *asd,
 		list_add_tail(&dis_buf->list, &asd->dis_stats);
 		spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 		return -EINVAL;
-	} else {
-		spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
-		list_add_tail(&dis_buf->list, &asd->dis_stats_in_css);
-		spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 	}
 
+	spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
+	list_add_tail(&dis_buf->list, &asd->dis_stats_in_css);
+	spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
+
 	asd->dis_bufs_in_css++;
 
 	return 0;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..2059b3afc858 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -468,22 +468,22 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 			__func__, irq);
 		spin_unlock_irqrestore(&isp->lock, flags);
 		return -EAGAIN;
-	} else {
-		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
-		irq &= BIT(INTR_IIR);
-		pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
-
-		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
-		if (!(irq & BIT(INTR_IIR))) {
-			atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
-			goto done;
-		}
-		dev_err(isp->dev,
-			"%s: error in iunit interrupt. status reg=0x%x\n",
-			__func__, irq);
-		spin_unlock_irqrestore(&isp->lock, flags);
-		return -EAGAIN;
 	}
+
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
+	irq &= BIT(INTR_IIR);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
+
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
+	if (!(irq & BIT(INTR_IIR))) {
+		atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
+		goto done;
+	}
+	dev_err(isp->dev,
+		"%s: error in iunit interrupt. status reg=0x%x\n", __func__,
+		irq);
+	spin_unlock_irqrestore(&isp->lock, flags);
+	return -EAGAIN;
 done:
 	/*
 	 * MRFLD WORKAROUND:
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 68b0ad27615d..f9bf8d1ddf0a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -408,47 +408,47 @@ static input_system_err_t input_system_configure_channel(
 {
 	input_system_err_t error = INPUT_SYSTEM_ERR_NO_ERROR;
 	// Check if channel is not already configured.
-	if (config.ch_flags[channel.ch_id] & INPUT_SYSTEM_CFG_FLAG_SET) {
+	if (config.ch_flags[channel.ch_id] & INPUT_SYSTEM_CFG_FLAG_SET)
 		return INPUT_SYSTEM_ERR_CHANNEL_ALREADY_SET;
-	} else {
-		switch (channel.source_type) {
-		case INPUT_SYSTEM_SOURCE_SENSOR:
-			error = input_system_configure_channel_sensor(channel);
-			break;
-		case INPUT_SYSTEM_SOURCE_PRBS:
-		case INPUT_SYSTEM_SOURCE_FIFO:
-		default:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		}
 
-		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return error;
-		// Input switch channel configurations must be combined in united config.
-		config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2]
-		    =
-			channel.target_cfg.input_switch_channel_cfg.hsync_data_reg[0];
-		config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2 +
-											   1] =
-							       channel.target_cfg.input_switch_channel_cfg.hsync_data_reg[1];
-		config.input_switch_cfg.vsync_data_reg |=
-		    (channel.target_cfg.input_switch_channel_cfg.vsync_data_reg & 0x7) <<
-		    (channel.source_cfg.csi_cfg.csi_port * 3);
-
-		// Other targets are just copied and marked as set.
-		config.target_isp[channel.source_cfg.csi_cfg.csi_port] =
-		    channel.target_cfg.target_isp_cfg;
-		config.target_sp[channel.source_cfg.csi_cfg.csi_port] =
-		    channel.target_cfg.target_sp_cfg;
-		config.target_strm2mem[channel.source_cfg.csi_cfg.csi_port] =
-		    channel.target_cfg.target_strm2mem_cfg;
-		config.target_isp_flags[channel.source_cfg.csi_cfg.csi_port] |=
-		    INPUT_SYSTEM_CFG_FLAG_SET;
-		config.target_sp_flags[channel.source_cfg.csi_cfg.csi_port] |=
-		    INPUT_SYSTEM_CFG_FLAG_SET;
-		config.target_strm2mem_flags[channel.source_cfg.csi_cfg.csi_port] |=
-		    INPUT_SYSTEM_CFG_FLAG_SET;
-
-		config.ch_flags[channel.ch_id] = INPUT_SYSTEM_CFG_FLAG_SET;
+	switch (channel.source_type) {
+	case INPUT_SYSTEM_SOURCE_SENSOR:
+		error = input_system_configure_channel_sensor(channel);
+		break;
+	case INPUT_SYSTEM_SOURCE_PRBS:
+	case INPUT_SYSTEM_SOURCE_FIFO:
+	default:
+		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
+
+	if (error != INPUT_SYSTEM_ERR_NO_ERROR)
+		return error;
+
+	// Input switch channel configurations must be combined in united config.
+	config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2] =
+	    channel.target_cfg.input_switch_channel_cfg.hsync_data_reg[0];
+	config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2 + 1] =
+	    channel.target_cfg.input_switch_channel_cfg.hsync_data_reg[1];
+	config.input_switch_cfg.vsync_data_reg |=
+	    (channel.target_cfg.input_switch_channel_cfg.vsync_data_reg & 0x7) <<
+	    (channel.source_cfg.csi_cfg.csi_port * 3);
+
+	// Other targets are just copied and marked as set.
+	config.target_isp[channel.source_cfg.csi_cfg.csi_port] =
+	    channel.target_cfg.target_isp_cfg;
+	config.target_sp[channel.source_cfg.csi_cfg.csi_port] =
+	    channel.target_cfg.target_sp_cfg;
+	config.target_strm2mem[channel.source_cfg.csi_cfg.csi_port] =
+	    channel.target_cfg.target_strm2mem_cfg;
+	config.target_isp_flags[channel.source_cfg.csi_cfg.csi_port] |=
+	    INPUT_SYSTEM_CFG_FLAG_SET;
+	config.target_sp_flags[channel.source_cfg.csi_cfg.csi_port] |=
+	    INPUT_SYSTEM_CFG_FLAG_SET;
+	config.target_strm2mem_flags[channel.source_cfg.csi_cfg.csi_port] |=
+	    INPUT_SYSTEM_CFG_FLAG_SET;
+
+	config.ch_flags[channel.ch_id] = INPUT_SYSTEM_CFG_FLAG_SET;
+
 	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
 
@@ -1171,12 +1171,11 @@ static input_system_err_t set_source_type(
 
 	if ((*flags) & INPUT_SYSTEM_CFG_FLAG_SET) {
 		// Check for consistency with already set value.
-		if ((*lhs) == (rhs)) {
+		if ((*lhs) == (rhs))
 			return INPUT_SYSTEM_ERR_NO_ERROR;
-		} else {
-			*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
-			return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
-		}
+
+		*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
+		return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
 	}
 	// Check the value (individually).
 	if (rhs >= N_INPUT_SYSTEM_SOURCE) {
@@ -1216,12 +1215,11 @@ static input_system_err_t set_csi_cfg(
 		    && lhs->acquisition_buffer.mem_reg_size == rhs->acquisition_buffer.mem_reg_size
 		    && lhs->acquisition_buffer.nof_mem_regs  == rhs->acquisition_buffer.nof_mem_regs
 		    && lhs->nof_xmem_buffers  == rhs->nof_xmem_buffers
-		) {
+		)
 			return INPUT_SYSTEM_ERR_NO_ERROR;
-		} else {
-			*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
-			return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
-		}
+
+		*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
+		return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
 	}
 	// Check the value (individually).
 	// no check for backend_ch
@@ -1273,12 +1271,11 @@ static input_system_err_t input_system_multiplexer_cfg(
 
 	if ((*flags) & INPUT_SYSTEM_CFG_FLAG_SET) {
 		// Check for consistency with already set value.
-		if ((*lhs) == (rhs)) {
+		if ((*lhs) == (rhs))
 			return INPUT_SYSTEM_ERR_NO_ERROR;
-		} else {
-			*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
-			return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
-		}
+
+		*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
+		return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
 	}
 	// Check the value (individually).
 	if (rhs >= N_INPUT_SYSTEM_MULTIPLEX) {
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..6ff77e053d5d 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -235,9 +235,8 @@ static int load_and_flush(ia_css_ptr virt, void *data, unsigned int bytes)
 		vptr = hmm_bo_vmap(bo, true);
 		if (!vptr)
 			return load_and_flush_by_kmap(virt, data, bytes);
-		else
-			vptr = vptr + (virt - bo->start);
 
+		vptr = vptr + (virt - bo->start);
 		memcpy(data, vptr, bytes);
 		clflush_cache_range(vptr, bytes);
 		hmm_bo_vunmap(bo);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
index 0089402bc12d..4b2b7667f075 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
@@ -29,11 +29,11 @@ static void ctc_gradient(
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "ctc_gradient() error, illegal division operation\n");
 		return;
-	} else {
-		dydx_int = dy / dx;
-		dydx_frc = ((dy - dydx_int * dx) << frc_bits) / dx;
 	}
 
+	dydx_int = dy / dx;
+	dydx_frc = ((dy - dydx_int * dx) << frc_bits) / dx;
+
 	assert(y0 >= 0 && y0 <= max_dydx);
 	assert(y1 >= 0 && y1 <= max_dydx);
 	assert(x0 < x1);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 00082276f1db..8e7c99b88c39 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7719,14 +7719,14 @@ ia_css_pipe_override_frame_format(struct ia_css_pipe *pipe,
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
-	} else {
-		err = ia_css_pipe_check_format(pipe, new_format);
-		if (!err) {
-			if (pin_index == 0)
-				pipe->output_info[0].format = new_format;
-			else
-				pipe->vf_output_info[0].format = new_format;
-		}
+	}
+
+	err = ia_css_pipe_check_format(pipe, new_format);
+	if (!err) {
+		if (pin_index == 0)
+			pipe->output_info[0].format = new_format;
+		else
+			pipe->vf_output_info[0].format = new_format;
 	}
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
 	return err;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index af12df2f9b09..965445609eaa 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -246,10 +246,10 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 		IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) mismatch!",
 			     file_header->version, release_version);
 		return -EINVAL;
-	} else {
-		IA_CSS_LOG("successfully load firmware version %s", release_version);
 	}
 
+	IA_CSS_LOG("Successfully loaded firmware version %s", release_version);
+
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
 	if (sh_css_num_binaries > NUM_OF_SPS) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 8420a22fd8f0..b48cb3227622 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -2334,10 +2334,10 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
 		IA_CSS_ERROR("%s:%d error: cannot allocate memory", __FILE__, __LINE__);
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
-	} else {
-		memset(params, 0, sizeof(struct ia_css_isp_parameters));
 	}
 
+	memset(params, 0, sizeof(struct ia_css_isp_parameters));
+
 	ddr_ptrs = &params->ddr_ptrs;
 	ddr_ptrs_size = &params->ddr_ptrs_size;
 
@@ -3195,31 +3195,31 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 				   isp_params_info.output_frame_ptr,
 				   queue_id, thread_id);
 			break;
-		} else {
-			/* TMP: check discrepancy between nr of enqueued
-			 * parameter sets and dequeued sets
-			 */
-			g_param_buffer_enqueue_count++;
-			assert(g_param_buffer_enqueue_count < g_param_buffer_dequeue_count + 50);
-			/*
-			 * Tell the SP which queues are not empty,
-			 * by sending the software event.
-			 */
-			if (!sh_css_sp_is_running()) {
-				/* SP is not running. The queues are not valid */
-				IA_CSS_LEAVE_ERR_PRIVATE(-EBUSY);
-				return -EBUSY;
-			}
-			ia_css_bufq_enqueue_psys_event(
-			    IA_CSS_PSYS_SW_EVENT_BUFFER_ENQUEUED,
-			    (uint8_t)thread_id,
-			    (uint8_t)queue_id,
-			    0);
-			IA_CSS_LOG("pfp: added config id %d for OF %d to q %d on thread %d",
-				   isp_params_info.isp_parameters_id,
-				   isp_params_info.output_frame_ptr,
-				   queue_id, thread_id);
 		}
+
+		/* TMP: check discrepancy between nr of enqueued
+		 * parameter sets and dequeued sets
+		 */
+		g_param_buffer_enqueue_count++;
+		assert(g_param_buffer_enqueue_count < g_param_buffer_dequeue_count + 50);
+		/*
+		 * Tell the SP which queues are not empty,
+		 * by sending the software event.
+		 */
+		if (!sh_css_sp_is_running()) {
+			/* SP is not running. The queues are not valid */
+			IA_CSS_LEAVE_ERR_PRIVATE(-EBUSY);
+			return -EBUSY;
+		}
+
+		ia_css_bufq_enqueue_psys_event(
+				IA_CSS_PSYS_SW_EVENT_BUFFER_ENQUEUED,
+				(uint8_t)thread_id, (uint8_t)queue_id, 0);
+		IA_CSS_LOG("pfp: added config id %d for OF %d to q %d on thread %d",
+			   isp_params_info.isp_parameters_id,
+			   isp_params_info.output_frame_ptr,
+			   queue_id, thread_id);
+
 		/* clean-up old copy */
 		ia_css_dequeue_param_buffers(/*pipe_num*/);
 		params->pipe_dvs_6axis_config_changed[pipeline->pipe_id] = false;
@@ -4105,44 +4105,44 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
 		uds->curr_dy = HRT_GDC_N;
 	}
 
-	if (info->enable.dvs_envelope) {
+	if (info->enable.dvs_envelope)
 		/* Zoom region is only supported by the UDS module on ISP
 		 * 2 and higher. It is not supported in video mode on ISP 1 */
 		return -EINVAL;
-	} else {
-		if (enable_zoom) {
-			/* A. Calculate dx/dy based on crop region using in_frame_info
-			* Scale the crop region if in_frame_info to the stage is not same as
-			* actual effective input of the pipeline
-			*/
-			if (in_frame_info->res.width != pipe_in_res.width ||
-			    in_frame_info->res.height != pipe_in_res.height) {
-				x0 = (x0 * in_frame_info->res.width) / (pipe_in_res.width);
-				y0 = (y0 * in_frame_info->res.height) / (pipe_in_res.height);
-				x1 = (x1 * in_frame_info->res.width) / (pipe_in_res.width);
-				y1 = (y1 * in_frame_info->res.height) / (pipe_in_res.height);
-			}
-			uds->curr_dx =
-			    ((x1 - x0 - filter_envelope) * HRT_GDC_N) / in_frame_info->res.width;
-			uds->curr_dy =
-			    ((y1 - y0 - filter_envelope) * HRT_GDC_N) / in_frame_info->res.height;
-
-			/* B. Calculate xc/yc based on crop region */
-			uds->xc = (uint16_t)x0 + (((x1) - (x0)) / 2);
-			uds->yc = (uint16_t)y0 + (((y1) - (y0)) / 2);
-		} else {
-			uds->xc = (uint16_t)in_frame_info->res.width / 2;
-			uds->yc = (uint16_t)in_frame_info->res.height / 2;
-		}
 
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "uds->curr_dx=%d, uds->xc=%d, uds->yc=%d\n",
-				    uds->curr_dx, uds->xc, uds->yc);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "x0=%d, y0=%d, x1=%d, y1=%d\n",
-				    x0, y0, x1, y1);
-		sp_out_crop_pos->x = (uint16_t)info->pipeline.left_cropping;
-		sp_out_crop_pos->y = (uint16_t)info->pipeline.top_cropping;
+	if (enable_zoom) {
+		/* A. Calculate dx/dy based on crop region using in_frame_info
+		* Scale the crop region if in_frame_info to the stage is not same as
+		* actual effective input of the pipeline
+		*/
+		if (in_frame_info->res.width != pipe_in_res.width ||
+		    in_frame_info->res.height != pipe_in_res.height) {
+			x0 = (x0 * in_frame_info->res.width) / (pipe_in_res.width);
+			y0 = (y0 * in_frame_info->res.height) / (pipe_in_res.height);
+			x1 = (x1 * in_frame_info->res.width) / (pipe_in_res.width);
+			y1 = (y1 * in_frame_info->res.height) / (pipe_in_res.height);
+		}
+		uds->curr_dx =
+		    ((x1 - x0 - filter_envelope) * HRT_GDC_N) / in_frame_info->res.width;
+		uds->curr_dy =
+		    ((y1 - y0 - filter_envelope) * HRT_GDC_N) / in_frame_info->res.height;
+
+		/* B. Calculate xc/yc based on crop region */
+		uds->xc = (uint16_t)x0 + (((x1) - (x0)) / 2);
+		uds->yc = (uint16_t)y0 + (((y1) - (y0)) / 2);
+	} else {
+		uds->xc = (uint16_t)in_frame_info->res.width / 2;
+		uds->yc = (uint16_t)in_frame_info->res.height / 2;
 	}
+
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
+			    "uds->curr_dx=%d, uds->xc=%d, uds->yc=%d\n",
+			    uds->curr_dx, uds->xc, uds->yc);
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "x0=%d, y0=%d, x1=%d, y1=%d\n",
+			    x0, y0, x1, y1);
+	sp_out_crop_pos->x = (uint16_t)info->pipeline.left_cropping;
+	sp_out_crop_pos->y = (uint16_t)info->pipeline.top_cropping;
+
 	IA_CSS_LEAVE_PRIVATE("void");
 	return err;
 }
-- 
2.43.0

