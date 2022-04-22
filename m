Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B22F25
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 19:32:55 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id q19so8100776pgm.6
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 12:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y+doHSiz3zcutbur9voJocSmaAz48vDvOlIUUyf7FWM=;
        b=a89x4nKawOtJHTWqZbbFoLA02HiA2GzJbSC41mQ0wwzZCECYB6TfQJyr2/Df//ex6j
         XmT7P5B7iv2ke14uKxII/CpVdU/jGI3+z1MIfk01HgLY9e7jNF9Ef2GADrch0NvHa2Y3
         e0KdE6OauULyRg0pbergxbJPNWhKph4DwTXjsVF841dpy6vNTRdBbFB4kG6CDGiBe/En
         Qb0hJIxgcUjt+X3s6hrUD5N9ZqrYgaixHHLzZl+0DDb3SAg7tffEOtAZ3BhMwk+Jk8Q8
         uA7WNM97/AFXWvlT4MeMpnEo8UMFQt1R3aNEVDwn5c6WaCgsPEVAFR101CSOBwwYA7K6
         c4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y+doHSiz3zcutbur9voJocSmaAz48vDvOlIUUyf7FWM=;
        b=lzEOwa+cNtDgLds+/BbN5r7BaWJrH53Tzb57tTU+nq0n9MUP4W5G7Y3xUa6BgDYe6h
         LoXotXWLZgQWWjcHy/P8/l39Iw7gKya25e7O2/0xT/OZQEKle5k6T85WkKlChsLUJuQ9
         ahLLjYIwclaahWqQlii07T2po4XmXmkdU6Ktml1Bk9hW4x7aPwGdSeKJooG/Skk2Y3mf
         9rm2CNPMyl+YQipEb1baMAyigo+fg6SZWK5UoXfbBV1e3Z3efxrI5ZPisthpEQ6UJFfg
         7JcWL35O97Z4mpc8Tzta6OgyJoCdmQaKtSI5nYurKgrnMgWDUp4BmZ/0nioMsULeugsm
         xy0A==
X-Gm-Message-State: AOAM532+sn7i43b2ckLr23qgWBLhUnVBLVTnk2tYGMX5sBYWARUNla/F
	2A934SHSCD5RskBHMuJL648=
X-Google-Smtp-Source: ABdhPJxEUUev7ihPovjIZboLjGNyvTtHcPOY4eAutzFYv8bD3wyzHsFImEWTBe+Xfe0zGML0moa32Q==
X-Received: by 2002:a62:a504:0:b0:50a:ceee:5f4 with SMTP id v4-20020a62a504000000b0050aceee05f4mr6608640pfm.13.1650655974887;
        Fri, 22 Apr 2022 12:32:54 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:bfe0:e8c0:bea6:ee63])
        by smtp.gmail.com with ESMTPSA id z5-20020a056a00240500b004e15d39f15fsm3518932pfh.83.2022.04.22.12.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 12:32:54 -0700 (PDT)
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
Subject: [PATCH v3 6/7] staging: r8188eu: drop unnecessary wrapper _rtw_alloc_network
Date: Sat, 23 Apr 2022 01:02:22 +0530
Message-Id: <20220422193223.11948-7-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422193223.11948-1-makvihas@gmail.com>
References: <20220422193223.11948-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary wrapper _rtw_alloc_network and move its logic to
rtw_alloc_network.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c     |  2 +-
 drivers/staging/r8188eu/core/rtw_mlme.c    | 59 +++++++++-------------
 drivers/staging/r8188eu/include/rtw_mlme.h |  2 +-
 3 files changed, 27 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 512896b86..ab462eb40 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1457,7 +1457,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		rtw_indicate_connect(padapter);
 	} else {
 
-		pwlan = _rtw_alloc_network(pmlmepriv);
+		pwlan = rtw_alloc_network(pmlmepriv);
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 		if (!pwlan) {
 			pwlan = rtw_get_oldest_wlan_network(&pmlmepriv->scanned_queue);
diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index fb64954a0..080e07385 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -53,38 +53,6 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p_assoc_req_ie_len);
 }
 
-struct	wlan_network *_rtw_alloc_network(struct	mlme_priv *pmlmepriv)/* _queue *free_queue) */
-{
-	struct	wlan_network	*pnetwork;
-	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
-	struct list_head *plist = NULL;
-
-	spin_lock_bh(&free_queue->lock);
-
-	if (list_empty(&free_queue->queue)) {
-		pnetwork = NULL;
-		goto exit;
-	}
-	plist = (&free_queue->queue)->next;
-
-	pnetwork = container_of(plist, struct wlan_network, list);
-
-	list_del_init(&pnetwork->list);
-
-	pnetwork->network_type = 0;
-	pnetwork->fixed = false;
-	pnetwork->last_scanned = jiffies;
-	pnetwork->aid = 0;
-	pnetwork->join_res = 0;
-
-	pmlmepriv->num_of_scanned++;
-
-exit:
-	spin_unlock_bh(&free_queue->lock);
-
-	return pnetwork;
-}
-
 void _rtw_free_network(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork, u8 isfreeall)
 {
 	u32 curr_time, delta_time;
@@ -285,11 +253,34 @@ void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 		vfree(pmlmepriv->free_bss_buf);
 }
 
-static struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv)
+struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv)
 {
 	struct	wlan_network	*pnetwork;
+	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
+	struct list_head *plist = NULL;
+
+	spin_lock_bh(&free_queue->lock);
 
-	pnetwork = _rtw_alloc_network(pmlmepriv);
+	if (list_empty(&free_queue->queue)) {
+		pnetwork = NULL;
+		goto exit;
+	}
+	plist = (&free_queue->queue)->next;
+
+	pnetwork = container_of(plist, struct wlan_network, list);
+
+	list_del_init(&pnetwork->list);
+
+	pnetwork->network_type = 0;
+	pnetwork->fixed = false;
+	pnetwork->last_scanned = jiffies;
+	pnetwork->aid = 0;
+	pnetwork->join_res = 0;
+
+	pmlmepriv->num_of_scanned++;
+
+exit:
+	spin_unlock_bh(&free_queue->lock);
 
 	return pnetwork;
 }
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index fc30793f4..e982f0615 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -560,7 +560,7 @@ void rtw_scan_timeout_handler(struct adapter *adapter);
 
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv);
 
- struct wlan_network *_rtw_alloc_network(struct mlme_priv *pmlmepriv);
+struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv);
 
 void _rtw_free_network(struct mlme_priv *pmlmepriv,
 		       struct wlan_network *pnetwork, u8 isfreeall);
-- 
2.30.2

