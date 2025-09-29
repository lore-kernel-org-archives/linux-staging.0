Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206012BF009
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128642; cv=none; b=B17IsuOWeyw4eArNEm3jVs3srWKliQFWB4KwZYOdImHB/QI9Aa9DWAjVXHf4t/3Iz/lcLYwqzbpLL+RdLAAy2CSolJb+PZ5LgmW7st+snErL0o7hUrw9u2t6hQe5ajHhREalB9oUNX//r/m8r6h6AiUiE7bBUEWdHv7jVIj1E+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128642; c=relaxed/simple;
	bh=Xf0LccqCHjcRpc9m4rzbi0aDOX4yjEMRJ3TSSqCdCAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nqHfsM0ugW64rHB6aq/Sjg9InOVgfbyZ2BJq6mfWoaDfgb+YsqdpDwljkS4R8QU5Z+llEd2ElE4NsYXXyLY3VsMWfbppiEagU1mDEmw02PZxmn+wO5yaK2xBvZwTqNX+/PplfOxwVSS0m2uorv5k2fk1CPICNra3cY0cPuzezUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwPHgqZk; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwPHgqZk"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4de60f19a3aso32280931cf.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128640; x=1759733440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDqO+UoPGgDbKDZcftZWgsNo4sXFXXjdDKh/zegscDg=;
        b=XwPHgqZkgq6aovGZv7F35y6XeKpHnE2fZSx+nBy48QNdQASe9gG2ssKU37kM6ulyp4
         GA7i4HcIsPZv9d86Se3M/g5YQL+CYsBMGN6XxmOEnMYVk6B3Tu3aphdXp+EUxUA2X5sh
         63st4LkKHCVJX2y9dI3FZnkz+h97kV1kN9p1DHOhG85D1I1kPYMkFRisS8o7wIKd33E3
         JRUulHktQfJJBCaEeZHaBxdLNeduj9+yZelWTd5xHmrPt1eqBiFmHo7qIdBmcm2Nns8S
         OAi29AOyELDTviU3UtbKB0CcuBZNEf229lLyClFLITEaoAW6UAiVoRilIvSnbOsxmEuz
         L5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128640; x=1759733440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDqO+UoPGgDbKDZcftZWgsNo4sXFXXjdDKh/zegscDg=;
        b=EP07YRt4fuwgp9npDLSAeUmFmIvTF0+gfqjHR9oQm9LSLslIo3kRoh9IoHV0fgU3uV
         E6gIpb1stG4otM29wj+ThuBw2Kl7qWfDxM6BTzpwv96/gYAFzUVaqzrenn2eL8Qrn4F8
         CGTtVJD3e5HE1DmbLVTGnPkUy6f+8aUgmjPVbgSuSE9cn059irpUkY3AIKzyNb7Q8jYX
         zO95OJtcQIqV1I2NOaYM6qSkH0vmeoQeJP56kA/XAVB9mG2cmVTJkfxwesYjTh1uG4K8
         r+FcSDj+mylWFXLep8XaDuV1T1v2xvlzxT22itPy92QLphDW3Ee8vyM+qgR+rwDZ0USa
         nl9A==
X-Gm-Message-State: AOJu0YyGQ9UXVMZbeq7ylpJ4eozxv0lY6/Yzo9HThlHScQj+6s/7LtWP
	OPXZciHmIYNJL0crsNyWpJ9e1GyUzzZtK7A68hzm7+naNPb9+juIYOoi
X-Gm-Gg: ASbGnctBKN0DQk4fs2K3lvsIkDaALqZ+M7y1y39E6Aa+nY/Veo1kqXZkwDgaTXM5SvX
	Hyu9svxZACKM8X+MBJXFBLW9qxKG7057OoP87qkbu/zvzmfqdyn9Ayt8l2VDN7yRdZ5usUxm4pY
	YEY5aMZxMaCNqakLbvO5JEKtcpoxIfOIWgJwX5Tl/U+6mi/ePT0GWxR6jfFwoIAteh1czK6EUtf
	yMBz0aqOhVRE24stw8JhJLE4dmnu2AaZGXNS+BEWNgFs48WhFSkKL9fPRw1++s2NLB1RwQmxsQv
	3u1z0Or9ldTz/8G2HFYknDgb4U1WK/Z5jwWomXpYjMbbzwR4z93pLRfcFXfKBtm9vrJOdhGm95m
	5ixfSnRnXxFcxcJv+KePSKFriXk4CMUcZHB5bkSE1aOmGR1gv7p+IIhA4ANGYzw==
X-Google-Smtp-Source: AGHT+IHUjsC+DXPmkdpqDN4zrphAoma9KM4Zj9T0bAafUWB38L0LSNync7vKAsPrDChYP+vG9uDJiA==
X-Received: by 2002:a05:622a:1cc9:b0:4d8:afdb:1275 with SMTP id d75a77b69052e-4da4b80839cmr245230521cf.43.1759128639904;
        Sun, 28 Sep 2025 23:50:39 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:38 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 05/15] staging: rtl8723bs: fix logical continuation style by moving to previous line
Date: Mon, 29 Sep 2025 06:49:50 +0000
Message-Id: <20250929065000.1010848-6-vivek.balachandhar@gmail.com>
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

Reformat logical continuation to same line as previous statement

Place the logical continuation on the same line as the previous
statement, as recommended by kernel coding style. This improves
readability and avoids unnecessary line breaks.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 24 ++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index cd41f713a52e..2ed7f71e41d1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -352,8 +352,8 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 
 inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
 {
-	return (a->ssid.ssid_length == b->ssid.ssid_length)
-		&&  !memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
+	return (a->ssid.ssid_length == b->ssid.ssid_length) &&
+		!memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
 }
 
 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature)
@@ -792,8 +792,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 		}
 	} else {
 		if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
-				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
+			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+			    check_fwstate(pmlmepriv, _FW_LINKED)) {
 				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
 					receive_disconnect(adapter,
 							   pmlmepriv->cur_network.network.mac_address,
@@ -945,7 +945,8 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 	if (rtw_to_roam(padapter) > 0)
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
 
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) || rtw_to_roam(padapter) <= 0) {
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) ||
+	    rtw_to_roam(padapter) <= 0) {
 		/*  Do it first for tx broadcast pkt after disconnection issue! */
 		netif_carrier_off(padapter->pnetdev);
 
@@ -985,8 +986,8 @@ void rtw_scan_abort(struct adapter *adapter)
 
 	start = jiffies;
 	pmlmeext->scan_abort = true;
-	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
-		&& jiffies_to_msecs(start) <= 200) {
+	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) &&
+	       jiffies_to_msecs(start) <= 200) {
 		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 			break;
 
@@ -1714,8 +1715,8 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (adapter->net_closed)
 		return;
 
-	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-		&& !(hal_btcoex_IsBtControlLps(adapter))
+	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode) &&
+	    !(hal_btcoex_IsBtControlLps(adapter))
 		) {
 		u8 bEnterPS;
 
@@ -1873,8 +1874,9 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 		goto exit;
 
 	if (rtw_to_roam(adapter) > 0) {
-		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms
-			|| is_same_ess(&competitor->network, &mlme->cur_network.network) == false
+		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=
+		    mlme->roam_scanr_exp_ms ||
+		    is_same_ess(&competitor->network, &mlme->cur_network.network) == false
 		)
 			goto exit;
 	}
-- 
2.39.5

