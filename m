Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B512670
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:47:35 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso10298134wmh.4
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 03:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6aSbeaV8aUHmxt7bo4GWSO+UYVKMaQnwiL3Al5lNldQ=;
        b=Q0azFpGXsNN66/8Sj2LgkoZJ6eN884VR3awDIz4TJgf5fD2dc5gbi0mSBcqd1xNcSj
         U8ukrv88cSMoV31HPnmxpDPez+3CYqDwjHCs7ZAhedj7WU+IrBRRU/XUk6r5UTKcFhJX
         UHjVDdZsljkKDUANUCg7yEsaGi2/8f5mc32OJuoBdqUQKP9ReDwA3446hpIyoMiLeyZ9
         AZP3J+06u8a4UefAipLZrGmR+TwtsixBgEyt869YWLD4qjQq4T3dVdMiG447RjrCFpZg
         pcZOwQQouFaek2skYPKcW8M8wRVJBYBkieyvHUcVuE9oytvZVt6Na6QYBDvc9bM4C73C
         fivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6aSbeaV8aUHmxt7bo4GWSO+UYVKMaQnwiL3Al5lNldQ=;
        b=jkS747moB+ZotwJooeu/vBdFIuKbxcXbE8kbbbbl4vpYKzTPdqF3p6MuO01eZWIT0g
         3nQzo0b3oq8xGvpAEjCA1pJVk+M+D8MeziC6zFW/3QZf0ZJLXUzRu9U8F0xoAGEEY5Uz
         QLDpUzHeBkwEJWhx8yug3inRC2oFmUm8/O36oPgA6v4FLfgtCF+KMCVZ0jjO+K0NMA2O
         9E3E3P08op0lySE7xn8gdhLjNYrj9MfriSxFcpg5H0UuJBCt/oLcX/5cfPzje75a04Br
         FMIXI/Ip3xOpL+c/J/QXukLLyAln1QKjus0ack69PFzcw3KX7ocrPhn9repWVv3W1k7T
         Vspg==
X-Gm-Message-State: AOAM532VpKNPexLxxzL4Rli0SBJkM5dipcp6GTqc8raPWWtDax+xUlu6
	KT01JKVXbauYZC+L0sqew0s=
X-Google-Smtp-Source: ABdhPJxDbG4F6aRfUgEj7qX7pFUk1GhET89T/BPq+6EAiYCMs4wLqdEyl5CoyVmlkh6AVZm99y6BOA==
X-Received: by 2002:a7b:cd94:: with SMTP id y20mr8631797wmj.145.1624099654342;
        Sat, 19 Jun 2021 03:47:34 -0700 (PDT)
Received: from agape ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id i21sm12704202wmq.12.2021.06.19.03.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 03:47:34 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/18] staging: rtl8723bs: beautify prototypes in include/hal_com_phycfg.h
Date: Sat, 19 Jun 2021 12:47:11 +0200
Message-Id: <ae9dcad7b9e63a06baa3be792c7e243e675e7e2a.1624099125.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624099125.git.fabioaiuto83@gmail.com>
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

beautify function prototypes in incldue/hal_com_phycfg.h
in order to ease grep searches.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../rtl8723bs/include/hal_com_phycfg.h        | 188 +++++-------------
 1 file changed, 48 insertions(+), 140 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
index a30e1e09826d..3d95ab1986b1 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
@@ -70,147 +70,55 @@ struct bb_register_def {
 
 };
 
