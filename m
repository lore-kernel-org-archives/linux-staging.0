Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13F2CA0
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:43 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id k18so9844236wrg.11
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yp5wNv6VBbDR2yyVQEw341AYk8xxeyzuXqbG6s7Nz1I=;
        b=MkjNJctKYG9b7nlBd3uPDBCOZ+dXvkqoS+se3ubKf6WH6zJZK9YeQMyYJGyLnkhzJ+
         fkSE8DFo9s9f1v08ZsDgn94YpDpZjfltxoDVBnHRdSC3hh8na92l4EN5RfyuohK5bkRV
         Fccp/dx8GJf68WEjm5OjurFiMVbNGALlItgbBh7ofwNfhr8vwYp7dogeeA0OuvximDd5
         qrciY9kkFnFtzFlUm2Tl0nYc1iEAQxlbg9pkTEggGyQCArEBoeMIAz/bKxFbZqXmxurX
         AcPVlNKyZG9VFEoN//AQZAIWHASuNCq9WXAULOFtMTyv3J4YXOxv2PSneC+DLg7s4LEp
         BCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yp5wNv6VBbDR2yyVQEw341AYk8xxeyzuXqbG6s7Nz1I=;
        b=2fif3lJKvYLg5j0ATjycJMehRo/3yPEVDV70TAUb0eVIkzBiARFM0+osDHiTaIWcsX
         P1xoUbfQztMsJEd6K7lC6K/0E6AvCc7lOX8qlZokS8d2Rklxvee6gWxZnmCdPr+egzL2
         VlorcI+wdUBy/02O2V98T50dAk0Yk4hNxpRpmiohk73CStE6pYtuHODimUxq6ui6ii4U
         DbQn0dJXsfOMkZHAbNS+lKnH6OFDQ7OLhTfePZPSEFCmPYyIbY2xAdWRqm3cN1vg/f0g
         OplbkC4vEJ+0CEOZ5+wq1w6OGpI2dMBTaSr8KXILv3Sp3GClgTV5jiapKkM1Ah6h6oDC
         ohSA==
X-Gm-Message-State: AOAM532u+USIO1f0zbFSsoOEqbLa4Pit6yR7nCSmClC+JOOl1gWFAa4I
	iS50O9O67ixr0Jew3r2oVlk=
X-Google-Smtp-Source: ABdhPJyqDIMVWuQLoqsWFjmSmjo9iDtkeQHD0IYck7KjMhT4n6SSj7KWWKq4rYWG/x+NIlNApNVwzg==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr22146098wrc.29.1640811102283;
        Wed, 29 Dec 2021 12:51:42 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:42 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 22/32] staging: r8188eu: make odm_FalseAlarmCounterStatistics() static
Date: Wed, 29 Dec 2021 21:50:58 +0100
Message-Id: <20211229205108.26373-23-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_FalseAlarmCounterStatistics() is only used in odm.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 116 +++++++++---------
 drivers/staging/r8188eu/include/odm_precomp.h |   1 -
 2 files changed, 56 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index d933d60a77ac..6e3325721c7b 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -373,6 +373,62 @@ static void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm)
 	pDM_PSTable->initialize = 0;
 }
 
+static void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm)
+{
+	u32 ret_value;
+	struct false_alarm_stats *FalseAlmCnt = &pDM_Odm->FalseAlmCnt;
+	struct adapter *adapter = pDM_Odm->Adapter;
+
+	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
+		return;
+
+	/* hold ofdm counter */
+	rtl8188e_PHY_SetBBReg(adapter, ODM_REG_OFDM_FA_HOLDC_11N, BIT(31), 1); /* hold page C counter */
+	rtl8188e_PHY_SetBBReg(adapter, ODM_REG_OFDM_FA_RSTD_11N, BIT(31), 1); /* hold page D counter */
+
+	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_OFDM_FA_TYPE1_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_Fast_Fsync = (ret_value & 0xffff);
+	FalseAlmCnt->Cnt_SB_Search_fail = ((ret_value & 0xffff0000) >> 16);
+	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_OFDM_FA_TYPE2_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_OFDM_CCA = (ret_value & 0xffff);
+	FalseAlmCnt->Cnt_Parity_Fail = ((ret_value & 0xffff0000) >> 16);
+	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_OFDM_FA_TYPE3_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_Rate_Illegal = (ret_value & 0xffff);
+	FalseAlmCnt->Cnt_Crc8_fail = ((ret_value & 0xffff0000) >> 16);
+	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_OFDM_FA_TYPE4_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_Mcs_fail = (ret_value & 0xffff);
+
+	FalseAlmCnt->Cnt_Ofdm_fail = FalseAlmCnt->Cnt_Parity_Fail + FalseAlmCnt->Cnt_Rate_Illegal +
+				     FalseAlmCnt->Cnt_Crc8_fail + FalseAlmCnt->Cnt_Mcs_fail +
+				     FalseAlmCnt->Cnt_Fast_Fsync + FalseAlmCnt->Cnt_SB_Search_fail;
+
+	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_SC_CNT_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_BW_LSC = (ret_value & 0xffff);
+	FalseAlmCnt->Cnt_BW_USC = ((ret_value & 0xffff0000) >> 16);
+
+	/* hold cck counter */
+	rtl8188e_PHY_SetBBReg(adapter, ODM_REG_CCK_FA_RST_11N, BIT(12), 1);
+	rtl8188e_PHY_SetBBReg(adapter, ODM_REG_CCK_FA_RST_11N, BIT(14), 1);
+
+	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_CCK_FA_LSB_11N, bMaskByte0);
+	FalseAlmCnt->Cnt_Cck_fail = ret_value;
+	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_CCK_FA_MSB_11N, bMaskByte3);
+	FalseAlmCnt->Cnt_Cck_fail +=  (ret_value & 0xff) << 8;
+
+	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_CCK_CCA_CNT_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_CCK_CCA = ((ret_value & 0xFF) << 8) | ((ret_value & 0xFF00) >> 8);
+
+	FalseAlmCnt->Cnt_all = (FalseAlmCnt->Cnt_Fast_Fsync +
+				FalseAlmCnt->Cnt_SB_Search_fail +
+				FalseAlmCnt->Cnt_Parity_Fail +
+				FalseAlmCnt->Cnt_Rate_Illegal +
+				FalseAlmCnt->Cnt_Crc8_fail +
+				FalseAlmCnt->Cnt_Mcs_fail +
+				FalseAlmCnt->Cnt_Cck_fail);
+
+	FalseAlmCnt->Cnt_CCA_all = FalseAlmCnt->Cnt_OFDM_CCA + FalseAlmCnt->Cnt_CCK_CCA;
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -507,66 +563,6 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 	}
 }
 
