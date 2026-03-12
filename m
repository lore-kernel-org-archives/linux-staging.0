Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C3C382373
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773308419; cv=none; b=I6ETMj45NJdhKBIjPt7uP5ZgltBIPDyjxxh64fZGKxnA8nq8PdxRKdsEYrhAdzUgpHD553BG8tKzG2ZzbakBSUuvgnWSMXGbOIPojv2GOWSyS2PwDc1cyfMv4CAWhxje7SQ0UOGdhR1wzq6qnzZUtKxPVKR2mhTOCYEtSZK/yKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773308419; c=relaxed/simple;
	bh=G8Tu4DpeyNNbeCys2w8HOtIwfeEJaJTXpZ0bS5VKuEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YggrU87F2RBme7rC4Rl5ht6gTfKLGRTkT6tXPP9g2hj4V4Zaq/pcOfZ9DakxFyDcWQEY/py9YvnIvXXTtUdwUgo7C9tRmhRJI3XDU+gotMHVLj7bv1fa+Jkw2FK0VdMF2j37jSUGcZcOL1i4amJapUV4ri/XIN7cHfLQonfjW7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+SqY75u; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+SqY75u"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439bc1a201fso57064f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773308416; x=1773913216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gycBx9rlR9co57gS962o5oUy6arW02hnHP4N2eAqgZw=;
        b=V+SqY75uOiWGQFsJHsuNQgekCwEC9G21Pks0KnF+t9DyGCj364UiT0vPHeEBJG9fxz
         CAPsz8VV+QqyXzA9jN5HiUoCUdHSVoVaR/7a/EDTRb928eex/CYIYzhevLBaT8j6KAw9
         FMqvyeQHUT9aAwQxm4u540WOL0VHNntxjiTSz7reWii62yGl2dwnyNsPuL8Gs1RuCMWh
         wfTuuO83CRpIAGsiTSBNSQaUT9NtZHgmoN/1QTgyaX6tt3kcW3XRCehSEi9yH0SErlHB
         8G4R6zNOzYAv6DW3mI2mMqNN6UeA9m4MqPGmWY7LCxrMObJp7sa7gZgjUo7dtuHPo5B8
         NRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773308416; x=1773913216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gycBx9rlR9co57gS962o5oUy6arW02hnHP4N2eAqgZw=;
        b=OsYa+WbGF8HmYjIlLLM7HvlaiZKpBlMQWxU9u2rKqVWW5f3JCDiYws0AHo9GpaFR05
         R1CUAbhjxlpuplJANEHldEH+RjpNcZfchOCK8wV1lHbEogrIxw2iGPEUJOujCxYrrHSd
         4Bxocx5MbTK+LRZuOY3OwGyluyygAx29gm1dCg3NNE4Hpvhvv4Nikqm2PAmlmQshKL2j
         3ADVYwUXP7xnScszQ/dHCpdMngwZznKL2BRa0OuxoEcSprIYU77OpRci4t649VTmFi7Z
         9JqRncV/HrmJNpjhjsQw26paqr2rfvlWbYZ0aEHrjPP8o1WzwZG2WsBV57y/UDNukHP+
         wLWA==
X-Gm-Message-State: AOJu0Yw0cwymSJ6e/NBsK7Z7bCahbQdNnSUpGrPGpq1cH+jPlCwGe9eQ
	sNbmhGC9bO9NhESlSVT6hYq/m1oIWNtmFCnfkIbehp4GDTopdh9y3O9D
X-Gm-Gg: ATEYQzyMjZuMNpzoC127Ljo6hvv5bcEZAHyt6JPDJ4ga19GTECbbpXx2VQDKnNbMzv6
	hJanrAy7lykl3lodTEj0wtUHzziyTzFMxUKyWL7Sv1u4WBtLHOTQSBmUrdmDItKGcS4qRBcAKO/
	60W5fxQAAmJ9MTFx4PscgdeoqoCNqnFhlyDFF1+5KBiN9qjFhrdxhuRje9QIa45T1tKdA+7jP3w
	PRZnoaVgn6BmKt7MYXyXb2sU3mIOOoAO8x0TxEo6BiVE5wpBhCoVn/AoiYrXSk+rnyC6eV12rTe
	nUd/AVg6I8ybxlOjh4jtkDsYvLPBXGCdwEVj4iQhBe0ItxPCVP7R+oTk5Oto3Jqe9axMarVL8ia
	2h9+40EKkkZOwaNcghcBs4Z0Jw1nun0S+4CefRlCn7w4CuI6Bi3onPQq8YDq5AjEFLzoNsynVqN
	QqZG2yVyb0NPReqHERUPD2ibGvd0844Q7wd8av5ZqoUU8BaOvGP+OkxeDX+3/LupK4JcWMj+cqE
	53YVQESxKCBIjnPFC/Yg0VTlI01AXOJnvNAjm2d7QDMF+t2+O2U
