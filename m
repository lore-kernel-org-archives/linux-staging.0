Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4765F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 16:50:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id j18so11435990wra.2
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/KvhKqY0FhOGmnXainQe9b9QiX8xZLkFH7E/LGoCkw=;
        b=fp3HA9hwH888rltxKc6xzybYgEUD8Pve7eCg3Nf3rwAOXdFOrgEs21Vpg3fUWjx3AZ
         3xledXILqGZfcd0q/f9BYD1mUCI/MwAhNLh5CkVpa5zvNIK5zDrBlaz8u7UboDxFjSYV
         hdgIfxIVDwXWdSOhpCmQbazxmZFGuWsObDK/+GWiJUEk4zOjGvWSexYvWViJLY0chwjh
         zQdHF9lAiP2BS1TnF3YHcgiikObip/0WeZaau243Mma27OX2sVLM8AeZ3AUj7V1xBn2Y
         6IkhE9kcQ7zjuFBjwRVOTg9/Wa+xJK1PxdIkgpwdV/U7O0rX/LeKEIiPBTm3nsMnRUDZ
         +1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/KvhKqY0FhOGmnXainQe9b9QiX8xZLkFH7E/LGoCkw=;
        b=DvYv+dnyjNRtggQGHwrQ6CcslnOlhnQ3b4jQFR3vp++qUfQM6sPgmHMeARHB61D3DE
         7WjcPyOnYN0+ZlAt+XDqsHAnYMx7PG9XbuoBBWUeeawBRo2B1lbLtMDgcpi3RAgGf6BK
         NLymWtzPc/rUTxb9OXsSm2sNOjchNNecrRQnKFkLd3X1eD7sLYj0PLYsa/lyx8qGE44I
         ysHYNZ7O7nbAw2eMU2Kfd0+JHmD4a1YLzkvcg3YTqwKQYjl/HPPf7OXhv0cfonoF7gcD
         NycJcHYpIngkwmFwecTMoYs80AloIkp0ik/7UuYfqyjK4F2MKwVQc0/4hS8OSRJP9mib
         8gTg==
X-Gm-Message-State: AOAM53396wYwz1NqF3afIvDFi7wFAWWRdVF9Uv6wvyflqZDOUzt7n7bE
	zhAUCndtQFad/RmKYPLUu9w=
X-Google-Smtp-Source: ABdhPJyeyPHoqR6rFcWeBivPOieuGXmaLRlJ3n3PgZ/gNpVkdObunpQP3NquopHzTQ2SsbSbKl+4Mg==
X-Received: by 2002:a5d:6985:: with SMTP id g5mr12459695wru.355.1617641418463;
        Mon, 05 Apr 2021 09:50:18 -0700 (PDT)
Received: from agape ([5.171.72.58])
        by smtp.gmail.com with ESMTPSA id j6sm69394wmq.16.2021.04.05.09.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 09:50:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 04/10] staging: rtl8723bs: remove empty if, else blocks after RT_TRACE deletion
Date: Mon,  5 Apr 2021 18:49:51 +0200
Message-Id: <0ce82ac515ba5f6b6318e63d910ad61d7a61de35.1617640221.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617640221.git.fabioaiuto83@gmail.com>
References: <cover.1617640221.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all if, else if, else blocks left empty after
RT_TRACE macro deletion.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 15 ---------------
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  7 -------
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c    |  3 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c          |  1 -
 4 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 39fb659bc06f..9c544b5888d0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -64,9 +64,6 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 	blockCount_p1 = buffSize / blockSize_p1;
 	remainSize_p1 = buffSize % blockSize_p1;
 
