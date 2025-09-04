Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289D520E6E2
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952114; cv=none; b=D5cbA7FYiUYxdn5qf4jnJUJntaUnfN4LXfSc+vNZbq+K2MTbmh7FgBudx3yBVZhFcrhEokl4PRkPMwfzv4m+pBCeaCW21f8FGEyNhrzDsrf+DzlsuG5Use0Ki1ims6iBy/WK/4r8lpGYRXBpM0Wns5QLAfjYRg/Pt5KCcD4M0mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952114; c=relaxed/simple;
	bh=pxuJYO4CuqL53J68mJP4o7ZMOLhyShj9GKp5RB/NJ2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GkfcT9DQXzD1f0UNnohB9s3h1dwM0RtZd4C20jL1nhTe5l7hug5WsqKFqdhtaKzELqJhR5AME+shc6elW6sahJQylxnJDLK6CoTuuXrlFdFMZ4+hp6mEpSc2q4WVlWGCo451nziB06D+ox0tI5B+CSBIyOY9U5LGBQULH30uMi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TC/FEvFq; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TC/FEvFq"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7291d89185fso697166d6.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952111; x=1757556911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWg4lnTQiycKLRdpjUfi3OBrhYfBAONDfnqMgTxSEog=;
        b=TC/FEvFqV+AqKhXrXtu695SsOSkHqezSUIcaBpt/0oFZ6OZ2b4wkTM1pyAxdozOPK0
         U4UR1zGmWVYgGBQWdz46Icq1wvUkqv59XG7Y3cg07vFVEH9CpNuw4BtNvQkM2Q0KOpWE
         PeuQXCC9HJTyNupuZmfL7tKrLaNwGkIpC5gn6snvraKY3NQOX2sWhLsioOg3ThbLPcY+
         y0OCp99jcHicyUtFaZKMiLhB74IP6GpXcjB9PLG1tnPChkJuNUWwJ2jFYjIhppmTzX01
         CBnKEmB5ToIP3pUvFg+jt1reJd9j/lHXrGHQPfWAt5cWZSqCF6eJCzJvs9fvCFuCyL7a
         8jWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952111; x=1757556911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWg4lnTQiycKLRdpjUfi3OBrhYfBAONDfnqMgTxSEog=;
        b=PVotDjE95Lv3lQnM8wxT/6Ho9gb00b4f5uK5EvtV/ad9MFNyOiAi11EQ/zEVj0vy2K
         ty5TsgNxwWC14TQKJ3l02zA3sQeZii2Sr9Mc1LRCXXzg3l4U2EYWxRHJi16wup/IS2cA
         U+SnmyIHYnw2dOSDErx3d2P6XqxKsN48+nmXPSozW3/TUUXRgzLUD7ih9pVEmOiEdml/
         hJ2PWi7TVQApIodION75UpYsQD9vYPBPk0+fQsPllnv4Rabfxn+sLaGkHm8CkxvzczUH
         XL4cB7X3wcCfDvxDARX9J1b3oXOYLsMfVqUL9aRQizlpzGwqigAsEbT2bA+UQAAR6uti
         vyOw==
X-Gm-Message-State: AOJu0Yyh0iBGdhA52nzh35p9XuGSjBeadUrzbsELAIPgvo1Pgaqhalu0
	Uecgr4qm7xuxmPdm1kzll6D3CF7IotX5E64aEJPc7pF5PilvF/IZxxwh
X-Gm-Gg: ASbGncuI9AfixnCy14btvBODWfEjqsFTVnk6zTzyI/SfUJA0RyAeU8nQDBNd6c/ncSe
	zNEkC1HW0QWKVUdhMpEO62nKEkLHD4Ra6fsedmwYPtF835bQk7lGRTYtcDBCdaLIrfHJIje4ctu
	JSu+Y+8ko1+ZBRNRWpSFENPQmEA0VNGD8spNjXuZNKk/jP20z0k7gkUxvH0bO81N6HD+v4Z1O72
	A6pJR+horx1ZGmGbOs7oCDWJ44P1b3b+anComfgMs6EulE8txp4Y6EAe+qfp+w+URO0GLg4xjsF
	uknPJKZgWOvdxW6Hid9KKqFMBNOsJWvpVVYobvfuXQU09DiY5ofoRYr6KZsqXz1v10EWOIPqlJ7
	zlgg61CZpCmtz9vUJlDNqzxYK9mJz21vfijF2tPOoDm7kwwmW7xcmG79VRS2TvA==
X-Google-Smtp-Source: AGHT+IF3Agr1d6gNeVc1AJ1OiiU3Bn1sTiAQGqvx/SormxN8dXKci+PskAoIUzX94Cyaw5HiAqKy0g==
X-Received: by 2002:a05:6214:2584:b0:727:c190:34ea with SMTP id 6a1803df08f44-727c1903594mr28399086d6.39.1756952110900;
        Wed, 03 Sep 2025 19:15:10 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:10 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 06/16] staging: rtl8723bs: fix indentation to align with open parenthesis
Date: Thu,  4 Sep 2025 02:14:38 +0000
Message-Id: <20250904021448.216461-7-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust indentation of function arguments to align with the opening
parenthesis, following kernel coding style. This improves readability
and maintains consistent formatting.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2ed7f71e41d1..19bf6bb360f9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -183,7 +183,7 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 		return;
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true))
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true))
 		lifetime = 1;
 
 	if (!isfreeall) {
@@ -270,7 +270,7 @@ signed int rtw_if_up(struct adapter *padapter)
 	signed int res;
 
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
-		(check_fwstate(&padapter->mlmepriv, _FW_LINKED) == false))
+	    (check_fwstate(&padapter->mlmepriv, _FW_LINKED) == false))
 		res = false;
 	else
 		res =  true;
@@ -339,7 +339,7 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
-		    (pnetwork->network.privacy == 0))
+	    (pnetwork->network.privacy == 0))
 		ret = false;
 	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
@@ -420,7 +420,7 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 }
 
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
-	struct adapter *padapter, bool update_ie)
+		    struct adapter *padapter, bool update_ie)
 {
 	long rssi_ori = dst->rssi;
 
@@ -474,9 +474,9 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	rtw_bug_check(&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network);
+		      &pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network);
 
 	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) &&
 	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
@@ -1438,7 +1438,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	spin_lock_bh(&pmlmepriv->lock);
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
 		if (adapter->stapriv.asoc_sta_count == 2) {
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
@@ -1537,7 +1537,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	}
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		rtw_free_stainfo(adapter,  psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {
@@ -2107,7 +2107,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 
 	for (i = 0; i < NUM_PMKID_CACHE; i++)
 		if ((p->PMKIDList[i].bUsed) &&
-				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
+		    (!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
 			return i;
 	return -1;
 }
@@ -2694,8 +2694,8 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 signed int rtw_linked_check(struct adapter *padapter)
 {
 	if ((check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true) ||
-			(check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE |
-			 WIFI_ADHOC_MASTER_STATE) == true)) {
+	    (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE |
+			   WIFI_ADHOC_MASTER_STATE) == true)) {
 		if (padapter->stapriv.asoc_sta_count > 2)
 			return true;
 	} else {	/* Station mode */
-- 
2.39.5

