Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F5C613B;
	Sun, 15 Oct 2023 11:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1e8r8pK"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-579de633419so43423377b3.3;
        Sun, 15 Oct 2023 04:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697369281; x=1697974081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2EkuzijiPdrajc83Obp0fb3GnIq7fHlM8WZQAKhxfc=;
        b=m1e8r8pKZiGUe1G5su7u6VDmi3MceKCAs64KybtigmvAVNKkIFSqBvAEvLB9RLzKKE
         uk1neAYA+hYfNvLbBSfU1+EXKBJOwPgGd9UrynHhEb4qnlTKj3TuARAli6evIE8N5s86
         Sf/J5KrzPQVuoWZnYaMlq2XcKuFNxmo7ezxc89TaowjBaZud2RQ6NhXWoG/HPY+65nGb
         og6lnmsc8PTHAzR8KzLXiG4PIv8CC+oF2pI35MhzYwAY0cLdhfvLc2AGiIf7ZcMuZmHk
         qVySjJusOYX95SWRp9kCFNjJqZ68iu+XN8LcxiNgqgNCQa4TJLyEr83WJATqvvLm9yaI
         mnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697369281; x=1697974081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2EkuzijiPdrajc83Obp0fb3GnIq7fHlM8WZQAKhxfc=;
        b=I2E4urBSFUh10NIER87MiJ4NdXkGrR5flDyYsn3LRWtxALnpTl2ReCUaRlcnXu5dJf
         UgIYIo5PsqaCef9Lm5Ua1IijT7UnmuXbLHeWJc7vCshUmwVB37HpH2nFygiOhtGT7aLB
         E/STSQk31SnHliDk+Q43mguymawI4Jq/3qj+tqkLYw4h+xjTlU50t6DuxoBNlZrbmnKy
         s4q0mzpN//KXdU13EeH9+m1GynT+YCf17KpH3mejZCRrk9R0MacOqHLVS/I2RPOdR6vp
         f+alEH1evTLxUgU0Bx/PWrsH7p3HIxhwhY55N78jAFF+wWJL7L7cHiBw8qiroStRFQn9
         kVxg==
X-Gm-Message-State: AOJu0Yx60hQPCUatZp5vLRprsHO1AwGSePFDJ4FFcs6kzX4CU8E7DWzT
	SDMB0qi+1C2hdE/afpWjEoQ=
X-Google-Smtp-Source: AGHT+IFjbSk7DfrtlIN7XI9cu5JvpJTBXuagNb9bed7eLp/azq9pCfQxN5smueJLnuCHZ0psboVk5Q==
X-Received: by 2002:a05:690c:f14:b0:5a7:fb11:90f8 with SMTP id dc20-20020a05690c0f1400b005a7fb1190f8mr12045502ywb.16.1697369281047;
        Sun, 15 Oct 2023 04:28:01 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id j145-20020a819297000000b00579e5c4982fsm1330279ywg.36.2023.10.15.04.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 04:28:00 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 3/6] staging: rtl8192u: Align descendant arguments
Date: Sun, 15 Oct 2023 12:24:49 +0100
Message-Id: <0230e0abfb31d6000c2d1294bc118b45896e9149.1697367161.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697367161.git.gilbertadikankwu@gmail.com>
References: <cover.1697367161.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align descendant arguments to the open parenthesis as per the "Linux
Kernel coding style" in Documentation/process/coding-style.rst

Mute the following checkpatch error:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 0a60ef20107c..2985c4f05bc8 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2236,7 +2236,7 @@ static int rtl8192_read_eeprom_info(struct net_device *dev)
 			*((u16 *)(&priv->EEPROMTxPowerLevelCCK_V1[1])) = tmpValue;
 			if (bLoad_From_EEPOM)
 				tmpValue = eprom_read(dev,
-					EEPROM_TX_PW_INDEX_OFDM_24G_V1 >> 1);
+						      EEPROM_TX_PW_INDEX_OFDM_24G_V1 >> 1);
 			else
 				tmpValue = 0x1010;
 			*((u16 *)(&priv->EEPROMTxPowerLevelOFDM24G[0])) = tmpValue;
@@ -2536,16 +2536,16 @@ static bool rtl8192_adapter_start(struct net_device *dev)
 
 	/* Initialize Number of Reserved Pages in Firmware Queue */
 	write_nic_dword(dev, RQPN1,
-		NUM_OF_PAGE_IN_FW_QUEUE_BK << RSVD_FW_QUEUE_PAGE_BK_SHIFT |
-		NUM_OF_PAGE_IN_FW_QUEUE_BE << RSVD_FW_QUEUE_PAGE_BE_SHIFT |
-		NUM_OF_PAGE_IN_FW_QUEUE_VI << RSVD_FW_QUEUE_PAGE_VI_SHIFT |
-		NUM_OF_PAGE_IN_FW_QUEUE_VO << RSVD_FW_QUEUE_PAGE_VO_SHIFT);
+			NUM_OF_PAGE_IN_FW_QUEUE_BK << RSVD_FW_QUEUE_PAGE_BK_SHIFT |
+			NUM_OF_PAGE_IN_FW_QUEUE_BE << RSVD_FW_QUEUE_PAGE_BE_SHIFT |
+			NUM_OF_PAGE_IN_FW_QUEUE_VI << RSVD_FW_QUEUE_PAGE_VI_SHIFT |
+			NUM_OF_PAGE_IN_FW_QUEUE_VO << RSVD_FW_QUEUE_PAGE_VO_SHIFT);
 	write_nic_dword(dev, RQPN2,
-		NUM_OF_PAGE_IN_FW_QUEUE_MGNT << RSVD_FW_QUEUE_PAGE_MGNT_SHIFT |
-		NUM_OF_PAGE_IN_FW_QUEUE_CMD << RSVD_FW_QUEUE_PAGE_CMD_SHIFT);
+			NUM_OF_PAGE_IN_FW_QUEUE_MGNT << RSVD_FW_QUEUE_PAGE_MGNT_SHIFT |
+			NUM_OF_PAGE_IN_FW_QUEUE_CMD << RSVD_FW_QUEUE_PAGE_CMD_SHIFT);
 	write_nic_dword(dev, RQPN3,
-		APPLIED_RESERVED_QUEUE_IN_FW |
-		NUM_OF_PAGE_IN_FW_QUEUE_BCN << RSVD_FW_QUEUE_PAGE_BCN_SHIFT);
+			APPLIED_RESERVED_QUEUE_IN_FW |
+			NUM_OF_PAGE_IN_FW_QUEUE_BCN << RSVD_FW_QUEUE_PAGE_BCN_SHIFT);
 	write_nic_dword(dev, RATR0 + 4 * 7, (RATE_ALL_OFDM_AG | RATE_ALL_CCK));
 
 	/* Set AckTimeout */
@@ -3019,7 +3019,7 @@ static void rtl819x_ifsilentreset(struct net_device *dev)
 }
 
 static void rtl819x_update_rxcounts(struct r8192_priv *priv, u32 *TotalRxBcnNum,
-			     u32 *TotalRxDataNum)
+				    u32 *TotalRxDataNum)
 {
 	u16			SlotIndex;
 	u16			i;
-- 
2.34.1

