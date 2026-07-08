Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2113C3448
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 19:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783537367; cv=none; b=q2EFXlNmurDo7nERg7x9MOkrR27ZzLpyDE97BYcWM9bKqrmr7bBCko9Owx0PtTnCfQCX7D2SeV+qCHd4tsu6eCOr/5+u+GJrPFgGTfAWZvyTjwnhIKa4Tak0jzCxxsa8hDBc47TZV72nFRS8p9jCAG1fWmOlfecF7DUsVk6fBGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783537367; c=relaxed/simple;
	bh=ViDKMLvRHVPlL+0kGNKJPu2ZU2zLGSYsWLB/j4ZittU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/cQ1pC3hkdz5ZwPJf+YTdZ10rkuOfs6nJxW9B9nK3m+JszIy4D6FFrPeEiopQ8FC3m5/17poKUUU8XFIgrcXNwo2rU/cTCV2oiZO8RgrTKod89eYyennx1dtZfbDaIkvBOIkx0DTbyBy85OdbsSMPas7vybJeHFWqMy6uIzdYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUGj63YX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUGj63YX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so6007735e9.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 12:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783537364; x=1784142164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swxPrbQW/jgc5eLVXhZ7wjTQH8dI0A5KOMNDTQ69GVg=;
        b=JUGj63YX+6XasXjM5dV3Z47KR9+66Yp4ZMsbmrzJwFlsQOqFiPtt8/4poO4iauwL3j
         x1E0MXAmhHhvtwuNgVTTDL4I+0VZHYBAxxXxQTHBHlI/MnY9yoXahX3t1qmtnCvBpLFz
         0VhHBI3yj45Z7RH0HARdgHD10FR/ZmUwTPdGVYWPfZS6e3QlfRASQSYGPjUtVrRwmzkP
         wC6knxPvynLYbdvWDS3IW+9vFeGrjpEGNL08wtw+xvx+r9BhRORR2vFB0bp4/X+ecstN
         g+C+BFSsO7+RX1WsK7WTmIW5dmU2MfjeCst7Z3ayEyhwO+MWkMT46OwDbtss3rufy/GV
         O0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783537364; x=1784142164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swxPrbQW/jgc5eLVXhZ7wjTQH8dI0A5KOMNDTQ69GVg=;
        b=s90e7q7CzMsf4ncijjbs3NQsUoj/aoCIYxHD2qLFvSm2OsKQXOpxexs6sjVxZEr2HJ
         z7QxBUBxc22AgUJ0d93YpkVJBegitUcto5rqtNwgRKFneirKBE3tjm6s/D28uTnnZu9f
         7+2WIWt9qjKWsE7swQNGoJA8TmSsAbaQfwFscq8qVdY8356KZl9je0hALlX7x5crB7Pa
         EBS8xfKYnl4m/Zm/VYr8ubqFITjY5aaIjbdYzyTXuRphG7xoyl63E6ge1ToILpmjIjK1
         Mn1wCXYNJe3GhXwr6rKtfiycVEwNHQ8uNugaBdkoR68y5m34DsT3s66QxBhgwW3kja9D
         07Og==
X-Gm-Message-State: AOJu0Yxn2Xn027aFaWiSZh7O3hErXD7QHuAUu1ysF33UrOSJZIHsivoA
	7sv7nztXVnOIZq8kwf4uFlBUBb9++caqk4fXJy5V7S47F4gdBHM1D57w
