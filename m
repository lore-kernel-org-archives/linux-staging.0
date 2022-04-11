Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E441363
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 10:22:09 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 125so13755545pgc.11
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 03:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pihteJgws3CPWC4SIMyqFCTdNFf4a7DVbmyRBkvm3cc=;
        b=ozYrBwVoW8GtsA2LMBdHt6bDeJZtkGzYW2+K2uSshw5P4MKZPC6ecevfqXHrxlNoKX
         TempNdL6Nw8L916q5BfA915Cha2mG1sTewnDh/g+NpQTeohWwR3/uvpoJNSDdnRY8ob5
         RC5xWCYcKmls1v5W34MCI1hksCjg9tAKgI8xz6Rcu92eXDERMbIqHbx+p5Vk9K63ZQwu
         5BvNrUsLDsWNg3nTIZpno1vecNM2rFLVclLCnUxPccXBkE7qs/5ta/37e1agqvoZJH4Z
         yj2PL0FZ1RooB4GiTE1scRriMt54bZp1mVbRlFe4aMyhmay5cv1SOxqfmzzm16w68Pfn
         r92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pihteJgws3CPWC4SIMyqFCTdNFf4a7DVbmyRBkvm3cc=;
        b=XCBGIlw0k2Z/UJwG3fKNIR4Urn+Czq6b2xr1xGSSkOMD5tBDQ6JOzn/zzDHCviCrwM
         fUye/AM3UtREBEFEZSxu492sxW+LMj1SX/SxKWvzij2g+v4susq8F+YJruF5RD0DpE6N
         a+TjcmfjE27K4ZogdptFtoR313g3ZT4d6/oVaQF2343J63t6AgnF9IJDSqn5wdHcS8Um
         +NXzu4Vdbb0mEYQdAd6HGArmarAy1+QN2SPvByt02oWv+8DxgIpXtGXODAvTxy2Kgz0e
         XgUI0uzoCqXHdVX08xuCo5e2eRouzF8l9XcGr6IqxWXxwZnRNtWQdplGem9Urwt9bIg8
         4rkQ==
X-Gm-Message-State: AOAM530Xqfd3WMdw8ZEnsoT+3ywX9b5KBswCLca1PkEKOn8ZlDkXQa1M
	nrMOqypvK0efVK0RPqhmviE=
X-Google-Smtp-Source: ABdhPJzlj6WhlOOW9qmB8onlQwlWiD/Ejx99i9RM2YVhF+dpyaVYOxXQA8UWKS+YVr80s/c5q77fVg==
X-Received: by 2002:a63:35c1:0:b0:386:3620:3c80 with SMTP id c184-20020a6335c1000000b0038636203c80mr25577283pga.327.1649672529329;
        Mon, 11 Apr 2022 03:22:09 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:4376:c658:ae1e:1781])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a170e00b001cb7e69ee5csm4886318pjd.54.2022.04.11.03.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 03:22:09 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v2 4/7] staging: r8188eu: drop unnecessary wrapper _rtw_init_mlme_priv
Date: Mon, 11 Apr 2022 15:51:33 +0530
Message-Id: <20220411102136.14937-5-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411102136.14937-1-makvihas@gmail.com>
References: <20220411102136.14937-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary wrapper _rtw_init_mlme_priv and move its logic to
_rtw_init_mlme_priv.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 103 +++++++++++-------------
 1 file changed, 47 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index c90f36dee..6b8c80fe9 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -30,60 +30,6 @@ u8 rtw_to_roaming(struct adapter *adapter)
 	return adapter->mlmepriv.to_roaming;
 }
 
-static int _rtw_init_mlme_priv(struct adapter *padapter)
-{
-	int	i;
-	u8	*pbuf;
-	struct wlan_network	*pnetwork;
-	struct mlme_priv		*pmlmepriv = &padapter->mlmepriv;
-	int	res = _SUCCESS;
-
-	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
-
-	pmlmepriv->nic_hdl = (u8 *)padapter;
-
-	pmlmepriv->pscanned = NULL;
-	pmlmepriv->fw_state = 0;
-	pmlmepriv->cur_network.network.InfrastructureMode = Ndis802_11AutoUnknown;
-	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: pasive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
-
-	spin_lock_init(&pmlmepriv->lock);
-	rtw_init_queue(&pmlmepriv->free_bss_pool);
-	rtw_init_queue(&pmlmepriv->scanned_queue);
-
-	set_scanned_network_val(pmlmepriv, 0);
-
-	memset(&pmlmepriv->assoc_ssid, 0, sizeof(struct ndis_802_11_ssid));
-
-	pbuf = vzalloc(MAX_BSS_CNT * (sizeof(struct wlan_network)));
-
-	if (!pbuf) {
-		res = _FAIL;
-		goto exit;
-	}
-	pmlmepriv->free_bss_buf = pbuf;
-
-	pnetwork = (struct wlan_network *)pbuf;
-
-	for (i = 0; i < MAX_BSS_CNT; i++) {
-		INIT_LIST_HEAD(&pnetwork->list);
-
-		list_add_tail(&pnetwork->list, &pmlmepriv->free_bss_pool.queue);
-
-		pnetwork++;
-	}
-
-	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
-
-	rtw_clear_scan_deny(padapter);
-
-	rtw_init_mlme_timer(padapter);
-
-exit:
-
-	return res;
-}
-
 static void rtw_free_mlme_ie_data(u8 **ppie, u32 *plen)
 {
 	kfree(*ppie);
@@ -290,9 +236,54 @@ u8 *rtw_get_beacon_interval_from_ie(u8 *ie)
 
 int rtw_init_mlme_priv(struct adapter *padapter)/* struct	mlme_priv *pmlmepriv) */
 {
-	int	res;
+	int	i;
+	u8	*pbuf;
+	struct wlan_network	*pnetwork;
+	struct mlme_priv		*pmlmepriv = &padapter->mlmepriv;
+	int	res = _SUCCESS;
+
+	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
+
+	pmlmepriv->nic_hdl = (u8 *)padapter;
+
+	pmlmepriv->pscanned = NULL;
+	pmlmepriv->fw_state = 0;
+	pmlmepriv->cur_network.network.InfrastructureMode = Ndis802_11AutoUnknown;
+	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: pasive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
+
+	spin_lock_init(&pmlmepriv->lock);
+	rtw_init_queue(&pmlmepriv->free_bss_pool);
+	rtw_init_queue(&pmlmepriv->scanned_queue);
+
+	set_scanned_network_val(pmlmepriv, 0);
+
+	memset(&pmlmepriv->assoc_ssid, 0, sizeof(struct ndis_802_11_ssid));
 
-	res = _rtw_init_mlme_priv(padapter);/*  (pmlmepriv); */
+	pbuf = vzalloc(MAX_BSS_CNT * (sizeof(struct wlan_network)));
+
+	if (!pbuf) {
+		res = _FAIL;
+		goto exit;
+	}
+	pmlmepriv->free_bss_buf = pbuf;
+
+	pnetwork = (struct wlan_network *)pbuf;
+
+	for (i = 0; i < MAX_BSS_CNT; i++) {
+		INIT_LIST_HEAD(&pnetwork->list);
+
+		list_add_tail(&pnetwork->list, &pmlmepriv->free_bss_pool.queue);
+
+		pnetwork++;
+	}
+
+	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
+
+	rtw_clear_scan_deny(padapter);
+
+	rtw_init_mlme_timer(padapter);
+
+exit:
 
 	return res;
 }
-- 
2.30.2

