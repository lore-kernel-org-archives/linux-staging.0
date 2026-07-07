Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26F23290A6
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414321; cv=none; b=TJvmZlGrHzL44hzF+JJKTBL1jYMRyqfIiZETe54mot/i9I6ApZm0uz7J1tg81d+tK/4/WRKwxqNXBoylqeAjQF3uFVbwecoWUkxqwd0JfKrhSuJcbAz51M1UlcDB+hAe2/R644X/u5OcVK9m5P4RGeLNzIINAsLurwVgOpKPMq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414321; c=relaxed/simple;
	bh=/1cNyHQL+a4sx/vadC9yO9JuUgygzQmrEaFObrFMypI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m+59SBSDR/0ypFqhKlmVHDA6PibjJV8UpysRxMSLRObWfkyLXe5amlUyWWKn+Jxu4XMJ/NqPJMcqcXu+8tpIBUXWO0hQoGsFTnCWrCcAhOb8/mR9hlJtnnz75A+Mtyoetec9bdO6qLPocZ5JNtTk7a3buaLp7RzjRpMnNeCmsj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLmfAG2v; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLmfAG2v"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so6026435ad.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 01:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783414319; x=1784019119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKtRQ4BCiUq2Ije3weFti+eDiZbXblzC1xaJ6Yfm/f8=;
        b=RLmfAG2v/0yYtnWTduKkahxmQ+bnZWk7OEFOqkV//DimVtHn4YkAuSii4LbjZ97C4c
         NAwuM6/8xzRW6QI5S5Wi0dRnBoPQj4U8oLbqWVjt4OTWue2t7msIRJx7zRtN88yqfEGc
         tREbH3hN1WT+XcShY36dUAqizA3h95LKTB1e0kozIup0+7j6WcBZwdgM6nnesWm+zCeV
         RXXxH/2bCMJDUikwc9llNOQw3Ka0c8a3b/XvmDzO7/0MSrVo06d31nNvVzaKzm/uJSG7
         a62k9jShYCbyCWP9ulDE/ITTn0uVAyz0NyEqK5OksZMBmOOqcqTIGrsro4DbvLCONS+p
         OJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783414319; x=1784019119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKtRQ4BCiUq2Ije3weFti+eDiZbXblzC1xaJ6Yfm/f8=;
        b=OGryusXWaAG90v5ZLYx9TK0yaEys5Qf/wmStqESOB3jwdPUHS5pbtv8K7alUtAuVE5
         Q8E6Qx+bwVyNUcBunYVi4ODgoM7VyhPdFzCE2SQqvFxZD/lG0Bs2j248tnnMK7y5JRNC
         SlmXn0JxMs3Sb6KkXKPddpIhpZWXXLET3HYTtTQg5D91lazo31QBu2HbwIjMVuC/5Ct4
         mrXYUi+JKHuCOECRR124K2wxgA0KAg9KoqQqXfZtERS8Tp8EuOWmHdrFDtCEpHvHQLg0
         +su4FE8+3g4PryCe32mp4sMedjcpq0P2bnBCaaLNgFQewT4nCfl0g7e2L2YscM9DxTYz
         i+tQ==
X-Forwarded-Encrypted: i=1; AHgh+RocxwfI4kOkjoc07XECtcD+Syj+WSidokn6DgYp5BzMvRWUvvofNjJ24vyleu3R9p/38KG+IhTSQV0LBvuZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5C/9j2ABp1TxDMs4MOx2GcmUfUnswFsOvnjrPb9rQI+A8wxpY
	YUI2e7afiUuB7IVey4SZRRMRTA3klr9Kpl3miemm95zxQuR/PurVCiev
