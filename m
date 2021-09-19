Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C2172
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 15:37:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso13703589wme.4
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 08:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w3kxpS1URn8OPwxyX4KDQ1NP2wd56BIFhiZc9SE8W3Q=;
        b=m2j+ort94V3aMDCKDO64QQwuPD5oO8Tnz+hVsfMRsR1OzNsNYiXnEiUxoVJk047lZb
         fKkuX44nNEhDSFk9FXqJceIYvIQh6IVQkMWi+e+WlJ6vSXXVxqqzrRFn2O4HSGyTcQLj
         OWGt3ODGki6urMZ96xsQtAXh6IYm5qzLbBHaRSD5WaH1YrcUDB1Gglo7yNAzsrpxkp4K
         mjXc8acQ8IKWxnh9YGDtCVzRT5FmdEJ0UKW9LfYPT3vubnMew9unPwTXIIS6H2QHz4wl
         5CJpUFSOW91LNUxGea2Nfc30YokakQGEKfFf+znRv5MsDGZQE3qeIgRcPembjnD8Z+YO
         MGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w3kxpS1URn8OPwxyX4KDQ1NP2wd56BIFhiZc9SE8W3Q=;
        b=K+2j+2x4GMC4uucDd8lWaN+ezpbQWz6D/+LV+F9lJ1JTK0kb1cNkOmEfpWT3zmFlBI
         zjQV4naaBcI8/wYDWvYKKOX76wsGLPbZDTIn3h1o2pemVCRDfzmPoow8Dn7Vuf/Kih+x
         DQkMSHINu9o509bReY9TqGOGYwTBeFUaD5TwxQWFmkRa9nfppTNoes+eDFFYk1vVnZ2y
         O6p57bLZdeZSINEuQMvWolecq1qVro7891pY+w69mBqzSOM+GSrM4reSkfwaP6/UXhNT
         Ojlo22dhJ97k8vSsJJsk3sh7BGwMDSEh5dSLeOTuk7NP28AKtFQmM/F2byzZyQTKRlJz
         a/hQ==
X-Gm-Message-State: AOAM531HP8xEgFJg224yrFRGz0EXtkMw81OIKtx0Bz76cXkBNNmCKMw+
	YFFcD4PrXKrNtrU8FPH3t2E=
X-Google-Smtp-Source: ABdhPJwDJYRhdlkYgLpZAuf3kZiBiyPCN2sHq9cBRaouKkh3X6kxQS/NAJAeVL+tcNng1m6udJLPtw==
X-Received: by 2002:a05:600c:3b89:: with SMTP id n9mr25160659wms.186.1632065859271;
        Sun, 19 Sep 2021 08:37:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id l15sm16614501wme.42.2021.09.19.08.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 08:37:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/6] staging: r8188eu: remove rtw_acl_add_sta()
Date: Sun, 19 Sep 2021 17:36:55 +0200
Message-Id: <20210919153659.20826-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919153659.20826-1-straube.linux@gmail.com>
References: <20210919153659.20826-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_acl_add_sta() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c    | 65 ------------------------
 drivers/staging/r8188eu/include/rtw_ap.h |  1 -
 2 files changed, 66 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 49d65d5b3bac..60ef8092c40b 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -995,71 +995,6 @@ void rtw_set_macaddr_acl(struct adapter *padapter, int mode)
 	pacl_list->mode = mode;
 }
 
-int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
-{
-	struct list_head *plist, *phead;
-	u8 added = false;
-	int i, ret = 0;
-	struct rtw_wlan_acl_node *paclnode;
-	struct sta_priv *pstapriv = &padapter->stapriv;
-	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
-	struct __queue *pacl_node_q = &pacl_list->acl_node_q;
-
-	DBG_88E("%s(acl_num =%d) =%pM\n", __func__, pacl_list->num, (addr));
-
-	if ((NUM_ACL - 1) < pacl_list->num)
-		return -1;
-
-	spin_lock_bh(&pacl_node_q->lock);
-
-	phead = get_list_head(pacl_node_q);
-	plist = phead->next;
-
-	while (phead != plist) {
-		paclnode = container_of(plist, struct rtw_wlan_acl_node, list);
-		plist = plist->next;
-
-		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
-			if (paclnode->valid) {
-				added = true;
-				DBG_88E("%s, sta has been added\n", __func__);
-				break;
-			}
-		}
-	}
-
-	spin_unlock_bh(&pacl_node_q->lock);
-
-	if (added)
-		return ret;
-
-	spin_lock_bh(&pacl_node_q->lock);
-
-	for (i = 0; i < NUM_ACL; i++) {
-		paclnode = &pacl_list->aclnode[i];
-
-		if (!paclnode->valid) {
-			INIT_LIST_HEAD(&paclnode->list);
-
-			memcpy(paclnode->addr, addr, ETH_ALEN);
-
-			paclnode->valid = true;
-
-			list_add_tail(&paclnode->list, get_list_head(pacl_node_q));
-
-			pacl_list->num++;
-
-			break;
-		}
-	}
-
-	DBG_88E("%s, acl_num =%d\n", __func__, pacl_list->num);
-
-	spin_unlock_bh(&pacl_node_q->lock);
-
-	return ret;
-}
-
 int rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 {
 	struct list_head *plist, *phead;
diff --git a/drivers/staging/r8188eu/include/rtw_ap.h b/drivers/staging/r8188eu/include/rtw_ap.h
index 11e6f799d577..d0d1f3834bd6 100644
--- a/drivers/staging/r8188eu/include/rtw_ap.h
+++ b/drivers/staging/r8188eu/include/rtw_ap.h
@@ -23,7 +23,6 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta);
 int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len);
 void rtw_ap_restore_network(struct adapter *padapter);
 void rtw_set_macaddr_acl(struct adapter *padapter, int mode);
-int rtw_acl_add_sta(struct adapter *padapter, u8 *addr);
 int rtw_acl_remove_sta(struct adapter *padapter, u8 *addr);
 
 void associated_clients_update(struct adapter *padapter, u8 updated);
-- 
2.33.0