X-Received: by 2002:a05:6000:4026:b0:439:c3d1:a38d with SMTP id ffacd0b85a97d-439f8437310mr5829741f8f.5.1773308415450;
        Thu, 12 Mar 2026 02:40:15 -0700 (PDT)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a737csm6152580f8f.10.2026.03.12.02.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 02:40:14 -0700 (PDT)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: media: atomisp: input_system: Fix leading space indentation
Date: Thu, 12 Mar 2026 13:39:43 +0400
Message-ID: <20260312093942.85218-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace leading spaces used for indentation with tabs to comply with
the Linux kernel coding style.

This fixes checkpatch warnings:

  "WARNING: please, no spaces at the start of a line"

No functional change.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 .../hive_isp_css_common/host/input_system.c   | 240 +++++++++---------
 1 file changed, 120 insertions(+), 120 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 9f1199c4761c..3ffbba8982e5 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -23,10 +23,10 @@
 static const isp2400_ib_buffer_t   IB_BUFFER_NULL = {0, 0, 0 };
 
 static input_system_err_t input_system_configure_channel(
-    const channel_cfg_t		channel);
+	const channel_cfg_t		channel);
 
 static input_system_err_t input_system_configure_channel_sensor(
-    const channel_cfg_t		channel);
+	const channel_cfg_t		channel);
 
 static input_system_err_t input_buffer_configuration(void);
 
@@ -36,39 +36,39 @@ static void receiver_rst(const rx_ID_t ID);
 static void input_system_network_rst(const input_system_ID_t ID);
 
 static void capture_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const isp2400_ib_buffer_t *const cfg);
+	const input_system_ID_t			ID,
+	const sub_system_ID_t			sub_id,
+	const isp2400_ib_buffer_t *const cfg);
 
 static void acquisition_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const isp2400_ib_buffer_t *const cfg);
+	const input_system_ID_t			ID,
+	const sub_system_ID_t			sub_id,
+	const isp2400_ib_buffer_t *const cfg);
 
 static void ctrl_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const ctrl_unit_cfg_t *const cfg);
+	const input_system_ID_t			ID,
+	const sub_system_ID_t			sub_id,
+	const ctrl_unit_cfg_t *const cfg);
 
 static void input_system_network_configure(
-    const input_system_ID_t			ID,
-    const input_system_network_cfg_t *const cfg);
+	const input_system_ID_t			ID,
+	const input_system_network_cfg_t *const cfg);
 
 // MW: CSI is previously named as "rx" short for "receiver"
 static input_system_err_t set_csi_cfg(
-    csi_cfg_t *const lhs,
-    const csi_cfg_t *const rhs,
-    input_system_config_flags_t *const flags);
+	csi_cfg_t *const lhs,
+	const csi_cfg_t *const rhs,
+	input_system_config_flags_t *const flags);
 
 static input_system_err_t set_source_type(
-    input_system_source_t *const lhs,
-    const input_system_source_t				rhs,
-    input_system_config_flags_t *const flags);
+	input_system_source_t *const lhs,
+	const input_system_source_t				rhs,
+	input_system_config_flags_t *const flags);
 
 static input_system_err_t input_system_multiplexer_cfg(
-    input_system_multiplex_t *const lhs,
-    const input_system_multiplex_t			rhs,
-    input_system_config_flags_t *const flags);
+	input_system_multiplex_t *const lhs,
+	const input_system_multiplex_t			rhs,
+	input_system_config_flags_t *const flags);
 
 static void gp_device_rst(const gp_device_ID_t		ID);
 
