Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6027F2BEFE4
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128645; cv=none; b=g+e5UnZvS4N9lvmoQY6pr8pXOXZKUQ9ltCRtALEIO8a5hwvjtq86xdrnLCtqFACMRYagb1cDHg3JNyk1jqiEcKYJHXmpBteMaFzO2DElPAJHm+/8DQ+ZH8pV4+xDHbKHazU9ND0pWndTj89DtnXCzuUmXD+sL9Zo7QcvvPwc2AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128645; c=relaxed/simple;
	bh=pxuJYO4CuqL53J68mJP4o7ZMOLhyShj9GKp5RB/NJ2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m8T8OVkgyAeKHujXtoQEd6ujRLMts+YiyqmAu43jke0QmlQF8w1QDk+H2lSWTpHdCOMaMw6Ljx6oWlbxA+LkKQvAbV9+sL5nlbqEwzIkKodnsCqKmcdNcqoVVTVVMaAqf6UwKsF5u0D2z1DJ/OMtQU9jGDir2ucj5u763AS7GiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDzIFSC6; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDzIFSC6"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4e06163d9e9so9276201cf.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128642; x=1759733442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWg4lnTQiycKLRdpjUfi3OBrhYfBAONDfnqMgTxSEog=;
        b=GDzIFSC67kYW84vGzR/NqdXa5CW1DfBlnkV4GuETerRhVNqJ39AlBl9wdC28KHI0/h
         eVXO3JWqeFMg68YrC4GXOWxXBoQ1+7IhDyZyG1k1ou8qN9BybaWAC2q/gLzHMgaiY9ta
         K7cplJYYbA2rVkrVjvc7uHSHSl7vrh8roSEz/63BGaUxCeh8qf52TtICt5Ass8PxDJt8
         8q7vJmzHsTheRQ4c04hgaZH7yX28aMUsVWBmm3BXdVGPH/SvEqZyPGmtZF1zDpOsZMeT
         cP8vGjUUuHWrSnkn1wtgz1IoJShjGdls9IInaAyFBJ+aIyc/QxLQwl0ajYH6eN1VfnDG
         sM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128642; x=1759733442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWg4lnTQiycKLRdpjUfi3OBrhYfBAONDfnqMgTxSEog=;
        b=Wds5ygDUZkNz1P8kINLEt0gAJzIc127jpExOcdNOUKrCmnOKqBGIKLMVFDd6McjeEC
         dyctFmelHinFeevfvzOyRojcsjIwYotbQya0btnA6Xph9RxvRKogwtnVdnBoijfToexO
         ueHNbtQzNUK3GHaChZR/j+/kdsMj1cOvWc//ht8rhaeE6Dlz2yaLCjUJo/4HX3RmbV1n
         6X3YqZFxM9rs7YB0bn1qwiEWN526ZwsAJeP4lNIloid7HyvttrDJfRALhAu9DUSgsRzd
         wGQUeyjeP3qoDCKjFAno9ZFD6eUgFxYn5IcoVtjoTjUDbyviSjz+J4vaWAx9ccPfdsEo
         I6Jw==
X-Gm-Message-State: AOJu0YzPFIjaIxQJEPpQ2hyozNrDFJTCqVtWBz+M+oGtKwZaW97OvPLD
	KWz412Luf3mj6cX65WEtOjIGnzxiu1kBr094+qyt94rRgT4eZmW8eNu0sfHAEA==
X-Gm-Gg: ASbGncvKl4XWlUIyf49MGdN1TmXrIiQdFAZEdUswf6cNcQw/PObjJOd3L8xT2HcBEEZ
	laalmTo5qGOq2J5p3G5DcYAU2dDT5T2qcRm7/mEHDWErZCeaa3PLOZItnSEm8X+wPK5bjzQJmKS
	emNsYjUYeo/jTTmNVDGK2gM3r1UYQPfuBmHXHBSvq55tgrYF2ueRB2bWJ31gLewVq3oZV1shrWZ
	POKZLi75UOvMHg8s/yrtQEjueri/UG/RlCQ0lT6eayjFYz8oH/WLnVqSKLgaDYYsIF0fQMLpxd2
	GkKxalnOdg2jejOpaq0RYOik19S93TNew1ml7ZI7ze4xsH8VtCjz5yv1IQ3vw7/sPS6HoCD835t
	zRuIKILuEAsdWr9AhT5TVgSoIWkdko+t6sFQ8M5/kB4TfCc8CkaU=
X-Google-Smtp-Source: AGHT+IFD6o45gYEmIpG1PaSfIBPIwybRJGtWPnj4vNP16R36MG7iSTAq9le1VX4I+4eDKHLBLdEOAw==
X-Received: by 2002:ac8:58c7:0:b0:4ce:f3ce:e9da with SMTP id d75a77b69052e-4da4782aae5mr275356391cf.16.1759128642339;
        Sun, 28 Sep 2025 23:50:42 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:42 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 06/15] staging: rtl8723bs: fix indentation to align with open parenthesis
Date: Mon, 29 Sep 2025 06:49:51 +0000
Message-Id: <20250929065000.1010848-7-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
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

