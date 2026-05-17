Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B223536B
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 14:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028506; cv=none; b=bjBuYqT7DicplFmOin7F446qWG4jjmd4hXp5SYQEUt0t/NK7nziJJUVzMedxDE/HdNezE+woGzAF4rU6Ph0ztT6Mrpho5NmV3IIrdCyT8QmCcyZWHnau+F9VrhrnFGocsXig74P3w1jsg2zhGIflFWcSEj+a+JSOvX67dSfIUNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028506; c=relaxed/simple;
	bh=FF9ZfazRE2/igLFALqrXMsLabkFJ7d22RgehowDupYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EdWame8t+vZiYDvgRiItcw5LKLSP/FN0FVQM4k4emXHHWVUoqf3zbuRZmRzij/TG0+h9nwiIXovcI2qM/6QIKmgRw3IX0NA9UHmrIeEb5/b+/pridAPhucu9j+dj/hwf0dRanaGAsx/L1zDOMYiwzAK1cvMt00vJim8eCrWgTdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZztQxwZ; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZztQxwZ"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69b94acd958so656595eaf.3
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 07:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028503; x=1779633303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5Tj8pIpwcuaWArASM+0sAuUc3qYDkIHm69X0MuttiY=;
        b=KZztQxwZw4Q4CR0PB8QREfWM+CrWaGfP6atg869Xn8glpdeCHOHCPnxnnCs6yrHpCA
         GXwRshntJqTaVJTVvMniDJb0YXTrFYjJ3Jv4DpfKNqpl24tDr7qHHf61/R3Lwd9cV3Db
         Konbefy4BVqgqkB2L0pcg0XODb6DbQh4OjtGb6qXyWO0eVr5OuZ9sCkQsE/muRl+OVoj
         csII9NbvfptjhVr+4TKBetR5M/dZctr+H3gd39MjRNfWLOgciTlWhsfQYGRN+vCyUWcM
         0P5daUOVleOuA/vdWOd0KTdVVGBK8mNjoaZf73yZ6es20n8vOtA/ZuYFT18z4R1moCyI
         JjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028503; x=1779633303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5Tj8pIpwcuaWArASM+0sAuUc3qYDkIHm69X0MuttiY=;
        b=jbJzrYV8iqQH0h5vDZIEM3GruEQDDkoeh3WrvrvZFta35P+35QsSThG/HWkjvePqvn
         x2jPJbHL72ivalrtdZOwGOFFMBPgasly4vE7+WfLR23yVqMlNhGZ9GnpBLGuRv8ej9Yd
         yZUblKHaJ1nNlI70PwkftLnxmr0b5WgycnJlNbWm6V1SsYfeslDxiTo7jfoNitSwgpmO
         3XwPLKu2B+5xctmkr5ClTZJ02aleI66bfrSZFoe1MIfRAWFCsn7ThbiBdfSAKTuDH4g9
         kWFg0DHsMuKrL+bm2vMTGSRHZoRQTVBQTVoqzORx9jcybwOvaBSx1KngJP3auDZ6MUgb
         gWIA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZCZMwhO7H8sAgC5tcPzNwAXjLGIHuc4slrEXjM1B6HMVwVeIu7DmFarABCOhLmLBuWYusT+YefERbHwGP@lists.linux.dev
X-Gm-Message-State: AOJu0YwKJUIrT3DMmq0UdP97OUp/tHXuMknc5cQI++HLZUlwDQGI9ejE
	lpg3Gy7OFnsXdPx6iq4u21TVTC8alvAihY0eT/bqD0/xfZNoaSwk8tqE
X-Gm-Gg: Acq92OGgYYpfSPhivvErZY0h38BL4RECsusFI62MQABf/Vu3hY7rQyWmPqzp8zJ2LYl
	0bj5iV2yXN/uJ3i9glc2AAIxGq5ME+ovP34ND5gyNfE8gBzqNETbZa/fXSgMNWvMSqsSBmAKxk0
	uCLUiWJnmWgPXTCpdFyhZFG19sE0oQHvc/mxWB18591QIHjHvU32FvZL2RPehlbTpOyfkB7mMTM
	V0gNlGEznSjnRRlR0vOBYrXXnOGhvwawCMPsIaRub3tWFs9bm7tHRxaC3Ocvxwg1lrDvSEKeHxh
	90yBjWsLfgTUzvMtGc8lh/tVpiqeqKliFb5zXBRJ8VfpBRsfE9uY2aFLAPwoGTbJCC/RPO8IwLr
	LLtUXSTPdYDYOgMpndLpzaOFRV+/i5gZdKD9WhYgQn1L088dvDZ82YOhf6ECgRZuOwVVn1s5epa
	SgNjAuejIPP41nPZoFu1Lqcz+SfBWVaNQLzeyQsryT
