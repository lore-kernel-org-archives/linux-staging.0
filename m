Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D470833ADB9
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774117670; cv=none; b=US1wu+cxEZaLnkaymesYzg2FfHHVerTd5e/rdH0N5wo3sPaPoOsrrqrHzUIDpIxsZTuSCmKBl2tuW98b2FPm0Ja4+A/FxaXXBz2iajq2KxFH35tooLjq1aCFFxzF6S2DF+OlNjWe+jtXeJVZbYuQacm24mRnka8UED/e1uc+V9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774117670; c=relaxed/simple;
	bh=id7YsOTuFdiwiTRw1W5tb/uCdcTWObJ04hrMsDLVGvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttqV0Z9Yf2g71WDaBJFp0KhspVsJ0bPolM4GQEs0I8NPrZtn2VUVZz/yEELfngZyN3cZflYHO9fqEXWuL7qYmc3JriByFUDVsCA/lxIS1ZzP5hWxMXjnCV8X8lTTVFLJcZAeBLCeN8KqpMcrJNL7bdSbhBJMJMGpjF5502QVyW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbhkgHp0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbhkgHp0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8f9568e074so232830666b.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 11:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774117667; x=1774722467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJi10ByW6U3y4Tl0xc6sEw2Ayb0yHzPnojIX0CO83Rk=;
        b=VbhkgHp0Me969kFf+qEUxq9MUjdj2N7Z9brH5JS1MihsHbm1xE8ogDzZKxfiZpVP+U
         v9thJhC9Lz15obmQpzzgDIY/BfXZT1QcyJuzrUTwicJ6tp1m+Z1oC98y0mClwuUuWiS2
         UaQuNAlKNBMfyozUYcldZxB1g99G4OyrY9ST+HJ+ricvv6LZE/XwtrUhF2SlVKDK0QSs
         MsFQlVj6Akj/pu+4NZLEB7wTkALJSLpAEG8TG676zybfBs6fZgEHE9rJnTowPp543lzi
         D0st3Gp5wbiENzoI0xwq/0UMN6hbt6EDdFT5zX26mkqnDtaM6esajpG3UdSqpXsS/208
         f62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774117667; x=1774722467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJi10ByW6U3y4Tl0xc6sEw2Ayb0yHzPnojIX0CO83Rk=;
        b=MSTUUklFlWlMcxsbgEdOR12Op7GM0utJPUQsaJIXYIvj0KgvgFaGLgXahf5LDCFxNh
         m+zuHZTjS3iAgKgZ988mcbPFD5RcEAalXQkZjc8HCgIbC2lvP1Fxx6JrPbw82DkBTkW+
         6vc5jbciNGauBP9ThXZeg4rBAKBsAXjNc6FSNkKQpBkxQqLEcDtLAnSYZe8c+ZLmOIpL
         eEMZ/KPwxM+Nfu9o7PkjEYRTv1zeG+d6JBLvtRo8E9uSFxQgsR3LMW1MtisGYAsnz0Gt
         cV7cp8NYHfHrFBo0MChIX0d9YrQTvFoRymfnl4oHbPJ/britBFpXjMPvHs4xyIWwTwyQ
         tpQA==
X-Gm-Message-State: AOJu0YyaRn+1OzJlhT/yhfYF6Z5ekcLz0WjCGO6m4Otn9Zt8ASPhyBr2
	m46U4PlnqOtM4QpV7KmWwpXgcg+2VmaOx2mFkgj5wA50I1vx19psOIUBU2lYGCayQog=
X-Gm-Gg: ATEYQzyT23sg4T73KXlPkmsL6WMjNpwEcavwL4+4Xe4hoLZYM7LUViaObbfszf/WgZQ
	gFjDkDMOPK/B4/NFvBFVMcRIGhN3lkh26Bqi54Eh5DXQJqg6EikQzl8nrS8LZhdnFafMi0j6dQP
	QvSZM1hpieVJQKcu7mz9UCSkv2EmuXm7YHDa0TKjWRAsvx4AMBySO2KEl+OBvkFH5Hv9YE5RiK7
	+IcECCSOsN32+/KYYyBpYKQDQvVDYDQ2pyEAcVAquUpiuhgY7VLUoG/Vangnv250z/GRxe/bZeH
	ICOl+jspknFJfPmiV6W0q4a+8pM/3TGQLBmKBrnR9rAZEz42GbgnlftkWAq0CetWJloImfL15Bf
	qdKhxHCNloPqqoSM3/jeDUXbIEh5q0Z4yt8Q63Lg/7jRzuaOWUcmurViCmlddyOsSrr0v9DFqNl
	epY0310W14pLN0Z96U2X4lI2/RZO3vPlx8sMTUnV2ErQywkXJMXUJml7QC
X-Received: by 2002:a17:907:1c9e:b0:b98:4c5f:6603 with SMTP id a640c23a62f3a-b984c606967mr162694366b.18.1774117666328;
        Sat, 21 Mar 2026 11:27:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:18ce:4346:2c4b:1eff:fec9:fe24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983388070csm285097866b.60.2026.03.21.11.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 11:27:45 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] staging: rtl8723bs: refactor rtw_joinbss_event_prehandle to reduce indentation
