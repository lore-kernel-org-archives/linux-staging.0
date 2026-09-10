Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1304149B5AF
	for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 22:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077855; cv=none; b=emiZBF8xrdCfpzcVqK8+cZGOOKMcyTaifD5Kj9XkaS1DU+1EfDy2edA993hyEkbqn/y9tkAzzyHUwpg4D55LEui0TtaBCCe3oruFV+YXhp/+H4GhR4dcVCSZYG/7+JycTqHJUQ/ZY2y00+hbgJm6wNhe0RLXyZbzkS6h5sIsfvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077855; c=relaxed/simple;
	bh=XZdqbLbxql8Jro5dhp/L/43SZ3BfueKPf/5qy4vKM/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gPvlkPjpA8z7ZZBPJ1q0wymCX7msMSb3Dvr4/JLZoXcsAEwGaT1j/lkEtGQwj03c1Ww8ukIo7pO3p6kHh39Bnma3NgFhek1fXE3a48jGJjVRhHoYcHxZWjBz6yB7nojUbsbc3Tr/erxK05lNxtshT1sOcfsujWBY6Wr06X57xdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQSFjArw; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQSFjArw"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25400so143517b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 15:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789077853; x=1789682653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSyOWKQOPgAjIh/53MaEz1wLV0gXZsU6+Ahhp+CsTxA=;
        b=NQSFjArwjyQnKptNMYnsDSkxiQgNTZdxEwECWEtQTrhAw9e8l4eECHdoZZzoFq7E42
         DlSTrA9NaE0v5owZOdKokjahBI7KF5P8nujSnwkuK800Wk+/eUlm1mGDwXzKUB2ptHeg
         6FX5aZS4EyJpX4u3JObro5jt1Voov+gvwGagXRpcto9t81GND9RAnH7jXG4AOUoaxPkn
         Lbw8EsNd7CjWK6p8yP5+8YsrnkjaeY0817OYc7buuRvIjeTABnMlxw85zNOSwIX6lM69
         bBDx5vRAR90RKxInCBNvn8iOUYiGRZ7m92/sSGAdng9T0Uf6s92yuMEvc+G0WIom/rAd
         0ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077853; x=1789682653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rSyOWKQOPgAjIh/53MaEz1wLV0gXZsU6+Ahhp+CsTxA=;
        b=Il4SVJrA882+1ov9g+GoHXfcjGy3oUKhLuqy4C1VHL1AB2aUiU+QFEVUFzFvldZll2
         ifwiF9Tq7W+lrSiHPRSZgrCQxejHBEcxy9PGpjTXW8nLezq3cz6dZtHopqTcc0xz1wtz
         WQmi61+VUIcGV9aY4xupHqBd4qq9RFq9hODPQvdFa6NZPjHOEYzh1CU18n1WaWRJ3gK0
         GLDZmJhXDqSRhuivwck9jPU5JuerfuNHETz3L2Y09HabaP/LZZ3J66v/UkMeu2b09ojb
         sfbATEdau4Fg9QHfhXPCeuw6kg2aoyBEssLs0DAGNRUVKB67aJsqRIXacPEYdTc2S8ja
         pKkQ==
X-Gm-Message-State: AFuF++l3f5qudw6AZjhXWBnc8GDrplo+EmXelRJegbqS3p5MvnMN7Oag
	zOex55YgpcETIQDY+s3Q73qYfGT8woRTVNBtpT1UxgVJe+Pxn4DK31XsgBOeZQ==
X-Gm-Gg: AYBFou3SSjg52vN0MKpY4JjQjY0WJSzhl8TotsCuz4XpLRdbihzl/Eo2nk0C6y3zo4G
	UF4hG61uRQTEI/8JsdG+il8zOMZ9cOvlSGcy0k4SzRpx+8oX46Ym9NpAPJu+aLC5JNe3o+HugWF
	WVpS01y/zn9uuY2sGLAjMBzv7AeqLMFsDrv1tptnU13QsRJMJZub5L7/Y4ybMbG74+HmE56T05t
	TzPUyE8REQppz314lSz+qtBGhgR8e9cv4Ot4OHE0gH9h9CdoVV8NQYWIsNYaBPtwykRauuHXqO2
	oKYGYSGiuAUHuuCpPC2AdKRwS7E/9Yy0HLUrJ46DwExO7jUCaPPPmD4Uad3OMgdXqWs8sMxb3Ll
	zZmX7ysQEkI7T9nLoQzLJUZmk9bu9CSv/vQQVjHOaoRTR0oRJGBLp61eRdbC4LACzedgtTOyS/S
	j5LRXHC8+YbsUY+UZQCSPDVcoVRSiMbGkdB1jppSMQjDiOI5Q6Y2q9A2y1fFuiXODeSxIdBoIi+
	ihwiKb541o=
