Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C68A3D3D1A
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 18:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954219; cv=none; b=tdmD5bgh/I1u7NHR8QOLdzCgNkyvgfe+s4fZK1h+aBmvJb/Fx4+pvGxlf0yYK91cE0ohLd554Y1Qx/zXOsncMNLJ2UGdh7Zn79XGiz+H4ZUNy7k5SnUcxu6geOQ6PT7SRFGxSOUBuzYRx/AdUBBTIatvJvjTjJPL67YPPBK1q4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954219; c=relaxed/simple;
	bh=DFov8f1K1EbEd9BCm8EY+BJjRY5CMVbevtL+vTctO0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMk1B8KL8zfAfyQvXmDYf/rzw2gYYVj0rI1idnffclu1aIABRuh6Rh5pBhiNvpYdQXYMXxDqfhiW/ZWtkmhD/06trwKWZ2lmOESVJVKct4BcZGedYFb858c3HOgku9qr1Qwmr98eIWLzFAdBREgeOeXTs8Crz4y5CI96IMZSQQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1tvD3Vr; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1tvD3Vr"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39f1ac13687so9974911fa.0
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 11:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785954215; x=1786559015; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3mew32AtlJj3/s2JKE+RBW/bETbC6CThl0+JdvO3NM=;
        b=Z1tvD3VroAbN/0xkcq6fpEuFcfo329rIHW/mP2L9fgFGS2UGtCIjHcKKul9HWIR+UI
         miUcvWlCAydy2YPRsbc0HzbQD5oiFUrVbblklBsz+OGZGX/X4oj4lHJoNU+OVMAjueJo
         gNGy+jcFCl4l04fRAxJt5Wx7TAEXVL/N4Fw4XqIicnB3HwrkfM0JPZ0uMDkF5oZJ+4Wi
         pFI6WEASVasKdESKMNWVhPwS6P4AgPEaxv0XyK5AunY6Nl7dFb1ExBsmvThf7aRFjVd4
         fyzFKLM2XQ2HObrQ+Qgw06z7tvb79qRxfnnD/bzhQHRrYiOr5/mnD2VlZRvjOHumHLSG
         6U5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954215; x=1786559015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3mew32AtlJj3/s2JKE+RBW/bETbC6CThl0+JdvO3NM=;
        b=hOSPnauiHjyEu5k6rPFTDDtujQNTvYu3dzvnKBMjCdcrtepLxc7BUmYFnxQnh2C9Vt
         m+m1xNN3Z1+vRyV/EfmnlUCLW42WFJphhjVKjKTzz23Rwwh9Uv7OkUKThQSafrRVVTod
         /I/9AHuxagG9ZIkaFxfRdcX4cXgS8ftOzv3zeBOmP2rU8HlAiuNkVpfFvyotFiY+tnOy
         52fNYPSsrkVLY75Bk40Ne3FgsZO4+Muf9JrGobfsYhnMu2+mzRsZyxld+sHsVJBHnfyo
         JKS3vx7+MSyyeQM/NTHGv32Ln8C+eafMxY6SveiiXZQqLa9ZjoDeIE5BnARbogNZJ4/j
         oXpg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9AUlBLCZ2OfH6qevHbVTqW+8NQI6hbcOkBhL9iNIPe2CR2iTHKRbBGnZ/L14ccMlbAQNZKFphOIOo2DEW@lists.linux.dev
X-Gm-Message-State: AOJu0YxFyGHcJ48QnAQC6hlFDCP594pnzVn7pliYwiCFw1LymEmUcU32
	DaY6Oxd9GfadcuM4SEumd1MuVBtCp4QgY0MuwBCY55fB32qYe3TgWiKxbUPn0w==
