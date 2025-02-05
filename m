Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9658211A0C
	for <linux-staging@lists.linux.dev>; Wed,  5 Feb 2025 01:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738720231; cv=none; b=K6CD2fy/8vauItqPC5xnBDzsEEe+fxKj0QjXwrYa1Ua4V36ChDhzQzlFoP+TEc0i/fIPOUf15FToqPhlUS4mYCTCuaxGclLOKVCugrRzpurGkXzTzJrviHNMFnQCZiKG//TeDKAT7sNBpjEKVVN84WeV3pKuZs20d+DjyaAOms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738720231; c=relaxed/simple;
	bh=vsfosK4EDGncw/JpLWreyZi0mpIhSDZJ0eulurqB8Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLcszGZGqBmc2Y09kKW65KaD2flKZzCzLTm79YWvgeYOBjoKTkgZPnNfEcdQscDdjCPa9pIgdbAj9o+OA75mdGJmBQGBbeb2BOn3TeeJoDgc2acMwZI78Ojg4ADlZCiiP188bGPK4Gj2SbFxMC/Bin8O/euuE2auZsmjLk5ARjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOznCks4; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOznCks4"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f9d74037a7so1493111a91.2
        for <linux-staging@lists.linux.dev>; Tue, 04 Feb 2025 17:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738720229; x=1739325029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ08YcfgbUiop8dwOeKgURJ7wcJBnOw/KKn3/YRa9b0=;
        b=SOznCks4HsGLnfW5mPtaUodwtz+we5QPxUEK8FjnYQWT7Yk+lMuIFpEFpSl8RR5mkj
         s6pjlCZhgEHkLneij41EzjLAov+KZJ7EW3iRm3v+i43B/YGBRcyXClX9ZapX0aNXsbvq
         fPMpqMHUBTOpWrr48qvzwXau5/baAnewepbzFfpPm2gkXY46WsIYclrxVNEX+1FMeWR4
         OpyRC5cS3NdQnEQRIPXaPd3kkcLbkKh6aQtn0rc8kcTETDUeVVZYYkiOHPpk8GX6+FL7
         NCIh0Qlnj8y0iqGJaxXB9D4/6OIL/DMM/9B/em/k4W0SY1Uw1ZYygNjBdrr2grZt3HNh
         /qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738720229; x=1739325029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJ08YcfgbUiop8dwOeKgURJ7wcJBnOw/KKn3/YRa9b0=;
        b=M+BFxNWfLYlnJa062eZnr6bvHiX9taweM/o4G0XwwM0JPqx+5N6knPqwusDrbTE/9s
         wtuZrcvnkve/3I9qqWO8o2ym1B1HxIUsJ4/8DzwgJnHyngIiSDV+VAq6YzSixVJaY9Fz
         fWSEOOlS1uNrFTRMc4zr9+/TLK/oi+FNCF2iO/UNafHODqo/xTaSMqc3whC8UOpgzxnU
         /Lo33tLpZQ0XpOIONxe/rnbzYmLzH9TQA9M2HnCiPZ0rPxql4XMUTYialFOSYwP61Kvv
         9ajHBhwiQzQW1XxkAPV5oNYqquYJyR3v/+PSKZwRt0Q0c1RsmgWBsN//xtnPgq2ep6GA
         5aSQ==
X-Gm-Message-State: AOJu0YxL5SttL4D8RZIUhgDHtuZa7f5lWLMNd4fvKexnye4CTfPnRUN4
	8juJlLTsfjkWQeZ8ZGTwQWbzE1YbolSf+/qRN5n4kubcl60OTnWH
X-Gm-Gg: ASbGnctL9ONIewH6KyhhsVtf4nz5kBcp4mkdqHYHZjUp6n2y+9m+OHuBJvqJbfPaCl2
	GpjmBGy8pg6lbZnO81t8z9f78oI5iFb5sT14qEy048VU30xVRraO/2+DnZ6/F+U+X1qTrhQlPAF
	YTXRFK1XxGFDzjZkwdlvSnGoDer3ZPCy8EEmn4v3lmlaWNJMHGlTVk2SsMDqhFuFf3CxnrmikQH
	A45HjZkdisGso55PgVgwGtiGLToJa1otA9VRl+IM8r3M3ns/Wq3Z/JyslgSE4hj1FwsTATc5U3b
	DtLvVHph4GtVU/dmA2A35NA=
