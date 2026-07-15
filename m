Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F05A41B8EB
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119821; cv=none; b=cNAC5jXCs9U+5lxHdiooOrHujsI9V3ifyECGiZITTek87Flv2kVwM2D2MDT8sbCbfo56vMNPnU94R6/P4RwH6UIOAV4RL7582UqgeIvcFMsoBqTYEpBJneJ4NQbYK35+cnZWZcdTu6p7YQx7496SK/EqEgpz88Tp1eQVQ175Xqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119821; c=relaxed/simple;
	bh=BM5yn8aa6nsA0MchY4B51U8iZ7cExTIA1lfWS+CBrDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYKLV5bZQyg6NAOcLf9CfcAfo4/Sp/tyFTV4o8CyWBrN1GmzwiJl6hPOWsLGtMM6+vvsRL7lhYIrvTl9Iwv3p1An4ExwnRlBt1YDnIRC/bVZUzcD5vJhdgpVNS/LCDuK4wfSkMdupOqkKJz1e8dlWBIfAPJ7nZjlececj45LtGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s98PvyvI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s98PvyvI"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aec201b582so5192296e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119818; x=1784724618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6gSPxNU6kjOmC+K/JcDDEl1A8+wRRo1W8eJFJVQ8aU=;
        b=s98PvyvIAQVFhp+ZZGTEtWeQdt9HY9LKKyvwrwzNAiBZACs01wYIcBw6+Azx9ifoQO
         HS4Y4g5A6vhBdHTykE3rJVzaKdDieZ0z1i0sHHy6csF2dK1ahmkYpGqXQuK01AUTIlUE
         /sjcjwEO1WBCjnMvezlDlVbxQd3Q0bpazU5uV+/uytCMBmftwuI+w4Pw4lFVj3ePp6Lt
         2cNp9hkOuYIVjIVorSkf+PZEthIXwAwL1lTAS/NcaMa8Cbi1IQz7HZXKF+XL3tViYzPD
         oipf2+hyj08rCVZSQcrrP4U2NMsP8bNAA/G54A3Nr+DLGIvqkaMiC3nsAaD/aj+uEw/1
         W7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119818; x=1784724618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6gSPxNU6kjOmC+K/JcDDEl1A8+wRRo1W8eJFJVQ8aU=;
        b=Vpik5lJcTZ1d71q+lLSGCo0Lnwg6+o0EvPvJiRDrFtI78J6fAPFB6+Y3eWXGmkg33f
         vkgxeYa1NwEg9fFgcaYTwvEq2D0uTT59x1fPkDgmmubKqP3yeusMfv2zwLmV3R6+p1cq
         9BxSQDcIV7/0LDMCXDumJSTVc9YYDmqd4UeSR4LJt60gr8pGTGMpTa9NP5aF22f/106G
         SWkU28EuIgpMj6ESpGBvWuMEI3z4ott2WeQOWSVKYybKy2uqLYf0iB5NYmZShDqu+Xsk
         U/bgGlCuWWM16OzDjun0i7EBGijddjaeqEPC+z5b3amKrZXm9PQdSKEctcrNWhBvcFJo
         AnZQ==
X-Gm-Message-State: AOJu0Yy9RohcWn1DJn6AuuKQfn2sGEXWp8VExIFJz3mbfVj3JUP/+tUJ
	m1TtaH2nxSPJsxR2gWvX3p77qaaBOz+IPK7ZopPuVwN17yYNwc/yeaZUNkwqxpAwv1iz3g==
X-Gm-Gg: AfdE7ckUR0TcA4rRmrKGzljhbnGUyzC0m6PRFqrd/OpUNQyvkksuO95WMBJVTdVTl7c
	3V82d0PQPGMNeVaXuJf0HDx14ZNUf2HY8lsusi0NA17UdkI62/Eq5tptLRNRTpqEkGYNhBKiBys
	oxGtHNYDKpQlH90IRVneAWILpo56UtszgrJNFtCbLcNSFRyzHp/sHgUMj7YdfUXAwbLmoY2jZYj
	4D5jHkjsubUaD5n8Tydg23b/oX9YkfKJW2WSvLSNiMTz3xbOGLjC6k1SjwZpb1tsLCXY0xnq+OV
	OxpQVZ2fusBkSg1EJP7fP9jhqC051IHdBF8LGfMlkYM3qhw0lHdhSivQ8dsDfP/st0NBKQaN0rf
	bwDy7EAAg6oN1P9SLT3EqX3tiaxYEd+aD7OUA0OpuhmaWF1KpW1mffhb4AcRI6WeSRhHCcPWruG
	2kSniTOpznsRc+p7QMeZYlpYokVKI/2jkWk7enIrMOFT00xcJrkCm02oiXE7U3pnRv+cb0Xfayu
	NpexUzIGmosQzY6hipc1d+c
