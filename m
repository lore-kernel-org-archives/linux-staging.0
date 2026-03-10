Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441E430FC1A
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773175040; cv=none; b=hWk52kIgC6p3zMeg2Iga0qTEkNGSRHWD6ywoAEUp2PldKymGwOH99XlIGNDT9t/JOq335xTJTAYkn1oJodo9kdlUWdoxt+gJmHcJywD/iLePrJMe0dQNuewLDG6Pb3zCyCG0eb0/64TWZinDxU/S4bPer0OA2I1Ev0U26IeaeV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773175040; c=relaxed/simple;
	bh=JXEmlR18YaMudzeYoY2Czh3VkL9MtWNXIpFpG3pbEL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pJKoHvubvZXIDvlUWDUS9ABt+GgvHd8ZPvC1A621DMlQ6g05JnkIMVzRGSoW5ON/cHTGdAZZqUh2VwtOzOUsuaLKzosD79I+4+xLeIshx557kfk+pV9GX6BAhXyTjtd2x/AZgaLliqog7ZWqzE+cb/hhSTj8Utc6L8REwsXS7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQiR2z2F; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQiR2z2F"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a13f6bcbf4so5758522e87.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773175035; x=1773779835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bHeA3wgzdrXvBOJfH24mr65Pocl3f4thV8wzfUQwhY8=;
        b=IQiR2z2FhZvsMGMGJtIw+z3Loj8R5fLQmHVOFpb0tIPKRkxBxFhfqOvF0jg1TBCXT4
         MYpTknldR9fyEEmxPFjYbu6UFqPxHt7nxvewzSyePyi2nLudouJckpqutpd0KAu6fKVX
         rxXsOVuQNAXEPP1ilaVZadvLc3rhRrwHWlBKRoONdxGra8qH7wWxeq42jjx2rcQUveKY
         XZ8ZAWiS8yS6ZYub0dF11D3/kJp7bITrFrG38trSTUzcbLwpdmo2LfYMaNa4HO4vF7Jb
         45tBmD3qWSme2NO1GUtL8iwBXd3/TFp5f1GF5h4Ye+yCCq67aTc8I/N3yHVf3j5WpZ92
         ZPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773175035; x=1773779835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHeA3wgzdrXvBOJfH24mr65Pocl3f4thV8wzfUQwhY8=;
        b=gHvkUitCoLmOL7NmZlx8jB1qxYFPOjlt7Hl96EkFlvvL5EsoNrKyC7HIqbfpqcOYvf
         aVwIXqoFq/+p/46m5sJSsgdbsyOTrw98QP0LYKeIL2C/LXptRe/7eiJncjTS61flHmpd
         x1TNfvG1F2F23d5kR3yuf6YTxIN57X4KGh7r10ymdSp1G+CULPbsaE4X84kkvILSwsEJ
         6EeI5d91rXDyzA9hfnS8HOza2j46reDIS2PA0F0dlbjYJhGX9cSaVlTiF2HfYT8MgAvo
         W4W3v5dvmHSd3twLjn5QYKy2zWrw0ME0gT7kIJ2P3FCugQSenLMtKg8N87fTPXuzQ2Um
         T+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU02XAMkFxptU3iyvs3ggjNFeaoto4Dh77u/4QAes8QHerCT9kO7vgJGdQsdixWr+G+SoIq5gIgfEGN//fM@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx4+a3YhAdJP4d2NMYzBDTDwZqk4OCutBp7+rSchofwiNB5eQO
	3l5+BrzvahhQtTMeTd8qSd/PCJ090Po+/owKQRBlSJXSkOtMJddQPqUp
