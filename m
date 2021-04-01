Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D483171
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:00 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id r12so1848591ejr.5
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4uET64dyZ9Hm0pwJAXZNONIy0WBkkm1uCrrvEqR1Lv8=;
        b=axqyY5QmBXNga6a0mEEGIoHzYlGDBxb4Awu43ZmGbyS0Srt7RcrRaKimikl8hT3pGh
         fv10sbS6IxLhyAdczZTTpC/sCddgT9rQtJtP0NxJUaU49uZUY9IFJ2EFl0xH0broAA6L
         N2NePl4xP+bVJQTi28vFAfyVKDLaeyZJRqnw3pmdT0jvnhWZ+ZgQt0SvvelBN6vLDdns
         qYtWcDGWxOkkaEZy9ckxUxoHyi8PA0MlsqcPaw8eKwAZaC9iNEPoE4P4WPp7Rvv8TL4w
         n/E7AbGg+AErFHMwo+z5oV6Xcikxj9ErzSlgbOZfeP9KwC4eyWytjT1iAR7GaxG6UVnR
         I6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4uET64dyZ9Hm0pwJAXZNONIy0WBkkm1uCrrvEqR1Lv8=;
        b=cBObkzVXyPCBMcPDYhOrvbYzkDdtYRzNh19uoZabUIYRjmWhLuo2Gea5XhtlufTupu
         YgkDdUP1Tvm0uiDz3VPuhUeDXOinmzWuzVBN27608mpdoS+PrQZPx2KLWIemFWm+Pa/o
         cRWEiGIBL4/mAZt11hUMWsU3imL7Jxz4X+j3S42uU49dsovlsfaXOMeuBC2G7XHLSGQe
         JLG/sFyt0JDwle+qwHO3DpUdjwNWBFTtp/kWKIoVH/t16aH2tUnHlz+LM+pb4aNGDCwd
         wmRJTxntr/3mcNlV58KcOs3xA6EDXZ0IglyqrYVyxdPwW6FkrT7cXmKwK5Vs4D2mpDtI
         lCeA==
X-Gm-Message-State: AOAM531+fENYD/z3NAwV3u2Sx+aTVHAIkFEav4BqC94ud79u5pNZRAZt
	LnOB7bRe7A0j4+ZPJePYWWs=
X-Google-Smtp-Source: ABdhPJwyZtstVW1yVTPNCQ9FZs0ZwBs+lECZD1/aAOD4gDiLs8rr79K1kmv5MmfMmfktyqxzEROFFQ==
X-Received: by 2002:a17:906:4d96:: with SMTP id s22mr8069904eju.189.1617268919405;
        Thu, 01 Apr 2021 02:21:59 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id e16sm2466632ejc.63.2021.04.01.02.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 22/49] staging: rtl8723bs: remove RT_TRACE logs in core/rtw_sta_mgt.c
Date: Thu,  1 Apr 2021 11:20:52 +0200
Message-Id: <7f9670d4021d59191bf202b6a7e3e13c5598aa25.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
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