X-Gm-Gg: AfdE7cn+hMQv+yv93zIESw/xB+2SCQiV9rSc7CB8vf8zUpklvos5os205u9GxV43YV3
	zL32rSIF9WAnBQ/ulCyt89zD7whUPI5+JXoZa9+2wt6cJdW7JOM9tYMnCsrPQ9cxOcDZg+E6vEo
	agefrZAr9JW9ZcDCZNSYrzz42hHsHvelfnR6LvuWd32JhmF49H3jws31HxlOcyVGRgxcFZpmw8V
	SU+7hxW0pmiFLlwtnP86QLnRu1F08F91Ic+7r2xOYAnrXrO0q5dZqVwXiNG41L/Y2Aq0w7h7Ki/
	cVJUN8vcrrAr4oHahOwtWHA+5TQH+FxyTeMoP7wr9KDHIqaoVRM+qv/srSARy44z7eQwIfBIteY
	3vM1uWoSBN6L817jCchzw2iMqKGmrC4ckTze0tR8Xxu5s+QFOPWh2dDBeL52/ROpyqJgurK1iiO
	c9DDRJcxBsgXNz+QADd+kzKWiKa2fCpnompXSWtMy/KIyX+q8s19DfMlZctvYuXrNYwapg8Gtk6
	RSVXXAGe4BoUVAD
X-Received: by 2002:a05:600c:1d99:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-493e6894944mr40589785e9.6.1783537363785;
        Wed, 08 Jul 2026 12:02:43 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccaf1sm184105e9.2.2026.07.08.12.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 12:02:43 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Rename camelcase struct member dot11PrivacyAlgrthm
Date: Wed,  8 Jul 2026 19:01:02 +0000
Message-ID: <20260708190102.2104-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ah6_GQWX8e8CjDN_@koolguy>
References: <ah6_GQWX8e8CjDN_@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Rename struct member dot11PrivacyAlgrthm to dot11_privacy_algrthm in
struct security_priv to resolve checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
Changes in v2:
- Rebased onto latest staging-testing.
- Refer to struct member instead of variable in commit description.

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 12 ++---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  8 ++--
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  6 +--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 16 +++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  4 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  2 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 +-
 .../staging/rtl8723bs/include/rtw_security.h  |  6 +--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 48 +++++++++----------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 13 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 1d429f16e01e..7e272701c68c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -651,8 +651,8 @@ void start_bss_network(struct adapter *padapter)
 	if (!pmlmepriv->cur_network.join_res) { /* setting only at  first time */
 
 		/* WEP Key will be set before this function, do not clear CAM. */
-		if ((psecuritypriv->dot11PrivacyAlgrthm != _WEP40_) &&
-		    (psecuritypriv->dot11PrivacyAlgrthm != _WEP104_))
+		if ((psecuritypriv->dot11_privacy_algrthm != _WEP40_) &&
+		    (psecuritypriv->dot11_privacy_algrthm != _WEP104_))
 			flush_all_cam_entry(padapter);	/* clear CAM */
 	}
 
@@ -1800,8 +1800,8 @@ void rtw_ap_restore_network(struct adapter *padapter)
 
 	start_bss_network(padapter);
 