Date: Sat, 21 Mar 2026 19:27:00 +0100
Message-ID: <20260321182713.665872-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321182713.665872-1-azpijr@gmail.com>
References: <20260321182713.665872-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtw_joinbss_event_prehandle function has excessive indentation due
to deeply nested if-statements.

Refactor the function using early returns and guard clauses for the
failure paths. This flattens the code and significantly improves
readability.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 135 +++++++++++-----------
 1 file changed, 70 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4bf6d1865391..e2dff9514b8e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1174,86 +1174,91 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	pmlmepriv->link_detect_info.traffic_transition_count = 0;
 	pmlmepriv->link_detect_info.low_power_transition_count = 0;
 
-	if (pnetwork->join_res > 0) {
-		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
-		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
-			/* s1. find ptarget_wlan */
-			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
-				if (the_same_macaddr) {
-					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
-				} else {
-					pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
-					if (pcur_wlan)
-						pcur_wlan->fixed = false;
-
-					pcur_sta = rtw_get_stainfo(pstapriv, cur_network->network.mac_address);
-					if (pcur_sta)
-						rtw_free_stainfo(adapter,  pcur_sta);
-
-					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
-					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-						if (ptarget_wlan)
-							ptarget_wlan->fixed = true;
-					}
-				}
+	if (pnetwork->join_res == -4) {
+		rtw_reset_securitypriv(adapter);
+		_set_timer(&pmlmepriv->assoc_timer, 1);
 
-			} else {
-				ptarget_wlan = _rtw_find_same_network(&pmlmepriv->scanned_queue, pnetwork);
-				if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-					if (ptarget_wlan)
-						ptarget_wlan->fixed = true;
-				}
-			}
+		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
+			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
-			/* s2. update cur_network */
-			if (ptarget_wlan) {
-				rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
-			} else {
-				netdev_dbg(adapter->pnetdev,
-					   "Can't find ptarget_wlan when joinbss_event callback\n");
-				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-				goto ignore_joinbss_callback;
-			}
+		spin_unlock_bh(&pmlmepriv->lock);
+		return;
+	}
 
-			/* s3. find ptarget_sta & update ptarget_sta after update cur_network only for station mode */
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-				ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
-				if (!ptarget_sta) {
-					spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-					goto ignore_joinbss_callback;
-				}
-			}
+	if (pnetwork->join_res <= 0) { /* if join_res < 0 (join fails), then try again */
+		_set_timer(&pmlmepriv->assoc_timer, 1);
+		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
+		spin_unlock_bh(&pmlmepriv->lock);
+		return;
+	}
 
-			/* s4. indicate connect */
+	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
+
+	if (!check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+		spin_unlock_bh(&pmlmepriv->lock);
+		return;
+	}
+
+	/* s1. find ptarget_wlan */
+	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
+		if (the_same_macaddr) {
+			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+		} else {
+			pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+			if (pcur_wlan)
+				pcur_wlan->fixed = false;
+
+			pcur_sta = rtw_get_stainfo(pstapriv, cur_network->network.mac_address);
+			if (pcur_sta)
+				rtw_free_stainfo(adapter, pcur_sta);
+
+			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-				pmlmepriv->cur_network_scanned = ptarget_wlan;
-				rtw_indicate_connect(adapter);
+				if (ptarget_wlan)
+					ptarget_wlan->fixed = true;
 			}
+		}
+	} else {
+		ptarget_wlan = _rtw_find_same_network(&pmlmepriv->scanned_queue, pnetwork);
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+			if (ptarget_wlan)
+				ptarget_wlan->fixed = true;
+		}
+	}
 
-			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+	/* s2. update cur_network */
+	if (!ptarget_wlan) {
+		netdev_dbg(adapter->pnetdev,
+			   "Can't find ptarget_wlan when joinbss_event callback\n");
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+		spin_unlock_bh(&pmlmepriv->lock);
+		return;
+	}
 
-			spin_unlock_bh(&pmlmepriv->lock);
-			/* s5. Cancel assoc_timer */
-			timer_delete_sync(&pmlmepriv->assoc_timer);
-			spin_lock_bh(&pmlmepriv->lock);
-		} else {
+	rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
+
+	/* s3. find ptarget_sta & update ptarget_sta after update cur_network only for station mode */
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+		ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
+		if (!ptarget_sta) {
 			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+			spin_unlock_bh(&pmlmepriv->lock);
+			return;
 		}
-	} else if (pnetwork->join_res == -4) {
-		rtw_reset_securitypriv(adapter);
-		_set_timer(&pmlmepriv->assoc_timer, 1);
-
-		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
-			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
+	}
 
-	} else {/* if join_res < 0 (join fails), then try again */
-		_set_timer(&pmlmepriv->assoc_timer, 1);
-		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
+	/* s4. indicate connect */
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+		pmlmepriv->cur_network_scanned = ptarget_wlan;
+		rtw_indicate_connect(adapter);
 	}
 
-ignore_joinbss_callback:
+	spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 
 	spin_unlock_bh(&pmlmepriv->lock);
+	/* s5. Cancel assoc_timer */
+	timer_delete_sync(&pmlmepriv->assoc_timer);
 }
 
 void rtw_joinbss_event_callback(struct adapter *adapter, u8 *pbuf)
-- 
2.53.0

