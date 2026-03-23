Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45D13B19BC
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 17:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774287514; cv=none; b=NSeC6Iy/8iKIvJXhyoJp2YTQNtCyYPk/bzvhHQm5Stc1IDDZym3bpLP1hx2T/wcRt7+rb+oGj/+DsT1P2zzXafYnriSHzHHGluN/5WHAMlcVD5/yo+mo9FR32BgiX7d61if8m0vwN8QbTnfxHYla/V8e05JZFLxm5PnlNu8WJt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774287514; c=relaxed/simple;
	bh=u+QxrN6yRvEFv7W2foss8WfpryKhzVVEeP59FzIovWw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qiKcyrHqc+62HiXPsBdX95lGJUQBQOsIMp6SrZ9CAZLxFUXY7IJ6ckrZ6GnJ6kxqPJiWhPTdaOd9UT2Pymc8J1gvTpj+eIaN1xia7OOFxe0v7W0be4K4/VNe4jY/uUqLj+DHaFf7djAGtrFqAid+Phy+RoxBSbcpxCt1U+wDcbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJgjLlXo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJgjLlXo"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a8fba3f769so20588035ad.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774287512; x=1774892312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VQfIr9mRYQK6rBx33dhRkkPsspMzawtgBrkSlvn7oA=;
        b=FJgjLlXoJl/UEqfI3cdw2EcQfyPZBGv2e9+OQJekCWFGpHXRo5zGpIWTBZ3b7v4Zsk
         G+VEkM5jcv/7X+eHdByHlOvE9XZ3BIvXWdMX2l2KVHdNdSU14h5xWoBRuAlm0bekBk55
         dswJZnnVmlTwtCTROt6kzbWljuIOGBNQ0RTq76/AfaRoLwCcsHeeqmWv6vmKYAju6NLN
         37efGN6dLlQjCKSy1Ku0JKa3UIgmWp2yBeZadVB8mDPRuxdhuz07w0WdTs9fE4BMabJt
         5LogHtacjJA2dbLiOlJ+OKP/TbWsCs9zeXtp2IXADLgSkrQ2FLg7g8C1818/ORKS/+LG
         4aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774287512; x=1774892312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VQfIr9mRYQK6rBx33dhRkkPsspMzawtgBrkSlvn7oA=;
        b=hNGDXA0s2UWFj5ImbvW+hxE8NiWrrFDwJYwLsiZs6VXWzC3Of7RKI4nOzSnz6kgxRi
         +lrRYj5TUm1l7uY5xc2flmM4zDtWmAYiZLCSUjuXBHu1aCWU1AtXIdHSP5AuWqcxDFoq
         6yl/O2ZpkeB8V+mLaWqGr7KB8FoYZ5IC2WbkKcCymy+Jiw6hqqgOC6R/6xyP+A/bgx/3
         NUIrlCJeZLFxGN5jiMxkc4kgcCaSlqP3ixXn1RLrmoYQjCWZZCX7z6rhE0RMShHE+Ba5
         pwB0oJD6mkF+yBnJgNQ8FQ8DM9yqBHYsoGvKFJVjrAWzcNw3dXT0CIXzhhOit3pi5plJ
         DjwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhA8CvDmrb16eZ7TV8HZHOKGQmn1ITPK7abpajvSq2xumcJ3toopJ/iwCTeEEeZbG+xc5zkl4R+jJzHT1k@lists.linux.dev
X-Gm-Message-State: AOJu0YztDfCneIeRkZ/VfIQRYdT9L8Vr9clL6yW99zRpes7pTyX6eet8
	8JFfGhx38SJuJavnWnNta1bt/zdsB9nhOHKj5JLiDX8cWg3+mrbLuUou
