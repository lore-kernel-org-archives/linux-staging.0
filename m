Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D7670
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:38 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o6so1648270wmq.3
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kIfS7OWNyn+ExLRfzsdJaFoZLyhYN11InQC07hnzCO8=;
        b=mbQSz06ndqEcA6auN/I5ySJRcWqY8lQFJ3nUXJU4AdlavPCwzDyZ/XTvH6eZapybFg
         0di0j+aj7RNUhvu4tMS/ZOY+Oi+6r4XgKTLMMj+sp+Auhy9PwwnlFs3yTULFiyzAUCJ5
         mnr56tTHlsyQGjvBRs6rRmdKeI2GLco3VBYeRp5g7r/mx/j7KvfXuBT/AFD6yGTJt/fv
         astjLLNuCTYbVGQz+ssM4pDZ46SNM5NIpdj8voyCRTZsgMyYPiKqowvNNRw4ZKeELLCA
         85IDstL6yIDq8+tk/pATeznJSOsSlufJs4Krbby1VHRzjl2pWKSjpjkgmpAscmo29J+F
         oaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kIfS7OWNyn+ExLRfzsdJaFoZLyhYN11InQC07hnzCO8=;
        b=HWUPEhtpyfGPSh19F0z2wUI4ouV4GfuZquwiY1y1m6hTEA4LA5pZFMYZ+bR5n5kAbj
         wlIZvGBOPLCOxFhPWktW0B1kogcHEqOLb/NESjPb366rfk3a+k2s3bYX7aY+g4PexGXy
         LdZmDT33ZQoLrH8qLjtamBCEZO5Ortt90bPU4iSOREMlmp2biUzHB5f6zdC9wkGaIo3Y
         r/0mqvzk4Mqz+BPwZoqYKKciIc7NkXJGS8aLdfS14agx/YFeN5g9qRdrVrr1GGNTfr2t
         YI3dgxAVDtCP2/yzVVtK+X3A1lJ3ACgMDrfDEMqt61+pqLKuVNX2BmgPXVBLueUruAiX
         RJYQ==
X-Gm-Message-State: AOAM5305GOfj/RonzBsTEKZeLb2Kq04+Q9JWbNdOxgaFBzQaDCEpLPXv
	TPyeAjEG30RCzFPyamAkEzU=
X-Google-Smtp-Source: ABdhPJy3z++HwqlFb5IRmtBeIOlAxTlPtpscongQ+p4UzBq0xCAk4zm/MRSa7HnthMNhlPO/Ot1Hkw==
X-Received: by 2002:a05:600c:19cf:: with SMTP id u15mr21211654wmq.7.1617545436768;
        Sun, 04 Apr 2021 07:10:36 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id v185sm9836976wmb.25.2021.04.04.07.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:36 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 28/30] staging: rtl8723bs: remove RT_TRACE logs in core/rtw_sta_mgt.c
Date: Sun,  4 Apr 2021 16:09:44 +0200
Message-Id: <155cff4252d13a4eefe12a397e1623fb9ab46f15.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all of the RT_TRACE logs in the core/rtw_sta_mgt.c file as they
currently do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged. Moreover it relies on an unneeded
private log level tracing which overrides the in-kernel public one,
so just remove them as they are unused.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 25 --------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index f96dd0b40e04..7dcac4dd9de2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -216,10 +216,7 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 
 		index = wifi_mac_hash(hwaddr);
 
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_info_, ("rtw_alloc_stainfo: index  = %x", index));
-
 		if (index >= NUM_STA) {
-			RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("ERROR => rtw_alloc_stainfo: index >= NUM_STA"));
 			spin_unlock_bh(&(pstapriv->sta_hash_lock));
 			psta = NULL;
 			goto exit;
@@ -242,17 +239,6 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 		for (i = 0; i < 16; i++)
 			memcpy(&psta->sta_recvpriv.rxcache.tid_rxseq[i], &wRxSeqInitialValue, 2);
 
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_info_,
-			 ("alloc number_%d stainfo  with hwaddr = %x %x %x %x %x %x \n",
-			  pstapriv->asoc_sta_count,
-			  hwaddr[0],
-			  hwaddr[1],
-			  hwaddr[2],
-			  hwaddr[3],
-			  hwaddr[4],
-			  hwaddr[5])
-		);
-
 		init_addba_retry_timer(pstapriv->padapter, psta);
 
 		/* for A-MPDU Rx reordering buffer control */
@@ -363,16 +349,6 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	spin_unlock_bh(&pxmitpriv->lock);
 
 	list_del_init(&psta->hash_list);
-	RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_,
-		 ("\n free number_%d stainfo  with hwaddr = 0x%.2x 0x%.2x 0x%.2x 0x%.2x 0x%.2x 0x%.2x \n",
-		  pstapriv->asoc_sta_count,
-		  psta->hwaddr[0],
-		  psta->hwaddr[1],
-		  psta->hwaddr[2],
-		  psta->hwaddr[3],
-		  psta->hwaddr[4],
-		  psta->hwaddr[5])
-	);
 	pstapriv->asoc_sta_count--;
 
 	/*  re-init sta_info; 20061114 will be init in alloc_stainfo */
@@ -543,7 +519,6 @@ u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 
 	if (!psta) {
 		res = _FAIL;
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("rtw_alloc_stainfo fail"));
 		goto exit;
 	}
 
-- 
2.20.1