-	if ((padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_) ||
-	    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+	if ((padapter->securitypriv.dot11_privacy_algrthm == _TKIP_) ||
+	    (padapter->securitypriv.dot11_privacy_algrthm == _AES_)) {
 		/* restore group key, WEP keys is restored in ips_leave() */
 		rtw_set_key(padapter,
 			    psecuritypriv,
@@ -1836,8 +1836,8 @@ void rtw_ap_restore_network(struct adapter *padapter)
 			Update_RA_Entry(padapter, psta);
 			/* pairwise key */
 			/* per sta pairwise key and settings */
-			if ((psecuritypriv->dot11PrivacyAlgrthm == _TKIP_) ||
-			    (psecuritypriv->dot11PrivacyAlgrthm == _AES_)) {
+			if ((psecuritypriv->dot11_privacy_algrthm == _TKIP_) ||
+			    (psecuritypriv->dot11_privacy_algrthm == _AES_)) {
 				rtw_setstakey_cmd(padapter, psta, true, false);
 			}
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 623ce064d395..67e451adf50f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -759,9 +759,9 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 		/* Added by Albert 2010/06/23 */
 		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
 		/* Especially for Realtek 8192u SoftAP. */
-		if ((padapter->securitypriv.dot11PrivacyAlgrthm != _WEP40_) &&
-		    (padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
-		    (padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
+		if ((padapter->securitypriv.dot11_privacy_algrthm != _WEP40_) &&
+		    (padapter->securitypriv.dot11_privacy_algrthm != _WEP104_) &&
+		    (padapter->securitypriv.dot11_privacy_algrthm != _TKIP_)) {
 			rtw_ht_use_default_setting(padapter);
 
 			rtw_build_wmm_ie_ht(padapter, &psecnetwork->ies[12], &psecnetwork->ie_length);
@@ -879,7 +879,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	memcpy(psetstakey_para->addr, sta->hwaddr, ETH_ALEN);
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
-		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11PrivacyAlgrthm;
+		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11_privacy_algrthm;
 	else
 		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm, false);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 958bb0d2aaa1..7d60da02b46d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -425,13 +425,13 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 
 	switch (wep->key_length) {
 	case 5:
-		psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
+		psecuritypriv->dot11_privacy_algrthm = _WEP40_;
 		break;
 	case 13:
-		psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
+		psecuritypriv->dot11_privacy_algrthm = _WEP104_;
 		break;
 	default:
-		psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+		psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 		break;
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 849280edaacc..aaac09100fe3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -330,10 +330,10 @@ bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 {
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
-	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
+	if ((psecuritypriv->dot11_privacy_algrthm != _NO_PRIVACY_) &&
 	    (pnetwork->network.privacy == 0))
 		return false;
-	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
+	else if ((psecuritypriv->dot11_privacy_algrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
 		return false;
 
@@ -978,7 +978,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			padapter->securitypriv.bgrpkey_handshake = false;
 
 			psta->ieee8021x_blocked = true;
-			psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+			psta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
 
 			memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
 
@@ -1120,7 +1120,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
 		psec_priv->dot11_auth_algrthm = dot11AuthAlgrthm_Open;  /* open system */
-		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+		psec_priv->dot11_privacy_algrthm = _NO_PRIVACY_;
 		psec_priv->dot11PrivacyKeyIndex = 0;
 
 		psec_priv->dot118021XGrpPrivacy = _NO_PRIVACY_;
@@ -1335,7 +1335,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
 	if (adapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X)
-		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
+		psta->dot118021XPrivacy = adapter->securitypriv.dot11_privacy_algrthm;
 
 	psta->ieee8021x_blocked = false;
 
@@ -1890,7 +1890,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	if (psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_8021X)
 		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
 	else
-		psetkeyparm->algorithm = (u8)psecuritypriv->dot11PrivacyAlgrthm;
+		psetkeyparm->algorithm = (u8)psecuritypriv->dot11_privacy_algrthm;
 
 	psetkeyparm->keyid = (u8)keyid;/* 0~3 */
 	psetkeyparm->set_tx = set_tx;
@@ -2120,7 +2120,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	security_priv *psecuritypriv = &adapter->securitypriv;
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
+	pdev_network->privacy = (psecuritypriv->dot11_privacy_algrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
 
 	pdev_network->rssi = 0;
 
@@ -2345,7 +2345,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 	ht_capie.ampdu_params_info = (max_rx_ampdu_factor & 0x03);
 
-	if (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
+	if (padapter->securitypriv.dot11_privacy_algrthm == _AES_)
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & (0x07 << 2));
 	else
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & 0x00);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 128213c97a61..fdb4a2d40ef5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -706,8 +706,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 
 	if (auth_mode == 2 &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP40_ &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP104_)
+			psecuritypriv->dot11_privacy_algrthm != _WEP40_ &&
+			psecuritypriv->dot11_privacy_algrthm != _WEP104_)
 		auth_mode = 0;
 
 	if ((algorithm > 0 && auth_mode == 0) ||	/*  rx a shared-key auth but shared not enabled */
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index fd7780b4809b..29e2a5a771dd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1430,7 +1430,7 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &adapter->securitypriv;
 	signed int keyid;
 
-	if ((securitypriv->dot11PrivacyAlgrthm == _WEP40_) || (securitypriv->dot11PrivacyAlgrthm == _WEP104_)) {
+	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) || (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 33004fd9cff2..ca8f01575b55 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -419,7 +419,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 			/* IOT action */
 			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) &&
 			    pattrib->ampdu_en &&
-			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+			    (padapter->securitypriv.dot11_privacy_algrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
 			}
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index a6f5b6ad471d..61cdc27a64ac 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -316,7 +316,7 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 		break;
 
 	case BTC_GET_BL_WIFI_ENABLE_ENCRYPTION:
-		*pu8 = padapter->securitypriv.dot11PrivacyAlgrthm != 0;
+		*pu8 = padapter->securitypriv.dot11_privacy_algrthm != 0;
 		break;
 
 	case BTC_GET_BL_WIFI_UNDER_B_MODE:
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 4fdda25969f9..bd6fbb80ddb7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -88,7 +88,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_RX_UNI, &(dvobj->traffic_stat.rx_bytes));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_WM_MODE, &(pmlmeext->cur_wireless_mode));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SEC_CHNL_OFFSET, &(pHalData->nCur40MhzPrimeSC));
-	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SEC_MODE, &(Adapter->securitypriv.dot11PrivacyAlgrthm));
+	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SEC_MODE, &(Adapter->securitypriv.dot11_privacy_algrthm));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_BW, &(pHalData->CurrentChannelBW));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_CHNL, &(pHalData->CurrentChannel));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_NET_CLOSED, &(Adapter->net_closed));
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 58c9b5de4ae2..85973375b113 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1873,7 +1873,7 @@ void rtl8723b_fill_fake_txdesc(
 	/*  Encrypt the data frame if under security mode excepct null data. Suggested by CCW. */
 	/*  */
 	if (bDataFrame) {
-		u32 EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
+		u32 EncAlg = padapter->securitypriv.dot11_privacy_algrthm;
 
 		switch (EncAlg) {
 		case _NO_PRIVACY_:
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 7b92f7e4ce71..cc7e27603690 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -92,7 +92,7 @@ struct rt_pmkid_list {
 
 struct security_priv {
 	u32   dot11_auth_algrthm;	/*  802.11 auth, could be open, shared, 8021x and authswitch */
-	u32   dot11PrivacyAlgrthm;	/*  This specify the privacy for shared auth. algorithm. */
+	u32   dot11_privacy_algrthm;	/*  This specify the privacy for shared auth. algorithm. */
 
 	/* WEP */
 	u32   dot11PrivacyKeyIndex;	/*  this is only valid for legendary wep, 0~3 for key id. (tx key index) */
@@ -174,7 +174,7 @@ do {\
 	case dot11AuthAlgrthm_Open:\
 	case dot11AuthAlgrthm_Shared:\
 	case dot11AuthAlgrthm_Auto:\
-		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
+		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
 		break;\
 	case dot11AuthAlgrthm_8021X:\
 		if (bmcst)\
@@ -183,7 +183,7 @@ do {\
 			encry_algo = (u8)psta->dot118021XPrivacy;\
 		break;\
 	case dot11AuthAlgrthm_WAPI:\
-		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
+		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
 		break;\
 	} \
 } while (0)
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 47506fb93a85..ed1b936215b9 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -541,11 +541,11 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Auto;
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
-			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
+			psecuritypriv->dot11_privacy_algrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 
 			if (wep_key_len == 13) {
-				psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
+				psecuritypriv->dot11_privacy_algrthm = _WEP104_;
 				psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 			}
 
@@ -595,7 +595,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			psecuritypriv->binstallGrpkey = true;
 
-			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
+			psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
 			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
 
@@ -669,7 +669,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 				psecuritypriv->binstallGrpkey = true;
 
-				psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
+				psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
 				rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
 
@@ -737,11 +737,11 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
-			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
+			psecuritypriv->dot11_privacy_algrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 
 			if (wep_key_len == 13) {
-				psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
+				psecuritypriv->dot11_privacy_algrthm = _WEP104_;
 				psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 			}
 
@@ -770,7 +770,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+					psta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
@@ -812,7 +812,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 			}
 		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) { /* adhoc mode */
@@ -935,15 +935,15 @@ static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
-	if ((key_index < WEP_KEYS) && ((psecuritypriv->dot11PrivacyAlgrthm == _WEP40_) || (psecuritypriv->dot11PrivacyAlgrthm == _WEP104_))) { /* set wep default key */
+	if ((key_index < WEP_KEYS) && ((psecuritypriv->dot11_privacy_algrthm == _WEP40_) || (psecuritypriv->dot11_privacy_algrthm == _WEP104_))) { /* set wep default key */
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
 		psecuritypriv->dot11PrivacyKeyIndex = key_index;
 
-		psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
+		psecuritypriv->dot11_privacy_algrthm = _WEP40_;
 		psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 		if (psecuritypriv->dot11DefKeylen[key_index] == 13) {
-			psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
+			psecuritypriv->dot11_privacy_algrthm = _WEP104_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 		}
 
@@ -1340,7 +1340,7 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 {
 	u32 ndisencryptstatus = Ndis802_11EncryptionDisabled;
 
-	u32 *profile_cipher = ucast ? &psecuritypriv->dot11PrivacyAlgrthm :
+	u32 *profile_cipher = ucast ? &psecuritypriv->dot11_privacy_algrthm :
 		&psecuritypriv->dot118021XGrpPrivacy;
 
 	if (!cipher) {
@@ -1377,7 +1377,7 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 	if (ucast) {
 		psecuritypriv->ndisencryptstatus = ndisencryptstatus;
 
-		/* if (psecuritypriv->dot11PrivacyAlgrthm >= _AES_) */
+		/* if (psecuritypriv->dot11_privacy_algrthm >= _AES_) */
 		/*	psecuritypriv->ndisauthtype = Ndis802_11AuthModeWPA2PSK; */
 	}
 
@@ -1477,23 +1477,23 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
 	switch (pairwise_cipher) {
 	case WPA_CIPHER_NONE:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _NO_PRIVACY_;
+		padapter->securitypriv.dot11_privacy_algrthm = _NO_PRIVACY_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
 		break;
 	case WPA_CIPHER_WEP40:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _WEP40_;
+		padapter->securitypriv.dot11_privacy_algrthm = _WEP40_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		break;
 	case WPA_CIPHER_TKIP:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _TKIP_;
+		padapter->securitypriv.dot11_privacy_algrthm = _TKIP_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption2Enabled;
 		break;
 	case WPA_CIPHER_CCMP:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _AES_;
+		padapter->securitypriv.dot11_privacy_algrthm = _AES_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption3Enabled;
 		break;
 	case WPA_CIPHER_WEP104:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _WEP104_;
+		padapter->securitypriv.dot11_privacy_algrthm = _WEP104_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		break;
 	}
@@ -1513,9 +1513,9 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	}
 
 	/* TKIP and AES disallow multicast packets until installing group key */
-	if (padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_
-		|| padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_WTMIC_
-		|| padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
+	if (padapter->securitypriv.dot11_privacy_algrthm == _TKIP_
+		|| padapter->securitypriv.dot11_privacy_algrthm == _TKIP_WTMIC_
+		|| padapter->securitypriv.dot11_privacy_algrthm == _AES_)
 		/* WPS open need to enable multicast */
 		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
 		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
@@ -1561,7 +1561,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	memcpy(ndis_ssid.ssid, (u8 *)params->ssid, params->ssid_len);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
@@ -1657,7 +1657,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 		rtw_scan_abort(padapter);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
@@ -1709,7 +1709,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 			pwep->length = wep_total_len;
 
 			if (wep_key_len == 13) {
-				padapter->securitypriv.dot11PrivacyAlgrthm = _WEP104_;
+				padapter->securitypriv.dot11_privacy_algrthm = _WEP104_;
 				padapter->securitypriv.dot118021XGrpPrivacy = _WEP104_;
 			}
 		} else {
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index d722121c3633..fb6fc603f279 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -532,7 +532,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
 	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 
 	psecuritypriv->dot11PrivacyKeyIndex = 0;
 
-- 
2.54.0

