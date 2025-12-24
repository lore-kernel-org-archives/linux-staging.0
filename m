Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA3632FA1B
	for <linux-staging@lists.linux.dev>; Wed, 24 Dec 2025 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570735; cv=none; b=n/sXVmof67rELdO+NYdQ/NgqnqJ83p7WNRy03k/oAb1agln3Ytpp7m+mxCtOege3jXG3rFsXawEbGTMuJqA62lD/rfbNyZbgFd/bpkOequzK0WfL6qbeeZtgRiTgD+2pXyc/BrMVrfpqM6bwS/CuUMJb6hud1wReXO5J4XmnhPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570735; c=relaxed/simple;
	bh=4oG2Q7/Kau2MT5tevpME79E3dCyHA80Zxx8VTjFTs9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxAmehHrMVJlybinljg+Cy3mQoRkoU5Dw9LBHxErCxoDncBFIcPHa5+5TjtrDUuvnoSwSeMt7S7Pz3DedZL9gjMSiidmnv2Tev6y/DSJj8BMs0zyqDlxZvW2SJpGUIbEi4irmWFDcJYo2hXDsq8T0mVpkObH2dy3XWRmvN6dUIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXp+GuVf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXp+GuVf"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso1169349066b.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Dec 2025 02:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766570731; x=1767175531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zRbN3HWP+rq6HwG0N9Qdr/BNHS/3TvvhifFlxhocyU=;
        b=OXp+GuVfZ/duk1kXq4rjkw2Y9ZV+MjZJ7OZO/whJzejSL0VZAVquafoCWNZ/eCDa85
         +eDr9Z10nSdtWFqS4bUhnWmMYCVrnT5NGgyRiqlDUF3jyJyZu/qD+iJ5E20rbohWWKOw
         TLqlfrG4gnKsOk42W+JPWHGIMFa2TNNqAYU20gzRYN+R5/Sf/tW7qJwuLkFGjmoWxnuc
         JqAIxyAb8m7wMYHWHhOXbBJpgmnOHHv8DDNRDiV9OOYnkUMymNElE117Aw0KhuJi+fi+
         SBvGX0boRZAiZ3qLq5oe/6zijhE/enRa2dTos0OIyMjqlSQZ9AsKEoTAYPYgLSYlQjCS
         uHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766570731; x=1767175531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7zRbN3HWP+rq6HwG0N9Qdr/BNHS/3TvvhifFlxhocyU=;
        b=cZdEH+3VFncYEigIDpdYzqBGOrRnVZyi5h1uuXLdQrU3RV4QRFn5xOk5Lzy+JAURV5
         5v0iYVYHPmTTrkGxgQsB2YeChqDww+mrkZJ0ucbC4nFkj6fvfdqFLCNhMYnp57EDLU7T
         ZOcXMAIQgFt0aGbkUYDzTkEtTot3hBHRODlAEoH6oAK+cpn7MS3lqUmMZfxBLxhL/hb9
         KRQnUjMYgqxVE9b328zvGssBecRv8+XRDfuizWPqFLREidWbvvVMT32evA+kNEeq4a7l
         gFPxtkNo0BnASddVsAZU6OF+x3xCsYiT86sOm/FN87Tdwm6RnTg5dER1jvBKfyqSRmOR
         mnzw==
X-Forwarded-Encrypted: i=1; AJvYcCW+5rp047oNDzjd9VO4uLcd6OoBxyQS5xaH5X4tohM84dZAnujlcUHPqe3PqjH1mDGrdZlW3qkt6ie4RI3b@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5RtZxCRxDgT9EzZvbuYhFuLwGTg3AA8826n2sJPVoPS/taU+Q
	0D58Nl36iAlmLiKhEGptkOf7ExEJmbHMeMK2wCy4rUAAQwAGvFPEO9pB
X-Gm-Gg: AY/fxX4wSY7hyjCcNgn9DfNy6/PAztkGyP2rEfyb5wKvTtYffgzfBfK4OgxjKQvsnuA
	5Kq73hWnw2aOrhDyAHTcUWHqMvdHgw7PlrK9URLcyvl60yQoGIrfWNe4fXqwFDSAuLpXCuUcw+X
	ye2CQ7nsYostXGm1bY1n3ppNVwTOP6YE6jBHVng6sOsYVAhr/87MZWk3NcnlaoaghqKRFqR+95z
	leZNhmryV5gzCDDI/m9PeUDMNP9uqYW+5L2UxlWt/34oSJKWqwS+raam1VWK67g5h0qX1OYgoUu
	FoimGkpIVNAZAWKHFc3tn3bCVjfCRMYv+FAnYMYfPORz9xah4NyLB2RhrHvpEMPYrXSIoR6aUu9
	PAcU5enb3xc+whr0ErflRve9j1mTl109m7h3YPfuYtLu0TwmCGXSSeAlUq/e8Q3ZwOx5AfWDy/a
	40xh7XT3BEnVA7dH7ly4WPfDz+9LpxQ5K4t8p3C8DfhfdgOR6k4BDTRGZ8/T/6xg==
