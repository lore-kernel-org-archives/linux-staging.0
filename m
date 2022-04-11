Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4CE1363
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 10:22:17 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id s2so14210297pfh.6
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yl+s+hfKCeq5/g5ZuXagReICrGy9w2ZYqBzEvur9CXQ=;
        b=Pd5QdnSlOTFKqeIQk/tHI6gVXTXj37xy0Apv8pOeoLHcdd6gsN7A5o88Vtcev4CBVu
         TYxsrwuOZzC1RZ7j+MgFAJaZ5/lhS9ADQGR6+LKcDJWS7EvA9wi/HM2cj9LiulCS5N22
         gRDNA3uWnhpRwrb7OGGmrgaEKwFAlfw3IO6nNgxTKTOOGbjXzEBKAO31Kx5iOqCtOkGv
         SlcgCIJ361ycbQ9/yAxzpWB0dwrrmOmnvgwiY5044oOIpmLfM88NXH7NdqQ5ZDSOYAED
         m4RB0qL3w2gSUOaVpMP5ifPYpKm/l7XASbzaXFvM54X6tgAsk1xLoW+p/iyAFp59te+D
         3nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yl+s+hfKCeq5/g5ZuXagReICrGy9w2ZYqBzEvur9CXQ=;
        b=Prno1QV0SZZq/Ik/IzRBqp9HUzBvDY1fpmeXlYmbw1HrbNtvDheJjVythcfRH1xHCU
         2C4WBlHf6AzVhLhPFMZ3iLOG93hHmx11SUeDj8kIAv22B32ad4rCnxV5mAR7s1WmBQcd
         0cBnxHE68kb9GQnoTir6toddi6oNhm6TszEAyiu/jvlmESWocmpZ9Ad5I/PMhZkM2OlC
         bll8/L7fIuHRHwkfYUJYB96lTlut6seCQx9meve3zNmdkZcoZmCaw/g+9qL/i+M6OwEB
         +t1RJU7xZDqhIwU5lf3GXgi5YOukYD+svLXYIEoEUaqfGHER5Jo6EJnOJasMc2ky/Xnw
         vwJA==
X-Gm-Message-State: AOAM5335f6zox74viXFVT1zTBzQOnzwKTdGKWp3GIWv0FzV5NgF4KNGe
	Dl3Wp7c0AGiNYSSgMLUP303XitW45gmN2lmb
X-Google-Smtp-Source: ABdhPJwEjcYvNIrxOhNhNP8a/KJ22xsCXtH+eu4FqsmRTEV4fiFQrge6nR1WP7fU6xiiTJDStESYvg==
X-Received: by 2002:aa7:88d4:0:b0:4fd:ad26:c52f with SMTP id k20-20020aa788d4000000b004fdad26c52fmr31668472pff.25.1649672536593;
        Mon, 11 Apr 2022 03:22:16 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:4376:c658:ae1e:1781])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a170e00b001cb7e69ee5csm4886318pjd.54.2022.04.11.03.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 03:22:16 -0700 (PDT)
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
Subject: [PATCH v2 6/7] staging: r8188eu: drop unnecessary wrapper _rtw_alloc_network
Date: Mon, 11 Apr 2022 15:51:35 +0530
Message-Id: <20220411102136.14937-7-makvihas@gmail.com>
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

Drop unnecessary wrapper _rtw_alloc_network and move its logic to
rtw_alloc_network.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c     |  2 +-
 drivers/staging/r8188eu/core/rtw_mlme.c    | 59 +++++++++-------------
 drivers/staging/r8188eu/include/rtw_mlme.h |  2 +-
 3 files changed, 27 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 3781706f7..959b69be5 100644
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
index 5584e1b84..31a5f252c 100644
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
@@ -286,11 +254,34 @@ void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 	}
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
index fc30793f4..95c23bf11 100644
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