X-Received: by 2002:a05:6820:151f:b0:69c:502f:bcde with SMTP id 006d021491bc7-69c950fe8c7mr7870649eaf.49.1779028503353;
        Sun, 17 May 2026 07:35:03 -0700 (PDT)
Received: from MacMini.lan ([172.127.162.94])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d0465461bsm4114183eaf.7.2026.05.17.07.35.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 17 May 2026 07:35:02 -0700 (PDT)
From: shayderrr <darknessshayder@gmail.com>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Bajjuri <darknessshayder@gmail.com>
Subject: [PATCH] media: ipu7: fix boot config memory leak and replace polling loops
Date: Sun, 17 May 2026 09:34:56 -0500
Message-ID: <20260517143456.81109-1-darknessshayder@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pranav Bajjuri <darknessshayder@gmail.com>

Free boot_config DMA allocation if queue memory alloc fails in
ipu7_boot_init_boot_config(). Replace hand-rolled timeout loops in
ipu7_boot_start_fw() and ipu7_boot_stop_fw() with read_poll_timeout().
Fix variable declaration order in cell reset, start, and stop to follow
reverse Christmas tree convention.

Signed-off-by: Pranav Bajjuri <darknessshayder@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-boot.c | 88 +++++++++++---------------
 1 file changed, 36 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
index d7901ff78b38..f081c39604a7 100644
--- a/drivers/staging/media/ipu7/ipu7-boot.c
+++ b/drivers/staging/media/ipu7/ipu7-boot.c
@@ -22,8 +22,8 @@
 #include "ipu7-platform-regs.h"
 #include "ipu7-syscom.h"
 
-#define IPU_FW_START_STOP_TIMEOUT		2000
-#define IPU_BOOT_CELL_RESET_TIMEOUT		(2 * USEC_PER_SEC)
+#define IPU_FW_START_STOP_TIMEOUT	2000
+#define IPU_BOOT_CELL_RESET_TIMEOUT	(2 * USEC_PER_SEC)
 #define BOOT_STATE_IS_CRITICAL(s)	IA_GOFO_FW_BOOT_STATE_IS_CRITICAL(s)
 #define BOOT_STATE_IS_READY(s)		((s) == IA_GOFO_FW_BOOT_STATE_READY)
 #define BOOT_STATE_IS_INACTIVE(s)	((s) == IA_GOFO_FW_BOOT_STATE_INACTIVE)
