Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1CC5F
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:31:04 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id b9so5288872wrt.8
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4uET64dyZ9Hm0pwJAXZNONIy0WBkkm1uCrrvEqR1Lv8=;
        b=EdZ4T8kCkGQWsUjwwMiXJ+ArUG4AHL+mxDqYIsUNGiM2I6JwVQ8sSz8R+S9hs2MWWn
         BpyBwjyS+LWHFoR+eQNiQp8CdxlEAhJmtU2G+izqVFIJdeGeQxqGCAOD844RYPINa8Ew
         m+/Wepcm+3ryMg17aZibaU40fsal3pcFCvpgk1+1dZgQqo1bFeHIdG+uN/rUdWDA6Y+a
         jeeqTT0Trv6QiHKwmrCtuYk/2oq6B8e8jzyfpeeSJR1hUi4CbMIvSzM2tn/SLQrZzLKs
         t6aaHZQbxQk0DafsJb1QEfnwWeamUWgakEpCYA/TecJBOdgjYqcz4bEQw7XC7nyPBtja
         E4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4uET64dyZ9Hm0pwJAXZNONIy0WBkkm1uCrrvEqR1Lv8=;
        b=HR+3kRGhU/zgZcvP7LJgofCGUqCPRPue0s00D67mATQ2/AjAPQ3jxXA+UJs+OOXaKt
         YdBKEGFDRBvVBOPR6nmlijSDc0Wa7AEpnBN8Y8aTSgnMT83kiPoh0PWYcD79pMQnQ4IF
         aSP7UNLmlxRmtwekeaAFGPAjrI1xPGEp5G6tnFhml1hLhX4VcsEOomo6P1UYBgbUEY45
         cNUazHRvKgtiiIC/jV7zEiRp0dz9EgVeO1cpXnqdAr9pu/18tdAf+6nyYQc1bGZYyutK
         RZA6B8fJDD5QfLJCZcbQpzAgliE5i3s1STcGushPaSZGM8maQNV7FFCKqY6/vqefE+7K
         g5jA==
X-Gm-Message-State: AOAM532lZeXn65gNv2IOPyanZyvZGip5GFPZraLlMVtTBmfGESMnGiMW
	0lcqqhyDC+MAxQrPxHnWWF/HXLYeDaT6cg==
X-Google-Smtp-Source: ABdhPJzN8/LNAs3/FSP/OHMq6Eg+6+96zMNcmfYfHaeDbqkc3h0iFhObtuxxZ0InfTIQGkHOCCLS7g==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr16344148wrp.252.1617384662833;
        Fri, 02 Apr 2021 10:31:02 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id p27sm13450012wmi.12.2021.04.02.10.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:31:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 28/30] staging: rtl8723bs: remove RT_TRACE logs in core/rtw_sta_mgt.c
Date: Fri,  2 Apr 2021 19:30:10 +0200
Message-Id: <4b3db6e98b192adcfeb0d9a20a6d24f65cd54105.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

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