X-Google-Smtp-Source: AGHT+IHsKAzoONmIoAhqjV0jBLZXoJSr/CX+ArSsxviP+J0Hsf6ir+67vWRx6VKvC+NB5gnXPG8hsw==
X-Received: by 2002:a17:907:eb07:b0:b80:3205:5af3 with SMTP id a640c23a62f3a-b803205815emr1455264366b.15.1766570730612;
        Wed, 24 Dec 2025 02:05:30 -0800 (PST)
Received: from localhost (19.120-65-87.adsl-dyn.isp.belgacom.be. [87.65.120.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm16477810a12.1.2025.12.24.02.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:05:30 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: core: remove unnecessary else-statements
Date: Wed, 24 Dec 2025 05:02:55 -0500
Message-ID: <20251224100329.762141-2-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224100329.762141-1-william.hansen.baird@gmail.com>
References: <20251224100329.762141-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove else statements where the preceding if-statement returns or breaks.

In rtw_mlme.c the if either continues or breaks.
The else-if always breaks, so the else is useless.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  6 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  | 97 +++++++++----------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  8 +-
 3 files changed, 54 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..6ea08ce05bf1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1562,10 +1562,10 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 					continue;
 
 				break;
-			} else {
-				rtw_indicate_disconnect(adapter);
-				break;
 			}
+
+			rtw_indicate_disconnect(adapter);
+			break;
 		}
 
 	} else {
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 3e80d03c4ec9..7ef22947134b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -191,77 +191,76 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 		/* spin_unlock_bh(&(pfree_sta_queue->lock)); */
 		spin_unlock_bh(&(pstapriv->sta_hash_lock));
 		return NULL;
-	} else {
-		psta = container_of(get_next(&pfree_sta_queue->queue), struct sta_info, list);
+	}
+	psta = container_of(get_next(&pfree_sta_queue->queue), struct sta_info, list);
 
-		list_del_init(&(psta->list));
+	list_del_init(&(psta->list));
 
-		/* spin_unlock_bh(&(pfree_sta_queue->lock)); */
+	/* spin_unlock_bh(&(pfree_sta_queue->lock)); */
 
-		_rtw_init_stainfo(psta);
+	_rtw_init_stainfo(psta);
 
-		psta->padapter = pstapriv->padapter;
+	psta->padapter = pstapriv->padapter;
 
-		memcpy(psta->hwaddr, hwaddr, ETH_ALEN);
+	memcpy(psta->hwaddr, hwaddr, ETH_ALEN);
 
-		index = wifi_mac_hash(hwaddr);
+	index = wifi_mac_hash(hwaddr);
 
-		if (index >= NUM_STA) {
-			spin_unlock_bh(&(pstapriv->sta_hash_lock));
-			psta = NULL;
-			goto exit;
-		}
-		phash_list = &(pstapriv->sta_hash[index]);
+	if (index >= NUM_STA) {
+		spin_unlock_bh(&(pstapriv->sta_hash_lock));
+		psta = NULL;
+		goto exit;
+	}
+	phash_list = &(pstapriv->sta_hash[index]);
 
-		/* spin_lock_bh(&(pstapriv->sta_hash_lock)); */
+	/* spin_lock_bh(&(pstapriv->sta_hash_lock)); */
 
-		list_add_tail(&psta->hash_list, phash_list);
+	list_add_tail(&psta->hash_list, phash_list);
 
-		pstapriv->asoc_sta_count++;
+	pstapriv->asoc_sta_count++;
 
-		/* spin_unlock_bh(&(pstapriv->sta_hash_lock)); */
+	/* spin_unlock_bh(&(pstapriv->sta_hash_lock)); */
 
