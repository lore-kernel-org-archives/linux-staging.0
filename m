Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ECF43FD2B
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979854; cv=none; b=VHtV7F/wFrz+PgLHNLQkDu4oyRJLOXiYxl/q9qD/XvPUB73lSVxPAq2jFfvIH2uXviYK8m4C/r61i3OaxGR+GkepRf0Sr1gLc7oRA+WyHmq2EiMlSMuG3kx14r5snkEbBO81mn98Xjk7Ec51wd1s+iSwQnyysdaLnYZ98u52MfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979854; c=relaxed/simple;
	bh=PnXURDT7TF7E+506PXiwQOaLGHxh0vguz1r+5WkZrfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIGMGXgZW3Vi/135pez1OgYEOtwJwbbNhRAJf+1zG6BlD2EkgFABxXG27D+EXag5KgoCy0umfAZgvQApz9KzGuTTdFrB/ZlVdQo7TW+7xTjlVZmbI8blXpULGtLRX+M1GxzoGIxtg9140GsOKemsUxzukalbQpT08RCqIycAelU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCUW83/J; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCUW83/J"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3952813fb92so496271a91.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786979850; x=1787584650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xmJpE2fneh7wGrqaQEZBQ9HCgMVcK1jLUppAI08kRg=;
        b=VCUW83/Ji+Xy8fNqBO4ERhXBpe2x1ZDeTfwszKUePwT8jDzjYf+CLI/PxfrYgcA81O
         iMAj5vWILQcgFRHZ+EshnF366FFj/kXPCZw97F5DcsCl6VrsGIq2gTluNM/xgOd2yLlP
         NdMhKWzNZG+wGyW078a6BkbXZFMMSdq4Bhi54+3xBdvMc3K0UHyGEmhvpNpjhOE8Toif
         xUruFb01CSiObpctKJI9+mu4lo3N+0TPUEZdxlYalwhVCdsrp35QJ4VZH+yvWlP3v665
         hDUgPaGfeWYJgaKnAAqAMjRBjln5vgXB0fIA8CgYdrh6jKNx6igJaiMGNTzn9NENYDkj
         +mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979850; x=1787584650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xmJpE2fneh7wGrqaQEZBQ9HCgMVcK1jLUppAI08kRg=;
        b=WJgRrKleoT81/j9a5dXd9s2DFjxqlFHXP7LjAwV2h3VrMv0EdYeQmjkw/P1OAyLdRj
         jYVMshm2pEbkNOMv+HZmdpZ21LkIEpye+W9utM1FaFbmdNM89M/9dWuQPHDb6Aj51WF+
         LIkqIA7CsfR08UUJXYxGoLwaxR0synMKVOgtRLMBbPwFu4HUGH/sk/eu2hSyG/R7Gd5x
         1GPzz32KmLd4AD84fTW6WXFXy9vAyTT23IEg0VeiffgBqiwGGtz6mq8TX8S2IGs0bMdB
         Yi5VwIEWsjq5pUtTV90CLPBy9x7X728W646/Npr0xcoX2CgUiqAfZ4aduv9wc/q4T4dt
         UqTA==
X-Forwarded-Encrypted: i=1; AHgh+RpolkqCoo6JTNILtqej7MNS7pD0TIsXO/mCpviNDHew0hNz96nk0GkowlMYL7x73uwIhdDGSZhA7Ocq+ZLk@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5KY54nJBvZXAgy5I7ED65ouLWFS0c8r/yAlRF5vYrv+aCxWDj
	49bJACN5ImMJsy6lpBhceUPyqgQXwtjByQaDiBQ/TM2Im9bC6tsbmk0c
X-Gm-Gg: AR+sD12ENOzjycyYdMtC9XNEz5xbr6C8ITnt9r1OGr4bc48zr/vmZsMIx9sUphqrH6v
	nxX07BANdMaPbE64MFEveEsOoVmBxOdM+OFWaj1Ma7u+ahFImKBc8JWWM3iRIJN3/8BNhM+VPzq
	9vqODgDkbrWk97+vc9SK/yNPnwVf+Sg06vcaJDm20+hh7HQDIbJHLClbfQG5PMKqF5ZKUQ2lnmr
	WOxwwJ3skuBHLVAJt+488kb6pO2kRQCug7zMMwS1YQl/BJMVKQPWmR5mn2AgK3LAEQtJNwoSZ5u
	MOvByF9COyVS6i9y2YSWLHgVpYZjE2yJetCKa7JwLNUvu4eODPCfSCWk7BR2BVZjlCIB3+cZJ5z
	DrZqMP2xx1IoIzjye3DF7r5nhzzoAE9V8fnRv07yl5PeJ3L09KjekFhUXluKDmg/e5z3xwf44b9
	lyVjLnoErj51lO9DWNiKxmnK6239aJm1PUcgMIHW93G6NwaqEsXyuOuYHgdzoLBxcg6bKPPdt41
	HEFuG032CvJkthqn5BrES7ONAoejZ8oRFbVZpWwTgfSqRh7gQyu8VB6dyIKUNg=
X-Received: by 2002:a17:90b:53c8:b0:392:c80b:8ef7 with SMTP id 98e67ed59e1d1-3955aa68f86mr1278380a91.18.1786979849772;
        Mon, 17 Aug 2026 08:17:29 -0700 (PDT)
Received: from localhost.localdomain (111-242-148-125.dynamic-ip.hinet.net. [111.242.148.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e84118sm5708876a91.5.2026.08.17.08.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:17:29 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: simplify rtw_free_xmitframe()
Date: Mon, 17 Aug 2026 15:17:11 +0000
Message-ID: <20260817151711.24385-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_free_xmitframe() always returns _SUCCESS and the return value is
not used by its callers.

Convert the function to return void and remove the redundant
_SUCCESS return value. Also replace the goto used to skip the xmit
frame queue handling with an early return.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 14 +++++++-------
 drivers/staging/rtl8723bs/include/rtw_xmit.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 81d9e713fc12..230ae52ef04c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1734,14 +1734,14 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv)
 	return pxframe;
 }
 
-s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitframe)
+void rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitframe)
 {
 	struct __queue *queue = NULL;
 	struct adapter *padapter = pxmitpriv->adapter;
 	struct sk_buff *pndis_pkt = NULL;
 
 	if (!pxmitframe)
-		return _SUCCESS;
+		return;
 
 	if (pxmitframe->pkt) {
 		pndis_pkt = pxmitframe->pkt;
@@ -1750,7 +1750,11 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 
 	if (pxmitframe->alloc_addr) {
 		kfree(pxmitframe->alloc_addr);
-		goto check_pkt_complete;
+
+		if (pndis_pkt)
+			rtw_os_pkt_complete(padapter, pndis_pkt);
+
+		return;
 	}
 
 	if (pxmitframe->ext_tag == 0)
@@ -1769,12 +1773,8 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 
 	spin_unlock_bh(&queue->lock);
 
-check_pkt_complete:
-
 	if (pndis_pkt)
 		rtw_os_pkt_complete(padapter, pndis_pkt);
-
-	return _SUCCESS;
 }
 
 void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pframequeue)
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 917e846e9ce2..28615fe72b80 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -416,7 +416,7 @@ extern s32 rtw_put_snap(u8 *data, u16 h_proto);
 extern struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv);
 struct xmit_frame *rtw_alloc_xmitframe_ext(struct xmit_priv *pxmitpriv);
 struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv);
-extern s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitframe);
+void rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitframe);
 extern void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pframequeue);
 struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac);
 int rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
-- 
2.43.0

