Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F666F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:44 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id w3so29112572ejc.4
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VVbef4RIKTJWs/6WO58+KVReeYM2u8NS17xKjC429X8=;
        b=KbjTqW1uP1ZQV/Bs03D0BorkP8raa7IAKlp1ApwRm2PB5SKLOOYaHMmX1Tt5/gDaly
         8Dcz0U5+gurKtzA5irq7If8hA3VeRZomUU9p99t3EYXmB61zhcvCbQUr9gsQnMmmWpr9
         KZgWxwyK8/N5OV0jwsfxldETDkVXY9imXXZBwTaL0btdCRY6K1chtuN0M3niioob/cE3
         wT9wbpHARcqOqKHL+nbR7nAu3fQNErgPYYVc4ynipdqsgXsMtoMoY65CUT8oOU5yWN8Y
         91CccZ6LGMVBzhfL+apcm6ETvm98yuEndWTPc+oRhV6BcRUBBg7d49ijIR/vTcrmqkvP
         xH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VVbef4RIKTJWs/6WO58+KVReeYM2u8NS17xKjC429X8=;
        b=kpa3fg3vjz5Y0wnvRxM5J4e05S+nCMESk1fP1zZ2iB8WH47qxUBuRNVZGsMMh6S0um
         wlG9/9UorZYLn5DAGKyivFBN5thYZkBa6+MCrQubztAZpyA4HlZgRtS2Uvv+XmiKGIXA
         0H7G6UhC1QAPlyxZNlVHly66oB8i0ogdwgBsLlOeTAYDcj4WZdQ/j2YhluYM1OBtldQY
         yn5iP8l3wUtMz83LQG2ehQVfPby96PPRumLyU+fNBpaD3tAFD6U+JNcA6pNyM6rOrSyC
         1I7vzh7Qf/5ghX2q295NbF5YI1aIUWWFQgYEcr28hreDSL4cTJh2zgKbMQROnZ7bvoHk
         WNFA==
X-Gm-Message-State: AOAM533Spu5vHu+5WSRA6JC4myqQ5QeMiAYnE7QrcQdkRYToYM8zbAEX
	iv02ocFPFMRub0GXcCBOXqU=
X-Google-Smtp-Source: ABdhPJxwqoEMgiUKDKpgH7tNKpChw6T+2OITkZ+tmEVRxmlXN2wZXA/kD92kfjaoDAk1NIdAnVX/Rg==
X-Received: by 2002:a17:906:aac5:: with SMTP id kt5mr2635890ejb.548.1617183642996;
        Wed, 31 Mar 2021 02:40:42 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id z17sm851957eju.27.2021.03.31.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 16/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in hal/HalPwrSeqCmd.c