X-Received: by 2002:a05:6a20:3ca8:b0:3d0:868d:8ccb with SMTP id adf61e73a8af0-3daed418649mr1785856637.13.1789077852912;
        Thu, 10 Sep 2026 15:04:12 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm997755eec.16.2026.09.10.15.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:04:12 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 1/3] staging: rtl8723bs: delete empty comment lines in hal_com_reg.h
Date: Thu, 10 Sep 2026 15:03:57 -0700
Message-Id: <20260910220359.6683-2-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910220359.6683-1-guojy.bj@gmail.com>
References: <20260910220359.6683-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete all empty comment lines /*  */ in hal_com_reg.h as they are not
serving any purpose. Add back a newline if needed for spacing, while
avoiding multiple blank lines.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../staging/rtl8723bs/include/hal_com_reg.h   | 92 +------------------
 1 file changed, 3 insertions(+), 89 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index 4671fdfff916..352280ed3c56 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -7,11 +7,7 @@
 #ifndef __HAL_COMMON_REG_H__
 #define __HAL_COMMON_REG_H__
 
-/*  */
-/*  */
 /* 	0x0000h ~ 0x00FFh	System Configuration */
-/*  */
-/*  */
 #define REG_SYS_FUNC_EN				0x0002
 #define REG_APS_FSMCO					0x0004
 #define REG_SYS_CLKR					0x0008
@@ -36,11 +32,7 @@
 #define REG_SYS_CFG						0x00F0
 #define REG_GPIO_OUTSTS				0x00F4	/*  For RTL8723 only. */
 
-/*  */
-/*  */
 /* 	0x0100h ~ 0x01FFh	MACTOP General Configuration */
-/*  */
-/*  */
 #define REG_CR							0x0100
 #define REG_PBP							0x0104
 #define REG_TRXDMA_CTRL				0x010C
@@ -53,31 +45,18 @@
 #define REG_HMETFR						0x01CC
 #define REG_HMEBOX_0					0x01D0
 
-/*  */
-/*  */
 /* 	0x0200h ~ 0x027Fh	TXDMA Configuration */
-/*  */
-/*  */
 #define REG_RQPN						0x0200
 #define REG_TDECTRL						0x0208
 #define REG_TXDMA_STATUS				0x0210
 #define REG_RQPN_NPQ					0x0214
 #define REG_AUTO_LLT					0x0224
 
-
-/*  */
-/*  */
 /* 	0x0280h ~ 0x02FFh	RXDMA Configuration */
-/*  */
-/*  */
 #define REG_RXDMA_AGG_PG_TH			0x0280
 #define REG_RXPKT_NUM					0x0284
 
-/*  */
-/*  */
 /* 	0x0400h ~ 0x047Fh	Protocol Configuration */
-/*  */
-/*  */
 #define REG_TXPKT_EMPTY				0x041A
 #define REG_FWHW_TXQ_CTRL				0x0420
 #define REG_HWSEQ_CTRL					0x0423
@@ -92,11 +71,7 @@
 #define REG_MACID_SLEEP				0x04D4
 #define REG_NQOS_SEQ					0x04DC
 
-/*  */
-/*  */
 /* 	0x0500h ~ 0x05FFh	EDCA Configuration */
-/*  */
-/*  */
 #define REG_EDCA_VO_PARAM				0x0500
 #define REG_EDCA_VI_PARAM				0x0504
 #define REG_EDCA_BE_PARAM				0x0508
@@ -108,7 +83,7 @@
 #define REG_SLOT						0x051B
 #define REG_TXPAUSE						0x0522
 #define REG_RD_CTRL						0x0524
-/*  */
+
 /*  Format for offset 540h-542h: */
 /* 	[3:0]:   TBTT prohibit setup in unit of 32us. The time for HW getting beacon content before TBTT. */
 /* 	[7:4]:   Reserved. */
