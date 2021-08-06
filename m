Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EBF70
	for <linux-staging@lists.linux.dev>; Fri,  6 Aug 2021 00:40:44 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id m12so8807435wru.12
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 17:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=myqA5XBhwnQwfLdZN/XArvN884CAchuviOzXLTqyhiQ=;
        b=uEElBfxNzvKFj5rdybc+kocspBPL51LEcsMQ0mI3zgtuBc3RTEJ47Iown+XbteId1+
         zGaFjuHZ123pSA/zuL39G4E56dtzYrrtm3J8KvqidzJOEsurRsX6eWBGijUX4eXsmwtx
         ktvB8LuySEoC9ssxmuVm/3dLK1LOjADvIfDqrtbs8MCAUExkgMIiJj1s4ADo4YmVpI9b
         /Jw0BgdgfBiJVdLwV8CZCUCXnFXj2MS3mo9WOSS1eetWwvSulo5Dh+KaRlMJSNFDhck6
         o+Z47WmOe2NbcYnxUZF9NcDgnOPWba/8TK5KbHFYMny3ZHu/39DAnP8IKXzX8X6ieh4W
         8aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=myqA5XBhwnQwfLdZN/XArvN884CAchuviOzXLTqyhiQ=;
        b=tnFf/gkhXoyI37IPsT1fXgZTJM/Y46JgNrQgiF0jrH9xzCU+jcxLa3t1x1KIvhefCn
         yjOYErr6rYmCAor/+Rz7NsHd7j7Ox57FoMUoe8JqGk0DrLXrY+0pu78FhA7CT5l5K0Ww
         o/5dzTCZhyIKo0EQ58u595j0AmWVrL6V4QTs+S5bKA6XAcNPtcT3o9KYwJbqanT+R1I1
         ePPlzX7lChLh6yzAf/eok5F0WW27VpWQvEnqIKk7U9vK+/9Quvy6saoc9OXNb3ReJWrI
         c/lhhO3n2O1eYYkxEr152FFL1tBsT+69oQaFGoonRctBGvzUDVfr5g00kmW4Pk5n2CIi
         Nz2w==
X-Gm-Message-State: AOAM530DUIQ8yytiriec9De2FhuuBIBvffSZ3AlT0FwmovNCZnWTJkTk
	BnN++H/s30+x82uKczuRbfvi+g==
X-Google-Smtp-Source: ABdhPJwNTE+g/3wg1VXkC4Fzi0Ap8L9FFWIzIYuzBy8TjwEV8sK3DMBLEyiVee/nOsvheMy1gdkKog==
X-Received: by 2002:a5d:674c:: with SMTP id l12mr8057972wrw.112.1628210443473;
        Thu, 05 Aug 2021 17:40:43 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id y19sm10727181wmq.5.2021.08.05.17.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 17:40:43 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx
Subject: [PATCH v2 07/11] staging: r8188eu: remove RT_TRACE calls from core/rtw_sta_mgt.c
Date: Fri,  6 Aug 2021 01:40:30 +0100
Message-Id: <20210806004034.82233-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806004034.82233-1-phil@philpotter.co.uk>
References: <20210806004034.82233-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from core/rtw_sta_mgt.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index fc963bee37be..3e8e85756f25 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -195,9 +195,7 @@ struct	sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 		_rtw_init_stainfo(psta);
 		memcpy(psta->hwaddr, hwaddr, ETH_ALEN);
 		index = wifi_mac_hash(hwaddr);
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_info_, ("rtw_alloc_stainfo: index=%x", index));
 		if (index >= NUM_STA) {
-			RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("ERROR => rtw_alloc_stainfo: index >= NUM_STA"));
 			psta = NULL;
 			goto exit;
 		}
@@ -219,10 +217,6 @@ struct	sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 		for (i = 0; i < 16; i++)
 			memcpy(&psta->sta_recvpriv.rxcache.tid_rxseq[i], &wRxSeqInitialValue, 2);
 
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_info_,
-			 ("alloc number_%d stainfo  with hwaddr = %pM\n",
-			 pstapriv->asoc_sta_count, hwaddr));
-
 		init_addba_retry_timer(pstapriv->padapter, psta);
 
 		/* for A-MPDU Rx reordering buffer control */
@@ -296,7 +290,6 @@ u32	rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	spin_unlock_bh(&pxmitpriv->lock);
 
 	list_del_init(&psta->hash_list);
-	RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("\n free number_%d stainfo  with hwaddr=0x%.2x 0x%.2x 0x%.2x 0x%.2x 0x%.2x 0x%.2x\n", pstapriv->asoc_sta_count, psta->hwaddr[0], psta->hwaddr[1], psta->hwaddr[2], psta->hwaddr[3], psta->hwaddr[4], psta->hwaddr[5]));
 	pstapriv->asoc_sta_count--;
 
 	/*  re-init sta_info; 20061114 */
@@ -462,7 +455,6 @@ u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 
 	if (!psta) {
 		res = _FAIL;
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("rtw_alloc_stainfo fail"));
 		goto exit;
 	}
 
-- 
2.31.1

