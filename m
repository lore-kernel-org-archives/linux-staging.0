Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89536D00
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 10:02:13 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id bx7so4933018edb.12
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4uET64dyZ9Hm0pwJAXZNONIy0WBkkm1uCrrvEqR1Lv8=;
        b=IPfxN1UfHvPV82MPB18cJOtPPtCi9UDSTKyP7epmzp4qlKtGw5c2nSnMeI9cz9UMdJ
         ZNjkVekvLiR5BWYSrZw70pzsyjJP19ZMDjvepf4nH8bC/Y3lAOGea3Y4MYfnvF0KXSyX
         cri3Mu80ahl9pkg7BUQCyinod8u027vW8wLE3Zc196CwKoEhUuIKoJTTKmU6VeKvLpzo
         a56L1bFenk0OFC9N59PT0UZp+5wEzyRqO/+XfFliuc1X4JdkBr7qM9zVHxl5LYWZ6/lU
         XUsmwtSra57ERy8yID3ZQ6VIOTncsxjAOFxBtHhyIBy6PiMBo7E2E+Az1Qcy4jMFA2Zg
         Fx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4uET64dyZ9Hm0pwJAXZNONIy0WBkkm1uCrrvEqR1Lv8=;
        b=LpZMizXaiATWBWpHgKiHjfuz3VzkBIDDS6gQ4PrtLLGxCwWhhjDQDwjuXmfJE8AzNN
         hJqkxRZIHvO08Abl2Qp/Bwg1zgQHbXl9aHcWKQ9oD241jgjFl+z8FXwn859rr5ESM3Kq
         DGXfzdvkZYe2grr7UlGHKy5jOyFvXUUlt5mDH7RoLYce3O7S38N3UbL5oC8Gj1T4Zhy3
         Ox4/Z/7SlepIZXD7EoJZ1CrhpXt4W/5xQ62L33Av4YPsxYEh7XUDhs97ME4ITxgAsXs1
         Afc+mPeaJPnyoM1ALdGMpBDkfkLFZaP+/cho3iyzltqczAC5epukf3VJ8L+OlPamz5hH
         ZhwA==
X-Gm-Message-State: AOAM533fUmv8eI6q9GNQ7Gs+2AB16duLwCpG9YvFhku7OOUM6mrREJ7/
	iTLOv9oZBeOhkHTqzByd+gw=
X-Google-Smtp-Source: ABdhPJyEU62Zbzb6d5+jFbXId07VykfVLrgZxeBYMLAMrACftLXBWfXZ2A/cONyy4m/HhKKdRE2xhg==
X-Received: by 2002:a50:ec8c:: with SMTP id e12mr750031edr.249.1617357732447;
        Fri, 02 Apr 2021 03:02:12 -0700 (PDT)
Received: from agape ([5.171.72.128])
        by smtp.gmail.com with ESMTPSA id a9sm5094906edt.82.2021.04.02.03.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:02:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 15/16] staging: rtl8723bs: remove RT_TRACE logs in core/rtw_sta_mgt.c
Date: Fri,  2 Apr 2021 12:01:35 +0200
Message-Id: <cba4d0eab6269485fcf0a5170e55ce39ef830392.1617356821.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617356821.git.fabioaiuto83@gmail.com>
References: <cover.1617356821.git.fabioaiuto83@gmail.com>
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