X-Gm-Gg: ATEYQzyvgQA68jIh6dAj+5FfQGxgLi3VF0s0ImeDId5o2JRWtQAePYn4AUTtENVQaf7
	iQCxu8cq7PrTcJeEu0bdzB0f0khHpU3W80hUVD25Z2TfcdOrlGyNEQnuyqcECvvjrKy88vc95r6
	pJWMWicuJ5RcC4q5TeWnnZ7FG85qC7uJ6/6hPSk+1fK5wYPoH1rGHLwAGn93HIwdIxMtpyDwYGq
	upVM3s75X2J9QRRmlXSZ4md0i3c3ajXdoHfrxeaaLaMfbfOhrJ827ukwtQdAipEh0WprVeM6SP7
	gGKAX/4v24kEN/ofkj7XznzVz4r5i554CY5RcNjnZwziFRcFvmDY4oUUkhyFqBT/F1eEMx6O+U+
	OOsE/CyXH8sXNFXVGngfcEATLbjA4eqbOzSvSY/ziygzT6NUT5Bsj+ZVCLytCSOFR4Ac4XHx/GI
	LFQWZqCYYctmOJ9kRkhBZcHEFnF46GB7RrgPPOZU1T15DLcx/6L/zvCZC1ew//VIKktt8/a6YF1
	w==
X-Received: by 2002:a05:6512:3e18:b0:5a1:381b:fae1 with SMTP id 2adb3069b0e04-5a13caadbccmr6998590e87.10.1773175035113;
        Tue, 10 Mar 2026 13:37:15 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162feasm25683e87.55.2026.03.10.13.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:37:13 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove unnecessary braces in single statement blocks
Date: Tue, 10 Mar 2026 21:36:46 +0100
Message-ID: <20260310203646.8869-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces around single statement blocks throughout
the atomisp driver to comply with kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../pci/camera/pipe/src/pipe_stagedesc.c      |  9 ++----
 .../atomisp/pci/camera/pipe/src/pipe_util.c   |  3 +-
 .../host/input_formatter.c                    |  3 +-
 .../hive_isp_css_common/host/input_system.c   | 14 ++++-----
 .../pci/hive_isp_css_common/host/irq.c        | 30 ++++++++-----------
 .../pci/hive_isp_css_common/host/mmu.c        |  3 +-
 .../pci/hive_isp_css_common/host/vmem.c       |  3 +-
 .../isp/kernels/anr/anr_2/ia_css_anr2.host.c  |  3 +-
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.c   |  6 ++--
 .../isp/kernels/ctc/ctc2/ia_css_ctc2.host.c   |  7 ++---
 .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 13 ++++----
 .../isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c |  3 +-
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |  6 ++--
 .../atomisp/pci/runtime/binary/src/binary.c   |  3 +-
 .../pci/runtime/debug/src/ia_css_debug.c      |  6 ++--
 .../pci/runtime/isys/src/virtual_isys.c       |  3 +-
 .../pci/runtime/pipeline/src/pipeline.c       |  3 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 12 +++-----
 18 files changed, 47 insertions(+), 83 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
index a9f736398f50..fa2f8ed5b053 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
@@ -32,9 +32,8 @@ void ia_css_pipe_get_generic_stage_desc(
 	stage_desc->max_input_width = 0;
 	stage_desc->mode = binary->info->sp.pipeline.mode;
 	stage_desc->in_frame = in_frame;
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		stage_desc->out_frame[i] = out_frame[i];
-	}
 	stage_desc->vf_frame = vf_frame;
 ERR:
 	IA_CSS_LEAVE_PRIVATE("");
@@ -59,9 +58,8 @@ void ia_css_pipe_get_firmwares_stage_desc(
 	stage_desc->max_input_width = 0;
 	stage_desc->mode = mode;
 	stage_desc->in_frame = in_frame;
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		stage_desc->out_frame[i] = out_frame[i];
-	}
 	stage_desc->vf_frame = vf_frame;
 }
 
