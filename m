Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2660968
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 19:23:21 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r25so2117036edq.7
        for <linux-staging@lists.linux.dev>; Thu, 02 Dec 2021 11:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k8V8pUt+WGRfiTwkpc4qq8UAMQGA384FOQPAoawdWxk=;
        b=aJn2GDAYGc4lLQSokkKvenVD4jG39KQr24RuiyIRm+RxCSL6OaHgrb6Ia492EHFWjk
         7htXHtYU9UI0K3YlC9UClnx+objx8S1ASmrqEGf+XB8nJovoYS+qshyS7g9mtg/5wHLI
         hqLS+5HAxuRCTwbrVZMtogWeWHpVUinCL84uc6Xym/uoIGGydCSiawPbNyd1P7Kz8y3j
         1TzOV6ivgetMG/0V75KHYJgpSQFciUSPm0QnI08CoathzDAMrYbpJNXBv2RFk+KYXo9z
         p31qPWG3DajtXYZ2B8Fnb+SrdN55EXxTX60RFFseQT/lsw1HFpA9npaH12z1SCN+ditr
         o2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k8V8pUt+WGRfiTwkpc4qq8UAMQGA384FOQPAoawdWxk=;
        b=msdAFUNCPnjNiiVAXmemM8DFwyNJcbwXAFs3L1s+dXy41/QMDw/3Pu6JSrkpr4ThCB
         4UQuK1rUlRjIlQen5iAN3qy5nkbX+JBUpHiMjBcfRoDnSYDolVwBGA39wlaFa61xn4d1
         1Dij3B1LWlIANFlqnVqY8SJMZrWkJvVne4YKFOkT/uQfbxHGqD0WemgbHDlL7OGivliV
         zlz2ZA7nsSTuQ/vdp3QLGaG+P1DHLl1YXJpgtma/zQszvrwFaXP4BhbDMY0nLRl6aopl
         rjnDOHjJDjcVOSDA3WhPOhrzrcXVJ95RpeerMY7kl0vxVoM/k9xswecTJKzZ3xg5fIMx
         yvtw==
X-Gm-Message-State: AOAM532ISpLjWUANQEeBA5GtUb//1m1xm4Ww9rneK3ogdUPpCV6J9/Fp
	/vIO5AUhHZpgGw1JWHpU3pI=
X-Google-Smtp-Source: ABdhPJwMgwCO26y5SeFi8zRaSituWtGsRoPjZTj5PXiNWdcrvWOZEUpXdND/TSklkvO7MzjU6Lxy9Q==
X-Received: by 2002:a17:906:2b12:: with SMTP id a18mr17404615ejg.254.1638472999651;
        Thu, 02 Dec 2021 11:23:19 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id jg36sm432530ejc.44.2021.12.02.11.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 11:23:19 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: r8188eu: pNumTxBytesUnicast is set but never used
Date: Thu,  2 Dec 2021 20:23:08 +0100
Message-Id: <20211202192309.9362-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211202192309.9362-1-straube.linux@gmail.com>
References: <20211202192309.9362-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pNumTxBytesUnicast in odm_dm_struct is set but never used.
Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c         | 3 ---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 1 -
 drivers/staging/r8188eu/include/odm.h     | 3 ---
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index f3498454ee1a..86758a603cfc 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -225,9 +225,6 @@ void ODM_CmnInfoHook(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	/*  */
 	switch	(CmnInfo) {
 	/*  Dynamic call by reference pointer. */
-	case	ODM_CMNINFO_TX_UNI:
-		pDM_Odm->pNumTxBytesUnicast = (u64 *)pValue;
-		break;
 	case	ODM_CMNINFO_RX_UNI:
 		pDM_Odm->pNumRxBytesUnicast = (u64 *)pValue;
 		break;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 389a0c650388..494175bb2739 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -68,7 +68,6 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 
 	ODM_CmnInfoUpdate(dm_odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_TX_UNI, &Adapter->xmitpriv.tx_bytes);
 	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_RX_UNI, &Adapter->recvpriv.rx_bytes);
 	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_WM_MODE, &pmlmeext->cur_wireless_mode);
 	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_SEC_CHNL_OFFSET, &hal_data->nCur40MhzPrimeSC);
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index bb1df9d2d652..ca8d60b515f4 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -224,7 +224,6 @@ enum odm_common_info_def {
 
 	/*  Dynamic value: */
 /*  POINTER REFERENCE-----------  */
-	ODM_CMNINFO_TX_UNI,
 	ODM_CMNINFO_RX_UNI,
 	ODM_CMNINFO_WM_MODE,		/*  ODM_WIRELESS_MODE_E */
 	ODM_CMNINFO_SEC_CHNL_OFFSET,	/*  ODM_SEC_CHNL_OFFSET_E */
@@ -471,8 +470,6 @@ struct odm_dm_struct {
 
 	/*  Dynamic Value */
 /*  POINTER REFERENCE----------- */
-	/* TX Unicast byte count */
-	u64	*pNumTxBytesUnicast;
 	/* RX Unicast byte count */
 	u64	*pNumRxBytesUnicast;
 	/*  Wireless mode B/G/A/N = BIT(0)/BIT(1)/BIT(2)/BIT(3) */
-- 
2.34.0