@@ -122,7 +97,6 @@
 /*                TBTT */
 /*  Note: We cannot update beacon content to HW or send any AC packets during the time between Setup and Hold. */
 /*  Described by Designer Tim and Bruce, 2011-01-14. */
-/*  */
 #define REG_TBTT_PROHIBIT				0x0540
 #define REG_BCN_CTRL					0x0550
 #define REG_BCN_CTRL_1					0x0551
@@ -137,11 +111,7 @@
 #define REG_TSFTR						0x0560
 #define REG_ACMHWCTRL					0x05C0
 
-/*  */
-/*  */
 /* 	0x0600h ~ 0x07FFh	WMAC Configuration */
-/*  */
-/*  */
 #define REG_BWOPMODE					0x0603
 #define REG_TCR							0x0604
 #define REG_RCR							0x0608
@@ -158,7 +128,6 @@
 
 #define REG_ACKTO						0x0640
 
-/*  */
 /*  Note: */
 /* 	The NAV upper value is very important to WiFi 11n 5.2.3 NAV test. The default value is */
 /* 	always too small, but the WiFi TestPlan test by 25, 000 microseconds of NAV through sending */
@@ -166,7 +135,6 @@
 /* 	The offset of NAV_UPPER in 8192C Spec is incorrect, and the offset should be 0x0652. Commented */
 /* 	by SD1 Scott. */
 /*  By Bruce, 2011-07-18. */
-/*  */
 #define REG_NAV_UPPER					0x0652	/*  unit of 128 */
 
 /* WMA, BA, CCX */
@@ -184,35 +152,25 @@
 #define REG_RXFLTMAP2					0x06A4
 #define REG_BCN_PSR_RPT				0x06A8
 
-/*  */
-/*  */
 /* 	Redefine 8192C register definition for compatibility */
-/*  */
-/*  */
 #define EFUSE_CTRL				REG_EFUSE_CTRL		/*  E-Fuse Control. */
 #define EFUSE_TEST				REG_EFUSE_TEST		/*  E-Fuse Test. */
 #define MSR						(REG_CR + 2)		/*  Media Status register */
 
 #define PBP						REG_PBP
 
-/*  */
 /*  9. Security Control Registers	(Offset:) */
-/*  */
 #define RWCAM					REG_CAMCMD		/* IN 8190 Data Sheet is called CAMcmd */
 #define WCAMI					REG_CAMWRITE	/*  Software write CAM input content */
 
-/*  */
 /*        8723/8188E Host System Interrupt Status Register (offset 0x5C, 32 byte) */
-/*  */
 #define HSISR_GPIO12_0_INT				BIT(0)
 #define HSISR_SPS_OCP_INT				BIT(5)
 #define HSISR_RON_INT					BIT(6)
 #define HSISR_PDNINT					BIT(7)
 #define HSISR_GPIO9_INT					BIT(25)
 
-/*  */
 /*        Response Rate Set Register	(offset 0x440, 24bits) */
-/*  */
 #define RRSR_1M					BIT(0)
 #define RRSR_2M					BIT(1)
 #define RRSR_5_5M				BIT(2)
@@ -223,9 +181,7 @@
 
 #define RRSR_CCK_RATES (RRSR_11M|RRSR_5_5M|RRSR_2M|RRSR_1M)
 
-/*  */
 /*        Rate Definition */
-/*  */
 /* CCK */
 #define RATE_1M					BIT(0)
 #define RATE_2M					BIT(1)
@@ -247,14 +203,10 @@
 /*  Only use CCK 1M rate for ACK */
 #define RATE_RRSR_CCK_ONLY_1M		0xFFFF1
 
-/*  */
 /*        BW_OPMODE bits				(Offset 0x603, 8bit) */
-/*  */
 #define BW_OPMODE_20MHZ			BIT(2)
 
-/*  */
 /*        CAM Config Setting (offset 0x680, 1 byte) */
-/*  */
 #define CAM_VALID				BIT(15)
 
 #define CAM_CONTENT_COUNT	8
@@ -266,13 +218,9 @@
 #define CAM_WRITE				BIT(16)
 #define CAM_POLLINIG			BIT(31)
 
-/*  */
 /*  12. Host Interrupt Status Registers */
-/*  */
 
-/*  */
 /*        8192C (RCR) Receive Configuration Register	(Offset 0x608, 32 bits) */