@@ -82,8 +80,7 @@ void ia_css_pipe_get_sp_func_stage_desc(
 	stage_desc->mode = (unsigned int)-1;
 	stage_desc->in_frame = NULL;
 	stage_desc->out_frame[0] = out_frame;
-	for (i = 1; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+	for (i = 1; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		stage_desc->out_frame[i] = NULL;
-	}
 	stage_desc->vf_frame = NULL;
 }
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c
index c7c42b472cc7..6cb3ecbd7297 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c
@@ -26,9 +26,8 @@ void ia_css_pipe_util_create_output_frames(
 	unsigned int i;
 
 	assert(frames);
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		frames[i] = NULL;
-	}
 }
 
 void ia_css_pipe_util_set_output_frames(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index 40b3f1e48c56..c353461dcdf2 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -62,9 +62,8 @@ void input_formatter_rst(
 	 * WICH USES THE STREAM2MEMRY BLOCK.
 	 * MUST BE FIXED PROPERLY
 	 */
-	if (!HIVE_IF_BIN_COPY[ID]) {
+	if (!HIVE_IF_BIN_COPY[ID])
 		input_formatter_reg_store(ID, addr, rst);
-	}
 
 	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 9f1199c4761c..68b0ad27615d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -138,11 +138,10 @@ void receiver_port_enable(
 	hrt_data	reg = receiver_port_reg_load(ID, port_ID,
 			  _HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX);
 
-	if (cnd) {
+	if (cnd)
 		reg |= 0x01;
-	} else {
+	else
 		reg &= ~0x01;
-	}
 
 	receiver_port_reg_store(ID, port_ID,
 				_HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX, reg);
@@ -194,9 +193,8 @@ static void receiver_rst(
 	assert(ID < N_RX_ID);
 
 // Disable all ports.
-	for (port_id = MIPI_PORT0_ID; port_id < N_MIPI_PORT_ID; port_id++) {
+	for (port_id = MIPI_PORT0_ID; port_id < N_MIPI_PORT_ID; port_id++)
 		receiver_port_enable(ID, port_id, false);
-	}
 
 	// AM: Additional actions for stopping receiver?
 }
@@ -830,15 +828,13 @@ input_system_err_t input_system_configuration_commit(void)
 	// The last configuration step is to configure the input buffer.
 	input_system_err_t error = input_buffer_configuration();
 
-	if (error != INPUT_SYSTEM_ERR_NO_ERROR) {
+	if (error != INPUT_SYSTEM_ERR_NO_ERROR)
 		return error;
-	}
 
 	// Translate the whole configuration into registers.
 	error = configuration_to_registers();
-	if (error != INPUT_SYSTEM_ERR_NO_ERROR) {
+	if (error != INPUT_SYSTEM_ERR_NO_ERROR)
 		return error;
-	}
 
 	// Translate the whole configuration into ctrl commands etc.
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index b66560bca625..7cf0103ae207 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -55,9 +55,8 @@ void irq_clear_all(
 	assert(ID < N_IRQ_ID);
 	assert(IRQ_N_CHANNEL[ID] <= HRT_DATA_WIDTH);
 
-	if (IRQ_N_CHANNEL[ID] < HRT_DATA_WIDTH) {
+	if (IRQ_N_CHANNEL[ID] < HRT_DATA_WIDTH)
 		mask = ~((~(hrt_data)0) >> IRQ_N_CHANNEL[ID]);
-	}
 
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, mask);
@@ -115,9 +114,9 @@ void irq_enable_pulse(
 {
 	unsigned int edge_out = 0x0;
 
-	if (pulse) {
+	if (pulse)
 		edge_out = 0xffffffff;
-	}
+
 	/* output is given as edge, not pulse */
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_EDGE_NOT_PULSE_REG_IDX, edge_out);
@@ -259,9 +258,9 @@ void virq_clear_all(void)
 {
 	irq_ID_t	irq_id;
 
-	for (irq_id = (irq_ID_t)0; irq_id < N_IRQ_ID; irq_id++) {
+	for (irq_id = (irq_ID_t)0; irq_id < N_IRQ_ID; irq_id++)
 		irq_clear_all(irq_id);
-	}
+
 	return;
 }
 
@@ -301,9 +300,9 @@ void virq_clear_info(struct virq_info *irq_info)
 
 	assert(irq_info);
 
-	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++) {
+	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++)
 		irq_info->irq_status_reg[ID] = 0;
-	}
+
 	return;
 }
 
@@ -324,20 +323,17 @@ enum hrt_isp_css_irq_status virq_get_channel_id(
 			break;
 	}
 
-	if (idx == IRQ_N_CHANNEL[IRQ0_ID]) {
+	if (idx == IRQ_N_CHANNEL[IRQ0_ID]) 
 		return hrt_isp_css_irq_status_error;
-	}
 
 	/* Check whether there are more bits set on device 0 */
-	if (irq_status != (1U << idx)) {
+	if (irq_status != (1U << idx))
 		status = hrt_isp_css_irq_status_more_irqs;
-	}
 
 	/* Check whether we have an IRQ on one of the nested devices */
 	for (ID = N_IRQ_ID - 1 ; ID > (irq_ID_t)0; ID--) {
-		if (IRQ_NESTING_ID[ID] == (enum virq_id)idx) {
+		if (IRQ_NESTING_ID[ID] == (enum virq_id)idx)
 			break;
-		}
 	}
 
 	/* If we have a nested IRQ, load that state, discard the device 0 state */
@@ -350,9 +346,8 @@ enum hrt_isp_css_irq_status virq_get_channel_id(
 				break;
 		}
 
-		if (idx == IRQ_N_CHANNEL[ID]) {
+		if (idx == IRQ_N_CHANNEL[ID])
 			return hrt_isp_css_irq_status_error;
-		}
 
 		/* Alternatively check whether there are more bits set on this device */
 		if (irq_status != (1U << idx)) {
@@ -408,9 +403,8 @@ static inline irq_ID_t virq_get_irq_id(
 	assert(channel_ID);
 
 	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++) {
-		if (irq_ID < IRQ_N_ID_OFFSET[ID + 1]) {
+		if (irq_ID < IRQ_N_ID_OFFSET[ID + 1])
 			break;
-		}
 	}
 
 	*channel_ID = (unsigned int)irq_ID - IRQ_N_ID_OFFSET[ID];
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
index 064e88a5e064..70d118fe1e70 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
@@ -32,7 +32,6 @@ void mmu_invalidate_cache_all(void)
 {
 	mmu_ID_t	mmu_id;
 
-	for (mmu_id = (mmu_ID_t)0; mmu_id < N_MMU_ID; mmu_id++) {
+	for (mmu_id = (mmu_ID_t)0; mmu_id < N_MMU_ID; mmu_id++)
 		mmu_invalidate_cache(mmu_id);
-	}
 }
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 722b684fbc37..6b5cb9db759b 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -168,9 +168,8 @@ static void store_vector(
 	//load_vector (&v[1][0], &to[ISP_NWAY]); /* Fetch the next vector, since it will be overwritten. */
 	hive_uedge *data = (hive_uedge *)v;
 
-	for (i = 0; i < ISP_NWAY; i++) {
+	for (i = 0; i < ISP_NWAY; i++)
 		hive_sim_wide_pack(data, (hive_wide)&from[i], ISP_VEC_ELEMBITS, i);
-	}
 	assert(ISP_BAMEM_BASE[ID] != (hrt_address) - 1);
 #if !defined(HRT_MEMORY_ACCESS)
 	ia_css_device_store(ISP_BAMEM_BASE[ID] + (unsigned long)to, &v, size);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
index 09599884bdae..08af8a848fbf 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
@@ -22,9 +22,8 @@ ia_css_anr2_vmem_encode(
 	for (i = 0; i < ANR_PARAM_SIZE; i++) {
 		unsigned int j;
 
-		for (j = 0; j < ISP_VEC_NELEMS; j++) {
+		for (j = 0; j < ISP_VEC_NELEMS; j++)
 			to->data[i][j] = from->data[i * ISP_VEC_NELEMS + j];
-		}
 	}
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
index cd867937ee13..fcd7d7e2afe8 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
@@ -125,14 +125,12 @@ ia_css_bnlm_vmem_encode(
 	bnlm_lut_encode(&to->div_lut, div_lut_nearests, div_lut_slopes,
 			BNLM_DIV_LUT_SIZE);
 	memset(to->div_lut_intercepts, 0, sizeof(to->div_lut_intercepts));
-	for (i = 0; i < BNLM_DIV_LUT_SIZE; i++) {
+	for (i = 0; i < BNLM_DIV_LUT_SIZE; i++)
 		to->div_lut_intercepts[0][i] = div_lut_intercepts[i];
-	}
 
 	memset(to->power_of_2, 0, sizeof(to->power_of_2));
-	for (i = 0; i < (ISP_VEC_ELEMBITS - 1); i++) {
+	for (i = 0; i < (ISP_VEC_ELEMBITS - 1); i++)
 		to->power_of_2[0][i] = 1 << i;
-	}
 }
 
 /* - Encodes BNLM public parameters into DMEM parameters */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
index 38751b8e9e6a..177487b6b237 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
@@ -52,13 +52,12 @@ static int ctc2_slope(int y1, int y0, int x1, int x0)
 	/*the slope must lie within the range
 	  (-max_slope-1) >= (dydx) >= (max_slope)
 	*/
-	if (slope <= -max_slope - 1) {
+	if (slope <= -max_slope - 1)
 		dydx = -max_slope - 1;
-	} else if (slope >= max_slope) {
+	else if (slope >= max_slope)
 		dydx = max_slope;
-	} else {
+	else
 		dydx = slope;
-	}
 
 	return dydx;
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
index 8e4451fcc8e3..76d76ca4401a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
@@ -140,17 +140,14 @@ ia_css_eed1_8_vmem_encode(
 	assert(tcinv_x[0] == 0);
 	assert(fcinv_x[0] == 0);
 
-	for (j = 1; j < NUMBER_OF_CHGRINV_POINTS; j++) {
+	for (j = 1; j < NUMBER_OF_CHGRINV_POINTS; j++)
 		assert(chgrinv_x[j] > chgrinv_x[j - 1]);
-	}
 
-	for (j = 1; j < NUMBER_OF_TCINV_POINTS; j++) {
+	for (j = 1; j < NUMBER_OF_TCINV_POINTS; j++)
 		assert(tcinv_x[j] > tcinv_x[j - 1]);
-	}
 
-	for (j = 1; j < NUMBER_OF_FCINV_POINTS; j++) {
+	for (j = 1; j < NUMBER_OF_FCINV_POINTS; j++)
 		assert(fcinv_x[j] > fcinv_x[j - 1]);
-	}
 
 	/* The implementation of the calculating 1/x is based on the availability
 	 * of the OP_vec_shuffle16 operation.
@@ -260,9 +257,9 @@ ia_css_eed1_8_encode(
 	to->margin_neg_diff = (from->neg_margin1 - from->neg_margin0);
 
 	/* Encode DEWEnhance exp (e_dew_enh_asr) */
-	for (i = 0; i < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); i++) {
+	for (i = 0; i < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); i++)
 		min_exp = max(min_exp, from->dew_enhance_seg_exp[i]);
-	}
+
 	to->e_dew_enh_asr = 13 - clamp(min_exp, 0, 13);
 
 	to->dedgew_max = from->dedgew_max;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
index 13678138c48c..823a1b0c0991 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
@@ -240,9 +240,8 @@ ia_css_s3a_hmem_decode(
 	/* Calculate sum of histogram of R,
 	   which should not be less than count_for_3a */
 	sum_r = 0;
-	for (i = 0; i < HMEM_UNIT_SIZE; i++) {
+	for (i = 0; i < HMEM_UNIT_SIZE; i++)
 		sum_r += out_ptr[i].r;
-	}
 	if (sum_r < count_for_3a) {
 		/* histogram is invalid */
 		return;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index bd2def6c341a..0ca7ef5bb064 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -50,9 +50,8 @@ void ia_css_sdis_horicoef_vmem_encode(
 	assert(size % (IA_CSS_DVS_NUM_COEF_TYPES * ISP_VEC_NELEMS * sizeof(
 			   short)) == 0);
 
-	for (type = 0; type < IA_CSS_DVS_NUM_COEF_TYPES; type++) {
+	for (type = 0; type < IA_CSS_DVS_NUM_COEF_TYPES; type++)
 		fill_row(&private[type * stride], &public[type * width], width, padding);
-	}
 }
 
 void ia_css_sdis_vertcoef_vmem_encode(
@@ -77,9 +76,8 @@ void ia_css_sdis_vertcoef_vmem_encode(
 	assert(size % (IA_CSS_DVS_NUM_COEF_TYPES * ISP_VEC_NELEMS * sizeof(
 			   short)) == 0);
 
-	for (type = 0; type < IA_CSS_DVS_NUM_COEF_TYPES; type++) {
+	for (type = 0; type < IA_CSS_DVS_NUM_COEF_TYPES; type++)
 		fill_row(&private[type * stride], &public[type * height], height, padding);
-	}
 }
 
 void ia_css_sdis_horiproj_encode(
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..60ae7bf5512b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -670,9 +670,8 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 		err = ia_css_isp_param_allocate_isp_parameters(
 		    &binary->mem_params, &binary->css_params,
 		    &info->mem_initializers);
-		if (err) {
+		if (err)
 			return err;
-		}
 	}
 	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 	{
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index b411ca2f415e..58d99abe70aa 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1123,9 +1123,8 @@ ia_css_debug_pipe_graph_dump_prologue(void)
 
 void ia_css_debug_pipe_graph_dump_epilogue(void)
 {
-	if (strlen(ring_buffer) > 0) {
+	if (strlen(ring_buffer) > 0)
 		dtrace_dot(ring_buffer);
-	}
 
 	if (pg_inst.stream_format != N_ATOMISP_INPUT_FORMAT) {
 		/* An input stream format has been set so assume we have
@@ -1778,9 +1777,8 @@ static void debug_dump_one_trace(enum TRACE_CORE_ID proc_id)
 				* When tid value is 111b, the data will be interpreted differently:
 				* tid val is ignored, major field contains 2 bits (msb) for format type
 				*/
-				if (tid_val == FIELD_TID_SEL_FORMAT_PAT) {
+				if (tid_val == FIELD_TID_SEL_FORMAT_PAT)
 					dump_format = FIELD_FORMAT_UNPACK(trace_read_buf[j]);
-				}
 			}
 			switch (dump_format) {
 			case TRACE_DUMP_FORMAT_POINT:
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index e6c11d5f77b4..8e8433f5b07a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -295,9 +295,8 @@ static bool create_input_system_channel(
 	if (!rc)
 		return false;
 
-	if (!acquire_sid(me->stream2mmio_id, &me->stream2mmio_sid_id)) {
+	if (!acquire_sid(me->stream2mmio_id, &me->stream2mmio_sid_id))
 		return false;
-	}
 
 	if (!acquire_ib_buffer(
 		metadata ? cfg->metadata.bits_per_pixel :
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index 0470871f8fff..8d11466fda1b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -575,9 +575,8 @@ static int pipeline_stage_create(
 	binary = stage_desc->binary;
 	firmware = stage_desc->firmware;
 	vf_frame = stage_desc->vf_frame;
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		out_frame[i] = stage_desc->out_frame[i];
-	}
 
 	stage = kvzalloc_obj(*stage);
 	if (!stage) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11daf..8cbb5d598005 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1928,9 +1928,8 @@ sh_css_set_per_frame_isp_config_on_pipe(
 	params = stream->per_frame_isp_params_configs;
 
 	/* update new ISP params object with the new config */
-	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe)) {
+	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe))
 		err1 = -EINVAL;
-	}
 
 	err2 = sh_css_init_isp_params_from_config(stream->pipes[0], params, config, pipe);
 
@@ -2004,9 +2003,8 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 		 * user. */
 		/* we do not exit from this point immediately to allow internal
 		 * firmware feature testing. */
-		if (is_dp_10bpp) {
+		if (is_dp_10bpp)
 			err = -EINVAL;
-		}
 	} else {
 		err = -EINVAL;
 		goto exit;
@@ -3034,9 +3032,8 @@ process_kernel_parameters(unsigned int pipe_id,
 		ia_css_ob_configure(&params->stream_configs.ob,
 				    isp_pipe_version, raw_bit_depth);
 	}
-	if (params->config_changed[IA_CSS_S3A_ID]) {
+	if (params->config_changed[IA_CSS_S3A_ID])
 		ia_css_s3a_configure(raw_bit_depth);
-	}
 	/* Copy stage uds parameters to config, since they can differ per stage.
 	 */
 	params->crop_config.crop_pos = params->uds[stage->stage_num].crop_pos;
@@ -3899,9 +3896,8 @@ sh_css_invalidate_params(struct ia_css_stream *stream)
 	params->isp_params_changed = true;
 	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++) {
 		for (j = 0; j < SH_CSS_MAX_STAGES; j++) {
-			for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++) {
+			for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++)
 				params->isp_mem_params_changed[i][j][mem] = true;
-			}
 		}
 	}
 
-- 
2.43.0