-	if (blockCount_p1) {
-	}
-
 	for (i = 0; i < blockCount_p1; i++) {
 		ret = rtw_write32(padapter, (FW_8723B_START_ADDRESS + i * blockSize_p1), *((u32 *)(bufferPtr + i * blockSize_p1)));
 		if (ret == _FAIL) {
@@ -81,10 +78,6 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 
 		blockCount_p2 = remainSize_p1/blockSize_p2;
 		remainSize_p2 = remainSize_p1%blockSize_p2;
-
-		if (blockCount_p2) {
-		}
-
 	}
 
 	/* 3 Phase #3 */
@@ -2266,8 +2259,6 @@ static bool Hal_GetChnlGroup8723B(u8 Channel, u8 *pGroup)
 			*pGroup = 3;
 		else if (12 <= Channel && Channel <= 14)
 			*pGroup = 4;
-		else {
-		}
 	} else {
 		bIn24G = false;
 
@@ -2299,9 +2290,6 @@ static bool Hal_GetChnlGroup8723B(u8 Channel, u8 *pGroup)
 			*pGroup = 12;
 		else if (173  <= Channel && Channel <= 177)
 			*pGroup = 13;
-		else {
-		}
-
 	}
 	return bIn24G;
 }
@@ -3022,7 +3010,6 @@ static void rtl8723b_fill_default_txdesc(
 			ptxdesc->spe_rpt = 1;
 			ptxdesc->sw_define = (u8)(GET_PRIMARY_ADAPTER(padapter)->xmitpriv.seq_no);
 		}
-	} else if (pxmitframe->frame_tag == TXAGG_FRAMETAG) {
 	} else {
 		ptxdesc->macid = pattrib->mac_id; /*  CAM_ID(MAC_ID) */
 		ptxdesc->rate_id = pattrib->raid; /*  Rate ID */
@@ -4258,8 +4245,6 @@ void rtl8723b_start_thread(struct adapter *padapter)
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
 
 	xmitpriv->SdioXmitThread = kthread_run(rtl8723bs_xmit_thread, padapter, "RTWHALXT");
-	if (IS_ERR(xmitpriv->SdioXmitThread)) {
-	}
 }
 
 void rtl8723b_stop_thread(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index e5f0e48db557..62dd5b582e1c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -550,7 +550,6 @@ void PHY_SetTxPowerIndex(
 			DBG_871X("Invalid Rate!!\n");
 			break;
 		}
-	} else {
 	}
 }
 
@@ -648,8 +647,6 @@ static u8 phy_GetSecondaryChnl_8723B(struct adapter *Adapter)
 			SCSettingOf40 = VHT_DATA_SC_40_LOWER_OF_80MHZ;
 		else if (pHalData->nCur80MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 			SCSettingOf40 = VHT_DATA_SC_40_UPPER_OF_80MHZ;
-		else
-			{}
 
 		if (
 			(pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) &&
@@ -671,15 +668,11 @@ static u8 phy_GetSecondaryChnl_8723B(struct adapter *Adapter)
 			(pHalData->nCur80MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 		)
 			SCSettingOf20 = VHT_DATA_SC_20_UPPERST_OF_80MHZ;
-		else
-			{}
 	} else if (pHalData->CurrentChannelBW == CHANNEL_WIDTH_40) {
 		if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 			SCSettingOf20 = VHT_DATA_SC_20_UPPER_OF_80MHZ;
 		else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
 			SCSettingOf20 = VHT_DATA_SC_20_LOWER_OF_80MHZ;
-		else
-			{}
 	}
 
 	return  (SCSettingOf40 << 4) | SCSettingOf20;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index d27d56920a11..ce7a72701455 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -345,8 +345,7 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 					if (pattrib->physt)
 						update_recvframe_phyinfo(precvframe, (struct phy_stat *)ptr);
 
-					if (rtw_recv_entry(precvframe) != _SUCCESS) {
-					}
+					rtw_recv_entry(precvframe);
 				} else if (pattrib->pkt_rpt_type == C2H_PACKET) {
 					struct c2h_evt_hdr_t	C2hEvent;
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 4777793e752d..acbb811ced5a 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -1040,7 +1040,6 @@ void sd_int_hdl(struct adapter *adapter)
 			SdioLocalCmd52Write4Byte(adapter, SDIO_REG_HISR, v32);
 
 		sd_int_dpc(adapter);
-	} else {
 	}
 }
 
-- 
2.20.1