X-Received: by 2002:a05:6512:2c8c:b0:5ae:b0ec:b024 with SMTP id 2adb3069b0e04-5b15d7b5373mr638834e87.53.1784119818261;
        Wed, 15 Jul 2026 05:50:18 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:17 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 04/61] staging: rtl8723bs: remove redundant rtw_dec_to_roam helper
Date: Wed, 15 Jul 2026 19:47:32 +0700
Message-ID: <20260715124829.90290-5-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate the redundant rtw_dec_to_roam() inline helper function by
replacing it with the open-coded prefix decrement operator '--' at all
call sites.

Since the original helper merely decrements the mlmepriv.to_roam field
and returns its updated value, using '--adapter->mlmepriv.to_roam' acts
as a direct, native language equivalent. This reduces boilerplate and
improves code scannability.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 15 +++++----------
 drivers/staging/rtl8723bs/include/rtw_mlme.h |  1 -
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 6c042de11..b038233af 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -745,7 +745,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 				rtw_indicate_connect(adapter);
 			} else {
 				if (adapter->mlmepriv.to_roam != 0) {
-					if (rtw_dec_to_roam(adapter) == 0 ||
+					if (--adapter->mlmepriv.to_roam == 0 ||
 					    rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
 							       1, NULL, 0) != _SUCCESS) {
 						rtw_set_to_roam(adapter, 0);
@@ -1421,7 +1421,8 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 		if (roam) {
 			if (adapter->mlmepriv.to_roam > 0)
-				rtw_dec_to_roam(adapter); /* this stadel_event is caused by roaming, decrease to_roam */
+				/* this stadel_event is caused by roaming, decrease to_roam */
+				--adapter->mlmepriv.to_roam;
 			else if (adapter->mlmepriv.to_roam == 0)
 				rtw_set_to_roam(adapter, adapter->registrypriv.max_roaming_times);
 		} else {
@@ -1518,7 +1519,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 
 	if (adapter->mlmepriv.to_roam > 0) { /* join timeout caused by roaming */
 		while (1) {
-			rtw_dec_to_roam(adapter);
+			--adapter->mlmepriv.to_roam;
 			if (adapter->mlmepriv.to_roam != 0) { /* try another */
 				int do_join_r;
 
@@ -2534,12 +2535,6 @@ inline void rtw_set_to_roam(struct adapter *adapter, u8 to_roam)
 	adapter->mlmepriv.to_roam = to_roam;
 }
 
-inline u8 rtw_dec_to_roam(struct adapter *adapter)
-{
-	adapter->mlmepriv.to_roam--;
-	return adapter->mlmepriv.to_roam;
-}
-
 
 void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
@@ -2561,7 +2556,7 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 		pmlmepriv->assoc_by_bssid = false;
 
 		while (rtw_do_join(padapter) != _SUCCESS) {
-			rtw_dec_to_roam(padapter);
+			--padapter->mlmepriv.to_roam;
 			if (padapter->mlmepriv.to_roam <= 0) {
 				rtw_indicate_disconnect(padapter);
 				break;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index b5276c429..233bf98e2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -388,7 +388,6 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 void _rtw_roaming(struct adapter *adapter, struct wlan_network *tgt_network);
 void rtw_roaming(struct adapter *adapter, struct wlan_network *tgt_network);
 void rtw_set_to_roam(struct adapter *adapter, u8 to_roam);
-u8 rtw_dec_to_roam(struct adapter *adapter);
 int rtw_select_roaming_candidate(struct mlme_priv *pmlmepriv);
 
 void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta, u32 mstatus);
-- 
2.55.0

