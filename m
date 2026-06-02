Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967EB3DA5C4
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399964; cv=none; b=B1ZtBNmq/hrtvk6DLThOrxIyfU5Bka/wsgMyHWcS6l81WWOGohLsHHfup5Hj8KR25ebCr9baHRZdOG8KkxGU3KF88oASTy2t+CGZJi3W4c2TBLD29dLCOjf/CumE5j8e4EydIohUa9kK5BvxsGvuDbmepmUkJgk+5TzhRkzEUaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399964; c=relaxed/simple;
	bh=IYxD/gUudYKuuIfEgNWFvDUDEqAVQdpy5VnIPpuMomI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmXyETgITlFxax1tPNeVysAUvq0QRKpsUFfXoDgXa4p6maxTGpVKhGaOeNxwSwgUJgTsP2Zdc/DBC2iYZLCSaoS4lagTjgv8RjpPVhVAqfGMCXf4X7P8Kfl+PAtwzVg4SDnffVg8COiiw5xEEH6hgntc6v4CYN6YB5C6eBRDEhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7VYe5k7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7VYe5k7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b3e03939so2410965e9.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 04:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780399958; x=1781004758; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMFvJ3qsmtJ45NVB3b+QLFHQFXSdzxiutRB/Sif6eJ8=;
        b=h7VYe5k7hufYCJFY6Gda9G5CtT77cF1URBo5MSuu9154lqzlumrkt3SkzAMkNzAouY
         n2Eddk2vnxJAm5y6b6PPLa0/T+MhRT4FWrkubEo70TzWC7E/QLR9Mqu+m8mtvo1Lwr7G
         i1AXCFQyC+8x2IDGFLiGiBwvMvUvwmSdVZL962v9hp6fPPrdWj2ixi98vJHmEtzSYHnU
         eHvKlD0/0R8emHlsGY1ANCbT0CATemPmVd7fEew21rl3oifJ/fbgQPB+WhVZVPOqPn2J
         RCColR/qYU3O82hO5fZWxE6fj19D4DTven+0OH9lD5xpxBBKn51RvVlEGurvcQQGnL69
         T/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399958; x=1781004758;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMFvJ3qsmtJ45NVB3b+QLFHQFXSdzxiutRB/Sif6eJ8=;
        b=MVyZ0LqezqgJ/V9t1h7rskNYOcLsKET72HxVbGF286X7RBlqUq8jHGeCGymp5402M3
         7Xw9uIvTZ6uaOt9yrfOkyTcfFb7sWv/0BOJud5TFSDPVyrFqQCEFa6wtlRNDj77AWhNx
         e/1tCvfUJfJlGqSF2zweBUfJb6NMpjvDeEUehWDhPvJMVRl4XquWQPfLxkJ/nxE2GwZl
         UuUI9ho4Oz/sDSmIjufwY1tQsNnXef0QTGr7UYx2/j0pbkLAplnjAuWzv0SW68jPV+Oq
         gSW7WTDPErfiniypd5+3I4jyB2R30bRLQ1PdiqLwiPayVR1LTGDyamSN/w0kB4HFkApp
         VAog==
X-Gm-Message-State: AOJu0YyRjc6mynSiV+eWMW+X+fp02+cSJcClJkOGc7xhOYKUzVYD4sOR
	fljbV1ubSypTvfjx3ZeIFblrqifjCIbiy06keQWBsYOHTTs6VCx7EBXU
X-Gm-Gg: Acq92OG4aUhj/U+cxs76yJFlcHFzbrWzxU0HWL1Yfp2vaE1zESWJ/1TWbDXB1Bv9/FD
	evit6uAB2bKstu6B8PofZKNTyJTse/5aQ41X0pPDKvf5zVJ47nDflrWfPQvalbS9utvX3x1V1gy
	Hsor3TGeHpZKGZz5g2QEBT4md+v5oEOncSwue1Qtkf+e6187U+YY6kmnzKusDZ0ZNdaoWhQ/ghD
	KNXzcSRoptMLGHcAlRXmR/m1OHO5y8lcoR9OP0OJyYqNkgEouQMY1QWcs+CoY4K62b6GMZUinxU
	MkT0T86dtbfO1fdp9S3l8V+JE2c+FPfQ943tny3DyKiIeaPF1AefgCWejLME9JldrvHTsGUi+Hn
	e65Ac3yi/Qx9W/N03nXlzQAUpwXFb0H+IwYl3hZYR+DEwgdwWEQWMTKaAq/7ZyhetojH5nRWPyo
	LZOjpW/Hkkl/IeXdgqLCPHonHqNenoCF47ixfmebljV4envoPi7fCx6KBynt3R9AKkUd9zDPOfV
	F6XxL9IDiYkAYDc
