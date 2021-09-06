Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF11B72
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:24 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id e21so15018568ejz.12
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LNRpiblACd1XahKWtsfFQ7za/HUNceoFV4adLbdklTA=;
        b=hwmUlISYfag/hx7lmRAr7b2/vMKc9HKCG+/PNNPkMDoFwn5MvPXqLL5334D2S66x4c
         TCpdViy1n6Tq6lTfxOLQIGDLAdhLS3CURabDvdFre4+8FIcyiQaH4hLZXZ8gkv5NB59H
         l9zavSqs+i+hKtm5nacXxN0Qx1TXmxgBWhSAshuYlf5Q1LfbTXxaSPB0pJMsNKReDox6
         nRUxpooejdYFGeS2ksLlYZnCMzqXTRIOxgkU+L3sies7uXjumeIMb6i4+Q2aZosUityk
         +yCJAxOddCoVcgMctyXGeQHMtg7B+ztYEi0323OsjoA+ZuFEHRCOVBewcFnz4HD2xD72
         b/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LNRpiblACd1XahKWtsfFQ7za/HUNceoFV4adLbdklTA=;
        b=G0oQTECKT+6JOtw+qZoE9dyxbm1LDKA35m1VP6xAB6Hg5uqU2QAsyQXRpUPAj35UIH
         uLIDrmq624J96ILT6Hkr0tYMG8TokWc1EEJ8sRdhdqM5maon6/MDumKZATlVpTq0Kagl
         CMWcx9Nr5tlm/1WagJk7v8Z1+wgmvQnyTIbajk2D5lyWp6BtzLjs8D6lvKOP/TrkgI09
         guPNUBdQrfYm3gHUK6qQjuk1TYME7FbpgngxWmSGibu9fM2ucPE1oNbqZGNWjRdAt3/m
         9sPwmocFRPSd2b+7RsuR31+0nNu3DY7iqccYYVa8TApj3HQoOhlhL/Li+6zRBw2HDnRi
         /Bqg==
X-Gm-Message-State: AOAM530hF69bYbCpAJyhqqFBBdeqXKdtZtS5ZKLhOXRCDBfZBzl9gbd8
	R9vyW3NLMMzqTXNUwqK4NZw=
X-Google-Smtp-Source: ABdhPJwmUqA46x3TshP4hbaLYRhE6sH36WO27r15STmqs7PUx5opVZpKgixTeYcsKBBzUNqd10kvJA==
X-Received: by 2002:a17:906:681a:: with SMTP id k26mr14640333ejr.506.1630954463286;
        Mon, 06 Sep 2021 11:54:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:23 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 28/40] staging: r8188eu: remove Efuse_PgPacketRead from hal_ops
Date: Mon,  6 Sep 2021 20:53:15 +0200
Message-Id: <20210906185327.10326-29-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove Efuse_PgPacketRead from hal_ops and remove its wrapper
Efuse_PgPacketRead(). Call rtl8188e_Efuse_PgPacketRead() directly
instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c        | 9 ---------
 drivers/staging/r8188eu/core/rtw_mp_ioctl.c     | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 ++---
 drivers/staging/r8188eu/include/hal_intf.h      | 3 +--
 drivers/staging/r8188eu/include/rtw_efuse.h     | 1 -
 5 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 9196a7925940..518ed5b2e8d2 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -247,15 +247,6 @@ u8 efuse_OneByteWrite(struct adapter *pAdapter, u16 addr, u8 data, bool pseudo)
 	return result;
 }
 