Date: Wed, 31 Mar 2021 11:39:44 +0200
Message-Id: <47073bd5ab9de71997aabd3a10c7a1a4aa268c47.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_TRACE for tracing with in-kernel
pr_* printk wrappers

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c | 61 +++++---------------
 1 file changed, 16 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index 932b31fda6ad..9abe37bf318f 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -53,21 +53,16 @@ u8 HalPwrSeqCmdParsing(
 	do {
 		PwrCfgCmd = PwrSeqCmd[AryIdx];
 
-		RT_TRACE(
-			_module_hal_init_c_,
-			_drv_info_,
-			(
-				"HalPwrSeqCmdParsing: offset(%#x) cut_msk(%#x) fab_msk(%#x) interface_msk(%#x) base(%#x) cmd(%#x) msk(%#x) value(%#x)\n",
-				GET_PWR_CFG_OFFSET(PwrCfgCmd),
-				GET_PWR_CFG_CUT_MASK(PwrCfgCmd),
-				GET_PWR_CFG_FAB_MASK(PwrCfgCmd),
-				GET_PWR_CFG_INTF_MASK(PwrCfgCmd),
-				GET_PWR_CFG_BASE(PwrCfgCmd),
-				GET_PWR_CFG_CMD(PwrCfgCmd),
-				GET_PWR_CFG_MASK(PwrCfgCmd),
-				GET_PWR_CFG_VALUE(PwrCfgCmd)
-			)
-		);
+		pr_info("%s %s: offset(%#x) cut_msk(%#x) fab_msk(%#x) interface_msk(%#x) base(%#x) cmd(%#x) msk(%#x) value(%#x)\n",
+			DRIVER_PREFIX, __func__,
+			GET_PWR_CFG_OFFSET(PwrCfgCmd),
+			GET_PWR_CFG_CUT_MASK(PwrCfgCmd),
+			GET_PWR_CFG_FAB_MASK(PwrCfgCmd),
+			GET_PWR_CFG_INTF_MASK(PwrCfgCmd),
+			GET_PWR_CFG_BASE(PwrCfgCmd),
+			GET_PWR_CFG_CMD(PwrCfgCmd),
+			GET_PWR_CFG_MASK(PwrCfgCmd),
+			GET_PWR_CFG_VALUE(PwrCfgCmd));
 
 		/* 2 Only Handle the command whose FAB, CUT, and Interface are matched */
 		if (
@@ -77,19 +72,11 @@ u8 HalPwrSeqCmdParsing(
 		) {
 			switch (GET_PWR_CFG_CMD(PwrCfgCmd)) {
 			case PWR_CMD_READ:
-				RT_TRACE(
-					_module_hal_init_c_,
-					_drv_info_,
-					("HalPwrSeqCmdParsing: PWR_CMD_READ\n")
-				);
+				pr_info("%s %s: PWR_CMD_READ\n", DRIVER_PREFIX, __func__);
 				break;
 
 			case PWR_CMD_WRITE:
-				RT_TRACE(
-					_module_hal_init_c_,
-					_drv_info_,
-					("HalPwrSeqCmdParsing: PWR_CMD_WRITE\n")
-				);
+				pr_info("%s %s: PWR_CMD_WRITE\n", DRIVER_PREFIX, __func__);
 				offset = GET_PWR_CFG_OFFSET(PwrCfgCmd);
 
 				/*  */
@@ -124,11 +111,7 @@ u8 HalPwrSeqCmdParsing(
 				break;
 
 			case PWR_CMD_POLLING:
-				RT_TRACE(
-					_module_hal_init_c_,
-					_drv_info_,
-					("HalPwrSeqCmdParsing: PWR_CMD_POLLING\n")
-				);
+				pr_info("%s %s: PWR_CMD_POLLING\n", DRIVER_PREFIX, __func__);
 
 				bPollingBit = false;
 				offset = GET_PWR_CFG_OFFSET(PwrCfgCmd);
@@ -160,11 +143,7 @@ u8 HalPwrSeqCmdParsing(
 				break;
 
 			case PWR_CMD_DELAY:
-				RT_TRACE(
-					_module_hal_init_c_,
-					_drv_info_,
-					("HalPwrSeqCmdParsing: PWR_CMD_DELAY\n")
-				);
+				pr_info("%s %s: PWR_CMD_DELAY\n", DRIVER_PREFIX, __func__);
 				if (GET_PWR_CFG_VALUE(PwrCfgCmd) == PWRSEQ_DELAY_US)
 					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd));
 				else
@@ -173,19 +152,11 @@ u8 HalPwrSeqCmdParsing(
 
 			case PWR_CMD_END:
 				/*  When this command is parsed, end the process */
-				RT_TRACE(
-					_module_hal_init_c_,
-					_drv_info_,
-					("HalPwrSeqCmdParsing: PWR_CMD_END\n")
-				);
+				pr_info("%s %s: PWR_CMD_END\n", DRIVER_PREFIX, __func__);
 				return true;
 
 			default:
-				RT_TRACE(
-					_module_hal_init_c_,
-					_drv_err_,
-					("HalPwrSeqCmdParsing: Unknown CMD!!\n")
-				);
+				pr_err("%s %s: Unknown CMD!!\n", DRIVER_PREFIX, __func__);
 				break;
 			}
 		}
-- 
2.20.1