X-Received: by 2002:a05:600c:3b97:b0:490:adce:251c with SMTP id 5b1f17b1804b1-490b0e4d010mr63666315e9.4.1780399957468;
        Tue, 02 Jun 2026 04:32:37 -0700 (PDT)
Received: from localhost (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm59016505e9.6.2026.06.02.04.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:32:37 -0700 (PDT)
Date: Tue, 2 Jun 2026 11:31:37 +0000
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Rename camelcase variable
 dot11PrivacyAlgrthm
Message-ID: <ah6_GQWX8e8CjDN_@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variable dot11PrivacyAlgrthm to dot11_privacy_algrthm in
struct security_priv to resolve checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
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
index 065850a9e894..41dc17464790 100644
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
 
@@ -1898,8 +1898,8 @@ void rtw_ap_restore_network(struct adapter *padapter)
 
 	start_bss_network(padapter);
 
-	if ((padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_) ||
-	    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+	if ((padapter->securitypriv.dot11_privacy_algrthm == _TKIP_) ||
+	    (padapter->securitypriv.dot11_privacy_algrthm == _AES_)) {
 		/* restore group key, WEP keys is restored in ips_leave() */
 		rtw_set_key(padapter,
 			    psecuritypriv,
@@ -1934,8 +1934,8 @@ void rtw_ap_restore_network(struct adapter *padapter)
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
index b932670f5d63..aa88002b8caf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -764,9 +764,9 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
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
@@ -884,7 +884,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	memcpy(psetstakey_para->addr, sta->hwaddr, ETH_ALEN);
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
-		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11PrivacyAlgrthm;
+		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11_privacy_algrthm;
 	else
 		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm, false);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 12bf7780bea5..027387d51b79 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -427,13 +427,13 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 
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
index 4fb74729180f..e9c70725fbca 100644
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
 
@@ -975,7 +975,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			padapter->securitypriv.bgrpkey_handshake = false;
 
 			psta->ieee8021x_blocked = true;
-			psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+			psta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
 
 			memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
 
@@ -1115,7 +1115,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
 		psec_priv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;  /* open system */
-		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+		psec_priv->dot11_privacy_algrthm = _NO_PRIVACY_;
 		psec_priv->dot11PrivacyKeyIndex = 0;
 
 		psec_priv->dot118021XGrpPrivacy = _NO_PRIVACY_;
@@ -1331,7 +1331,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
 	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
-		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
+		psta->dot118021XPrivacy = adapter->securitypriv.dot11_privacy_algrthm;
 
 	psta->ieee8021x_blocked = false;
 
@@ -1886,7 +1886,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
 		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
 	else
-		psetkeyparm->algorithm = (u8)psecuritypriv->dot11PrivacyAlgrthm;
+		psetkeyparm->algorithm = (u8)psecuritypriv->dot11_privacy_algrthm;
 
 	psetkeyparm->keyid = (u8)keyid;/* 0~3 */
 	psetkeyparm->set_tx = set_tx;
@@ -2116,7 +2116,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	security_priv *psecuritypriv = &adapter->securitypriv;
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
+	pdev_network->privacy = (psecuritypriv->dot11_privacy_algrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
 
 	pdev_network->rssi = 0;
 
@@ -2357,7 +2357,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 	ht_capie.ampdu_params_info = (max_rx_ampdu_factor & 0x03);
 
-	if (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
+	if (padapter->securitypriv.dot11_privacy_algrthm == _AES_)
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & (0x07 << 2));
 	else
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & 0x00);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..9969856b9f56 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -703,8 +703,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 
 	if (auth_mode == 2 &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP40_ &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP104_)
+			psecuritypriv->dot11_privacy_algrthm != _WEP40_ &&
+			psecuritypriv->dot11_privacy_algrthm != _WEP104_)
 		auth_mode = 0;
 
 	if ((algorithm > 0 && auth_mode == 0) ||	/*  rx a shared-key auth but shared not enabled */
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 0cfd7734c174..31e637b0e28c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1446,7 +1446,7 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &adapter->securitypriv;
 	signed int keyid;
 
-	if ((securitypriv->dot11PrivacyAlgrthm == _WEP40_) || (securitypriv->dot11PrivacyAlgrthm == _WEP104_)) {
+	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) || (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 444966c0de7f..5d16589f6a6f 100644
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
index 195ccc4b710f..05b57dfe41cf 100644
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
index 2276dc1cb44a..47d29bbfab44 100644
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
index bcaf63b2893c..bde40df584ef 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1880,7 +1880,7 @@ void rtl8723b_fill_fake_txdesc(
 	/*  Encrypt the data frame if under security mode excepct null data. Suggested by CCW. */
 	/*  */
 	if (bDataFrame) {
-		u32 EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
+		u32 EncAlg = padapter->securitypriv.dot11_privacy_algrthm;
 
 		switch (EncAlg) {
 		case _NO_PRIVACY_:
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 32f6d3a5e309..286869a75b7e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -92,7 +92,7 @@ struct rt_pmkid_list {
 
 struct security_priv {
 	u32   dot11AuthAlgrthm;		/*  802.11 auth, could be open, shared, 8021x and authswitch */
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
index 1484336d7551..298bb746d4d6 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -548,11 +548,11 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
-			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
+			psecuritypriv->dot11_privacy_algrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 
 			if (wep_key_len == 13) {
-				psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
+				psecuritypriv->dot11_privacy_algrthm = _WEP104_;
 				psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 			}
 
@@ -602,7 +602,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			psecuritypriv->binstallGrpkey = true;
 
-			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
+			psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
 			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
 
@@ -676,7 +676,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 				psecuritypriv->binstallGrpkey = true;
 
-				psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
+				psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
 				rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
 
@@ -744,11 +744,11 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
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
 
@@ -777,7 +777,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+					psta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
@@ -819,7 +819,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 			}
 		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) { /* adhoc mode */
@@ -942,15 +942,15 @@ static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
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
 
@@ -1356,7 +1356,7 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 {
 	u32 ndisencryptstatus = Ndis802_11EncryptionDisabled;
 
-	u32 *profile_cipher = ucast ? &psecuritypriv->dot11PrivacyAlgrthm :
+	u32 *profile_cipher = ucast ? &psecuritypriv->dot11_privacy_algrthm :
 		&psecuritypriv->dot118021XGrpPrivacy;
 
 	if (!cipher) {
@@ -1393,7 +1393,7 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 	if (ucast) {
 		psecuritypriv->ndisencryptstatus = ndisencryptstatus;
 
-		/* if (psecuritypriv->dot11PrivacyAlgrthm >= _AES_) */
+		/* if (psecuritypriv->dot11_privacy_algrthm >= _AES_) */
 		/*	psecuritypriv->ndisauthtype = Ndis802_11AuthModeWPA2PSK; */
 	}
 
@@ -1493,23 +1493,23 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
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
@@ -1529,9 +1529,9 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
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
@@ -1577,7 +1577,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	memcpy(ndis_ssid.ssid, (u8 *)params->ssid, params->ssid_len);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
@@ -1673,7 +1673,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 		rtw_scan_abort(padapter);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
@@ -1725,7 +1725,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 			pwep->length = wep_total_len;
 
 			if (wep_key_len == 13) {
-				padapter->securitypriv.dot11PrivacyAlgrthm = _WEP104_;
+				padapter->securitypriv.dot11_privacy_algrthm = _WEP104_;
 				padapter->securitypriv.dot118021XGrpPrivacy = _WEP104_;
 			}
 		} else {
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..f2cb2de1abcd 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -535,7 +535,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
 	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 
 	psecuritypriv->dot11PrivacyKeyIndex = 0;
 
-- 
2.54.0

