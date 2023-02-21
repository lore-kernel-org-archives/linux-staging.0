Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D744C64
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 14:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676991224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNDHyshiR620IZhFYtGcl5Q2QtIGj+rpBuzJKCGrKdo=;
	b=gCnofM52H3bxqsC1fMX5u92f+/Qog9QAPNQS/76xorXp69BJJu2oG7Q9U9bBOJ/uYeCS68
	3zZ062ZjnTGhWLGcYPmYVdkS1P1yPVDbrJ6TvVbKZPo1f44LgjtUffAymjt/OH8VKqX0J9
	YyNM/EaYQno2fF2j4Fuldc3InP6gC0E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-bJaYOCAzMFi7DblJ09XGkw-1; Tue, 21 Feb 2023 09:53:35 -0500
X-MC-Unique: bJaYOCAzMFi7DblJ09XGkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6198D100F917;
	Tue, 21 Feb 2023 14:53:35 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70987140EBF4;
	Tue, 21 Feb 2023 14:53:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/4] drivers: staging: rtl8723bs: Remove pmlmepriv->num_of_scanned
Date: Tue, 21 Feb 2023 15:53:26 +0100
Message-Id: <20230221145326.7808-4-hdegoede@redhat.com>
In-Reply-To: <20230221145326.7808-1-hdegoede@redhat.com>
References: <20230221145326.7808-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pmlmepriv->num_of_scanned is only ever set and never read, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 9 ---------
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 8 --------
 2 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 091842d70d48..7e2c61c75150 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -32,8 +32,6 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 	INIT_LIST_HEAD(&pmlmepriv->scanned_queue.queue);
 	spin_lock_init(&pmlmepriv->scanned_queue.lock);
 
-	set_scanned_network_val(pmlmepriv, 0);
-
 	memset(&pmlmepriv->assoc_ssid, 0, sizeof(struct ndis_802_11_ssid));
 
 	pbuf = vzalloc(array_size(MAX_BSS_CNT, sizeof(struct wlan_network)));
@@ -161,8 +159,6 @@ struct	wlan_network *rtw_alloc_network(struct	mlme_priv *pmlmepriv)
 	pnetwork->aid = 0;
 	pnetwork->join_res = 0;
 
-	pmlmepriv->num_of_scanned++;
-
 exit:
 	spin_unlock_bh(&free_queue->lock);
 
@@ -198,8 +194,6 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 
 	list_add_tail(&(pnetwork->list), &(free_queue->queue));
 
-	pmlmepriv->num_of_scanned--;
-
 	spin_unlock_bh(&free_queue->lock);
 }
 
@@ -220,8 +214,6 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 
 	list_add_tail(&(pnetwork->list), get_list_head(free_queue));
 
-	pmlmepriv->num_of_scanned--;
-
 	/* spin_unlock_irqrestore(&free_queue->lock, irqL); */
 }
 
@@ -863,7 +855,6 @@ static void free_scanqueue(struct	mlme_priv *pmlmepriv)
 		list_del_init(plist);
 		list_add_tail(plist, &free_queue->queue);
 		plist = ptemp;
-		pmlmepriv->num_of_scanned--;
 	}
 
 	spin_unlock_bh(&free_queue->lock);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index ee748620107f..fc0b43d38d9a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -303,7 +303,6 @@ struct mlme_priv {
 	struct __queue	free_bss_pool;
 	struct __queue	scanned_queue;
 	u8 *free_bss_buf;
-	u32 num_of_scanned;
 
 	struct ndis_802_11_ssid	assoc_ssid;
 	u8 assoc_bssid[6];
@@ -490,13 +489,6 @@ static inline void _clr_fwstate_(struct mlme_priv *pmlmepriv, signed int state)
 		pmlmepriv->bScanInProcess = false;
 }
 
-static inline void set_scanned_network_val(struct mlme_priv *pmlmepriv, signed int val)
-{
-	spin_lock_bh(&pmlmepriv->lock);
-	pmlmepriv->num_of_scanned = val;
-	spin_unlock_bh(&pmlmepriv->lock);
-}
-
 extern u16 rtw_get_capability(struct wlan_bssid_ex *bss);
 extern void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target);
 extern void rtw_disconnect_hdl_under_linked(struct adapter *adapter, struct sta_info *psta, u8 free_assoc);
-- 
2.39.1