@@ -77,15 +77,15 @@ static void input_selector_cfg_for_sensor(const gp_device_ID_t	ID);
 static void input_switch_rst(const gp_device_ID_t	ID);
 
 static void input_switch_cfg(
-    const gp_device_ID_t				ID,
-    const input_switch_cfg_t *const cfg
+	const gp_device_ID_t				ID,
+	const input_switch_cfg_t *const cfg
 );
 
 void receiver_set_compression(
-    const rx_ID_t			ID,
-    const unsigned int		cfg_ID,
-    const mipi_compressor_t		comp,
-    const mipi_predictor_t		pred)
+	const rx_ID_t			ID,
+	const unsigned int		cfg_ID,
+	const mipi_compressor_t		comp,
+	const mipi_predictor_t		pred)
 {
 	const unsigned int		field_id = cfg_ID % N_MIPI_FORMAT_CUSTOM;
 	const unsigned int		ch_id = cfg_ID / N_MIPI_FORMAT_CUSTOM;
@@ -131,9 +131,9 @@ void receiver_set_compression(
 }
 
 void receiver_port_enable(
-    const rx_ID_t			ID,
-    const enum mipi_port_id		port_ID,
-    const bool			cnd)
+	const rx_ID_t			ID,
+	const enum mipi_port_id		port_ID,
+	const bool			cnd)
 {
 	hrt_data	reg = receiver_port_reg_load(ID, port_ID,
 			  _HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX);
@@ -149,8 +149,8 @@ void receiver_port_enable(
 }
 
 bool is_receiver_port_enabled(
-    const rx_ID_t			ID,
-    const enum mipi_port_id		port_ID)
+	const rx_ID_t			ID,
+	const enum mipi_port_id		port_ID)
 {
 	hrt_data	reg = receiver_port_reg_load(ID, port_ID,
 			  _HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX);
@@ -158,26 +158,26 @@ bool is_receiver_port_enabled(
 }
 
 void receiver_irq_enable(
-    const rx_ID_t			ID,
-    const enum mipi_port_id		port_ID,
-    const rx_irq_info_t		irq_info)
+	const rx_ID_t			ID,
+	const enum mipi_port_id		port_ID,
+	const rx_irq_info_t		irq_info)
 {
 	receiver_port_reg_store(ID,
 				port_ID, _HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX, irq_info);
 }
 
 rx_irq_info_t receiver_get_irq_info(
-    const rx_ID_t			ID,
-    const enum mipi_port_id		port_ID)
+	const rx_ID_t			ID,
+	const enum mipi_port_id		port_ID)
 {
 	return receiver_port_reg_load(ID,
 				      port_ID, _HRT_CSS_RECEIVER_IRQ_STATUS_REG_IDX);
 }
 
 void receiver_irq_clear(
-    const rx_ID_t			ID,
-    const enum mipi_port_id		port_ID,
-    const rx_irq_info_t		irq_info)
+	const rx_ID_t			ID,
+	const enum mipi_port_id		port_ID,
+	const rx_irq_info_t		irq_info)
 {
 	receiver_port_reg_store(ID,
 				port_ID, _HRT_CSS_RECEIVER_IRQ_STATUS_REG_IDX, irq_info);
@@ -187,7 +187,7 @@ void receiver_irq_clear(
 static input_system_cfg2400_t config;
 
 static void receiver_rst(
-    const rx_ID_t				ID)
+	const rx_ID_t				ID)
 {
 	enum mipi_port_id		port_id;
 
@@ -284,8 +284,8 @@ static void input_switch_rst(const gp_device_ID_t ID)
 }
 
 static void input_switch_cfg(
-    const gp_device_ID_t			ID,
-    const input_switch_cfg_t *const cfg)
+	const gp_device_ID_t			ID,
+	const input_switch_cfg_t *const cfg)
 {
 	int addr_offset;
 
@@ -406,7 +406,7 @@ input_system_err_t input_system_configuration_reset(void)
 // MW: Comments are good, but doxygen is required, place it at the declaration
 // Function that appends the channel to current configuration.
 static input_system_err_t input_system_configure_channel(
-    const channel_cfg_t		channel)
+	const channel_cfg_t		channel)
 {
 	input_system_err_t error = INPUT_SYSTEM_ERR_NO_ERROR;
 	// Check if channel is not already configured.
@@ -565,9 +565,9 @@ static input_system_err_t input_buffer_configuration(void)
 }
 
 static void capture_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const isp2400_ib_buffer_t *const cfg)