X-Gm-Gg: ATEYQzxCpRVv9yj3Ir2Iqs+Nv/xI8m3R9A8WLi/5KtLUA/eKwsipDrk4lBga3xtWBVh
	MSW3g254UKJjajXGKgTrjQfqTfcRQOFka/J6/fGAV2E9woNFUUfbilS9JlrBFXtyEUT+R8tbbvu
	q5nSv+k5sXS6s58SIwBN80Hxpo7CfXMZNM9V22TNM6EUk64/cVMPvnuyFDe7wQB5hDjf1famu2W
	pwFKEpyT8XckrayQdcrI8UDisjmr+A9Cqhi4+tv3QZg/f0QO4PKJB86rcHEsFxxrFwaNYT785WB
	WRjiU+xYS+ucIAxndDZb8AtPw9xITAMv27Ho3pNUaJR9hayJh2pmqtx09nBvFLzecbAg08y7zv0
	kfQ+IQhubNvKlgsi6CU/2sWb/XluRPbSCuio1lG1/7iO4nnuZUxlCNVT+jd0t5ei+AU2GLwCDIT
	BN3SnDGtpzfoMniCApgDYqYbw8iSmhK8es0k94vgx05OKgvAo=
X-Received: by 2002:a17:902:f651:b0:2b0:4d7d:fbc8 with SMTP id d9443c01a7336-2b0825e0b04mr119953635ad.0.1774287512015;
        Mon, 23 Mar 2026 10:38:32 -0700 (PDT)