-/*  */
 #define RCR_APPFCS				BIT(31)	/*  WMAC append FCS after payload */
 #define RCR_APP_MIC				BIT(30)	/*  MACRX will retain the MIC at the bottom of the packet. */
 #define RCR_APP_ICV				BIT(29)	/*  MACRX will retain the ICV at the bottom of the packet. */
@@ -289,11 +237,7 @@
 #define RCR_APM					BIT(1)		/*  Accept physical match packet */
 
 
-/*  */
-/*  */
 /* 	0x0000h ~ 0x00FFh	System Configuration */
-/*  */
-/*  */
 
 /* 2 SYS_FUNC_EN */
 #define FEN_BBRSTB				BIT(0)
@@ -350,11 +294,7 @@
 /* 2 REG_GPIO_OUTSTS (For RTL8723 only) */
 #define RF_RL_ID					(BIT(31)|BIT(30)|BIT(29)|BIT(28))
 
-/*  */
-/*  */
 /* 	0x0100h ~ 0x01FFh	MACTOP General Configuration */
-/*  */
-/*  */
 
 /* 2 Function Enable Registers */
 /* 2 CR */
@@ -397,11 +337,8 @@
 #define QUEUE_NORMAL			2
 #define QUEUE_HIGH				3
 
-/*  */
-/*  */
 /* 	0x0200h ~ 0x027Fh	TXDMA Configuration */
-/*  */
-/*  */
+
 /* 2 RQPN */
 #define _HPQ(x)					((x) & 0xFF)
 #define _LPQ(x)					(((x) & 0xFF) << 8)
@@ -413,11 +350,7 @@
 /* 2 AUTO_LLT */
 #define BIT_AUTO_INIT_LLT BIT(16)
 
-/*  */
-/*  */
 /* 	0x0280h ~ 0x028Bh	RX DMA Configuration */
-/*  */
-/*  */
 
 /* 2 REG_RXDMA_CONTROL, 0x0286h */
 /*  Write only. When this bit is set, RXDMA will decrease RX PKT counter by one. Before */
@@ -435,11 +368,8 @@
 #define	RXDMA_IDLE				BIT(17)
 #define	RW_RELEASE_EN			BIT(18)
 
-/*  */
-/*  */
 /* 	0x0400h ~ 0x047Fh	Protocol Configuration */
-/*  */
-/*  */
+
 /* 2 FWHW_TXQ_CTRL */
 #define EN_AMPDU_RTY_NEW			BIT(7)
 
@@ -452,11 +382,7 @@
 #define	RETRY_LIMIT_SHORT_SHIFT			8
 #define	RETRY_LIMIT_LONG_SHIFT			0
 
-/*  */
-/*  */
 /* 	0x0500h ~ 0x05FFh	EDCA Configuration */
-/*  */
-/*  */
 
 #define _LRL(x)					((x) & 0x3F)
 #define _SRL(x)					(((x) & 0x3F) << 8)
@@ -476,11 +402,7 @@
 #define AcmHw_ViqEn				BIT(2)
 #define AcmHw_VoqEn			BIT(3)
 
-/*  */
-/*  */
 /* 	0x0600h ~ 0x07FFh	WMAC Configuration */
-/*  */
-/*  */
 
 /* 2 TCR */
 #define TSFRST					BIT(0)
@@ -497,11 +419,7 @@
 #define SCR_RXBCUSEDK			BIT(7)			/*  Force Rx Broadcast packets Use Default Key */
 #define SCR_CHK_KEYID			BIT(8)
 
-/*  */
-/*  */
 /* 	SDIO Bus Specification */
-/*  */
-/*  */
 
 /*  I/O bus domain address mapping */
 #define SDIO_LOCAL_BASE		0x10250000
@@ -578,11 +496,7 @@
 /*  SDIO Tx FIFO related */
 #define SDIO_TX_FREE_PG_QUEUE			4	/*  The number of Tx FIFO free page */
 
-/*  */
-/*  */
 /* 	0xFE00h ~ 0xFE55h	USB Configuration */
-/*  */
-/*  */
 
 /* 2REG_C2HEVT_CLEAR */
 #define C2H_EVT_HOST_CLOSE		0x00	/*  Set by driver and notify FW that the driver has read the C2H command message */
-- 
2.34.1