X-Google-Smtp-Source: AGHT+IEApOZoxGoFfiDhvmmSwV9n5I2Bw3v+HjLfPGoYIQ9JHhyVVPDO7bDJYvKmPKmMKTla9hFX5A==
X-Received: by 2002:a17:90b:1809:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2f9e0753844mr1485997a91.6.1738720229067;
        Tue, 04 Feb 2025 17:50:29 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([146.70.174.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9c314b64fsm1302137a91.1.2025.02.04.17.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:50:28 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: fixed comment styling
Date: Tue,  4 Feb 2025 17:50:19 -0800
Message-ID: <c167a99c0a96f5eba7e5d10fef947da3edf7d4d9.1738720049.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1738720049.git.onlyian4981@gmail.com>
References: <cover.1738720049.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Comments were not neat and did not comply with the coding style.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 71 +++++++++++------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4d8dc7646867..9bd36440a15b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -185,10 +185,10 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct list_head	*phead, *plist;
@@ -290,10 +290,10 @@ void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnet
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct	wlan_network *pnetwork = _rtw_find_network(scanned_queue, addr);
@@ -483,11 +483,11 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
-
 	}
 
 	/* If we didn't find a match, then get a new network slot to initialize
-	 * with this beacon's information */
+	 * with this beacon's information
+	 */
 	if (!target_find) {
 		if (list_empty & pmlmepriv->free_bss_pool.queue) {
 			/* If there are no more slots, expire the oldest */
@@ -564,11 +564,11 @@ void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
 }
 
 /* select the desired network based on the capability of the (i)bss. */
-/*  check items: (1) security */
-/* 			   (2) network_type */
-/* 			   (3) WMM */
-/* 			   (4) HT */
-/*                      (5) others */
+/* check items: (1) security */
+/* 		(2) network_type */
+/* 		(3) WMM */
+/* 		(4) HT */
+/*		(5) others */
 int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork);
 int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
 {
@@ -827,8 +827,8 @@ static void find_network(struct adapter *adapter)
 }
 
 /*
-*rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
+ */
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -863,8 +863,8 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 }
 
 /*
-*rtw_indicate_connect: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_indicate_connect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_connect(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -882,8 +882,8 @@ void rtw_indicate_connect(struct adapter *padapter)
 }
 
 /*
-*rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_disconnect(struct adapter *padapter)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1466,9 +1466,9 @@ void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
 }
 
 /*
-* _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
-* @adapter: pointer to struct adapter structure
-*/
+ * _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
+ * @adapter: pointer to struct adapter structure
+ */
 void _rtw_join_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = from_timer(adapter, t,
@@ -1503,16 +1503,15 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 
 		/* indicate disconnect for the case that join_timeout and check_fwstate != FW_LINKED */
 		rtw_cfg80211_indicate_disconnect(adapter);
-
 	}
 
 	spin_unlock_bh(&pmlmepriv->lock);
 }
 
 /*
-* rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
-* @adapter: pointer to struct adapter structure
-*/
+ * rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
+ * @adapter: pointer to struct adapter structure
+ */
 void rtw_scan_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = from_timer(adapter, t,
@@ -1628,10 +1627,10 @@ void rtw_set_scan_deny(struct adapter *adapter, u32 ms)
 }
 
 /*
-* Select a new roaming candidate from the original @param candidate and @param competitor
-* @return true: candidate is updated
-* @return false: candidate is not updated
-*/
+ * Select a new roaming candidate from the original @param candidate and @param competitor
+ * @return true: candidate is updated
+ * @return false: candidate is not updated
+ */
 static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
@@ -1710,10 +1709,10 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 }
 
 /*
-* Select a new join candidate from the original @param candidate and @param competitor
-* @return true: candidate is updated
-* @return false: candidate is not updated
-*/
+ * Select a new join candidate from the original @param candidate and @param competitor
+ * @return true: candidate is updated
+ * @return false: candidate is not updated
+ */
 static int rtw_check_join_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
-- 
2.45.3

