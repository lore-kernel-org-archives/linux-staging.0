Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA44E6D11
	for <linux-staging@lists.linux.dev>; Mon,  9 Aug 2021 16:50:56 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id i4so4855775wru.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Aug 2021 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vbN/79mS5cORZWWvLgOUVIMx3cPKWDGgv+719frs6/c=;
        b=JKLTwxX2dVYwBZtll5OeyhMtIGgpmTN1Y/qXLPJi8bBVo/OOAl5cuiZsTDN5+Q98TI
         qGq7z3F89P3qoJiuL7y5JigS/GDEpWBVv362B1wv2ielG/5lnK0ikJFQvlFeOgoe1pms
         X7OOk6NUhpqcplJ9Rfev78s6L5O+PzkJNZMsxSNtPwPcIxoctvXhxs33+4z04LFlVYvq
         6UVgJjlC8KWZ6LSuJ0cZAsH+7YQr2HaMlVm8BLsJi4pd1dWNSV16+4O1jTH/24t50ngj
         MgKyS2vWffSKfMXZarhH4Zn2OHLW8Sfe3v17ESuOallKH40RhDOcUEbk09OdZw+SxRap
         t7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vbN/79mS5cORZWWvLgOUVIMx3cPKWDGgv+719frs6/c=;
        b=UafwH/JzCuxBtuFTXBZPhHJf9R/vuivQQI/m6eoefk7QmZwvyJaHMUhU1ludw6OPT4
         IbRab1UXwx5rLnPIqwh+1lhSoJiXujnt7BffuUicZrrFOoVnZRE4zfOmbWNupOLmg4mW
         Tf161GpSRZB4ygzSjKkv1dpB8clOtojyQU67ENuDwl5l+vs1TOKED/luqA+vcSMU0s6N
         waH159Y6OslOBLP3i4j0Oflwe9uygpUhDPnzojn8L4S1ICodbfOOA/f7Xbp6IoXooTKB
         3gNPa5QIJhR5xg/tZ/G6NouUGC+O/4b5SpRcN1GnHn3wIS0190cRV9FcaLH8fSJ5h5hI
         +1nA==
X-Gm-Message-State: AOAM531svu1/4K2GtP65N+0wzHPEi4BI+kwHLPJLVTA2lEL19+34mRJQ
	ysgZgKK/SRvuXQYCWRJ7MM1+o4HOnEo=
X-Google-Smtp-Source: ABdhPJxwLRcGO6wJu2V3tbs5R4JGbrC8qVIW25xIta/ZT64j9uhZTDvO1gM9Pz8l69wTynOHZ0Ve7w==
X-Received: by 2002:a5d:4846:: with SMTP id n6mr9314816wrs.91.1628527855251;
        Mon, 09 Aug 2021 09:50:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::996b])
        by smtp.gmail.com with ESMTPSA id q5sm20484469wrx.33.2021.08.09.09.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 09:50:55 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 11/17] staging: r8188eu: remove unnecessary parentheses in core/rtw_sta_mgt.c
Date: Mon,  9 Aug 2021 18:50:01 +0200
Message-Id: <20210809165007.23204-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809165007.23204-1-straube.linux@gmail.com>
References: <20210809165007.23204-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses in core/rtw_sta_mgt.c reported by
checkpatch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index 3e8e85756f25..c9644a3ecc4e 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -81,7 +81,7 @@ u32	_rtw_init_sta_priv(struct	sta_priv *pstapriv)
 	for (i = 0; i < NUM_STA; i++) {
 		_rtw_init_stainfo(psta);
 
-		INIT_LIST_HEAD(&(pstapriv->sta_hash[i]));
+		INIT_LIST_HEAD(&pstapriv->sta_hash[i]);
 
 		list_add_tail(&psta->list, get_list_head(&pstapriv->free_sta_queue));
 
@@ -145,7 +145,7 @@ u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
 		/*	delete all reordering_ctrl_timer		*/
 		spin_lock_bh(&pstapriv->sta_hash_lock);
 		for (index = 0; index < NUM_STA; index++) {
-			phead = &(pstapriv->sta_hash[index]);
+			phead = &pstapriv->sta_hash[index];
 			plist = phead->next;
 
 			while (phead != plist) {
@@ -190,7 +190,7 @@ struct	sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 		psta = NULL;
 	} else {
 		psta = container_of((&pfree_sta_queue->queue)->next, struct sta_info, list);
-		list_del_init(&(psta->list));
+		list_del_init(&psta->list);
 		spin_unlock_bh(&pfree_sta_queue->lock);
 		_rtw_init_stainfo(psta);
 		memcpy(psta->hwaddr, hwaddr, ETH_ALEN);
@@ -199,7 +199,7 @@ struct	sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 			psta = NULL;
 			goto exit;
 		}
-		phash_list = &(pstapriv->sta_hash[index]);
+		phash_list = &pstapriv->sta_hash[index];
 
 		spin_lock_bh(&pstapriv->sta_hash_lock);
 
@@ -273,19 +273,19 @@ u32	rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->vo_q.sta_pending);
 
-	list_del_init(&(pstaxmitpriv->vo_q.tx_pending));
+	list_del_init(&pstaxmitpriv->vo_q.tx_pending);
 
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->vi_q.sta_pending);
 
-	list_del_init(&(pstaxmitpriv->vi_q.tx_pending));
+	list_del_init(&pstaxmitpriv->vi_q.tx_pending);
 
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->bk_q.sta_pending);
 
-	list_del_init(&(pstaxmitpriv->bk_q.tx_pending));
+	list_del_init(&pstaxmitpriv->bk_q.tx_pending);
 
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->be_q.sta_pending);
 
-	list_del_init(&(pstaxmitpriv->be_q.tx_pending));
+	list_del_init(&pstaxmitpriv->be_q.tx_pending);
 
 	spin_unlock_bh(&pxmitpriv->lock);
 
@@ -321,7 +321,7 @@ u32	rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 
 			plist = plist->next;
 
-			list_del_init(&(prframe->list));
+			list_del_init(&prframe->list);
 
 			rtw_free_recvframe(prframe, pfree_recv_queue);
 		}
@@ -389,7 +389,7 @@ void rtw_free_all_stainfo(struct adapter *padapter)
 	spin_lock_bh(&pstapriv->sta_hash_lock);
 
 	for (index = 0; index < NUM_STA; index++) {
-		phead = &(pstapriv->sta_hash[index]);
+		phead = &pstapriv->sta_hash[index];
 		plist = phead->next;
 
 		while (phead != plist) {
@@ -425,7 +425,7 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 
 	spin_lock_bh(&pstapriv->sta_hash_lock);
 
-	phead = &(pstapriv->sta_hash[index]);
+	phead = &pstapriv->sta_hash[index];
 	plist = phead->next;
 
 	while (phead != plist) {
-- 
2.32.0

