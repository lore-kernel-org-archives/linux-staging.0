Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913293D9022
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009430; cv=none; b=P+maaoMjifg/w/5fY2J1ZUqHuD7m/Eaz40kejNDwDe/NLAP9fc4o6rt7nwxymQENGPnWjFZ608qWSdeNk+cE5VYtpZmWNPe3arPqWcTvVVHyQY2+CB5ibYY9ymnOx7O22dq7Sg7V2GFIncdxF732/rhwVcEVqf5DU9Y4oxtkVxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009430; c=relaxed/simple;
	bh=zpicqWCN2t/dKrU3MK5D4wJ2uW9yyBYvRa8ruTT4+5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RsJrNRb/Z3qHldNwiUeHf00tzKZprE9COC/6RQyKcCwdOBcVljqthmUNN8r4MwueA0ucYbmUTcT1WvxC5/p9bCr5ZsiHGdXmce6nmPh20MV1ElmDfuWc4pw8oZMHsJSse1XQhwtcX7mXbiynmiB1aROY91OKfHrXaxKRCjr7VHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcbcZ9u6; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcbcZ9u6"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c801912c903so1247618a12.0
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 12:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778009426; x=1778614226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tWudeNa5IYTsQ5xiSsffw9fXErap8LkuddMOvGBJcqs=;
        b=IcbcZ9u6D0Jo8OzDoQ38g96ppYQ9UIqMY1inM29sx+ezQJsVzKSQsvSfroXz2Hvb8U
         0FYqVnaC+UkH+m/9Wym+pVrmbOji3MboipNiRIbjdzMRdnZczu6YDgO0kU05BNMtcSvG
         pZJmkoQ1ez/ZlcHK8OGvkRHQsEaRskMnBdcL64y4Q3Vr26lU3612qymHFrZxZSJ+PONC
         0z2jyk2w7lwRyXfZS827g0y+TF9znnBvb6STdk5UiynbK6QUNmYnyWyhxD9Nl2zbnW1s
         zvcO9bKG96gmyViUhRx0Y0HSMBlnMWNR4KiNDyuK09RBJZgG0WQtWtqwT+VsnF7i01dy
         A/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778009426; x=1778614226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWudeNa5IYTsQ5xiSsffw9fXErap8LkuddMOvGBJcqs=;
        b=nw9LVfgcwGzH6zKghFCUK8DUtlaiaIjq2U+pGNw+IFcHpYOQcXguMpmeLULuJnK9mJ
         mnLEbKWSg95KJH78jbyY5WIz6msfJTnmKiatkgepT5AvB4+nMCp/wVCXDChHpceCNmYj
         SyWk3Ntm0fPMaaE+722NcGQ8rDY/PEhsAxEclcmyMq9SZXSpXHuUC0R7jAect3Uf0UAb
         A4h5t84cnaO8wCcYzp0fAZIYLCnIOa4LO2V7WNqpxHlrk8X04EETjCsF2ujCMx1PXrTo
         OLB3A7Wjn9V8o2KQ0goAE/a94Jl823sx57TtgQd4S0njSISBpdjDPKRNCsXSPS2PsHvT
         glAw==
X-Gm-Message-State: AOJu0YyttxAfGRrBm4bMiL01XwmjWbj2Xo/ZWEXqTOk3H12vJqRihF1c
	ljMVOKWEXIFk9pudqhGrKnizr25vilbguBf3ejqj8QWCqHVMJ6lnnfOb+9u85k1NCpQ=
X-Gm-Gg: AeBDieugc83pebQmMBd2aBx1U0e4zXhfOlkI5WHk0E7vw+ojHweTi+q83Y16taRDj4H
	JC5Gxp0q3XvOFwENoI6JO+8g2FhG5pvEHCxIGjFHiak/+OP5WTaOCf9WDwi89WUWtnsBoQBvVYh
	ScKLU7ayc0KdowaNaQKeRsnbgGJj/Jv8q5IvIH/MIuZCz90NOuAQGBixz8TOS5m3pRGdSB1/xM3
	f+W3p3F2/8QEEmUKznXhTPgKbzDnRLCQJKvBGpHDlL9DmIcxMdL3OJfAaXV30rHlVPodspXJk8v
	a24evjT6HViHnLWANWYngyO1ja/Y6th4W4hRM85rUFiPcov8jxbaKtDACXXRMGyUyyix69Lm9iF
	E4hkeEpR+3N8T3prQRIU2iwwpwx47o4kB5Q6AwdncQnHOG453qxEV5ebDnkhlZU0m/UF8HPG1iU
	40TixFHraDktCmeL52dUtGHCBTIq7qv3jvSVc6JhL8HRfoJGmu4cLy6Vo/+rnjIg==
X-Received: by 2002:a05:6a20:1591:b0:34f:14d6:15f5 with SMTP id adf61e73a8af0-3aa5a934e9cmr300658637.29.1778009426198;
        Tue, 05 May 2026 12:30:26 -0700 (PDT)
