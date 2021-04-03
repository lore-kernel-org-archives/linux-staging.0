Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD9D6D00
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:59 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c8so6526594wrq.11
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kIfS7OWNyn+ExLRfzsdJaFoZLyhYN11InQC07hnzCO8=;
        b=Q/dHkeQTkcVv+uIV+IFICfDM5WLJn1BqucLkdzSxqtjueu8CeWLK8MND8vI8ayen5g
         6wtcRNZanK1CCy5pfi7Cd+UIxCPodVdTHa8NMKa0MGGvWJvx+8X0Vz5hQKcTE+v4VGWg
         hL9EghrpycPgJUpB3Vq2Q3O9C8MmwUvlVGHTAbI5wx3KlvyKiDJotKZHkdag5JYMmhIU
         4JtBdUwVXdNj93nxqyGm3MlURRIVudTo8IYqGGImQQibbx9muKhaEL2ucgYRxu4JLn7U
         ijqqexp9z1eR8Qj5HAdsL4zBI18nPrjGiiJzxcqBAJKqAxI7CLzzV4Mq0PY14rMUZYfR
         WLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kIfS7OWNyn+ExLRfzsdJaFoZLyhYN11InQC07hnzCO8=;
        b=YEHk0V+P3BRpTfq02M3ctRywP1FMr96UonNMTpEOOc4ZSnEB7YhGMcXysUfjlMB6K4
         RSvdfW4h43mCqyazT8PTs0WgcAw8Rw9dv3/qnvrulaEtrUezjimEBxWj5FAPi20uACvU
         Z3i5cX/Z+RP4oXBxB1xJ41R4NObQ1RP3yRofEo6AHmlthf0zmO4xbasq2Q10DWcMhd4w
         d8gcpvTeNaZiv62wHzLzIr62xKRkJcQ6bwRn0DEYFSGlKaDOP4jyncDqqqmxU9nt1xKB
         TMR6lRCFF+8jRL7nmZtvS0LP3fI1CfnuOufBNTrNNF2ht52NJ2nUqUF1/dh8lEKZCatW
         4WOA==
X-Gm-Message-State: AOAM530ziM8zdkTAWXNVtwVstgU6Ts9mUyCH/StIEEVQNbK8NRTOXaZC
	gTt9TxgTNRCnWkDwXkJq4jQ=
X-Google-Smtp-Source: ABdhPJzEwmtgT6xUe6Ag+IStt0KSjGvOMzJQeAOamsxNi/fZYSOZmZ4FpkvOvTt3xZ8YJfRAmm2Otw==
X-Received: by 2002:adf:a703:: with SMTP id c3mr19537409wrd.72.1617441298125;
        Sat, 03 Apr 2021 02:14:58 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id i7sm1469381wru.41.2021.04.03.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 28/30] staging: rtl8723bs: remove RT_TRACE logs in core/rtw_sta_mgt.c
Date: Sat,  3 Apr 2021 11:13:50 +0200
Message-Id: <fde460021dacc0b131b2a8f3cc8dddc171d7f459.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
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