Received: from xufowonmvnism.localdomain ([2409:893d:dfc:c0d:ad9b:7685:578e:c20c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836955dbsm158835965ad.72.2026.03.23.10.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:38:31 -0700 (PDT)
From: Lian Xiangyu <lin25001x@gmail.com>
To: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	mchehab@kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Lian Xiangyu <lin25001x@gmail.com>
Subject: [PATCH v2] staging: media: ipu7: remove 'U' suffix from hexadecimal literals
Date: Tue, 24 Mar 2026 01:31:40 +0800
Message-Id: <20260323173140.993436-1-lin25001x@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipu7 driver's TODO specifies that the 'U' suffix should be
removed from hexadecimal values in register definitions.

This patch cleans up the definitions in the header files within the
ipu7 directory to comply with the requirements and improve consistency.

The modification was verified by comparing the disassembly of the
built-in.a archive before and after the change. The MD5 hashes of the
disassembly output remained identical, confirming that this is a
purely cosmetic cleanup with no functional impact on the binary.

Signed-off-by: Lian Xiangyu <lin25001x@gmail.com>
---
v2:
 - Only remove the 'U' suffix from hexadecimal literals to align with
   preferred kernel style, while keeping it for decimal values as
   suggested by Sakari Ailus.
 - Verified binary identity on x86_64 by comparing MD5/SHA256 hashes
   of the disassembly output.

 .../staging/media/ipu7/abi/ipu7_fw_boot_abi.h | 78 +++++++++----------
 .../media/ipu7/abi/ipu7_fw_common_abi.h       |  4 +-
 .../staging/media/ipu7/abi/ipu7_fw_msg_abi.h  | 12 +--
 .../staging/media/ipu7/ipu7-buttress-regs.h   | 10 +--
 4 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
index a1519c4fe66..56b90aab83e 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
@@ -42,7 +42,7 @@ struct ia_gofo_logger_config {
 	((IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET) + \
 	(u32)(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP))
 #define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PRIMARY_OFFSET (0U)
-#define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET (0x3000U / 4U)
+#define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET (0x3000 / 4U)
 #define IA_GOFO_HKR_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET \
 	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 2U)
 #define IA_GOFO_HKR_HIF_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET \
@@ -75,7 +75,7 @@ enum ia_gofo_boot_uc_tile_frequency_units {
 };
 
 #define IA_GOFO_FW_BOOT_STATE_IS_CRITICAL(boot_state) \
-	(0xdead0000U == ((boot_state) & 0xffff0000U))
+	(0xdead0000 == ((boot_state) & 0xffff0000))
 
 struct ia_gofo_boot_config {
 	u32 length;
@@ -104,35 +104,35 @@ struct ia_gofo_secondary_boot_config {
 
 #pragma pack(pop)
 
-#define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401U
-#define IA_GOFO_MEM_FATAL_DME_ERR		0xdead0801U
-#define IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR	0xdead0802U
-#define IA_GOFO_MEM_UNCORRECTABLE_DIRTY_ERR	0xdead0803U
-#define IA_GOFO_MEM_UNCORRECTABLE_DTAG_ERR	0xdead0804U
-#define IA_GOFO_MEM_UNCORRECTABLE_CACHE_ERR	0xdead0805U
-#define IA_GOFO_DOUBLE_EXCEPTION_ERR		0xdead0806U
-#define IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR	0xdead1000U
-#define IA_GOFO_BIST_DATA_INTEGRITY_FAILURE	0xdead1010U
+#define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401
+#define IA_GOFO_MEM_FATAL_DME_ERR		0xdead0801
+#define IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR	0xdead0802
+#define IA_GOFO_MEM_UNCORRECTABLE_DIRTY_ERR	0xdead0803
+#define IA_GOFO_MEM_UNCORRECTABLE_DTAG_ERR	0xdead0804
+#define IA_GOFO_MEM_UNCORRECTABLE_CACHE_ERR	0xdead0805
+#define IA_GOFO_DOUBLE_EXCEPTION_ERR		0xdead0806
+#define IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR	0xdead1000
+#define IA_GOFO_BIST_DATA_INTEGRITY_FAILURE	0xdead1010
 
 enum ia_gofo_boot_state {
-	IA_GOFO_FW_BOOT_STATE_SECONDARY_BOOT_CONFIG_READY = 0x57a7b000U,
-	IA_GOFO_FW_BOOT_STATE_UNINIT = 0x57a7e000U,
-	IA_GOFO_FW_BOOT_STATE_STARTING_0 = 0x57a7d000U,
-	IA_GOFO_FW_BOOT_STATE_CACHE_INIT_DONE = 0x57a7d010U,
-	IA_GOFO_FW_BOOT_STATE_MEM_INIT_DONE = 0x57a7d020U,
-	IA_GOFO_FW_BOOT_STATE_STACK_INIT_DONE = 0x57a7d030U,
-	IA_GOFO_FW_BOOT_STATE_EARLY_BOOT_DONE = 0x57a7d100U,
-	IA_GOFO_FW_BOOT_STATE_BOOT_CONFIG_START = 0x57a7d200U,
-	IA_GOFO_FW_BOOT_STATE_QUEUE_INIT_DONE = 0x57a7d300U,
-	IA_GOFO_FW_BOOT_STATE_READY = 0x57a7e100U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_UNSPECIFIED = 0xdead0001U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_PTR = 0xdead0101U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_VERSION = 0xdead0201U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_MSG_VERSION = 0xdead0301U,
+	IA_GOFO_FW_BOOT_STATE_SECONDARY_BOOT_CONFIG_READY = 0x57a7b000,
+	IA_GOFO_FW_BOOT_STATE_UNINIT = 0x57a7e000,
+	IA_GOFO_FW_BOOT_STATE_STARTING_0 = 0x57a7d000,
+	IA_GOFO_FW_BOOT_STATE_CACHE_INIT_DONE = 0x57a7d010,
+	IA_GOFO_FW_BOOT_STATE_MEM_INIT_DONE = 0x57a7d020,
+	IA_GOFO_FW_BOOT_STATE_STACK_INIT_DONE = 0x57a7d030,
+	IA_GOFO_FW_BOOT_STATE_EARLY_BOOT_DONE = 0x57a7d100,
+	IA_GOFO_FW_BOOT_STATE_BOOT_CONFIG_START = 0x57a7d200,
+	IA_GOFO_FW_BOOT_STATE_QUEUE_INIT_DONE = 0x57a7d300,
+	IA_GOFO_FW_BOOT_STATE_READY = 0x57a7e100,
+	IA_GOFO_FW_BOOT_STATE_CRIT_UNSPECIFIED = 0xdead0001,
+	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_PTR = 0xdead0101,
+	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_VERSION = 0xdead0201,
+	IA_GOFO_FW_BOOT_STATE_CRIT_MSG_VERSION = 0xdead0301,
 	IA_GOFO_FW_BOOT_STATE_CRIT_WDT_TIMEOUT = IA_GOFO_WDT_TIMEOUT_ERR,
-	IA_GOFO_FW_BOOT_STATE_WRONG_DATA_SECTION_UNPACKING = 0xdead0501U,
-	IA_GOFO_FW_BOOT_STATE_WRONG_RO_DATA_SECTION_UNPACKING = 0xdead0601U,
-	IA_GOFO_FW_BOOT_STATE_INVALID_UNTRUSTED_ADDR_MIN = 0xdead0701U,
+	IA_GOFO_FW_BOOT_STATE_WRONG_DATA_SECTION_UNPACKING = 0xdead0501,
+	IA_GOFO_FW_BOOT_STATE_WRONG_RO_DATA_SECTION_UNPACKING = 0xdead0601,
+	IA_GOFO_FW_BOOT_STATE_INVALID_UNTRUSTED_ADDR_MIN = 0xdead0701,
 	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_FATAL_DME = IA_GOFO_MEM_FATAL_DME_ERR,
 	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_UNCORRECTABLE_LOCAL =
 	IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR,
@@ -146,18 +146,18 @@ enum ia_gofo_boot_state {
 	IA_GOFO_DOUBLE_EXCEPTION_ERR,
 	IA_GOFO_FW_BOOT_STATE_CRIT_BIST_DMEM_FAULT_DETECTION_ERR =
 	IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR,
-	IA_GOFO_FW_BOOT_STATE_CRIT_DATA_INTEGRITY_FAILURE = 0xdead1010U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_STACK_CHK_FAILURE = 0xdead1011U,
+	IA_GOFO_FW_BOOT_STATE_CRIT_DATA_INTEGRITY_FAILURE = 0xdead1010,
+	IA_GOFO_FW_BOOT_STATE_CRIT_STACK_CHK_FAILURE = 0xdead1011,
 	IA_GOFO_FW_BOOT_STATE_CRIT_SYSCOM_CONTEXT_INTEGRITY_FAILURE =
-	0xdead1012U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_MPU_CONFIG_FAILURE = 0xdead1013U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_SHARED_BUFFER_FAILURE = 0xdead1014U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_CMEM_FAILURE = 0xdead1015U,
-	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD = 0x57a7f001U,
-	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_START = 0x57a7e200U,
-	IA_GOFO_FW_BOOT_STATE_INACTIVE = 0x57a7e300U,
-	IA_GOFO_FW_BOOT_HW_CMD_ACK_TIMEOUT = 0x57a7e400U,
-	IA_GOFO_FW_BOOT_SYSTEM_CYCLES_ERROR = 0x57a7e500U
+	0xdead1012,
+	IA_GOFO_FW_BOOT_STATE_CRIT_MPU_CONFIG_FAILURE = 0xdead1013,
+	IA_GOFO_FW_BOOT_STATE_CRIT_SHARED_BUFFER_FAILURE = 0xdead1014,
+	IA_GOFO_FW_BOOT_STATE_CRIT_CMEM_FAILURE = 0xdead1015,
+	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD = 0x57a7f001,
+	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_START = 0x57a7e200,
+	IA_GOFO_FW_BOOT_STATE_INACTIVE = 0x57a7e300,
+	IA_GOFO_FW_BOOT_HW_CMD_ACK_TIMEOUT = 0x57a7e400,
+	IA_GOFO_FW_BOOT_SYSTEM_CYCLES_ERROR = 0x57a7e500
 };
 
 #endif
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
index 7bb6fac585a..398a1335048 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
@@ -60,7 +60,7 @@ struct ia_gofo_tlv_list {
 
 #define IA_GOFO_MSG_ERR_MAX_DETAILS		(4U)
 #define IA_GOFO_MSG_ERR_OK			(0U)
-#define IA_GOFO_MSG_ERR_UNSPECIFED		(0xffffffffU)
+#define IA_GOFO_MSG_ERR_UNSPECIFED		(0xffffffff)
 #define IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED	(0U)
 #define IA_GOFO_MSG_ERR_IS_OK(err)	(IA_GOFO_MSG_ERR_OK == (err).err_code)
 
@@ -145,7 +145,7 @@ struct ia_gofo_msg_indirect {
 #define IA_GOFO_MSG_LOG_DOC_FMT_ID_MIN	(0U)
 
 #define IA_GOFO_MSG_LOG_DOC_FMT_ID_MAX	(4095U)
-#define IA_GOFO_MSG_LOG_FMT_ID_INVALID	(0xfffffffU)
+#define IA_GOFO_MSG_LOG_FMT_ID_INVALID	(0xfffffff)
 
 struct ia_gofo_msg_log_info {
 	u16 log_counter;
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
index 8a78dd0936d..31124838599 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
@@ -69,11 +69,11 @@ struct ipu7_msg_cb_profile {
 
 #define IPU_MSG_NODE_MAX_PROFILES	(2U)
 #define IPU_MSG_NODE_DEF_PROFILE_IDX	(0U)
-#define IPU_MSG_NODE_RSRC_ID_EXT_IP	(0xffU)
+#define IPU_MSG_NODE_RSRC_ID_EXT_IP	(0xff)
 
-#define IPU_MSG_NODE_DONT_CARE_TEB_HI	(0xffffffffU)
-#define IPU_MSG_NODE_DONT_CARE_TEB_LO	(0xffffffffU)
-#define IPU_MSG_NODE_RSRC_ID_IS		(0xfeU)
+#define IPU_MSG_NODE_DONT_CARE_TEB_HI	(0xffffffff)
+#define IPU_MSG_NODE_DONT_CARE_TEB_LO	(0xffffffff)
+#define IPU_MSG_NODE_RSRC_ID_IS		(0xfe)
 
 struct ipu7_msg_node {
 	struct ia_gofo_tlv_header tlv_header;
@@ -160,7 +160,7 @@ struct ipu7_msg_link_ep_pair {
 #define IPU_MSG_LINK_FOREIGN_KEY_MAX		(64U)
 #define IPU_MSG_LINK_PBK_ID_DONT_CARE		(255U)
 #define IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE	(255U)
-#define IPU_MSG_LINK_TERM_ID_DONT_CARE		(0xffU)
+#define IPU_MSG_LINK_TERM_ID_DONT_CARE		(0xff)
 
 struct ipu7_msg_link {
 	struct ia_gofo_tlv_header tlv_header;
@@ -333,7 +333,7 @@ enum ipu7_msg_err_device {
 #pragma pack(pop)
 
 #pragma pack(push, 1)
-#define IPU_MSG_GRAPH_ID_UNKNOWN	(0xffU)
+#define IPU_MSG_GRAPH_ID_UNKNOWN	(0xff)
 #define IPU_MSG_GRAPH_SEND_MSG_ENABLED	1U
 #define IPU_MSG_GRAPH_SEND_MSG_DISABLED	0U
 
diff --git a/drivers/staging/media/ipu7/ipu7-buttress-regs.h b/drivers/staging/media/ipu7/ipu7-buttress-regs.h
index 3eafd6a3813..7b646aa538c 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress-regs.h
+++ b/drivers/staging/media/ipu7/ipu7-buttress-regs.h
@@ -287,7 +287,7 @@
 
 #define BUTTRESS_TSC_CMD_START_TSC_SYNC		BIT(0)
 #define BUTTRESS_PWR_STATUS_HH_STATUS_SHIFT	11
-#define BUTTRESS_PWR_STATUS_HH_STATUS_MASK	(0x3U << 11)
+#define BUTTRESS_PWR_STATUS_HH_STATUS_MASK	(0x3 << 11)
 #define BUTTRESS_TSW_WA_SOFT_RESET		BIT(8)
 /* new for PTL */
 #define BUTTRESS_SEL_PB_TIMESTAMP		BIT(9)
@@ -326,8 +326,8 @@
 #define BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK 0xffff
 
 /* IS/PS freq control */
-#define BUTTRESS_IS_FREQ_CTL_RATIO_MASK	0xffU
-#define BUTTRESS_PS_FREQ_CTL_RATIO_MASK	0xffU
+#define BUTTRESS_IS_FREQ_CTL_RATIO_MASK	0xff
+#define BUTTRESS_PS_FREQ_CTL_RATIO_MASK	0xff
 
 #define IPU7_IS_FREQ_MAX		450
 #define IPU7_IS_FREQ_MIN		50
@@ -350,11 +350,11 @@
 /* buttree power status */
 #define IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT	0
 #define IPU_BUTTRESS_PWR_STATE_IS_PWR_MASK	\
-	(0x3U << IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT)
+	(0x3 << IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT)
 
 #define IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT	4
 #define IPU_BUTTRESS_PWR_STATE_PS_PWR_MASK	\
-	(0x3U << IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT)
+	(0x3 << IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT)
 
 #define IPU_BUTTRESS_PWR_STATE_DN_DONE		0x0
 #define IPU_BUTTRESS_PWR_STATE_UP_PROCESS	0x1
-- 
2.34.1