Received: from shirinkaul.localdomain ([122.167.182.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242ab4435sm34320a12.5.2026.05.05.12.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 12:30:25 -0700 (PDT)
From: Shirin Kaul <shirin.kaul11@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Cc: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Shirin Kaul <shirin.kaul11@gmail.com>
Subject: [PATCH] drivers: staging: atomisp: Fix open brace issue in function signatures across pci/hive_isp_css_common/host
Date: Tue,  5 May 2026 19:30:15 +0000
Message-ID: <20260505193015.49262-1-shirin.kaul11@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix function signature across pci/hive_isp_css_common/host
to comply with Linux coding standard and fix errors reported
by checkpatch.pl

Non-functionality impacting

Signed-off-by: Shirin Kaul <shirin.kaul11@gmail.com>
---
 .../hive_isp_css_common/host/fifo_monitor.c   |  46 ++-
 .../pci/hive_isp_css_common/host/gdc.c        |  20 +-
 .../pci/hive_isp_css_common/host/gp_device.c  |   5 +-
 .../host/input_formatter.c                    |  26 +-
 .../hive_isp_css_common/host/input_system.c   | 275 +++++++-----------
 .../pci/hive_isp_css_common/host/irq.c        |  47 +--
 .../pci/hive_isp_css_common/host/isp.c        |   4 +-
 .../pci/hive_isp_css_common/host/mmu.c        |  10 +-
 .../atomisp/pci/hive_isp_css_common/host/sp.c |   4 +-
 .../pci/hive_isp_css_common/host/timed_ctrl.c |  31 +-
 .../pci/hive_isp_css_common/host/vmem.c       |  76 ++---
 11 files changed, 200 insertions(+), 344 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
index f0de78815456..1c417efab8f2 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
@@ -31,20 +31,17 @@ STORAGE_CLASS_FIFO_MONITOR_DATA unsigned int FIFO_SWITCH_ADDR[N_FIFO_SWITCH] = {
 #include "fifo_monitor_private.h"
 #endif /* __INLINE_FIFO_MONITOR__ */
 
-static inline bool fifo_monitor_status_valid(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id);
+static inline bool fifo_monitor_status_valid(const fifo_monitor_ID_t ID,
+					     const unsigned int reg,
+					     const unsigned int port_id);
 
-static inline bool fifo_monitor_status_accept(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id);
+static inline bool fifo_monitor_status_accept(const fifo_monitor_ID_t ID,
+					      const unsigned int reg,
+					      const unsigned int port_id);
 
-void fifo_channel_get_state(
-    const fifo_monitor_ID_t		ID,
-    const fifo_channel_t		channel_id,
-    fifo_channel_state_t		*state)
+void fifo_channel_get_state(const fifo_monitor_ID_t ID,
+			    const fifo_channel_t channel_id,
+			    fifo_channel_state_t *state)
 {
 	assert(channel_id < N_FIFO_CHANNEL);
 	assert(state);
@@ -496,10 +493,8 @@ void fifo_channel_get_state(
 	return;
 }
 
-void fifo_switch_get_state(
-    const fifo_monitor_ID_t		ID,
-    const fifo_switch_t			switch_id,
-    fifo_switch_state_t			*state)
+void fifo_switch_get_state(const fifo_monitor_ID_t ID, const fifo_switch_t switch_id,
+			   fifo_switch_state_t	*state)
 {
 	hrt_data		data = (hrt_data)-1;
 
@@ -518,9 +513,8 @@ void fifo_switch_get_state(
 	return;
 }
 
-void fifo_monitor_get_state(
-    const fifo_monitor_ID_t		ID,
-    fifo_monitor_state_t		*state)
+void fifo_monitor_get_state(const fifo_monitor_ID_t ID,
+			    fifo_monitor_state_t *state)
 {
 	fifo_channel_t	ch_id;
 	fifo_switch_t	sw_id;
@@ -540,20 +534,18 @@ void fifo_monitor_get_state(
 	return;
 }
 
-static inline bool fifo_monitor_status_valid(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id)
+static inline bool fifo_monitor_status_valid(const fifo_monitor_ID_t ID,
+					     const unsigned int reg,
+					     const unsigned int port_id)
 {
 	hrt_data	data = fifo_monitor_reg_load(ID, reg);
 
 	return (data >> (((port_id * 2) + _hive_str_mon_valid_offset))) & 0x1;
 }
 
-static inline bool fifo_monitor_status_accept(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id)
+static inline bool fifo_monitor_status_accept(const fifo_monitor_ID_t ID,
+					      const unsigned int reg,
+					      const unsigned int port_id)
 {
 	hrt_data	data = fifo_monitor_reg_load(ID, reg);
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index 8bb78b4d7c67..7af4199f1fa5 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -14,10 +14,8 @@
 /*
  * Local function declarations
  */
-static inline void gdc_reg_store(
-    const gdc_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value);
+static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int reg,
+				 const hrt_data value);
 
 #ifndef __INLINE_GDC__
 #include "gdc_private.h"
@@ -26,9 +24,8 @@ static inline void gdc_reg_store(
 /*
  * Exported function implementations
  */
-void gdc_lut_store(
-    const gdc_ID_t		ID,
-    const int			data[4][HRT_GDC_N])
+void gdc_lut_store(const gdc_ID_t ID,
+		   const int data[4][HRT_GDC_N])
 {
 	unsigned int i, lut_offset = HRT_GDC_LUT_IDX;
 
@@ -85,8 +82,7 @@ void gdc_lut_convert_to_isp_format(const int in_lut[4][HRT_GDC_N],
 	}
 }
 
-int gdc_get_unity(
-    const gdc_ID_t		ID)
+int gdc_get_unity(const gdc_ID_t ID)
 {
 	assert(ID < N_GDC_ID);
 	(void)ID;
@@ -96,10 +92,8 @@ int gdc_get_unity(
 /*
  * Local function implementations
  */
-static inline void gdc_reg_store(
-    const gdc_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value)
+static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int reg,
+				 const hrt_data value)
 {
 	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
 	return;
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
index b934d20c88ea..f977b50860a4 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
@@ -11,9 +11,8 @@
 #include "gp_device_private.h"
 #endif /* __INLINE_GP_DEVICE__ */
 
-void gp_device_get_state(
-    const gp_device_ID_t		ID,
-    gp_device_state_t			*state)
+void gp_device_get_state(const gp_device_ID_t ID,
+			 gp_device_state_t *state)
 {
 	assert(ID < N_GP_DEVICE_ID);
 	assert(state);
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index 40b3f1e48c56..afcc1f68508d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -47,8 +47,7 @@ static const bool HIVE_IF_BIN_COPY[N_INPUT_FORMATTER_ID] = {
 	false, false, false, true
 };
 
-void input_formatter_rst(
-    const input_formatter_ID_t		ID)
+void input_formatter_rst(const input_formatter_ID_t ID)
 {
 	hrt_address	addr;
 	hrt_data	rst;
@@ -69,17 +68,15 @@ void input_formatter_rst(
 	return;
 }
 
-unsigned int input_formatter_get_alignment(
-    const input_formatter_ID_t		ID)
+unsigned int input_formatter_get_alignment(const input_formatter_ID_t ID)
 {
 	assert(ID < N_INPUT_FORMATTER_ID);
 
 	return input_formatter_alignment[ID];
 }
 
-void input_formatter_set_fifo_blocking_mode(
-    const input_formatter_ID_t		ID,
-    const bool						enable)
+void input_formatter_set_fifo_blocking_mode(const input_formatter_ID_t ID,
+					    const bool enable)
 {
 	assert(ID < N_INPUT_FORMATTER_ID);
 
@@ -91,9 +88,8 @@ void input_formatter_set_fifo_blocking_mode(
 	return;
 }
 
-void input_formatter_get_switch_state(
-    const input_formatter_ID_t		ID,
-    input_formatter_switch_state_t	*state)
+void input_formatter_get_switch_state(const input_formatter_ID_t ID,
+				      input_formatter_switch_state_t *state)
 {
 	assert(ID < N_INPUT_FORMATTER_ID);
 	assert(state);
@@ -125,9 +121,8 @@ void input_formatter_get_switch_state(
 	return;
 }
 
-void input_formatter_get_state(
-    const input_formatter_ID_t		ID,
-    input_formatter_state_t			*state)
+void input_formatter_get_state(const input_formatter_ID_t ID,
+			       input_formatter_state_t *state)
 {
 	assert(ID < N_INPUT_FORMATTER_ID);
 	assert(state);
@@ -206,9 +201,8 @@ void input_formatter_get_state(
 	return;
 }
 
-void input_formatter_bin_get_state(
-    const input_formatter_ID_t		ID,
-    input_formatter_bin_state_t		*state)
+void input_formatter_bin_get_state(const input_formatter_ID_t ID,
+				   input_formatter_bin_state_t *state)
 {
 	assert(ID < N_INPUT_FORMATTER_ID);
 	assert(state);
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 9f1199c4761c..2909a5fa7500 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -22,11 +22,9 @@
 
 static const isp2400_ib_buffer_t   IB_BUFFER_NULL = {0, 0, 0 };
 
-static input_system_err_t input_system_configure_channel(
-    const channel_cfg_t		channel);
+static input_system_err_t input_system_configure_channel(const channel_cfg_t channel);
 
-static input_system_err_t input_system_configure_channel_sensor(
-    const channel_cfg_t		channel);
+static input_system_err_t input_system_configure_channel_sensor(const channel_cfg_t channel);
 
 static input_system_err_t input_buffer_configuration(void);
 
@@ -35,57 +33,47 @@ static input_system_err_t configuration_to_registers(void);
 static void receiver_rst(const rx_ID_t ID);
 static void input_system_network_rst(const input_system_ID_t ID);
 
-static void capture_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const isp2400_ib_buffer_t *const cfg);
+static void capture_unit_configure(const input_system_ID_t ID,
+				   const sub_system_ID_t sub_id,
+				   const isp2400_ib_buffer_t *const cfg);
 
-static void acquisition_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const isp2400_ib_buffer_t *const cfg);
+static void acquisition_unit_configure(const input_system_ID_t ID,
+				       const sub_system_ID_t sub_id,
+				       const isp2400_ib_buffer_t *const cfg);
 
-static void ctrl_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const ctrl_unit_cfg_t *const cfg);
+static void ctrl_unit_configure(const input_system_ID_t ID,
+				const sub_system_ID_t sub_id,
+				const ctrl_unit_cfg_t *const cfg);
 
-static void input_system_network_configure(
-    const input_system_ID_t			ID,
-    const input_system_network_cfg_t *const cfg);
+static void input_system_network_configure(const input_system_ID_t ID,
+					   const input_system_network_cfg_t *const cfg);
 
 // MW: CSI is previously named as "rx" short for "receiver"
-static input_system_err_t set_csi_cfg(
-    csi_cfg_t *const lhs,
-    const csi_cfg_t *const rhs,
-    input_system_config_flags_t *const flags);
+static input_system_err_t set_csi_cfg(csi_cfg_t *const lhs,
+				      const csi_cfg_t *const rhs,
+				      input_system_config_flags_t *const flags);
 
-static input_system_err_t set_source_type(
-    input_system_source_t *const lhs,
-    const input_system_source_t				rhs,
-    input_system_config_flags_t *const flags);
+static input_system_err_t set_source_type(input_system_source_t *const lhs,
+					  const input_system_source_t rhs,
+					  input_system_config_flags_t *const flags);
 
-static input_system_err_t input_system_multiplexer_cfg(
-    input_system_multiplex_t *const lhs,
-    const input_system_multiplex_t			rhs,
-    input_system_config_flags_t *const flags);
+static input_system_err_t input_system_multiplexer_cfg(input_system_multiplex_t *const lhs,
+						       const input_system_multiplex_t rhs,
+						       input_system_config_flags_t *const flags);
 
-static void gp_device_rst(const gp_device_ID_t		ID);
+static void gp_device_rst(const gp_device_ID_t ID);
 
-static void input_selector_cfg_for_sensor(const gp_device_ID_t	ID);
+static void input_selector_cfg_for_sensor(const gp_device_ID_t ID);
 
-static void input_switch_rst(const gp_device_ID_t	ID);
+static void input_switch_rst(const gp_device_ID_t ID);
 
-static void input_switch_cfg(
-    const gp_device_ID_t				ID,
-    const input_switch_cfg_t *const cfg
+static void input_switch_cfg(const gp_device_ID_t ID,
+			     const input_switch_cfg_t *const cfg
 );
 
-void receiver_set_compression(
-    const rx_ID_t			ID,
-    const unsigned int		cfg_ID,
-    const mipi_compressor_t		comp,
-    const mipi_predictor_t		pred)
+void receiver_set_compression(const rx_ID_t ID, const unsigned int cfg_ID,
+			      const mipi_compressor_t comp,
+			      const mipi_predictor_t pred)
 {
 	const unsigned int		field_id = cfg_ID % N_MIPI_FORMAT_CUSTOM;
 	const unsigned int		ch_id = cfg_ID / N_MIPI_FORMAT_CUSTOM;
@@ -130,10 +118,8 @@ void receiver_set_compression(
 	receiver_reg_store(ID, addr, reg);
 }
 
-void receiver_port_enable(
-    const rx_ID_t			ID,
-    const enum mipi_port_id		port_ID,
-    const bool			cnd)
+void receiver_port_enable(const rx_ID_t ID, const enum mipi_port_id port_ID,
+			  const bool cnd)
 {
 	hrt_data	reg = receiver_port_reg_load(ID, port_ID,
 			  _HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX);
@@ -148,36 +134,30 @@ void receiver_port_enable(
 				_HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX, reg);
 }
 
-bool is_receiver_port_enabled(
-    const rx_ID_t			ID,
-    const enum mipi_port_id		port_ID)
+bool is_receiver_port_enabled(const rx_ID_t ID,
+			      const enum mipi_port_id port_ID)
 {
 	hrt_data	reg = receiver_port_reg_load(ID, port_ID,
 			  _HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX);
 	return ((reg & 0x01) != 0);
 }
 
-void receiver_irq_enable(
-    const rx_ID_t			ID,
-    const enum mipi_port_id		port_ID,
-    const rx_irq_info_t		irq_info)
+void receiver_irq_enable(const rx_ID_t ID, const enum mipi_port_id port_ID,
+			 const rx_irq_info_t	irq_info)
 {
 	receiver_port_reg_store(ID,
 				port_ID, _HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX, irq_info);
 }
 
-rx_irq_info_t receiver_get_irq_info(
-    const rx_ID_t			ID,
-    const enum mipi_port_id		port_ID)
+rx_irq_info_t receiver_get_irq_info(const rx_ID_t ID,
+				    const enum mipi_port_id port_ID)
 {
 	return receiver_port_reg_load(ID,
 				      port_ID, _HRT_CSS_RECEIVER_IRQ_STATUS_REG_IDX);
 }
 
-void receiver_irq_clear(
-    const rx_ID_t			ID,
-    const enum mipi_port_id		port_ID,
-    const rx_irq_info_t		irq_info)
+void receiver_irq_clear(const rx_ID_t ID, const enum mipi_port_id port_ID,
+			const rx_irq_info_t	irq_info)
 {
 	receiver_port_reg_store(ID,
 				port_ID, _HRT_CSS_RECEIVER_IRQ_STATUS_REG_IDX, irq_info);
@@ -186,8 +166,7 @@ void receiver_irq_clear(
 // MW: "2400" in the name is not good, but this is to avoid a naming conflict
 static input_system_cfg2400_t config;
 
-static void receiver_rst(
-    const rx_ID_t				ID)
+static void receiver_rst(const rx_ID_t ID)
 {
 	enum mipi_port_id		port_id;
 
@@ -202,7 +181,7 @@ static void receiver_rst(
 }
 
 //Single function to reset all the devices mapped via GP_DEVICE.
-static void gp_device_rst(const gp_device_ID_t		ID)
+static void gp_device_rst(const gp_device_ID_t ID)
 {
 	assert(ID < N_GP_DEVICE_ID);
 
@@ -283,9 +262,8 @@ static void input_switch_rst(const gp_device_ID_t ID)
 			    ZERO);
 }
 
-static void input_switch_cfg(
-    const gp_device_ID_t			ID,
-    const input_switch_cfg_t *const cfg)
+static void input_switch_cfg(const gp_device_ID_t ID,
+			     const input_switch_cfg_t *const cfg)
 {
 	int addr_offset;
 
@@ -405,8 +383,7 @@ input_system_err_t input_system_configuration_reset(void)
 
 // MW: Comments are good, but doxygen is required, place it at the declaration
 // Function that appends the channel to current configuration.
-static input_system_err_t input_system_configure_channel(
-    const channel_cfg_t		channel)
+static input_system_err_t input_system_configure_channel(const channel_cfg_t channel)
 {
 	input_system_err_t error = INPUT_SYSTEM_ERR_NO_ERROR;
 	// Check if channel is not already configured.
@@ -564,10 +541,9 @@ static input_system_err_t input_buffer_configuration(void)
 	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
 
-static void capture_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const isp2400_ib_buffer_t *const cfg)
+static void capture_unit_configure(const input_system_ID_t ID,
+				   const sub_system_ID_t sub_id,
+				   const isp2400_ib_buffer_t *const cfg)
 {
 	assert(ID < N_INPUT_SYSTEM_ID);
 	assert(/*(sub_id >= CAPTURE_UNIT0_ID) &&*/ (sub_id <=
@@ -588,10 +564,9 @@ static void capture_unit_configure(
 					  cfg->nof_mem_regs);
 }
 
-static void acquisition_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const isp2400_ib_buffer_t *const cfg)
+static void acquisition_unit_configure(const input_system_ID_t ID,
+				       const sub_system_ID_t sub_id,
+				       const isp2400_ib_buffer_t *const cfg)
 {
 	assert(ID < N_INPUT_SYSTEM_ID);
 	assert(sub_id == ACQUISITION_UNIT0_ID);
@@ -611,10 +586,9 @@ static void acquisition_unit_configure(
 					  cfg->mem_reg_size);
 }
 
-static void ctrl_unit_configure(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    const ctrl_unit_cfg_t *const cfg)
+static void ctrl_unit_configure(const input_system_ID_t ID,
+				const sub_system_ID_t sub_id,
+				const ctrl_unit_cfg_t *const cfg)
 {
 	assert(ID < N_INPUT_SYSTEM_ID);
 	assert(sub_id == CTRL_UNIT0_ID);
@@ -677,9 +651,8 @@ static void ctrl_unit_configure(
 					  0);
 }
 
-static void input_system_network_configure(
-    const input_system_ID_t				ID,
-    const input_system_network_cfg_t *const cfg)
+static void input_system_network_configure(const input_system_ID_t ID,
+					   const input_system_network_cfg_t *const cfg)
 {
 	u32 sub_id;
 
@@ -847,11 +820,9 @@ input_system_err_t input_system_configuration_commit(void)
 
 // FIFO
 
-input_system_err_t	input_system_csi_fifo_channel_cfg(
-    u32		ch_id,
-    input_system_csi_port_t	port,
-    backend_channel_cfg_t	backend_ch,
-    target_cfg2400_t	target
+input_system_err_t input_system_csi_fifo_channel_cfg(u32 ch_id, input_system_csi_port_t port,
+						     backend_channel_cfg_t backend_ch,
+						     target_cfg2400_t target
 )
 {
 	channel_cfg_t channel;
@@ -870,15 +841,12 @@ input_system_err_t	input_system_csi_fifo_channel_cfg(
 	return input_system_configure_channel(channel);
 }
 
-input_system_err_t	input_system_csi_fifo_channel_with_counting_cfg(
-    u32				ch_id,
-    u32				nof_frames,
-    input_system_csi_port_t			port,
-    backend_channel_cfg_t			backend_ch,
-    u32				csi_mem_reg_size,
-    u32				csi_nof_mem_regs,
-    target_cfg2400_t			target
-)
+input_system_err_t input_system_csi_fifo_channel_with_counting_cfg(u32 ch_id, u32 nof_frames,
+								   input_system_csi_port_t port,
+								   backend_channel_cfg_t backend_ch,
+								   u32 csi_mem_reg_size,
+								   u32 csi_nof_mem_regs,
+								   target_cfg2400_t target)
 {
 	channel_cfg_t channel;
 
@@ -901,16 +869,13 @@ input_system_err_t	input_system_csi_fifo_channel_with_counting_cfg(
 
 // SRAM
 
-input_system_err_t	input_system_csi_sram_channel_cfg(
-    u32				ch_id,
-    input_system_csi_port_t			port,
-    backend_channel_cfg_t			backend_ch,
-    u32				csi_mem_reg_size,
-    u32				csi_nof_mem_regs,
-    //	uint32_t				acq_mem_reg_size,
-    //	uint32_t				acq_nof_mem_regs,
-    target_cfg2400_t			target
-)
+input_system_err_t input_system_csi_sram_channel_cfg(u32 ch_id, input_system_csi_port_t port,
+						     backend_channel_cfg_t backend_ch,
+						     u32 csi_mem_reg_size,
+						     u32 csi_nof_mem_regs,
+						     // uint32_t acq_mem_reg_size,
+						     // uint32_t acq_nof_mem_regs,
+						     target_cfg2400_t target)
 {
 	channel_cfg_t channel;
 
@@ -933,17 +898,12 @@ input_system_err_t	input_system_csi_sram_channel_cfg(
 //XMEM
 
 // Collects all parameters and puts them in channel_cfg_t.
-input_system_err_t	input_system_csi_xmem_channel_cfg(
-    u32				ch_id,
-    input_system_csi_port_t			port,
-    backend_channel_cfg_t			backend_ch,
-    u32				csi_mem_reg_size,
-    u32				csi_nof_mem_regs,
-    u32				acq_mem_reg_size,
-    u32				acq_nof_mem_regs,
-    target_cfg2400_t			target,
-    uint32_t				nof_xmem_buffers
-)
+input_system_err_t input_system_csi_xmem_channel_cfg(u32 ch_id, input_system_csi_port_t port,
+						     backend_channel_cfg_t backend_ch,
+						     u32 csi_mem_reg_size, u32 csi_nof_mem_regs,
+						     u32 acq_mem_reg_size, u32 acq_nof_mem_regs,
+						     target_cfg2400_t target,
+						     uint32_t nof_xmem_buffers)
 {
 	channel_cfg_t channel;
 
@@ -965,14 +925,12 @@ input_system_err_t	input_system_csi_xmem_channel_cfg(
 	return input_system_configure_channel(channel);
 }
 
-input_system_err_t	input_system_csi_xmem_acquire_only_channel_cfg(
-    u32				ch_id,
-    u32				nof_frames,
-    input_system_csi_port_t			port,
-    backend_channel_cfg_t			backend_ch,
-    u32				acq_mem_reg_size,
-    u32				acq_nof_mem_regs,
-    target_cfg2400_t			target)
+input_system_err_t input_system_csi_xmem_acquire_only_channel_cfg(u32 ch_id, u32 nof_frames,
+								  input_system_csi_port_t port,
+								  backend_channel_cfg_t backend_ch,
+								  u32 acq_mem_reg_size,
+								  u32 acq_nof_mem_regs,
+								  target_cfg2400_t target)
 {
 	channel_cfg_t channel;
 
@@ -992,15 +950,13 @@ input_system_err_t	input_system_csi_xmem_acquire_only_channel_cfg(
 	return input_system_configure_channel(channel);
 }
 
-input_system_err_t	input_system_csi_xmem_capture_only_channel_cfg(
-    u32				ch_id,
-    u32				nof_frames,
-    input_system_csi_port_t			port,
-    u32				csi_mem_reg_size,
-    u32				csi_nof_mem_regs,
-    u32				acq_mem_reg_size,
-    u32				acq_nof_mem_regs,
-    target_cfg2400_t			target)
+input_system_err_t input_system_csi_xmem_capture_only_channel_cfg(u32 ch_id, u32 nof_frames,
+								  input_system_csi_port_t port,
+								  u32 csi_mem_reg_size,
+								  u32 csi_nof_mem_regs,
+								  u32 acq_mem_reg_size,
+								  u32 acq_nof_mem_regs,
+								  target_cfg2400_t target)
 {
 	channel_cfg_t channel;
 
@@ -1025,16 +981,13 @@ input_system_err_t	input_system_csi_xmem_capture_only_channel_cfg(
 
 // Non - CSI
 
-input_system_err_t	input_system_prbs_channel_cfg(
-    u32		ch_id,
-    u32		nof_frames,//not used yet
-    u32		seed,
-    u32		sync_gen_width,
-    u32		sync_gen_height,
-    u32		sync_gen_hblank_cycles,
-    u32		sync_gen_vblank_cycles,
-    target_cfg2400_t	target
-)
+input_system_err_t input_system_prbs_channel_cfg(u32 ch_id,
+						 u32 nof_frames,//not used yet
+						 u32 seed, u32 sync_gen_width,
+						 u32 sync_gen_height,
+						 u32 sync_gen_hblank_cycles,
+						 u32 sync_gen_vblank_cycles,
+						 target_cfg2400_t target)
 {
 	channel_cfg_t channel;
 
@@ -1055,11 +1008,9 @@ input_system_err_t	input_system_prbs_channel_cfg(
 }
 
 // MW: Don't use system specific names, (even in system specific files) "cfg2400" -> cfg
-input_system_err_t	input_system_gpfifo_channel_cfg(
-    u32		ch_id,
-    u32		nof_frames, //not used yet
-
-    target_cfg2400_t	target)
+input_system_err_t input_system_gpfifo_channel_cfg(u32 ch_id,
+						   u32 nof_frames, //not used yet
+						   target_cfg2400_t target)
 {
 	channel_cfg_t channel;
 
@@ -1079,8 +1030,7 @@ input_system_err_t	input_system_gpfifo_channel_cfg(
 ///////////////////////////////////////////////////////////////////////////
 
 // Fills the parameters to config.csi_value[port]
-static input_system_err_t input_system_configure_channel_sensor(
-    const channel_cfg_t channel)
+static input_system_err_t input_system_configure_channel_sensor(const channel_cfg_t channel)
 {
 	const u32 port = channel.source_cfg.csi_cfg.csi_port;
 	input_system_err_t status = INPUT_SYSTEM_ERR_NO_ERROR;
@@ -1159,10 +1109,9 @@ static input_system_err_t input_system_configure_channel_sensor(
 }
 
 // Test flags and set structure.
-static input_system_err_t set_source_type(
-    input_system_source_t *const lhs,
-    const input_system_source_t			rhs,
-    input_system_config_flags_t *const flags)
+static input_system_err_t set_source_type(input_system_source_t *const lhs,
+					  const input_system_source_t rhs,
+					  input_system_config_flags_t *const flags)
 {
 	// MW: Not enough asserts
 	assert(lhs);
@@ -1195,10 +1144,9 @@ static input_system_err_t set_source_type(
 }
 
 // Test flags and set structure.
-static input_system_err_t set_csi_cfg(
-    csi_cfg_t *const lhs,
-    const csi_cfg_t *const rhs,
-    input_system_config_flags_t *const flags)
+static input_system_err_t set_csi_cfg(csi_cfg_t *const lhs,
+				      const csi_cfg_t *const rhs,
+				      input_system_config_flags_t *const flags)
 {
 	u32 memory_required;
 	u32 acq_memory_required;
@@ -1262,10 +1210,9 @@ static input_system_err_t set_csi_cfg(
 }
 
 // Test flags and set structure.
-static input_system_err_t input_system_multiplexer_cfg(
-    input_system_multiplex_t *const lhs,
-    const input_system_multiplex_t		rhs,
-    input_system_config_flags_t *const flags)
+static input_system_err_t input_system_multiplexer_cfg(input_system_multiplex_t *const lhs,
+						       const input_system_multiplex_t rhs,
+						       input_system_config_flags_t *const flags)
 {
 	assert(lhs);
 	assert(flags);
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index b66560bca625..76a87c2ab071 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -12,11 +12,9 @@
 #endif
 #include "gp_device.h"	/* _REG_GP_IRQ_REQUEST_ADDR */
 
-static inline void irq_wait_for_write_complete(
-    const irq_ID_t		ID);
+static inline void irq_wait_for_write_complete(const irq_ID_t ID);
 
-static inline bool any_irq_channel_enabled(
-    const irq_ID_t				ID);
+static inline bool any_irq_channel_enabled(const irq_ID_t ID);
 
 static inline irq_ID_t virq_get_irq_id(const enum virq_id irq_ID,
 				       unsigned int *channel_ID);
@@ -47,8 +45,7 @@ static enum virq_id IRQ_NESTING_ID[N_IRQ_ID] = {
 	virq_isel
 };
 
-void irq_clear_all(
-    const irq_ID_t				ID)
+void irq_clear_all(const irq_ID_t ID)
 {
 	hrt_data	mask = 0xFFFFFFFF;
 
@@ -67,9 +64,7 @@ void irq_clear_all(
 /*
  * Do we want the user to be able to set the signalling method ?
  */
-void irq_enable_channel(
-    const irq_ID_t				ID,
-    const unsigned int			irq_id)
+void irq_enable_channel(const irq_ID_t ID, const unsigned int irq_id)
 {
 	unsigned int mask = irq_reg_load(ID,
 					 _HRT_IRQ_CONTROLLER_MASK_REG_IDX);
@@ -109,9 +104,7 @@ void irq_enable_channel(
 	return;
 }
 
-void irq_enable_pulse(
-    const irq_ID_t	ID,
-    bool			pulse)
+void irq_enable_pulse(const irq_ID_t ID, bool pulse)
 {
 	unsigned int edge_out = 0x0;
 
@@ -124,9 +117,7 @@ void irq_enable_pulse(
 	return;
 }
 
-void irq_disable_channel(
-    const irq_ID_t				ID,
-    const unsigned int			irq_id)
+void irq_disable_channel(const irq_ID_t ID, const unsigned int irq_id)
 {
 	unsigned int mask = irq_reg_load(ID,
 					 _HRT_IRQ_CONTROLLER_MASK_REG_IDX);
@@ -155,9 +146,7 @@ void irq_disable_channel(
 	return;
 }
 
-enum hrt_isp_css_irq_status irq_get_channel_id(
-    const irq_ID_t				ID,
-    unsigned int				*irq_id)
+enum hrt_isp_css_irq_status irq_get_channel_id(const irq_ID_t ID, unsigned int *irq_id)
 {
 	unsigned int irq_status = irq_reg_load(ID,
 					       _HRT_IRQ_CONTROLLER_STATUS_REG_IDX);
@@ -195,9 +184,7 @@ static const hrt_address IRQ_REQUEST_ADDR[N_IRQ_SW_CHANNEL_ID] = {
 	_REG_GP_IRQ_REQUEST1_ADDR
 };
 
-void irq_raise(
-    const irq_ID_t				ID,
-    const irq_sw_channel_id_t	irq_id)
+void irq_raise(const irq_ID_t ID, const irq_sw_channel_id_t irq_id)
 {
 	hrt_address		addr;
 
@@ -224,9 +211,7 @@ bool any_virq_signal(void)
 	return (irq_status != 0);
 }
 
-void cnd_virq_enable_channel(
-    const enum virq_id				irq_ID,
-    const bool					en)
+void cnd_virq_enable_channel(const enum virq_id irq_ID, const bool en)
 {
 	irq_ID_t		i;
 	unsigned int	channel_ID;
@@ -307,8 +292,7 @@ void virq_clear_info(struct virq_info *irq_info)
 	return;
 }
 
-enum hrt_isp_css_irq_status virq_get_channel_id(
-    enum virq_id					*irq_id)
+enum hrt_isp_css_irq_status virq_get_channel_id(enum virq_id *irq_id)
 {
 	unsigned int irq_status = irq_reg_load(IRQ0_ID,
 					       _HRT_IRQ_CONTROLLER_STATUS_REG_IDX);
@@ -377,8 +361,7 @@ enum hrt_isp_css_irq_status virq_get_channel_id(
 	return status;
 }
 
-static inline void irq_wait_for_write_complete(
-    const irq_ID_t		ID)
+static inline void irq_wait_for_write_complete(const irq_ID_t ID)
 {
 	assert(ID < N_IRQ_ID);
 	assert(IRQ_BASE[ID] != (hrt_address)-1);
@@ -386,8 +369,7 @@ static inline void irq_wait_for_write_complete(
 					_HRT_IRQ_CONTROLLER_ENABLE_REG_IDX * sizeof(hrt_data));
 }
 
-static inline bool any_irq_channel_enabled(
-    const irq_ID_t				ID)
+static inline bool any_irq_channel_enabled(const irq_ID_t ID)
 {
 	hrt_data	en_reg;
 
@@ -399,9 +381,8 @@ static inline bool any_irq_channel_enabled(
 	return (en_reg != 0);
 }
 
-static inline irq_ID_t virq_get_irq_id(
-    const enum virq_id		irq_ID,
-    unsigned int		*channel_ID)
+static inline irq_ID_t virq_get_irq_id(const enum virq_id irq_ID,
+				       unsigned int *channel_ID)
 {
 	irq_ID_t ID;
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
index 39cccbfa3fca..52e4e519b560 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
@@ -15,9 +15,7 @@
 
 #include "assert_support.h"
 
-void cnd_isp_irq_enable(
-    const isp_ID_t		ID,
-    const bool		cnd)
+void cnd_isp_irq_enable(const isp_ID_t ID, const bool cnd)
 {
 	if (cnd) {
 		isp_ctrl_setbit(ID, ISP_IRQ_READY_REG, ISP_IRQ_READY_BIT);
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
index 064e88a5e064..e2403d1c299f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
@@ -7,22 +7,18 @@
 /* The name "mmu.h is already taken" */
 #include "mmu_device.h"
 
-void mmu_set_page_table_base_index(
-    const mmu_ID_t		ID,
-    const hrt_data		base_index)
+void mmu_set_page_table_base_index(const mmu_ID_t ID, const hrt_data base_index)
 {
 	mmu_reg_store(ID, _HRT_MMU_PAGE_TABLE_BASE_ADDRESS_REG_IDX, base_index);
 	return;
 }
 
-hrt_data mmu_get_page_table_base_index(
-    const mmu_ID_t		ID)
+hrt_data mmu_get_page_table_base_index(const mmu_ID_t ID)
 {
 	return mmu_reg_load(ID, _HRT_MMU_PAGE_TABLE_BASE_ADDRESS_REG_IDX);
 }
 
-void mmu_invalidate_cache(
-    const mmu_ID_t		ID)
+void mmu_invalidate_cache(const mmu_ID_t ID)
 {
 	mmu_reg_store(ID, _HRT_MMU_INVALIDATE_TLB_REG_IDX, 1);
 	return;
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
index 0fb8a675439e..9fe8c94c222a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
@@ -12,9 +12,7 @@
 
 #include "assert_support.h"
 
-void cnd_sp_irq_enable(
-    const sp_ID_t		ID,
-    const bool		cnd)
+void cnd_sp_irq_enable(const sp_ID_t ID, const bool cnd)
 {
 	if (cnd) {
 		sp_ctrl_setbit(ID, SP_IRQ_READY_REG, SP_IRQ_READY_BIT);
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
index 948b0b0a0272..bfac66d46e71 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
@@ -12,13 +12,8 @@
 
 #include "assert_support.h"
 
-void timed_ctrl_snd_commnd(
-    const timed_ctrl_ID_t			ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    hrt_address				addr,
-    hrt_data				value)
+void timed_ctrl_snd_commnd(const timed_ctrl_ID_t ID, hrt_data mask, hrt_data condition,
+			   hrt_data counter, hrt_address addr, hrt_data value)
 {
 	OP___assert(ID == TIMED_CTRL0_ID);
 	OP___assert(TIMED_CTRL_BASE[ID] != (hrt_address)-1);
@@ -33,14 +28,9 @@ void timed_ctrl_snd_commnd(
 /* pqiao TODO: make sure the following commands get
 	correct BASE address both for csim and android */
 
-void timed_ctrl_snd_sp_commnd(
-    const timed_ctrl_ID_t			ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    const sp_ID_t				SP_ID,
-    hrt_address				offset,
-    hrt_data				value)
+void timed_ctrl_snd_sp_commnd(const timed_ctrl_ID_t ID, hrt_data mask,
+			      hrt_data condition, hrt_data counter, const sp_ID_t SP_ID,
+			      hrt_address offset, hrt_data value)
 {
 	OP___assert(SP_ID < N_SP_ID);
 	OP___assert(SP_DMEM_BASE[SP_ID] != (hrt_address)-1);
@@ -49,14 +39,9 @@ void timed_ctrl_snd_sp_commnd(
 			      SP_DMEM_BASE[SP_ID] + offset, value);
 }
 
-void timed_ctrl_snd_gpio_commnd(
-    const timed_ctrl_ID_t			ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    const gpio_ID_t				GPIO_ID,
-    hrt_address				offset,
-    hrt_data				value)
+void timed_ctrl_snd_gpio_commnd(const timed_ctrl_ID_t ID, hrt_data mask,
+				hrt_data condition, hrt_data counter, const gpio_ID_t GPIO_ID,
+				hrt_address offset, hrt_data value)
 {
 	OP___assert(GPIO_ID < N_GPIO_ID);
 	OP___assert(GPIO_BASE[GPIO_ID] != (hrt_address)-1);
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 722b684fbc37..4abe991750ec 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -38,12 +38,9 @@ inv_subword(hive_uedge w, unsigned int start, unsigned int end)
 #define move_word(target, target_bit, src) move_subword(target, target_bit, src, 0, uedge_bits)
 
 static void
-move_subword(
-    hive_uedge *target,
-    unsigned int target_bit,
-    hive_uedge src,
-    unsigned int src_start,
-    unsigned int src_end)
+move_subword(hive_uedge *target, unsigned int target_bit,
+	     hive_uedge src, unsigned int src_start,
+	     unsigned int src_end)
 {
 	unsigned int start_elem = target_bit / uedge_bits;
 	unsigned int start_bit  = target_bit % uedge_bits;
@@ -68,11 +65,8 @@ move_subword(
 }
 
 static void
-hive_sim_wide_unpack(
-    hive_wide vector,
-    hive_wide elem,
-    hive_uint elem_bits,
-    hive_uint index)
+hive_sim_wide_unpack(hive_wide vector, hive_wide elem,
+		     hive_uint elem_bits, hive_uint index)
 {
 	/* pointers into wide_type: */
 	unsigned int start_elem = (elem_bits * index) / uedge_bits;
@@ -102,11 +96,8 @@ hive_sim_wide_unpack(
 }
 
 static void
-hive_sim_wide_pack(
-    hive_wide vector,
-    hive_wide elem,
-    hive_uint elem_bits,
-    hive_uint index)
+hive_sim_wide_pack(hive_wide vector, hive_wide elem,
+		   hive_uint elem_bits, hive_uint index)
 {
 	/* pointers into wide_type: */
 	unsigned int start_elem = (elem_bits * index) / uedge_bits;
@@ -130,10 +121,8 @@ hive_sim_wide_pack(
 	}
 }
 
-static void load_vector(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from)
+static void load_vector(const isp_ID_t ID, t_vmem_elem *to,
+			const t_vmem_elem *from)
 {
 	unsigned int i;
 	hive_uedge *data;
@@ -156,10 +145,8 @@ static void load_vector(
 	udelay(1); /* Spend at least 1 cycles per vector */
 }
 
-static void store_vector(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from)
+static void store_vector(const isp_ID_t ID, t_vmem_elem *to,
+			 const t_vmem_elem *from)
 {
 	unsigned int i;
 	unsigned int size = sizeof(short) * ISP_NWAY;
@@ -181,11 +168,8 @@ static void store_vector(
 	udelay(1); /* Spend at least 1 cycles per vector */
 }
 
-void isp_vmem_load(
-    const isp_ID_t		ID,
-    const t_vmem_elem	*from,
-    t_vmem_elem		*to,
-    unsigned int elems) /* In t_vmem_elem */
+void isp_vmem_load(const isp_ID_t ID, const t_vmem_elem *from,
+		   t_vmem_elem *to, unsigned int elems) /* In t_vmem_elem */
 {
 	unsigned int c;
 	const t_vmem_elem *vp = from;
@@ -199,11 +183,8 @@ void isp_vmem_load(
 	}
 }
 
-void isp_vmem_store(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from,
-    unsigned int elems) /* In t_vmem_elem */
+void isp_vmem_store(const isp_ID_t ID, t_vmem_elem *to,
+		    const t_vmem_elem *from, unsigned int elems) /* In t_vmem_elem */
 {
 	unsigned int c;
 	t_vmem_elem *vp = to;
@@ -217,15 +198,10 @@ void isp_vmem_store(
 	}
 }
 
-void isp_vmem_2d_load(
-    const isp_ID_t		ID,
-    const t_vmem_elem	*from,
-    t_vmem_elem		*to,
-    unsigned int height,
-    unsigned int width,
-    unsigned int stride_to,  /* In t_vmem_elem */
-
-    unsigned stride_from /* In t_vmem_elem */)
+void isp_vmem_2d_load(const isp_ID_t ID, const t_vmem_elem *from,
+		      t_vmem_elem *to, unsigned int height,
+		      unsigned int width, unsigned int stride_to,  /* In t_vmem_elem */
+		      unsigned stride_from /* In t_vmem_elem */)
 {
 	unsigned int h;
 
@@ -246,15 +222,11 @@ void isp_vmem_2d_load(
 	}
 }
 
-void isp_vmem_2d_store(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from,
-    unsigned int height,
-    unsigned int width,
-    unsigned int stride_to,  /* In t_vmem_elem */
-
-    unsigned stride_from /* In t_vmem_elem */)
+void isp_vmem_2d_store(const isp_ID_t ID, t_vmem_elem *to,
+		       const t_vmem_elem *from, unsigned int height,
+		       unsigned int width,
+		       unsigned int stride_to,  /* In t_vmem_elem */
+		       unsigned stride_from /* In t_vmem_elem */)
 {
 	unsigned int h;
 
-- 
2.43.0