-/*  Commented by Albert 2009/08/13 */
-/*  For the SMC router, the sequence number of first packet of WPS handshake will be 0. */
-/*  In this case, this packet will be dropped by recv_decache function if we use the 0x00 as the default value for tid_rxseq variable. */
-/*  So, we initialize the tid_rxseq variable as the 0xffff. */
+	/*  Commented by Albert 2009/08/13 */
+	/*  For the SMC router, the sequence number of first packet of WPS handshake will be 0. */
+	/*  In this case, this packet will be dropped by recv_decache function if we use the 0x00 as the default value for tid_rxseq variable. */
+	/*  So, we initialize the tid_rxseq variable as the 0xffff. */
 
-		for (i = 0; i < 16; i++)
-			memcpy(&psta->sta_recvpriv.rxcache.tid_rxseq[i], &wRxSeqInitialValue, 2);
+	for (i = 0; i < 16; i++)
+		memcpy(&psta->sta_recvpriv.rxcache.tid_rxseq[i], &wRxSeqInitialValue, 2);
 
-		timer_setup(&psta->addba_retry_timer, addba_timer_hdl, 0);
+	timer_setup(&psta->addba_retry_timer, addba_timer_hdl, 0);
 
-		/* for A-MPDU Rx reordering buffer control */
-		for (i = 0; i < 16 ; i++) {
-			preorder_ctrl = &psta->recvreorder_ctrl[i];
+	/* for A-MPDU Rx reordering buffer control */
+	for (i = 0; i < 16 ; i++) {
+		preorder_ctrl = &psta->recvreorder_ctrl[i];
 
-			preorder_ctrl->padapter = pstapriv->padapter;
+		preorder_ctrl->padapter = pstapriv->padapter;
 
-			preorder_ctrl->enable = false;
+		preorder_ctrl->enable = false;
 
-			preorder_ctrl->indicate_seq = 0xffff;
-			preorder_ctrl->wend_b = 0xffff;
-			/* preorder_ctrl->wsize_b = (NR_RECVBUFF-2); */
-			preorder_ctrl->wsize_b = 64;/* 64; */
+		preorder_ctrl->indicate_seq = 0xffff;
+		preorder_ctrl->wend_b = 0xffff;
+		/* preorder_ctrl->wsize_b = (NR_RECVBUFF-2); */
+		preorder_ctrl->wsize_b = 64;/* 64; */
 
-			INIT_LIST_HEAD(&preorder_ctrl->pending_recvframe_queue.queue);
-			spin_lock_init(&preorder_ctrl->pending_recvframe_queue.lock);
+		INIT_LIST_HEAD(&preorder_ctrl->pending_recvframe_queue.queue);
+		spin_lock_init(&preorder_ctrl->pending_recvframe_queue.lock);
 
-			/* init recv timer */
-			timer_setup(&preorder_ctrl->reordering_ctrl_timer,
-				    rtw_reordering_ctrl_timeout_handler, 0);
-		}
+		/* init recv timer */
+		timer_setup(&preorder_ctrl->reordering_ctrl_timer,
+				rtw_reordering_ctrl_timeout_handler, 0);
+	}
 
-		/* init for DM */
-		psta->rssi_stat.UndecoratedSmoothedPWDB = (-1);
-		psta->rssi_stat.UndecoratedSmoothedCCK = (-1);
+	/* init for DM */
+	psta->rssi_stat.UndecoratedSmoothedPWDB = (-1);
+	psta->rssi_stat.UndecoratedSmoothedCCK = (-1);
 
-		/* init for the sequence number of received management frame */
-		psta->RxMgmtFrameSeqNum = 0xffff;
-		spin_unlock_bh(&(pstapriv->sta_hash_lock));
-		/* alloc mac id for non-bc/mc station, */
-		rtw_alloc_macid(pstapriv->padapter, psta);
-	}
+	/* init for the sequence number of received management frame */
+	psta->RxMgmtFrameSeqNum = 0xffff;
+	spin_unlock_bh(&(pstapriv->sta_hash_lock));
+	/* alloc mac id for non-bc/mc station, */
+	rtw_alloc_macid(pstapriv->padapter, psta);
 
 exit:
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 5ffefa50699e..ad33c7947348 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -694,8 +694,8 @@ int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 
 	if (!memcmp(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_para_element)))
 		return false;
-	else
-		memcpy(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_para_element));
+
+	memcpy(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_para_element));
 
 	pmlmeinfo->WMM_enable = 1;
 	return true;
@@ -1450,9 +1450,7 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 				return get_realtek_assoc_AP_vender(pIE);
 			else if (!memcmp(pIE->data, AIRGOCAP_OUI, 3))
 				return HT_IOT_PEER_AIRGO;
-			else
-				break;
-
+			break;
 		default:
 			break;
 		}
-- 
2.52.0