X-Gm-Gg: AR+sD13G1IE6fuQgoOqbdGQr14Ka82J247vTqBscF5RfoIM9Zqu2wO1R42HtbTqHxLe
	nNuOfJklLSkwE90/WkRy/xLjWjEDnLr5cq28MMYprJ7pb5kzsG6RdGPMbYYbQ47GkJRRoTK8GQ4
	sVePlo9te5rfQqH8pDk6ufhqskymSOhDKWfZPONeXC3F42XVuLr/fBis5hIvXI94gvWRC2SiaPp
	Cgi5Zzy3wS+8BjbczAYnZxAiLQBgROlRUyte2DfO2ZSEIjKpjotEgET96fK37PdFlQKBQL3UP1z
	cOfPuqlZ+VEDC56lngMWdbqseYqvE3vuaCGlsTgxMS8zIfZSSAD9ipxci4WkaBaaqaWH8B1OljW
	l2T1s9vPGd8dat7IaRY5CBTf+pOP4ybZhP56t14hC52awXvjcJ6Uo6I9tSXmyBCspP1tLgXCTNj
	5p7t7RxLtSi6AZD8HoImgEnsObd7z/H2bEYK48CoBWzmOlTosDwR7BaUr8NME8JmOd0s4HMQ==
X-Received: by 2002:a05:651c:a385:10b0:39d:ba1e:aaf4 with SMTP id 38308e7fff4ca-39fbb295ff9mr8603911fa.24.1785954215019;
        Wed, 05 Aug 2026 11:23:35 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a32bb7sm11954811fa.29.2026.08.05.11.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:23:34 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Wed, 05 Aug 2026 21:23:06 +0300
Subject: [PATCH 2/4] staging: media: ipu7: remove unused abi/ macros
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ipu7_abi-v1-2-46d420cef267@gmail.com>
References: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
In-Reply-To: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785954209; l=14147;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=DFov8f1K1EbEd9BCm8EY+BJjRY5CMVbevtL+vTctO0g=;
 b=fCEz3uVaIAL6RvwFSCGGLTIJaFwJQDvtGgFhqwJ2I1ctoRgf7dyI9y9FpGRYnxSxMUBRRmlwX
 JcPXPa0g56RAw6eexQH/ZgWq9HQnl2siPq9wIxr7hhWYgatoCYBAqKM
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These macros are defined but never used, so remove them.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h  | 31 ------------
 .../staging/media/ipu7/abi/ipu7_fw_common_abi.h    | 28 ----------
 .../staging/media/ipu7/abi/ipu7_fw_config_abi.h    |  3 --
 drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h  | 29 -----------
 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h   | 59 ----------------------
 .../staging/media/ipu7/abi/ipu7_fw_syscom_abi.h    |  1 -
 6 files changed, 151 deletions(-)

diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
index 8d5c9b06d158..00c04ee8dd0b 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
@@ -9,19 +9,9 @@
 #include "ipu7_fw_common_abi.h"
 #include "ipu7_fw_syscom_abi.h"
 
-#define IA_GOFO_FWLOG_SEVERITY_CRIT			(0U)
-#define IA_GOFO_FWLOG_SEVERITY_ERROR			(1U)
-#define IA_GOFO_FWLOG_SEVERITY_WARNING			(2U)
-#define IA_GOFO_FWLOG_SEVERITY_INFO			(3U)
-#define IA_GOFO_FWLOG_SEVERITY_DEBUG			(4U)
-#define IA_GOFO_FWLOG_SEVERITY_VERBOSE			(5U)
 #define IA_GOFO_FWLOG_MAX_LOGGER_SOURCES		(64U)
 
-#define LOGGER_CONFIG_CHANNEL_ENABLE_HWPRINTF_BITMASK	BIT(0)
 #define LOGGER_CONFIG_CHANNEL_ENABLE_SYSCOM_BITMASK	BIT(1)
-#define LOGGER_CONFIG_CHANNEL_ENABLE_ALL_BITMASK \
-	(LOGGER_CONFIG_CHANNEL_ENABLE_HWPRINTF_BITMASK | \
-	 LOGGER_CONFIG_CHANNEL_ENABLE_SYSCOM_BITMASK)
 
 struct ia_gofo_logger_config {
 	u8 use_source_severity;
@@ -35,27 +25,7 @@ struct ia_gofo_logger_config {
 
 #pragma pack(push, 1)
 
-#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP \
-	((u32)IA_GOFO_FW_BOOT_ID_MAX)
-#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET (0U)
-#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PS_OFFSET \
-	((IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET) + \
-	(u32)(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP))
-#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PRIMARY_OFFSET (0U)
-#define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET (0x3000 / 4U)
-#define IA_GOFO_HKR_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET \
-	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 2U)
-#define IA_GOFO_HKR_HIF_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET \
-	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP)
-#define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX \
-	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4U)
-#define IA_GOFO_HKR_IPU_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX \
-	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4U)
-
 #define IA_GOFO_BOOT_RESERVED_SIZE (58U)