+	const input_system_ID_t			ID,
+	const sub_system_ID_t			sub_id,
+	const isp2400_ib_buffer_t *const cfg)
 {
 	assert(ID < N_INPUT_SYSTEM_ID);
 	assert(/*(sub_id >= CAPTURE_UNIT0_ID) &&*/ (sub_id <=
@@ -589,9 +589,9 @@ static void capture_unit_configure(
 }
 
 static void acquisition_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const isp2400_ib_buffer_t *const cfg)
+	const input_system_ID_t			ID,
+	const sub_system_ID_t			sub_id,
+	const isp2400_ib_buffer_t *const cfg)
 {
 	assert(ID < N_INPUT_SYSTEM_ID);
 	assert(sub_id == ACQUISITION_UNIT0_ID);
@@ -612,9 +612,9 @@ static void acquisition_unit_configure(
 }
 
 static void ctrl_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const ctrl_unit_cfg_t *const cfg)
+	const input_system_ID_t			ID,
+	const sub_system_ID_t			sub_id,
+	const ctrl_unit_cfg_t *const cfg)
 {
 	assert(ID < N_INPUT_SYSTEM_ID);
 	assert(sub_id == CTRL_UNIT0_ID);
@@ -678,8 +678,8 @@ static void ctrl_unit_configure(
 }
 
 static void input_system_network_configure(
-    const input_system_ID_t				ID,
-    const input_system_network_cfg_t *const cfg)
+	const input_system_ID_t				ID,
+	const input_system_network_cfg_t *const cfg)
 {
 	u32 sub_id;
 
@@ -848,10 +848,10 @@ input_system_err_t input_system_configuration_commit(void)
 // FIFO
 
 input_system_err_t	input_system_csi_fifo_channel_cfg(
-    u32		ch_id,
-    input_system_csi_port_t	port,
-    backend_channel_cfg_t	backend_ch,
-    target_cfg2400_t	target
+	u32		ch_id,
+	input_system_csi_port_t	port,
+	backend_channel_cfg_t	backend_ch,
+	target_cfg2400_t	target
 )
 {
 	channel_cfg_t channel;
@@ -871,13 +871,13 @@ input_system_err_t	input_system_csi_fifo_channel_cfg(
 }
 
 input_system_err_t	input_system_csi_fifo_channel_with_counting_cfg(
-    u32				ch_id,
-    u32				nof_frames,
-    input_system_csi_port_t			port,
-    backend_channel_cfg_t			backend_ch,
-    u32				csi_mem_reg_size,
-    u32				csi_nof_mem_regs,
-    target_cfg2400_t			target
+	u32				ch_id,
+	u32				nof_frames,
+	input_system_csi_port_t			port,
+	backend_channel_cfg_t			backend_ch,
+	u32				csi_mem_reg_size,
+	u32				csi_nof_mem_regs,
+	target_cfg2400_t			target
 )
 {
 	channel_cfg_t channel;
@@ -902,14 +902,14 @@ input_system_err_t	input_system_csi_fifo_channel_with_counting_cfg(
 // SRAM
 
 input_system_err_t	input_system_csi_sram_channel_cfg(
-    u32				ch_id,
-    input_system_csi_port_t			port,
-    backend_channel_cfg_t			backend_ch,
-    u32				csi_mem_reg_size,
-    u32				csi_nof_mem_regs,
-    //	uint32_t				acq_mem_reg_size,
-    //	uint32_t				acq_nof_mem_regs,
-    target_cfg2400_t			target
+	u32				ch_id,
+	input_system_csi_port_t			port,
+	backend_channel_cfg_t			backend_ch,
+	u32				csi_mem_reg_size,
+	u32				csi_nof_mem_regs,
+	//	uint32_t				acq_mem_reg_size,
+	//	uint32_t				acq_nof_mem_regs,
+	target_cfg2400_t			target
 )
 {
 	channel_cfg_t channel;
@@ -934,15 +934,15 @@ input_system_err_t	input_system_csi_sram_channel_cfg(
 
 // Collects all parameters and puts them in channel_cfg_t.
 input_system_err_t	input_system_csi_xmem_channel_cfg(
-    u32				ch_id,
-    input_system_csi_port_t			port,
-    backend_channel_cfg_t			backend_ch,
-    u32				csi_mem_reg_size,
-    u32				csi_nof_mem_regs,
-    u32				acq_mem_reg_size,
-    u32				acq_nof_mem_regs,
-    target_cfg2400_t			target,
-    uint32_t				nof_xmem_buffers
+	u32				ch_id,
+	input_system_csi_port_t			port,
+	backend_channel_cfg_t			backend_ch,
+	u32				csi_mem_reg_size,
+	u32				csi_nof_mem_regs,
+	u32				acq_mem_reg_size,
+	u32				acq_nof_mem_regs,
+	target_cfg2400_t			target,
+	uint32_t				nof_xmem_buffers
 )
 {
 	channel_cfg_t channel;
@@ -966,13 +966,13 @@ input_system_err_t	input_system_csi_xmem_channel_cfg(
 }
 
 input_system_err_t	input_system_csi_xmem_acquire_only_channel_cfg(
-    u32				ch_id,
-    u32				nof_frames,
-    input_system_csi_port_t			port,
-    backend_channel_cfg_t			backend_ch,
-    u32				acq_mem_reg_size,
-    u32				acq_nof_mem_regs,
-    target_cfg2400_t			target)
+	u32				ch_id,
+	u32				nof_frames,
+	input_system_csi_port_t			port,
+	backend_channel_cfg_t			backend_ch,
+	u32				acq_mem_reg_size,
+	u32				acq_nof_mem_regs,
+	target_cfg2400_t			target)
 {
 	channel_cfg_t channel;
 
@@ -993,14 +993,14 @@ input_system_err_t	input_system_csi_xmem_acquire_only_channel_cfg(
 }
 
 input_system_err_t	input_system_csi_xmem_capture_only_channel_cfg(
-    u32				ch_id,
-    u32				nof_frames,
-    input_system_csi_port_t			port,
-    u32				csi_mem_reg_size,
-    u32				csi_nof_mem_regs,
-    u32				acq_mem_reg_size,
-    u32				acq_nof_mem_regs,
-    target_cfg2400_t			target)
+	u32				ch_id,
+	u32				nof_frames,
+	input_system_csi_port_t			port,
+	u32				csi_mem_reg_size,
+	u32				csi_nof_mem_regs,
+	u32				acq_mem_reg_size,
+	u32				acq_nof_mem_regs,
+	target_cfg2400_t			target)
 {
 	channel_cfg_t channel;
 
@@ -1026,14 +1026,14 @@ input_system_err_t	input_system_csi_xmem_capture_only_channel_cfg(
 // Non - CSI
 
 input_system_err_t	input_system_prbs_channel_cfg(
-    u32		ch_id,
-    u32		nof_frames,//not used yet
-    u32		seed,
-    u32		sync_gen_width,
-    u32		sync_gen_height,
-    u32		sync_gen_hblank_cycles,
-    u32		sync_gen_vblank_cycles,
-    target_cfg2400_t	target
+	u32		ch_id,
+	u32		nof_frames,//not used yet
+	u32		seed,
+	u32		sync_gen_width,
+	u32		sync_gen_height,
+	u32		sync_gen_hblank_cycles,
+	u32		sync_gen_vblank_cycles,
+	target_cfg2400_t	target
 )
 {
 	channel_cfg_t channel;
@@ -1056,10 +1056,10 @@ input_system_err_t	input_system_prbs_channel_cfg(
 
 // MW: Don't use system specific names, (even in system specific files) "cfg2400" -> cfg
 input_system_err_t	input_system_gpfifo_channel_cfg(
-    u32		ch_id,
-    u32		nof_frames, //not used yet
+	u32		ch_id,
+	u32		nof_frames, //not used yet
 
-    target_cfg2400_t	target)
+	target_cfg2400_t	target)
 {
 	channel_cfg_t channel;
 
@@ -1080,7 +1080,7 @@ input_system_err_t	input_system_gpfifo_channel_cfg(
 
 // Fills the parameters to config.csi_value[port]
 static input_system_err_t input_system_configure_channel_sensor(
-    const channel_cfg_t channel)
+	const channel_cfg_t channel)
 {
 	const u32 port = channel.source_cfg.csi_cfg.csi_port;
 	input_system_err_t status = INPUT_SYSTEM_ERR_NO_ERROR;
@@ -1160,9 +1160,9 @@ static input_system_err_t input_system_configure_channel_sensor(
 
 // Test flags and set structure.
 static input_system_err_t set_source_type(
-    input_system_source_t *const lhs,
-    const input_system_source_t			rhs,
-    input_system_config_flags_t *const flags)
+	input_system_source_t *const lhs,
+	const input_system_source_t			rhs,
+	input_system_config_flags_t *const flags)
 {
 	// MW: Not enough asserts
 	assert(lhs);
@@ -1196,9 +1196,9 @@ static input_system_err_t set_source_type(
 
 // Test flags and set structure.
 static input_system_err_t set_csi_cfg(
-    csi_cfg_t *const lhs,
-    const csi_cfg_t *const rhs,
-    input_system_config_flags_t *const flags)
+	csi_cfg_t *const lhs,
+	const csi_cfg_t *const rhs,
+	input_system_config_flags_t *const flags)
 {
 	u32 memory_required;
 	u32 acq_memory_required;
@@ -1263,9 +1263,9 @@ static input_system_err_t set_csi_cfg(
 
 // Test flags and set structure.
 static input_system_err_t input_system_multiplexer_cfg(
-    input_system_multiplex_t *const lhs,
-    const input_system_multiplex_t		rhs,
-    input_system_config_flags_t *const flags)
+	input_system_multiplex_t *const lhs,
+	const input_system_multiplex_t		rhs,
+	input_system_config_flags_t *const flags)
 {
 	assert(lhs);
 	assert(flags);
-- 
2.52.0

