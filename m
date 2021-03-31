Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669B36F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:40 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id o19so21530340edc.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwTgoBA0eOBLs5AzNjX8YYxLxe5sNbz7ch4RSMNui4c=;
        b=NM6BmaQ3dQ+dnOhb8q1nKbXhls9SOcjs2zwweJLz6191qtj0GZkzIydaUcMLzopbLT
         RiDRv21RiI7r1XzzrOha6enXVB7ohNCOoWPrrTJaZ5mx3dDkxjCzVxtPwyMOtbF0u4TK
         osNZqS/Ivg83+7e4V9V/3ua//gIoy3wAOUAqTMWEjHKiGKSlIY9zA3nPvEUJ8RgDNgYM
         OhFReGYQKvlJ53eObuuidHQXSowiSWOf/MLzS/xFwkPjOp2hh3i3bVH+0DRiH3LhA12c
         nZQOuxPrI/clU9MHzp5b4AYtHqZ9vkdVxE4ROSRgk93bY85F9s2P9EaXIOi9uf2jf62/
         zB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwTgoBA0eOBLs5AzNjX8YYxLxe5sNbz7ch4RSMNui4c=;
        b=Skx7R5Qt57bAW/vGOpDzvOvPBwVp5Ma7kzOwR3Fakl0L0enn7dkh80HwMOTWv42s9b
         ZFIL22Hk+CVMvBweeN+KxwOpHk4kcEaweFVBopNJEchRTKokGEeo9nzwhqwK/30+Gxo6
         pdn509nlAm2bDhAh4gcOFnnoFyyVDWCjLKEsaFZ5QM1e1hhtaO9CKq2hnXdjLwGjkAFZ
         K6EpQkojv/jcPa/y/BhU2SSMka+i8HrYXxqQnqn/K7EefiMBO9eyK3kByJLzTGG7WGMK
         WErd0nga3RMVd/RXVuuAgfSe0o9NkikfJRsmk5iWZozkCoD6NLYaNcb4xoZ+j02OD4k6
         eM0A==
X-Gm-Message-State: AOAM530artsAdl7sNW6uR1UWL8u0YCubG4EcHC2QDb7C4FIKtGAsJ15R
	vd9tQP09SOhNC0niBVVbNyQ=
X-Google-Smtp-Source: ABdhPJzc2iwnKPdlGHOWz6FJwbLh+RrvP5Y0I6oqSsfIJ3immDjKhznqP43LOAdXV8saz91erT05EA==
X-Received: by 2002:a50:ed90:: with SMTP id h16mr2554746edr.101.1617183638965;
        Wed, 31 Mar 2021 02:40:38 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id r10sm825095eju.66.2021.03.31.02.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:38 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 14/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in core/rtw_sta_mgt.c
Date: Wed, 31 Mar 2021 11:39:42 +0200
Message-Id: <630742d4ff8fb1f54e949d3979ddad699064d039.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_TRACE for tracing with in-kernel
pr_* printk wrappers

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 45 ++++++++++----------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index f96dd0b40e04..7febeff7308d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -216,10 +216,11 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 
 		index = wifi_mac_hash(hwaddr);
 
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_info_, ("rtw_alloc_stainfo: index  = %x", index));
+		pr_info("%s %s: index  = %x", DRIVER_PREFIX, __func__, index);
 
 		if (index >= NUM_STA) {
-			RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("ERROR => rtw_alloc_stainfo: index >= NUM_STA"));
+			pr_err("%s ERROR => %s: index >= NUM_STA",
+			       DRIVER_PREFIX, __func__);
 			spin_unlock_bh(&(pstapriv->sta_hash_lock));
 			psta = NULL;
 			goto exit;
@@ -242,16 +243,15 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
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
+		pr_info("%s alloc number_%d stainfo  with hwaddr = %x %x %x %x %x %x\n",
+			DRIVER_PREFIX,
+			pstapriv->asoc_sta_count,
+			hwaddr[0],
+			hwaddr[1],
+			hwaddr[2],
+			hwaddr[3],
+			hwaddr[4],
+			hwaddr[5]);
 
 		init_addba_retry_timer(pstapriv->padapter, psta);
 
@@ -363,16 +363,15 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
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
+	pr_err("%s free number_%d stainfo  with hwaddr = 0x%.2x 0x%.2x 0x%.2x 0x%.2x 0x%.2x 0x%.2x\n",
+	       DRIVER_PREFIX,
+	       pstapriv->asoc_sta_count,
+	       psta->hwaddr[0],
+	       psta->hwaddr[1],
+	       psta->hwaddr[2],
+	       psta->hwaddr[3],
+	       psta->hwaddr[4],
+	       psta->hwaddr[5]);
 	pstapriv->asoc_sta_count--;
 
 	/*  re-init sta_info; 20061114 will be init in alloc_stainfo */
@@ -543,7 +542,7 @@ u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 
 	if (!psta) {
 		res = _FAIL;
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("rtw_alloc_stainfo fail"));
+		pr_err("%s rtw_alloc_stainfo fail", DRIVER_PREFIX);
 		goto exit;
 	}
 
-- 
2.20.1

