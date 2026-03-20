Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CB73CD8B0
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 15:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774021669; cv=none; b=U+yfdhpfOXwg/3PxD1neT2J+7rCOsDlJxo3IFLJhxkm58H8sW9OwPwy7ki6wWzNVv2bvP/zWhHFEDT0+IrIku5aKPZ96dS/oJJFfk/JTo6dHGu6SI9l0C88bWynLYFNEcqkgA2NyJ/S3PbfB02qGCLTCWkXDnghBKw2P6+azkmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774021669; c=relaxed/simple;
	bh=MWmxiiGSvJIN69qS1vFWxFdi8elmqCIq3V3OIGWD4Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LftHOE18t1YhP0eK3gt7BHssIQ7qJEsPamAKyOh7fkYRyBFCSVUx5/5p6anEfEJUfVgvUIldco4opKJxpf7PG7ysbKq5HA/sbCW7aRSjSHZU/pw/jr8HlHBxTnnk97UdMuLbbQKbwFw5B1J0H9YiA7ifS+Xf91vMa8QIQ2nwgzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZHeEUeb; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZHeEUeb"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b97905516faso259914266b.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 08:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774021666; x=1774626466; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/GS64vkzSKPEbLFLQ/XpxIQ3rnQ73rFXLw8JIxcZKs=;
        b=RZHeEUeb3AwSPi4rRC2j9mOvHPIcRQ2y2LnfQetkqE+lCf+jd6HETY++GG/v/n0wnI
         Qv4WWB2GWJqWOYoeHUuqr10euILyH0X/5rjDODTRzAlCNNy7wIyLDpMrQAc+I3yrxCl3
         cYy6KoZM2NaWTuXcxsvHAw8ijIIlZwIqnuulje+kg3olub/+rsc7wmtHxzjFcXoC/AD0
         5xBAxqr4WcFIlHha+lV5F54RaEl/7zkkK15QZntaQLWc5e3cwFhnatn+Cv4np6Nd/hpR
         kMF5DQSMLOr68Rlevlm3NRwd72JunE/Yao1AUPrlAissmRWGWfyYjQ8B9gK6ZwMqY41C
         sWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774021666; x=1774626466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1/GS64vkzSKPEbLFLQ/XpxIQ3rnQ73rFXLw8JIxcZKs=;
        b=oaPBEtLGJpM7St7EwqZQVPsOxU6ue2bGNsUWrrwy8BAuxCLFf6dC+oyPV79kdLwBi1
         WOl921jtqDdKCuDuuwlIUpeGOZyM+mjf2NRahC9Hw99lyu301SyvtfZJZUlW93BdTyZd
         yTf9QCnQghNjRIBKFjc2ZvfeIVJIqxZvf1O3J1n6CT4ld8n2BTMsC9kyhaDopedNa3sm
         ZxBqTX7nIaLIEI62z8csgYpnPBKsGAxUzOtJgJJmMADjCgCdnyvXczNuBrfTBl7T95xQ
         m7nDRGMax6LBtt/hAIQUKarY2hUAaELNowcAk6tnmsum99HuvqMGEOyxIvOAvCllAFF0
         nOQg==
X-Gm-Message-State: AOJu0YzKWOWOc7+1Aub0QM1iT0t27FnbGrYE/g+o5n0xHWYOus7HoyfG
	SW5yndl8UCMM90aoqjMPPbhQliiDMw8mOVW5kJOJrY7pFI/hHK6LnMH1ZVlub4s/
X-Gm-Gg: ATEYQzyKtcDSNoQDvhC2UMaay5FAqGX+pyJvMuoXEa9OZguYF0JPaoRwwGl2IlQqbNy
	C8QZZJe3Moa/IBfREcjVhLCoqjgKN4wpzeaLQFRTm48fyo24iEWolCfIIJ+vUcmAXYmzYGBHcIE
	LE+mjZJxIJO4VaXXPUJzEy7QYWH4uXq2GFvThhjFpW380h9MyqxWtwC3uk9YKwkio14BPvuY1Su
	IrkWNTyWh4mYbOO+fIj3UR4yOaw4373NTk+q74WTqTeYxqSwXLv+lattd3TSidhaXTN/JUvprX6
	T6cz9bSaG2dhfsqTeI3mB4dbciF5YnH4+6ZrwejenAITB5tDqtrWymK3xC6w+HKXM7sGu4hNwax
	wj5TvGfxT+DTIeR0sZAyH+GvN1Id76OZ4QVZsnkcvhDeEyRb0xU+ebdouoXrWDSNkcHf8Ny3V+g
	T4VcivkgNf6aVJzLC3Uxt/RL91GlB3XZ9m/C05c5QkvN5igQ==
X-Received: by 2002:a17:907:874c:b0:b98:29fb:f32 with SMTP id a640c23a62f3a-b982f20c0c8mr243966066b.1.1774021665969;
        Fri, 20 Mar 2026 08:47:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1cd8:5427:4c74:c4ff:fe18:7da5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8d3d0sm173658966b.19.2026.03.20.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:47:45 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] staging: rtl8723bs: refactor rtw_joinbss_event_prehandle to reduce indentation
Date: Fri, 20 Mar 2026 16:47:17 +0100
Message-ID: <20260320154724.603847-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320154724.603847-1-azpijr@gmail.com>
References: <20260320154724.603847-1-azpijr@gmail.com>
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
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 136 +++++++++++-----------
 1 file changed, 71 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4bf6d1865391..3b16d3fadd54 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1174,86 +1174,92 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
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
+
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
 
-			/* s4. indicate connect */
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
+	return;
 }
 
 void rtw_joinbss_event_callback(struct adapter *adapter, u8 *pbuf)
-- 
2.53.0

