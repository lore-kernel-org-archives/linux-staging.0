Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE85F
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 13:06:02 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id l4so21786962ejc.10
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 06:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGmF2rdYBG/AzXYkXGuoMiHqRDGWNujv9sDGHDshI+4=;
        b=UvrRF0jRMWdyA5DUZeBThTmI4cjr5LtugXUAVt5KpC5Rvkz+dne/RZT6Zn1Z36EmNP
         D2VJMIUM1etZ0X4xqM1yaerIxfB0yxn5+jYDEihiHHH9w+BczKzHGWAMTqTepXP2RkRG
         s97EHzhXQvl5QpDiaFszmNGGhrFlgks8c0UkWNEbSGhmCVzC6RRT60F12xvTtoUkOdCO
         ORMhuLpJY56FdYrEX4CGIX+UBdxrcdUhfct8VmUWlsP2XQudzmOAYaM8WX4YbmJaGvxf
         fiHrFCnKt5ibFTBDCEwT0HZNXe8TKoXDh0YEUD9wy2JHr2GnJQn+Zw6k6RAwwtqaXD0P
         54dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGmF2rdYBG/AzXYkXGuoMiHqRDGWNujv9sDGHDshI+4=;
        b=C4YONKh2D6j+FfXJjzmBgKbRbb3y06LTK4KCQDf92hH2k6khkpHes0MJiKKl/QRl7c
         sCiVU7kVBMIs44T3whjt3CqjqONGi8BOMEA/NCEkNlnLkD4XBBbAWEUNBXgqKovUhRp0
         J26K6earURLGMG+ufPdTmm2pcFu7rVkcsiclmVwtw0mhNQ0sPwQt4VvtgH6OP8EMR22j
         51f5leWDjQZSokcG63cpl0junoMkHL9rRen1SpkQ3ZQ4tT3jNAb8Vd5q7XHgLnzbwtT6
         anQgG7Zn9RA2IWBLkfIqZfkdpht8P/iZ7vcPpWmGEuYlZ9Tgky6S1yO0zup320MymJWq
         ckuQ==
X-Gm-Message-State: AOAM533MgklBCBTFzIiYazr7M8+koxK7iHYprFcnd7wGYP7E1fARGhlu
	mpJZ9vm/1X2uZBW78vL0Z6A=
X-Google-Smtp-Source: ABdhPJyDiLxHkbaP3sk3sljMSPq8gh5F6eiS3+6mRIt2nNBTNMbuQsixxnx4KtiQTg2977NTRT1YjQ==
X-Received: by 2002:a17:907:2bdd:: with SMTP id gv29mr33145501ejc.259.1617714360617;
        Tue, 06 Apr 2021 06:06:00 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id t14sm10967241ejc.121.2021.04.06.06.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:06:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: hal: Remove camelcase in Hal8723BReg.h
Date: Tue,  6 Apr 2021 15:05:56 +0200
Message-Id: <20210406130556.1417-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove camelcase in some symbols defined in Hal8723BReg.h. These symbols
are not used anywhere else, therefore this patch does not break the driver.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
index cc249e15b4bd..60c1f966c5de 100644
--- a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
+++ b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
@@ -110,7 +110,7 @@
 #define REG_RSVD3_8723B				0x0168
 #define REG_C2HEVT_MSG_NORMAL_8723B		0x01A0
 #define REG_C2HEVT_CMD_SEQ_88XX			0x01A1
-#define REG_C2hEVT_CMD_CONTENT_88XX		0x01A2
+#define REG_C2HEVT_CMD_CONTENT_88XX		0x01A2
 #define REG_C2HEVT_CMD_LEN_88XX			0x01AE
 #define REG_C2HEVT_CLEAR_8723B			0x01AF
 #define REG_MCUTST_1_8723B			0x01C0
@@ -424,13 +424,13 @@
 #define	IMR_RXFOVW_8723B		BIT8	/* Receive FIFO Overflow */
 
 /* 2 ACMHWCTRL 0x05C0 */
-#define	AcmHw_HwEn_8723B		BIT(0)
-#define	AcmHw_VoqEn_8723B		BIT(1)
-#define	AcmHw_ViqEn_8723B		BIT(2)
-#define	AcmHw_BeqEn_8723B		BIT(3)
-#define	AcmHw_VoqStatus_8723B		BIT(5)
-#define	AcmHw_ViqStatus_8723B		BIT(6)
-#define	AcmHw_BeqStatus_8723B		BIT(7)
+#define	ACMHW_HWEN_8723B		BIT(0)
+#define	ACMHW_VOQEN_8723B		BIT(1)
+#define	ACMHW_VIQEN_8723B		BIT(2)
+#define	ACMHW_BEQEN_8723B		BIT(3)
+#define	ACMHW_VOQSTATUS_8723B		BIT(5)
+#define	ACMHW_VIQSTATUS_8723B		BIT(6)
+#define	ACMHW_BEQSTATUS_8723B		BIT(7)
 
 /* 8195 (RCR) Receive Configuration Register	(Offset 0x608, 32 bits) */
 #define	RCR_TCPOFLD_EN			BIT25	/* Enable TCP checksum offload */
-- 
2.30.2