-#define IA_GOFO_BOOT_SECONDARY_RESERVED_SIZE (IA_GOFO_BOOT_RESERVED_SIZE)
-#define IA_GOFO_BOOT_SECONDARY_RESERVED_FIELDS \
-	(sizeof(ia_gofo_addr_t) + sizeof(ia_gofo_addr_t) + sizeof(u32))
 
 enum ia_gofo_buttress_reg_id {
 	IA_GOFO_FW_BOOT_CONFIG_ID = 0,
@@ -101,7 +71,6 @@ struct ia_gofo_boot_config {
 #define IA_GOFO_MEM_UNCORRECTABLE_CACHE_ERR	0xdead0805
 #define IA_GOFO_DOUBLE_EXCEPTION_ERR		0xdead0806
 #define IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR	0xdead1000
-#define IA_GOFO_BIST_DATA_INTEGRITY_FAILURE	0xdead1010
 
 enum ia_gofo_boot_state {
 	IA_GOFO_FW_BOOT_STATE_SECONDARY_BOOT_CONFIG_READY = 0x57a7b000,
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
index c50b355b04d8..dab4476f83ff 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
@@ -11,8 +11,6 @@
 #pragma pack(push, 1)
 typedef u32	ia_gofo_addr_t;
 
-#define IA_GOFO_ADDR_NULL	(0U)
-
 struct ia_gofo_version_s {
 	u8 patch;
 	u8 subminor;
@@ -20,10 +18,6 @@ struct ia_gofo_version_s {
 	u8 major;
 };
 
-#define IA_GOFO_MSG_VERSION_INIT(major_val, minor_val, subminor_val, patch_val)\
-	{.major = (major_val), .minor = (minor_val), .subminor = \
-	(subminor_val), .patch = (patch_val)}
-
 #define IA_GOFO_MSG_VERSION_LIST_MAX_ENTRIES	(3U)
 #define IA_GOFO_MSG_RESERVED_SIZE		(3U)
 
@@ -35,22 +29,11 @@ struct ia_gofo_msg_version_list {
 
 #pragma pack(pop)
 
-#define TLV_TYPE_PADDING		(0U)
-
 #pragma pack(push, 1)
-
-#define IA_GOFO_ABI_BITS_PER_BYTE	(8U)
-
-#define TLV_ITEM_ALIGNMENT	((u32)sizeof(u32))
-#define TLV_MSG_ALIGNMENT	((u32)sizeof(u64))
-#define TLV_LIST_ALIGNMENT	TLV_ITEM_ALIGNMENT
 #pragma pack(pop)
 
-#define IA_GOFO_MODULO(dividend, divisor) ((dividend) % (divisor))
-
 #define IA_GOFO_MSG_ERR_MAX_DETAILS		(4U)
 #define IA_GOFO_MSG_ERR_OK			(0U)
-#define IA_GOFO_MSG_ERR_UNSPECIFED		(0xffffffff)
 #define IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED	(0U)
 #define IA_GOFO_MSG_ERR_IS_OK(err)	(IA_GOFO_MSG_ERR_OK == (err).err_code)
 
@@ -63,9 +46,6 @@ struct ia_gofo_msg_err {
 
 #pragma pack(pop)
 
-#define IA_GOFO_MSG_ERR_GROUP_APP_EXT_START	(16U)
-#define IA_GOFO_MSG_ERR_GROUP_MAX		(31U)
-#define IA_GOFO_MSG_ERR_GROUP_INTERNAL_START	(IA_GOFO_MSG_ERR_GROUP_MAX + 1U)
 #define IA_GOFO_MSG_ERR_GROUP_RESERVED	IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED
 #define IA_GOFO_MSG_ERR_GROUP_GENERAL		1
 
@@ -104,16 +84,10 @@ enum ia_gofo_soc_pbk_instance_id {
 	IA_GOFO_SOC_PBK_ID_N
 };
 
-#define IA_GOFO_MSG_LINK_PBK_MAX_SLOTS	(2U)
-
 #pragma pack(pop)
 
 #pragma pack(push, 1)
 #define IA_GOFO_MSG_LOG_MAX_PARAMS	(4U)
-#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MIN	(0U)
-
-#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MAX	(4095U)
-#define IA_GOFO_MSG_LOG_FMT_ID_INVALID	(0xfffffff)
 
 struct ia_gofo_msg_log_info {
 	u16 log_counter;
@@ -131,8 +105,6 @@ struct ia_gofo_msg_log_info_ts {
 
 #pragma pack(pop)
 
-#define IA_GOFO_MSG_ABI_OUT_ACK_QUEUE_ID	(0U)
 #define IA_GOFO_MSG_ABI_OUT_LOG_QUEUE_ID	(1U)
-#define IA_GOFO_MSG_ABI_IN_DEV_QUEUE_ID		(2U)
 
 #endif
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
index c3f62aaedd86..cd6c6add0333 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
@@ -8,9 +8,6 @@
 
 #include <linux/types.h>
 
-#define IPU_CONFIG_ABI_WDT_TIMER_DISABLED	0U
-#define IPU_CONFIG_ABI_CMD_TIMER_DISABLED	0U
-
 struct ipu7_wdt_abi {
 	u32 wdt_timer1_us;
 	u32 wdt_timer2_us;
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
index 87bf2bd5576c..f1dbcfefaa10 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
@@ -19,19 +19,8 @@
 #define IPU_INSYS_OUTPUT_LOG_QUEUE	(IPU_INSYS_OUTPUT_FIRST_QUEUE + 1U)
 #define IPU_INSYS_OUTPUT_RESERVED_QUEUE	(IPU_INSYS_OUTPUT_LAST_QUEUE)
 #define IPU_INSYS_INPUT_FIRST_QUEUE	(IPU_INSYS_MAX_OUTPUT_QUEUES)
-#define IPU_INSYS_INPUT_LAST_QUEUE \
-	(IPU_INSYS_INPUT_FIRST_QUEUE + IPU_INSYS_MAX_INPUT_QUEUES - 1U)
 #define IPU_INSYS_INPUT_DEV_QUEUE	(IPU_INSYS_INPUT_FIRST_QUEUE)
 #define IPU_INSYS_INPUT_MSG_QUEUE	(IPU_INSYS_INPUT_FIRST_QUEUE + 1U)
-#define IPU_INSYS_INPUT_MSG_MAX_QUEUE	(IPU_INSYS_MAX_INPUT_QUEUES - 1U)
-
-#define MAX_OPINS_FOR_SINGLE_IPINS	(3U)
-#define DEV_SEND_QUEUE_SIZE		(IPU_INSYS_STREAM_ID_MAX)
-
-#define PIN_PLANES_MAX			(4U)
-
-#define INSYS_MSG_ERR_STREAM_INSUFFICIENT_RESOURCES_INPUT \
-	INSYS_MSG_ERR_STREAM_INSUFFICIENT_RESOURCES
 
 typedef u64 ipu7_insys_return_token;
 
@@ -129,7 +118,6 @@ enum ipu7_insys_frame_format_type {
 	N_IPU_INSYS_FRAME_FORMAT
 };
 
-#define IPU_INSYS_FRAME_FORMAT_RAW (IPU_INSYS_FRAME_FORMAT_RAW16)
 #define N_IPU_INSYS_MIPI_DATA_TYPE 0x40
 
 enum ipu7_insys_mipi_dt_rename_mode {
@@ -138,27 +126,10 @@ enum ipu7_insys_mipi_dt_rename_mode {
 	N_IPU_INSYS_MIPI_DT_MODE
 };
 
-#define IPU_INSYS_SEND_MSG_ENABLED				1U
-#define IPU_INSYS_SEND_MSG_DISABLED				0U
-
 #define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF			BIT(0)
-#define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_EOF			BIT(1)
 #define IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_SOF			BIT(2)
-#define IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_EOF			BIT(3)
 #define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF_DISCARDED	BIT(4)
-#define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_EOF_DISCARDED	BIT(5)
 #define IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_SOF_DISCARDED	BIT(6)
-#define IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_EOF_DISCARDED	BIT(7)
-#define IPU_INSYS_STREAM_SYNC_MSG_ENABLE_MSG_SEND_RESP ( \
-	IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF | \
-	IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_EOF | \
-	IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF_DISCARDED | \
-	IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_EOF_DISCARDED)
-#define IPU_INSYS_STREAM_SYNC_MSG_ENABLE_MSG_SEND_IRQ ( \
-	IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_SOF | \
-	IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_EOF | \
-	IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_SOF_DISCARDED | \
-	IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_EOF_DISCARDED)
 
 #define IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_OPEN_DONE		BIT(0)
 #define IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_OPEN_DONE		BIT(1)
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
index 1d0541b1ae9d..3f2c065dfe14 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
@@ -28,9 +28,6 @@ enum ipu7_msg_type {
 	IPU_MSG_TYPE_N,
 };
 
-#define IPU_MSG_MAX_NODE_TERMS		(64U)
-#define IPU_MSG_MAX_FRAGS		(7U)
-
 enum ipu7_msg_node_type {
 	IPU_MSG_NODE_TYPE_PAD = 0,
 	IPU_MSG_NODE_TYPE_BASE,
@@ -55,14 +52,6 @@ enum ipu7_msg_node_profile_type {
 	IPU_MSG_NODE_PROFILE_TYPE_N
 };
 
-#define IPU_MSG_NODE_MAX_PROFILES	(2U)
-#define IPU_MSG_NODE_DEF_PROFILE_IDX	(0U)
-#define IPU_MSG_NODE_RSRC_ID_EXT_IP	(0xff)
-
-#define IPU_MSG_NODE_DONT_CARE_TEB_HI	(0xffffffff)
-#define IPU_MSG_NODE_DONT_CARE_TEB_LO	(0xffffffff)
-#define IPU_MSG_NODE_RSRC_ID_IS		(0xfe)
-
 enum ipu7_msg_node_option_types {
 	IPU_MSG_NODE_OPTION_TYPES_PADDING = 0,
 	IPU_MSG_NODE_OPTION_TYPES_N
@@ -90,20 +79,9 @@ enum ipu7_msg_link_cmprs_option_bit_depth {
 	IPU_MSG_LINK_CMPRS_OPTION_12BPP = 2,
 };
 
-#define IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM		(128U)
-#define IPU_MSG_LINK_CMPRS_LOSSY_CFG_PAYLOAD_SIZE	(5U)
-#define IPU_MSG_LINK_CMPRS_SPACE_SAVING_NUM_MAX \
-	(IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM - 1U)
-
-#define IPU_MSG_LINK_CMPRS_MAX_PLANES		(2U)
-#define IPU_MSG_LINK_CMPRS_NO_ALIGN_INTERVAL	(0U)
-#define IPU_MSG_LINK_CMPRS_MIN_ALIGN_INTERVAL	(16U)
-#define IPU_MSG_LINK_CMPRS_MAX_ALIGN_INTERVAL	(1024U)
 #define IPU_MSG_LINK_FOREIGN_KEY_NONE		(65535U)
-#define IPU_MSG_LINK_FOREIGN_KEY_MAX		(64U)
 #define IPU_MSG_LINK_PBK_ID_DONT_CARE		(255U)
 #define IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE	(255U)
-#define IPU_MSG_LINK_TERM_ID_DONT_CARE		(0xff)
 
 #pragma pack(pop)
 
@@ -165,10 +143,6 @@ enum ipu7_msg_term_type {
 	IPU_MSG_TERM_TYPE_N,
 };
 
-#define IPU_MSG_TERM_EVENT_TYPE_NONE		0U
-#define IPU_MSG_TERM_EVENT_TYPE_PROGRESS	1U
-#define IPU_MSG_TERM_EVENT_TYPE_N	(IPU_MSG_TERM_EVENT_TYPE_PROGRESS + 1U)
-
 enum ipu7_msg_term_option_types {
 	IPU_MSG_TERM_OPTION_TYPES_PADDING = 0,
 	IPU_MSG_TERM_OPTION_TYPES_N
@@ -177,14 +151,6 @@ enum ipu7_msg_term_option_types {
 #pragma pack(pop)
 
 #pragma pack(push, 1)
-#define IPU_MSG_DEVICE_SEND_MSG_ENABLED		1U
-#define IPU_MSG_DEVICE_SEND_MSG_DISABLED	0U
-
-#define IPU_MSG_DEVICE_OPEN_SEND_RESP		BIT(0)
-#define IPU_MSG_DEVICE_OPEN_SEND_IRQ		BIT(1)
-
-#define IPU_MSG_DEVICE_CLOSE_SEND_RESP		BIT(0)
-#define IPU_MSG_DEVICE_CLOSE_SEND_IRQ		BIT(1)
 
 enum ipu7_msg_err_device {
 	IPU_MSG_ERR_DEVICE_OK = IA_GOFO_MSG_ERR_OK,
@@ -196,15 +162,6 @@ enum ipu7_msg_err_device {
 #pragma pack(pop)
 
 #pragma pack(push, 1)
-#define IPU_MSG_GRAPH_ID_UNKNOWN	(0xff)
-#define IPU_MSG_GRAPH_SEND_MSG_ENABLED	1U
-#define IPU_MSG_GRAPH_SEND_MSG_DISABLED	0U
-
-#define IPU_MSG_GRAPH_OPEN_SEND_RESP	BIT(0)
-#define IPU_MSG_GRAPH_OPEN_SEND_IRQ	BIT(1)
-
-#define IPU_MSG_GRAPH_CLOSE_SEND_RESP	BIT(0)
-#define IPU_MSG_GRAPH_CLOSE_SEND_IRQ	BIT(1)
 
 enum ipu7_msg_graph_ack_option_types {
 	IPU_MSG_GRAPH_ACK_OPTION_TYPES_PADDING = 0,
@@ -259,16 +216,12 @@ enum ipu7_msg_err_graph {
 
 #define FWPS_MSG_ABI_MAX_INPUT_QUEUES	(60U)
 #define FWPS_MSG_ABI_MAX_OUTPUT_QUEUES	(2U)
-#define FWPS_MSG_ABI_MAX_QUEUES \
-	(FWPS_MSG_ABI_MAX_OUTPUT_QUEUES + FWPS_MSG_ABI_MAX_INPUT_QUEUES)
 
-#define FWPS_MSG_ABI_OUT_ACK_QUEUE_ID	(IA_GOFO_MSG_ABI_OUT_ACK_QUEUE_ID)
 #define FWPS_MSG_ABI_OUT_LOG_QUEUE_ID	(IA_GOFO_MSG_ABI_OUT_LOG_QUEUE_ID)
 #if (FWPS_MSG_ABI_OUT_LOG_QUEUE_ID >= FWPS_MSG_ABI_MAX_OUTPUT_QUEUES)
 #error "Maximum output queues configuration is too small to fit ACK and LOG \
 queues"
 #endif
-#define FWPS_MSG_ABI_IN_DEV_QUEUE_ID	(IA_GOFO_MSG_ABI_IN_DEV_QUEUE_ID)
 #define FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID	(3U)
 #define FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID \
 	(FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID + 1U)
@@ -278,16 +231,4 @@ queues"
 useful queues"
 #endif
 
-#define FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID	(FWPS_MSG_ABI_MAX_QUEUES - 1U)
-#define FWPS_MSG_ABI_IN_MAX_TASK_QUEUES \
-	(FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID - \
-	FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID + 1U)
-#define FWPS_MSG_ABI_OUT_FIRST_QUEUE_ID		(FWPS_MSG_ABI_OUT_ACK_QUEUE_ID)
-#define FWPS_MSG_ABI_OUT_LAST_QUEUE_ID	(FWPS_MSG_ABI_MAX_OUTPUT_QUEUES - 1U)
-#define FWPS_MSG_ABI_IN_FIRST_QUEUE_ID		(FWPS_MSG_ABI_IN_DEV_QUEUE_ID)
-#define FWPS_MSG_ABI_IN_LAST_QUEUE_ID	(FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID)
-
-#define FWPS_MSG_HOST2FW_MAX_SIZE	(2U * 1024U)
-#define FWPS_MSG_FW2HOST_MAX_SIZE	(256U)
-
 #endif
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
index bfa5258d5b97..19b5149279c3 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
@@ -11,7 +11,6 @@
 #include "ipu7_fw_common_abi.h"
 
 #pragma pack(push, 1)
-#define SYSCOM_QUEUE_MIN_CAPACITY	2U
 
 struct syscom_queue_params_config {
 	ia_gofo_addr_t token_array_mem;

-- 
2.55.0