-int Efuse_PgPacketRead(struct adapter *pAdapter, u8 offset, u8 *data, bool pseudo)
-{
-	int	ret = 0;
-
-	ret =  pAdapter->HalFunc.Efuse_PgPacketRead(pAdapter, offset, data, pseudo);
-
-	return ret;
-}
-
 int Efuse_PgPacketWrite(struct adapter *pAdapter, u8 offset, u8 word_en, u8 *data, bool pseudo)
 {
 	int ret;
diff --git a/drivers/staging/r8188eu/core/rtw_mp_ioctl.c b/drivers/staging/r8188eu/core/rtw_mp_ioctl.c
index 48f0f3b8dbb8..4c56c0da7625 100644
--- a/drivers/staging/r8188eu/core/rtw_mp_ioctl.c
+++ b/drivers/staging/r8188eu/core/rtw_mp_ioctl.c
@@ -974,7 +974,7 @@ int rtl8188eu_oid_rt_pro_rw_efuse_pgpkt_hdl(struct oid_par_priv *poid_par_priv)
 
 	if (poid_par_priv->type_of_oid == QUERY_OID) {
 		rtl8188e_EfusePowerSwitch(Adapter, false, true);
-		if (Efuse_PgPacketRead(Adapter, ppgpkt->offset, ppgpkt->data, false))
+		if (rtl8188e_Efuse_PgPacketRead(Adapter, ppgpkt->offset, ppgpkt->data, false))
 			*poid_par_priv->bytes_rw = poid_par_priv->information_buf_len;
 		else
 			status = NDIS_STATUS_FAILURE;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 8b7fde0a49f1..9cbb13a07f83 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1294,7 +1294,7 @@ static int Hal_EfusePgPacketRead_Pseudo(struct adapter *pAdapter, u8 offset, u8
 	return ret;
 }
 
-static int rtl8188e_Efuse_PgPacketRead(struct adapter *pAdapter, u8 offset, u8 *data, bool bPseudoTest)
+int rtl8188e_Efuse_PgPacketRead(struct adapter *pAdapter, u8 offset, u8 *data, bool bPseudoTest)
 {
 	int	ret;
 
@@ -1313,7 +1313,7 @@ static bool hal_EfuseFixHeaderProcess(struct adapter *pAdapter, u8 efuseType, st
 
 	memset((void *)originaldata, 0xff, 8);
 
-	if (Efuse_PgPacketRead(pAdapter, pFixPkt->offset, originaldata, bPseudoTest)) {
+	if (rtl8188e_Efuse_PgPacketRead(pAdapter, pFixPkt->offset, originaldata, bPseudoTest)) {
 		/* check if data exist */
 		badworden = Efuse_WordEnableDataWrite(pAdapter, efuse_addr + 1, pFixPkt->word_en, originaldata, bPseudoTest);
 
@@ -1782,7 +1782,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->write_rfreg = &rtl8188e_PHY_SetRFReg;
 
 	/*  Efuse related function */
-	pHalFunc->Efuse_PgPacketRead = &rtl8188e_Efuse_PgPacketRead;
 	pHalFunc->Efuse_PgPacketWrite = &rtl8188e_Efuse_PgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &rtl8188e_Efuse_WordEnableDataWrite;
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 640195a4c830..115d2598b3b0 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -177,8 +177,6 @@ struct hal_ops {
 			       enum rf_radio_path eRFPath, u32 RegAddr,
 			       u32 BitMask, u32 Data);
 
-	int	(*Efuse_PgPacketRead)(struct adapter *adapter, u8 offset,
-				      u8 *data, bool bPseudoTest);
 	int	(*Efuse_PgPacketWrite)(struct adapter *padapter, u8 offset,
 				       u8 word_en, u8 *data, bool bPseudoTest);
 	u8	(*Efuse_WordEnableDataWrite)(struct adapter *padapter,
@@ -220,6 +218,7 @@ void rtl8188e_ReadEFuse(struct adapter *Adapter, u8 efuseType,
 void rtl8188e_EFUSE_GetEfuseDefinition(struct adapter *pAdapter, u8 efuseType,
 				       u8 type, void *pOut, bool bPseudoTest);
 u16 rtl8188e_EfuseGetCurrentSize(struct adapter *pAdapter, u8 efuseType, bool bPseudoTest);
+int rtl8188e_Efuse_PgPacketRead(struct adapter *pAdapter, u8 offset, u8 *data, bool bPseudoTest);
 
 void	rtw_hal_free_data(struct adapter *padapter);
 uint rtw_hal_init(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index 5cd1313dbe36..d19ef73be39e 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -116,7 +116,6 @@ void ReadEFuseByte(struct adapter *adapter, u16 _offset, u8 *pbuf, bool test);
 u8 efuse_OneByteRead(struct adapter *adapter, u16 addr, u8 *data, bool test);
 u8 efuse_OneByteWrite(struct adapter *adapter, u16 addr, u8 data, bool	test);
 
-int Efuse_PgPacketRead(struct adapter *adapt, u8 offset, u8 *data, bool test);
 int Efuse_PgPacketWrite(struct adapter *adapter, u8 offset, u8 word, u8 *data,
 			bool test);
 void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata);
-- 
2.33.0

