Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDD42FB0
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 13:10:16 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id f2so23567009wri.11
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6aSbeaV8aUHmxt7bo4GWSO+UYVKMaQnwiL3Al5lNldQ=;
        b=sD/NI0kSg7pa+zM6LyAbeIRz9QFuoeVOvzKhCEcF6XnqDmn29LVeAaykYbmOVO8SM5
         0Xe8JgHKWrZiOarF/79i9uRGMT9ZkyGpQQdUbk2hBb2NYO95C6679YxmHyDMA6f+e0Rs
         Y075ghCe2FYt/6BFFN8nzUWDOVM/pw2LJW2CkTS/VGlsuKL7a/wAR2kug/uuimCA1Q32
         HgwG4xWcDsmEJR+ble0DJIG1uUz2i+7NPxViKNj317tolftomLc9GgeyOp+wF4jwXST5
         77D3uKt8AGIhcWDuVaqm0jEz2roBy9uahRB1y/XVbag26o9oYM/8J+xM+oz6nydGXr+t
         pnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6aSbeaV8aUHmxt7bo4GWSO+UYVKMaQnwiL3Al5lNldQ=;
        b=SUIZL1D3Lxzn9/BJE1IlYc2wMxlN+62J6MFbLG93e+3+g0YoWBjWNdlYXcclm2+neY
         Ntq86MzsXaJFu+KjgBopbmI0YrY5I97OqOIDvzBQrVtu+gwbBagBV4AocMV9VMDoTQuV
         FcsNIlxTqiVAfQAhkAQ5s9LGQ1Pp75CDK+9gKvKUSW21x5pyBlTYe6v9Z7eSRgByrBLM
         xXfczmDC8dClw9r54EO5lTeqbdZ0Z0JYac5I7FGOFtJwO5b7mjUmP5+lzCcZ8SR4wCvv
         Z+j/n9m+GKXNfT6SYS0m5tb4HN0jFy2NuYx6q778wGTY1r8FgduXZKTb/0mTVAA8iSCf
         OC+g==
X-Gm-Message-State: AOAM530oJsG1cow7Limf8emnPjlfhSnZfywfP8Aub6rloHh+EwIaQ6rl
	sFlHMbMb2kPzxTXCnLPcdaE=
X-Google-Smtp-Source: ABdhPJwPwK7NzOQ+8JPE54/NQN+ICjYxw/HnFQKRFPpcepbDWgpCJTdLtF4EvXV6cS9U/jBPLs7Epw==
X-Received: by 2002:adf:fd04:: with SMTP id e4mr4585519wrr.11.1624367415446;
        Tue, 22 Jun 2021 06:10:15 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id r12sm14911926wrn.2.2021.06.22.06.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:10:15 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/17] staging: rtl8723bs: beautify prototypes in include/hal_com_phycfg.h
Date: Tue, 22 Jun 2021 15:09:52 +0200
Message-Id: <8f6796cbbe726dd912fababe94b3dd1d8dcabbb7.1624367071.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624367071.git.fabioaiuto83@gmail.com>
References: <cover.1624367071.git.fabioaiuto83@gmail.com>
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