-/* 3============================================================ */
-/* 3 FASLE ALARM CHECK */
-/* 3============================================================ */
-
-void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm)
-{
-	u32 ret_value;
-	struct false_alarm_stats *FalseAlmCnt = &pDM_Odm->FalseAlmCnt;
-	struct adapter *adapter = pDM_Odm->Adapter;
-
-	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
-		return;
-
-	/* hold ofdm counter */
-	rtl8188e_PHY_SetBBReg(adapter, ODM_REG_OFDM_FA_HOLDC_11N, BIT(31), 1); /* hold page C counter */
-	rtl8188e_PHY_SetBBReg(adapter, ODM_REG_OFDM_FA_RSTD_11N, BIT(31), 1); /* hold page D counter */
-
-	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_OFDM_FA_TYPE1_11N, bMaskDWord);
-	FalseAlmCnt->Cnt_Fast_Fsync = (ret_value & 0xffff);
-	FalseAlmCnt->Cnt_SB_Search_fail = ((ret_value & 0xffff0000) >> 16);
-	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_OFDM_FA_TYPE2_11N, bMaskDWord);
-	FalseAlmCnt->Cnt_OFDM_CCA = (ret_value & 0xffff);
-	FalseAlmCnt->Cnt_Parity_Fail = ((ret_value & 0xffff0000) >> 16);
-	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_OFDM_FA_TYPE3_11N, bMaskDWord);
-	FalseAlmCnt->Cnt_Rate_Illegal = (ret_value & 0xffff);
-	FalseAlmCnt->Cnt_Crc8_fail = ((ret_value & 0xffff0000) >> 16);
-	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_OFDM_FA_TYPE4_11N, bMaskDWord);
-	FalseAlmCnt->Cnt_Mcs_fail = (ret_value & 0xffff);
-
-	FalseAlmCnt->Cnt_Ofdm_fail = FalseAlmCnt->Cnt_Parity_Fail + FalseAlmCnt->Cnt_Rate_Illegal +
-				     FalseAlmCnt->Cnt_Crc8_fail + FalseAlmCnt->Cnt_Mcs_fail +
-				     FalseAlmCnt->Cnt_Fast_Fsync + FalseAlmCnt->Cnt_SB_Search_fail;
-
-	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_SC_CNT_11N, bMaskDWord);
-	FalseAlmCnt->Cnt_BW_LSC = (ret_value & 0xffff);
-	FalseAlmCnt->Cnt_BW_USC = ((ret_value & 0xffff0000) >> 16);
-
-	/* hold cck counter */
-	rtl8188e_PHY_SetBBReg(adapter, ODM_REG_CCK_FA_RST_11N, BIT(12), 1);
-	rtl8188e_PHY_SetBBReg(adapter, ODM_REG_CCK_FA_RST_11N, BIT(14), 1);
-
-	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_CCK_FA_LSB_11N, bMaskByte0);
-	FalseAlmCnt->Cnt_Cck_fail = ret_value;
-	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_CCK_FA_MSB_11N, bMaskByte3);
-	FalseAlmCnt->Cnt_Cck_fail +=  (ret_value & 0xff) << 8;
-
-	ret_value = rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_CCK_CCA_CNT_11N, bMaskDWord);
-	FalseAlmCnt->Cnt_CCK_CCA = ((ret_value & 0xFF) << 8) | ((ret_value & 0xFF00) >> 8);
-
-	FalseAlmCnt->Cnt_all = (FalseAlmCnt->Cnt_Fast_Fsync +
-				FalseAlmCnt->Cnt_SB_Search_fail +
-				FalseAlmCnt->Cnt_Parity_Fail +
-				FalseAlmCnt->Cnt_Rate_Illegal +
-				FalseAlmCnt->Cnt_Crc8_fail +
-				FalseAlmCnt->Cnt_Mcs_fail +
-				FalseAlmCnt->Cnt_Cck_fail);
-
-	FalseAlmCnt->Cnt_CCA_all = FalseAlmCnt->Cnt_OFDM_CCA + FalseAlmCnt->Cnt_CCK_CCA;
-}
-
 /* 3============================================================ */
 /* 3 CCK Packet Detect Threshold */
 /* 3============================================================ */
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 259e0de93144..de95948c7325 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -33,7 +33,6 @@
 
 void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm);
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
-void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm);
 void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm);
-- 
2.34.1