X-Gm-Gg: AfdE7ckdA6uWKItwucBhdcpq13OwmypneAml8wio0jffLJEQlQ1LovJ4FYnvmLdgIZN
	ajO6+oGMxxAOnoZEb6k9WFtl7q8aiIAApUVyTVbyzhxUe47pyOvC9d9rpCPxxAYc9q+MRp1l/wi
	K4uBxE3OCawTaS7+so6gck2U5XlSyVMs94vpfSdfogkJZPmap0J9yHG+0cztjz9IsDRiNTYueZc
	6A09C756m0zaWgU/M52KidhHrsxY32Bv3XErZfl4mN/VWfqXshe+YrMw81h11Tun13JcOupjJ6J
	tnKbcppQYDp/+3FGFPv9474hpg69FGS4snHyI+qi5Tlsmx4xtCmfhr97c7J/9whzbHM+uppdUqo
	XypfuMsnZyd/t7TxRsDF1otmwSvvSVSY5Upsc2CPZ+28TRQ5Hi+J3Uv/ILpiQY2Kq/EXrchHMux
	FXF50v4TNrsXHwZ382nJeZeE2W21tG4K0ECMnC9uCvOWy06nqeVWwVV0DPzy0XhP7iHQ3eKDzkw
	sHiOaZDLkaeblTmzeE=
X-Received: by 2002:a17:903:2990:b0:2c8:5de:a84e with SMTP id d9443c01a7336-2ccca8fb605mr17191785ad.10.1783414318810;
        Tue, 07 Jul 2026 01:51:58 -0700 (PDT)
Received: from dileep-HP-Pavilion-Laptop-15-eg2xxx.. ([2405:201:5c1b:705f:7de2:dc42:a243:cab0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb877sm7991605ad.14.2026.07.07.01.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:51:58 -0700 (PDT)
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
Subject: [PATCH v2] staging: media: atomisp: Drop unnecessary else block after return/break
Date: Tue,  7 Jul 2026 14:29:37 +0530
Message-ID: <20260707085937.17237-1-dileepsankhla.ds@gmail.com>
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
Changes in v2:
	- Reflow dev_err() call to two lines instead of three.
	- Reflow ia_css_bufq_enqueue_psys_event() call to align with
	  checkpatch's lines should not end with a '(' rule.
	- Fixed block comments' formattings.

 .../staging/media/atomisp/pci/atomisp_fops.c  |  22 +--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  29 ++--
 .../hive_isp_css_common/host/input_system.c   | 103 +++++++-------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |   3 +-
 .../kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c   |   6 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |  16 +--
 .../media/atomisp/pci/sh_css_firmware.c       |   4 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 126 +++++++++---------
 8 files changed, 154 insertions(+), 155 deletions(-)

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
index 812230397409..08f8029eac3c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -468,22 +468,21 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
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
+	dev_err(isp->dev, "%s: error in iunit interrupt. status reg=0x%x\n",
+		__func__, irq);
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
index 8420a22fd8f0..7c5eb20258ba 100644
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
 
@@ -3195,31 +3195,32 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
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
+		/*
+		 * TMP: check discrepancy between nr of enqueued
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
+		ia_css_bufq_enqueue_psys_event(IA_CSS_PSYS_SW_EVENT_BUFFER_ENQUEUED,
+					       (uint8_t)thread_id,
+					       (uint8_t)queue_id, 0);
+		IA_CSS_LOG("pfp: added config id %d for OF %d to q %d on thread %d",
+			   isp_params_info.isp_parameters_id,
+			   isp_params_info.output_frame_ptr,
+			   queue_id, thread_id);
+
 		/* clean-up old copy */
 		ia_css_dequeue_param_buffers(/*pipe_num*/);
 		params->pipe_dvs_6axis_config_changed[pipeline->pipe_id] = false;
@@ -4105,44 +4106,47 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
 		uds->curr_dy = HRT_GDC_N;
 	}
 
-	if (info->enable.dvs_envelope) {
-		/* Zoom region is only supported by the UDS module on ISP
-		 * 2 and higher. It is not supported in video mode on ISP 1 */
+	if (info->enable.dvs_envelope)
+		/*
+		 * Zoom region is only supported by the UDS module on ISP
+		 * 2 and higher. It is not supported in video mode on ISP 1
+		 */
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
+		/*
+		 * A. Calculate dx/dy based on crop region using in_frame_info
+		 * Scale the crop region if in_frame_info to the stage is not same as
+		 * actual effective input of the pipeline
+		 */
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