-u8
-PHY_GetTxPowerByRateBase(
-struct adapter *Adapter,
-u8 		RfPath,
-u8 		TxNum,
-enum rate_section	RateSection
-	);
-
-u8
-PHY_GetRateSectionIndexOfTxPowerByRate(
-struct adapter *padapter,
-u32 		RegAddr,
-u32 		BitMask
-	);
-
-void
-PHY_GetRateValuesOfTxPowerByRate(
-struct adapter *padapter,
-u32 		RegAddr,
-u32 		BitMask,
-u32 		Value,
-u8		*RateIndex,
-s8		*PwrByRateVal,
-u8		*RateNum
-	);
-
-u8
-PHY_GetRateIndexOfTxPowerByRate(
-u8 Rate
-	);
-
-void
-PHY_SetTxPowerIndexByRateSection(
-struct adapter *padapter,
-u8 		RFPath,
-u8 		Channel,
-u8 		RateSection
-	);
-
-s8
-PHY_GetTxPowerByRate(
-struct adapter *padapter,
-u8 	RFPath,
-u8 	TxNum,
-u8 	RateIndex
-	);
-
-void
-PHY_SetTxPowerByRate(
-struct adapter *padapter,
-u8 	RFPath,
-u8 	TxNum,
-u8 	Rate,
-s8			Value
-	);
-
-void
-PHY_SetTxPowerLevelByPath(
-struct adapter *Adapter,
-u8 	channel,
-u8 	path
-	);
-
-void
-PHY_SetTxPowerIndexByRateArray(
-struct adapter *padapter,
-u8 		RFPath,
-enum channel_width	BandWidth,
-u8 		Channel,
-u8		*Rates,
-u8 		RateArraySize
-	);
-
-void
-PHY_InitTxPowerByRate(
-struct adapter *padapter
-	);
-
-void
-PHY_StoreTxPowerByRate(
-struct adapter *padapter,
-u32 		RfPath,
-u32 		TxNum,
-u32 		RegAddr,
-u32 		BitMask,
-u32 		Data
-	);
-
-void
-PHY_TxPowerByRateConfiguration(
-	struct adapter *padapter
-	);
-
-u8
-PHY_GetTxPowerIndexBase(
-struct adapter *padapter,
-u8 		RFPath,
-u8 		Rate,
-enum channel_width	BandWidth,
-u8 		Channel
-	);
+u8 PHY_GetTxPowerByRateBase(struct adapter *Adapter, u8 RfPath, u8 TxNum,
+			    enum rate_section RateSection);
+
+u8 PHY_GetRateSectionIndexOfTxPowerByRate(struct adapter *padapter, u32	RegAddr,
+					  u32 BitMask);
+
+void PHY_GetRateValuesOfTxPowerByRate(struct adapter *padapter, u32 RegAddr,
+				      u32 BitMask, u32 Value, u8 *RateIndex,
+				      s8 *PwrByRateVal, u8 *RateNum);
+
+u8 PHY_GetRateIndexOfTxPowerByRate(u8 Rate);
+
+void PHY_SetTxPowerIndexByRateSection(struct adapter *padapter, u8 RFPath, u8 Channel,
+				      u8 RateSection);
+
+s8 PHY_GetTxPowerByRate(struct adapter *padapter, u8 RFPath, u8	TxNum, u8 RateIndex);
+
+void PHY_SetTxPowerByRate(struct adapter *padapter, u8 RFPath, u8 TxNum, u8 Rate,
+			  s8 Value);
+
+void PHY_SetTxPowerLevelByPath(struct adapter *Adapter, u8 channel, u8 path);
+
+void PHY_SetTxPowerIndexByRateArray(struct adapter *padapter, u8 RFPath,
+				    enum channel_width BandWidth, u8 Channel,
+				    u8 *Rates, u8 RateArraySize);
+
+void PHY_InitTxPowerByRate(struct adapter *padapter);
+
+void PHY_StoreTxPowerByRate(struct adapter *padapter, u32 RfPath, u32 TxNum,
+			    u32	RegAddr, u32 BitMask, u32 Data);
+
+void PHY_TxPowerByRateConfiguration(struct adapter *padapter);
+
+u8 PHY_GetTxPowerIndexBase(struct adapter *padapter, u8 RFPath, u8 Rate,
+			   enum channel_width BandWidth, u8 Channel);
 
 s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 RegPwrTblSel,
-		      enum channel_width Bandwidth,
-u8 		RfPath,
-u8 		DataRate,
-u8 		Channel
-	);
-
-void
-PHY_SetTxPowerLimit(
-struct adapter *Adapter,
-u8 			*Regulation,
-u8 			*Bandwidth,
-u8 			*RateSection,
-u8 			*RfPath,
-u8 			*Channel,
-u8 			*PowerLimit
-	);
-
-void
-PHY_ConvertTxPowerLimitToPowerIndex(
-struct adapter *Adapter
-	);
-
-void
-PHY_InitTxPowerLimit(
-struct adapter *Adapter
-	);
-
-s8
-PHY_GetTxPowerTrackingOffset(
-	struct adapter *padapter,
-	u8 	Rate,
-	u8 	RFPath
-	);
-
-void
-Hal_ChannelPlanToRegulation(
-struct adapter *Adapter,
-u16 			ChannelPlan
-	);
+		      enum channel_width Bandwidth, u8 RfPath, u8 DataRate,
+		      u8 Channel);
+
+void PHY_SetTxPowerLimit(struct adapter *Adapter, u8 *Regulation, u8 *Bandwidth,
+			 u8 *RateSection, u8 *RfPath, u8 *Channel, u8 *PowerLimit);
+
+void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter);
+
+void PHY_InitTxPowerLimit(struct adapter *Adapter);
+
+s8 PHY_GetTxPowerTrackingOffset(struct adapter *padapter, u8 Rate, u8 RFPath);
+
+void Hal_ChannelPlanToRegulation(struct adapter *Adapter, u16 ChannelPlan);
 
 #endif /* __HAL_COMMON_H__ */
-- 
2.20.1