@@ -39,17 +39,17 @@ struct ipu7_boot_context {
 static const struct ipu7_boot_context contexts[IPU_SUBSYS_NUM] = {
 	{
 		/* ISYS */
-		.dmem_address = IPU_ISYS_DMEM_OFFSET,
-		.status_ctrl_reg = BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS,
-		.fw_start_address_reg = BUTTRESS_REG_DRV_IS_UCX_START_ADDR,
-		.fw_code_base_reg = IS_UC_CTRL_BASE
+		.dmem_address		= IPU_ISYS_DMEM_OFFSET,
+		.status_ctrl_reg	= BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS,
+		.fw_start_address_reg	= BUTTRESS_REG_DRV_IS_UCX_START_ADDR,
+		.fw_code_base_reg	= IS_UC_CTRL_BASE
 	},
 	{
 		/* PSYS */
-		.dmem_address = IPU_PSYS_DMEM_OFFSET,
-		.status_ctrl_reg = BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS,
-		.fw_start_address_reg = BUTTRESS_REG_DRV_PS_UCX_START_ADDR,
-		.fw_code_base_reg = PS_UC_CTRL_BASE
+		.dmem_address		= IPU_PSYS_DMEM_OFFSET,
+		.status_ctrl_reg	= BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS,
+		.fw_start_address_reg	= BUTTRESS_REG_DRV_PS_UCX_START_ADDR,
+		.fw_code_base_reg	= PS_UC_CTRL_BASE
 	}
 };
 
@@ -85,9 +85,9 @@ static int ipu7_boot_cell_reset(const struct ipu7_bus_device *adev)
 {
 	const struct ipu7_boot_context *ctx = &contexts[adev->subsys];
 	const struct device *dev = &adev->auxdev.dev;
+	void __iomem *base = adev->isp->base;
 	u32 ucx_ctrl_status = ctx->status_ctrl_reg;
 	u32 timeout = IPU_BOOT_CELL_RESET_TIMEOUT;
-	void __iomem *base = adev->isp->base;
 	u32 val, val2;
 	int ret;
 
@@ -134,8 +134,8 @@ static int ipu7_boot_cell_reset(const struct ipu7_bus_device *adev)
 static void ipu7_boot_cell_start(const struct ipu7_bus_device *adev)
 {
 	const struct ipu7_boot_context *ctx = &contexts[adev->subsys];
-	void __iomem *base = adev->isp->base;
 	const struct device *dev = &adev->auxdev.dev;
+	void __iomem *base = adev->isp->base;
 	u32 val;
 
 	dev_dbg(dev, "starting cell...\n");
@@ -152,8 +152,8 @@ static void ipu7_boot_cell_start(const struct ipu7_bus_device *adev)
 static void ipu7_boot_cell_stop(const struct ipu7_bus_device *adev)
 {
 	const struct ipu7_boot_context *ctx = &contexts[adev->subsys];
-	void __iomem *base = adev->isp->base;
 	const struct device *dev = &adev->auxdev.dev;
+	void __iomem *base = adev->isp->base;
 	u32 val;
 
 	dev_dbg(dev, "stopping cell...\n");
@@ -187,16 +187,14 @@ static int ipu7_boot_cell_init(const struct ipu7_bus_device *adev)
 }
 
 static void init_boot_config(struct ia_gofo_boot_config *boot_config,
-			     u32 length, u8 major)
+			     u32 config_size, u8 major)
 {
-	/* syscom version, new syscom2 version */
-	boot_config->length = length;
+	boot_config->length = config_size;
 	boot_config->config_version.major = 1U;
 	boot_config->config_version.minor = 0U;
 	boot_config->config_version.subminor = 0U;
 	boot_config->config_version.patch = 0U;
 
-	/* msg version for task interface */
 	boot_config->client_version_support.num_versions = 1U;
 	boot_config->client_version_support.versions[0].major = major;
 	boot_config->client_version_support.versions[0].minor = 0U;
@@ -221,7 +219,7 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
 
 	dev_dbg(dev, "boot config queues_nr: %d freq: %u sys_conf: 0x%pad\n",
 		num_queues, uc_freq, &subsys_config);
-	/* Allocate boot config. */
+
 	adev->boot_config_size =
 		sizeof(*cfgs) * num_queues + sizeof(*boot_config);
 	adev->boot_config = ipu7_dma_alloc(adev, adev->boot_config_size,
@@ -257,12 +255,15 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
 		qconfigs[i].queue_size = queue_size;
 	}
 
-	/* Allocate queue memory */
 	syscom->queue_mem = ipu7_dma_alloc(adev, total_queue_size_aligned,
 					   &syscom->queue_mem_dma_addr,
 					   GFP_KERNEL, 0);
 	if (!syscom->queue_mem) {
 		dev_err(dev, "Failed to allocate queue memory.\n");
+		ipu7_dma_free(adev, adev->boot_config_size,
+			      adev->boot_config,
+			      adev->boot_config_dma_addr, 0);
+		adev->boot_config = NULL;
 		return -ENOMEM;
 	}
 	syscom->queue_mem_size = total_queue_size_aligned;
@@ -312,7 +313,6 @@ EXPORT_SYMBOL_NS_GPL(ipu7_boot_release_boot_config, "INTEL_IPU7");
 int ipu7_boot_start_fw(const struct ipu7_bus_device *adev)
 {
 	const struct device *dev = &adev->auxdev.dev;
-	u32 timeout = IPU_FW_START_STOP_TIMEOUT;
 	void __iomem *base = adev->isp->base;
 	u32 boot_state, last_boot_state;
 	u32 indices_addr, msg_ver, id;
@@ -323,37 +323,26 @@ int ipu7_boot_start_fw(const struct ipu7_bus_device *adev)
 		return ret;
 
 	dev_dbg(dev, "start booting fw...\n");
-	/* store "uninit" state to syscom/boot state reg */
 	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID,
 			    IA_GOFO_FW_BOOT_STATE_UNINIT);
-	/*
-	 * Set registers to zero
-	 * (not strictly required, but recommended for diagnostics)
-	 */
 	write_fw_boot_param(adev,
 			    IA_GOFO_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID, 0);
 	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_MESSAGING_VERSION_ID, 0);
-	/* store firmware configuration address */
 	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_CONFIG_ID,
 			    adev->boot_config_dma_addr);
 
-	/* Kick uC, then wait for boot complete */
 	ipu7_boot_cell_start(adev);
 
 	last_boot_state = IA_GOFO_FW_BOOT_STATE_UNINIT;
-	while (timeout--) {
-		boot_state = read_fw_boot_param(adev,
-						IA_GOFO_FW_BOOT_STATE_ID);
-		if (boot_state != last_boot_state) {
-			dev_dbg(dev, "boot state changed from 0x%x to 0x%x\n",
-				last_boot_state, boot_state);
-			last_boot_state = boot_state;
-		}
-		if (BOOT_STATE_IS_CRITICAL(boot_state) ||
-		    BOOT_STATE_IS_READY(boot_state))
-			break;
-		usleep_range(1000, 1200);
-	}
+	ret = read_poll_timeout(read_fw_boot_param, boot_state,
+				BOOT_STATE_IS_CRITICAL(boot_state) ||
+				BOOT_STATE_IS_READY(boot_state),
+				1000, IPU_FW_START_STOP_TIMEOUT * 1000ULL,
+				false, adev, IA_GOFO_FW_BOOT_STATE_ID);
+
+	if (boot_state != last_boot_state)
+		dev_dbg(dev, "boot state changed from 0x%x to 0x%x\n",
+			last_boot_state, boot_state);
 
 	if (BOOT_STATE_IS_CRITICAL(boot_state)) {
 		ipu7_dump_fw_error_log(adev);
@@ -365,13 +354,11 @@ int ipu7_boot_start_fw(const struct ipu7_bus_device *adev)
 	}
 	dev_dbg(dev, "fw boot done.\n");
 
-	/* Get FW syscom queue indices addr */
 	id = IA_GOFO_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID;
 	indices_addr = read_fw_boot_param(adev, id);
 	adev->syscom->queue_indices = base + indices_addr;
 	dev_dbg(dev, "fw queue indices offset is 0x%x\n", indices_addr);
 
-	/* Get message version. */
 	msg_ver = read_fw_boot_param(adev,
 				     IA_GOFO_FW_BOOT_MESSAGING_VERSION_ID);
 	dev_dbg(dev, "ipu message version is 0x%08x\n", msg_ver);
@@ -383,8 +370,8 @@ EXPORT_SYMBOL_NS_GPL(ipu7_boot_start_fw, "INTEL_IPU7");
 int ipu7_boot_stop_fw(const struct ipu7_bus_device *adev)
 {
 	const struct device *dev = &adev->auxdev.dev;
-	u32 timeout = IPU_FW_START_STOP_TIMEOUT;
 	u32 boot_state;
+	int ret;
 
 	boot_state = read_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID);
 	if (BOOT_STATE_IS_CRITICAL(boot_state) ||
@@ -394,18 +381,15 @@ int ipu7_boot_stop_fw(const struct ipu7_bus_device *adev)
 		return -EBUSY;
 	}
 
-	/* Issue shutdown to start shutdown process */
 	dev_dbg(dev, "stopping fw...\n");
 	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID,
 			    IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD);
-	while (timeout--) {
-		boot_state = read_fw_boot_param(adev,
-						IA_GOFO_FW_BOOT_STATE_ID);
-		if (BOOT_STATE_IS_CRITICAL(boot_state) ||
-		    BOOT_STATE_IS_INACTIVE(boot_state))
-			break;
-		usleep_range(1000, 1200);
-	}
+
+	ret = read_poll_timeout(read_fw_boot_param, boot_state,
+				BOOT_STATE_IS_CRITICAL(boot_state) ||
+				BOOT_STATE_IS_INACTIVE(boot_state),
+				1000, IPU_FW_START_STOP_TIMEOUT * 1000ULL,
+				false, adev, IA_GOFO_FW_BOOT_STATE_ID);
 
 	if (BOOT_STATE_IS_CRITICAL(boot_state)) {
 		ipu7_dump_fw_error_log(adev);
-- 
2.50.1 (Apple Git-155)

