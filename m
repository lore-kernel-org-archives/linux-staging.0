Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088843B4E83
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 23:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773962100; cv=none; b=lx2q/8W6Z58nn1PpTNrrdpXecNLjcS1OeSd5XUotsTa2CkprMRDNpd0jaqq0c98bE8/opcqVPUZdh+sbPbYV77IntSnqHgXiZHZInfSd+cWJTdPFeyvDYM4nFewbsAOZJoh8zqMOTGjOQuyWxp1Krwdzrtg2dxjO96akzWSJkUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773962100; c=relaxed/simple;
	bh=ezuuvW7vGBqj887ZV0keHkjqx5NKeixQq1AIAmy5GVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtqpJybXZrf+ugBRbqa0RFH6slx8eQdN25z+z1RACntmvHnjQybXeJOxqcIGrn3Hvdu2PZ4K4lGv+NKrz91kaocPkU2KXl2U32SAMdRtHbME8QBBKK+Erj+u+GHekZJjStKcxCfZ2FI1+x2tPo725zFk/K7LZv+XwdGGgT9XNe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhwBCCSS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhwBCCSS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b49819938so27736f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 16:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773962096; x=1774566896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJ0VSQnyDateSNUz+mGKHIDKNMY/DiNSUMwKORo661A=;
        b=FhwBCCSSRPyni//YIx2YCM9ia5HyMqfCQUmGosRwSkLZmGfXABtQrJZvBcxuEqgp7d
         F96ApNmly3Q9AtMcbkqrdxzFeC3rJdgh0e44U9gBdx6lB6MTAsHreoYmg7Kt3K0UFWc8
         ytYc/LJI+ni7QkQmU8p4NSpKLolBorwRsr7Qnp/0RtTJaYFWURSs/iIbH7+ZGXahtX2g
         nh2i2nbqRU8jt2OF6OCGJRkNvwhxoDTz0NuTWraX9RRoini5ixvictLPI/fQwBhwwHqe
         jMnWt+C0BL2LIMhIGN8Wzj1g9DYn1H/QkDvmXLWcl/FALU268sQ4kdCm+wOEbiP9rYue
         d59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773962096; x=1774566896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gJ0VSQnyDateSNUz+mGKHIDKNMY/DiNSUMwKORo661A=;
        b=gevOkWzisxokNFHXunojMFnkmDs2lwrgjxx+Id0slqDtGIdpOY3pI5s6oHovpDJKse
         n/+hNm+bHO3huECdMn8gzg4Qo4r6WYIK5NiLzvmf/vgn7FxnH1ubAiCij72p/yKvxUHV
         roJ77SWIWhbyQp8i9U941Q8API2ZfpcUNRzS23Z75CDYhdpbbamd7JZHWl3UVJNOdu8k
         27rfoedGuzcUQColAlfpXtw9Klk6wsQakV8WDal2vHWTfli51FzcEv4pxCE7PSI24GWh
         gZsCrhZ82U1Z+wyUB5P957RGeCBeNm+Uxi9Od7R2dPBncIrDCXjWX+FzeIGM/i1yKKpL
         qnSg==
X-Gm-Message-State: AOJu0Yz5qz6z1u/2V3cK7kfcUEsTVi8P2oRwxwkmWHMre5xY6ekYthqG
	Wwf+hnM1cbDAXyLnx1Pi/OfZnG4vqu+1EjjeC4dqvyat1MuspsjovxxaJXAJgM24
X-Gm-Gg: ATEYQzzGe8qf5c5XfICVrkT84V+R1vEH2agfT4mqBsyljm7QuQP99litSr/xIA0Kfdu
	J7uszNWU9Vp2d5IOZFYNs8Co/mxExH0BIm/o3INaRtVFRNobihMOPeMmoCFNCv4SHY55q4wTJF9
	4WkkxUmf8cmnhGAYQ/h6jY59RjeUudVWcO4lWgy0hqsPLBjqMjRp7QEjW4JscPRxqw8g0py4Xqx
	riJhlwKRG4Kmy57Dk5ctpnVL2PJAGHvdg9EBClsD4Yp30UszuNBdZeWFb1NDFKUsjnGUpO5HvP9
	D0BVYI970LKFuuTg/IpSb6kgmDmIt1thzIeAYEXPQ1EYQIB9jL61O2u/bM9IFqg0FFp14xfZydg
	YM7IW+rlnknyctD6nP6UYBhRZKM9XW1/6YOqptxPNCK0CaB8qd2QyCO4sOb7tYD/EgUlZU4HDWD
	ruvCyy5EBx8wmMGqsCWOvMwhDNDP9GxVCA6VMBqAgfejR3ZQ==
X-Received: by 2002:a05:6000:1a85:b0:435:9cd5:bb2a with SMTP id ffacd0b85a97d-43b64251836mr1898465f8f.24.1773962096022;
        Thu, 19 Mar 2026 16:14:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1c48:8ce3:7093:e9ff:fede:440c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c35sm1983888f8f.22.2026.03.19.16.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 16:14:55 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: rtl8723bs: refactor rtw_joinbss_event_prehandle to reduce indentation
Date: Fri, 20 Mar 2026 00:13:35 +0100
Message-ID: <20260319231344.569418-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319231344.569418-1-azpijr@gmail.com>
References: <20260319231344.569418-1-azpijr@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 134 +++++++++++-----------
 1 file changed, 69 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 805427353aa6..2a192c1dd038 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1175,84 +1175,88 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	pmlmepriv->link_detect_info.traffic_transition_count = 0;
 	pmlmepriv->link_detect_info.low_power_transition_count = 0;
 
-	if (pnetwork->join_res > 0) {
-		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
-		retry = 0;
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
+		goto ignore_joinbss_callback;
+	}
 
-			/* s3. find ptarget_sta & update ptarget_sta after update cur_network only for station mode */
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-				ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
-				if (!ptarget_sta) {
-					spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-					goto ignore_joinbss_callback;
-				}
-			}
+	if (pnetwork->join_res <= 0) {
+		_set_timer(&pmlmepriv->assoc_timer, 1);
+		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
+		goto ignore_joinbss_callback;
+	}
+
+	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
+	retry = 0;
+
+	if (!check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+		goto ignore_joinbss_callback;
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
 
-			/* s4. indicate connect */
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
+		netdev_dbg(adapter->pnetdev, "Can't find ptarget_wlan when joinbss_event callback\n");
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+		goto ignore_joinbss_callback;
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
+			goto ignore_joinbss_callback;
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
 
+	spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+
+	/* s5. Cancel assoc_timer */
+	spin_unlock_bh(&pmlmepriv->lock);
+	timer_delete_sync(&pmlmepriv->assoc_timer);
+	return;
+
 ignore_joinbss_callback:
 
 	spin_unlock_bh(&pmlmepriv->lock);
-- 
2.53.0

