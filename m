Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8E1DF261
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949196; cv=none; b=duNl7nBHCz6gFUmKjke3vS/Knj8rAJfrKYPnCIMxDUYREO85DMuUwV790l71PRSPDicqeUKsiUneuexFnlni+axA8ZcIeY94rX5y4CKVO5dlTUv0HFf8SZe/OaBxil4XexY3O+CVjAncRkUhKEM33wfXZCu1B+ennHFgSj0lhbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949196; c=relaxed/simple;
	bh=pxuJYO4CuqL53J68mJP4o7ZMOLhyShj9GKp5RB/NJ2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oOayTRSRLIdprhMpnUItE2uvwjNaOOboin1bgTsI394P3u8f3Jeh0vLwVq8HJGwgJTJguctUwhAB/krEGT8/Wl655KmB/9Thqoam34i8/4g9ig/flJSdb0Rx/IzLGcK956pZx7+fhZj7oZRr4+fQDxgiOVDAxQW4IS4elz1a5Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB4Hkm3c; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB4Hkm3c"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7211b09f639so5461766d6.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949193; x=1757553993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWg4lnTQiycKLRdpjUfi3OBrhYfBAONDfnqMgTxSEog=;
        b=cB4Hkm3c6S2Ov5fQ0hyRiRcm1VtdhQDSroQBzAYfdlVd/zPdgVV19p45MJ0Ezn1OhK
         j348baM+kEF2fgJTuFewx7YI1TrCZYiYww8SEavEos2CbhHEiNlLWJz+/J0M/If8V5LT
         eKIil21q2oBROBVcmJ5YUKSI/QQPnE0ewcil6r3S+tszmzStTBY1BSFS+XwwdkiOf5fR
         RYerJGoEUdVOSIfPa/3AHqMUBcGvRRqqbdSFiFPYKgJTZSI5BHy5umKwXXk0we3R9UhO
         vNbE9eOncMv6cx9K5TFHX3lhyrPjrMxe2fZdc6Ze0gznpyMAoeYBv2es2KaLx/2QMh0g
         cDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949193; x=1757553993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWg4lnTQiycKLRdpjUfi3OBrhYfBAONDfnqMgTxSEog=;
        b=CkbAitvPJ0LOSWszdyhagWOcOq0sWNBLprl1WDHWbvFIEpxykhQqxAasVWmJg48wYe
         zQPum935Nuu4MLAmBmEP2rDrABAKRjES3yqVH5fCAGb9m1JIo3Erdw4dZhLU4hiJ3X/6
         dfcDJ9RrPq8KcLzSaRg9yzyym4t4InFgq55hatojKAhNTga4cteNSU5Jn2cT3UWMQvnq
         wYTUceQZbPH9JMsEQ7+2Kt6FgM7L+uRPBOTM+21x27ppWd1wx2e2VMqoYcBdcAlzOw7w
         WMDMVZdMyVhGkJsoH3rN1U3j1GpJU3a/U3GBYW/tyvtAGM47ErMTv0A04qor2aEJhouH
         cn8Q==
X-Gm-Message-State: AOJu0YxkGcTjbfkyDL9ZTlysEFh1yXnvQpJcXZyiOygDyToyeO8JfwyX
	QqKJ2LQd1nZ2yD+s5ngB38vs1uEjDYJ3TI5h6SUtRIJb5BCEmw2fMpSf/Peu8w==
X-Gm-Gg: ASbGncuzE4T7CSz1oqavTQcQ4ugtasLRMjiXIvQqO/AwjjAismG8HotDwLzeeF8wfeR
	bIrwXfBeBUK9mZ7b6RUSa2u+gmOCaoKN51e8M+H6bgQrBV1XcERN5B+acwLberPQfX7Iwy8vY0Y
	LW67uN+aBJ40EKT2BsyMFowqBHp3XhQD51N7Z3Vs+fvRh3AnhKr/kC0fOh5r6vxCs6F3fgsfH8U
	AUeFdwF1B0D9hhB1EafuTv6i12afPi0tj2uye9LqAqo1Ab21yfkd46qhw/f8DxGURr5x/biTKnF
	4hE59Hen7DNHks6WEGQa3pNmDN+qZLY6SW1eifsjoSfKM482+/vRfMf/PtMfsocF17G8g7Oqgsf
	cplPAgdSsdBI7CM27FV/ahkocMFt7GsmJWOAH7ehF7pAtQeqICGxbeZVapfLaNA==
X-Google-Smtp-Source: AGHT+IGwYo4wjBNE7pDznPSzjQo+7efFZf3z0N82Wrt5NrLH1vL9wlDfXDDQFRNYVMxs3lkpjrMKrw==
X-Received: by 2002:a05:6214:29e9:b0:711:b9f3:1fc2 with SMTP id 6a1803df08f44-711b9f322ddmr192922156d6.26.1756949193103;
        Wed, 03 Sep 2025 18:26:33 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faf5sm38423266d6.65.2025.09.03.18.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:26:32 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 06/16] staging: rtl8723bs: fix indentation to align with open parenthesis
Date: Thu,  4 Sep 2025 01:25:26 +0000
Message-Id: <20250904012529.215521-7-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
References: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
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

