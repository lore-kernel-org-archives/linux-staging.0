Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB4D241CB7
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 22:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773874600; cv=none; b=TF4PTsg6hQbcGE8GB2ZoTapaO6oMshNMZ/XPTvxFIYvLymRcu0INqd0n6m1lL30hiE347YQOvz8UD7V6Us5sS8WInD+deb/wbDNl70h6HWGQhEaRkcv/BK3Xd41iZwtRySAm3ZKXPmoaf7RgfgWgFqonW64JxpKDjDxxXB+ge/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773874600; c=relaxed/simple;
	bh=4Vh0Hp2WnTXcZToVyNL+kCJNNq01xghYNTXdl8xkIds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uf1CF6RgdEX+YdymE3U8ufHvQeS3lE3zb4EIxwhoqy4JdtFWovqE5JrNjhJxARw3ei7sVzUqgTXQ+4naliOWXiDy5gKZbNx7U9j5pxBlrEZFEE63u+DgdXPclUQIJ03N+CegRwI8R4+kGxg+7DRWhokF/Zl+Ps1v82NsXhH8B90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFHhXbTz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFHhXbTz"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so638143a12.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 15:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773874597; x=1774479397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AI37ocZBE7PjJ3M5c4x+eUfmaD6N83f1uXKcbpaDCA4=;
        b=aFHhXbTzKCPgJxVZAeEtlAk9S6VXjhCmnMCxm0G3h/lIu+shfLggnsTDUNleW6chZ4
         FxlHDlx5l0HG4V/OQ9CSNj8VmdZ4RlK3qhYm3GdZzyj/pN9BB/bWN0WPRgdJ4COi0MWm
         MnHoVLnGSsyHcged52GkB1W6gpmbRpkjhzKwX2YQ/BYe/SLE1qBci+8s1oDxqmHh3shW
         k2vTTFbRph+f1jRnhiDOVoWyt3nm8zyTSKE4xvQ0DMAyGSFC5plpRhRHaLPv2/Rq/4jJ
         TmVLHDuWg0TMDCxy8CgvpbwNO7iNJeXiIB/DIEd0N/Ka36py81YKQ1HxwamaSf1t5xF4
         oQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773874597; x=1774479397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AI37ocZBE7PjJ3M5c4x+eUfmaD6N83f1uXKcbpaDCA4=;
        b=Lx4ElujZBU2ZeGS7I1bSrfmUE1JDRR19Zem7dpndug7RXyC0yd7TcfqURzjHBx0lJP
         zvx6nl4QW7pxFEofv0nvyZfT3I50tmtxZY4h9mha1GPsbkHXYmQkQ4JSlnDdH+MxyHRD
         dajFZw6BkA3h89QHchmHyGd6SjCF3hWuHB7J9OTjWvr3v4IEuCvYxm+P5g3iIVDeAO70
         USFDMuuuZrNRyz4ARFSR+cOZnmnSg2dJunPB8CuzW3IwtQZ8LsnwSSxEccYheJIyvdIV
         xHDnimTcN2PAfDOlRg6wuFHzGOzBaKjNfe0+pieZrwzyyR94JMpA/JBqprZsohQ6LNoc
         KN5Q==
X-Gm-Message-State: AOJu0Yzvr5KYkEDWwIFOsIWwX7bh+O4QQ8KCP6s+y+4Co32U87gRwfmU
	ve3T6EIVDs9SFkCLFp/w0T97P3BqfwqS9TBNMRdKpYLc7vEIbz736u/uWxmMckkF
X-Gm-Gg: ATEYQzzBgt3rtHgUikMLi5j4Kpar9YIjbEI2trXkK4dYTn9WPh7l/TdvU562Pk/ozvl
	GvZHi3ORPe4kVi+2MFa3QDn/dkT10gXqRIGmOyfUImwDKcFvJ4RKWGeFo1fvZp2qEIwMOAPu/75
	ZG8zWv1aUoSQ08jybDjdCoZkokQoAq4K8xUKawckXiIjSlk40hDKeGMaHgZiEGqr0YtizBywerS
	ribz4uX64zTJpf+NB06nvYSUwTO5bDzn1255rIlxPWs7MOI4FjArU1YutThZZSe/A8GuOz9jGvu
	hlOB856xsw4OSaWcJKxEeu4VUAZp7xjaZQ+aNVVK/TbGrnyHo9gkWOTZ7oar+WY8f9wS5cv9vCU
	8UmXTKVvxVBIlYrsg349714r6VygU66ViBAggsOOLqPySPxESs6Ga9W7AXTumWVFNSISqjA1F5w
	KQl2Yuk43FtsVmWmJIOUB8p6pokVjA+CPJpdtMKyoM3tJaMA==
X-Received: by 2002:a17:907:9811:b0:b94:24:44bb with SMTP id a640c23a62f3a-b97f49bd1dfmr331933866b.42.1773874596343;
        Wed, 18 Mar 2026 15:56:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1cc8:c257:1410:43ff:fe11:dbdc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16d3380sm348022266b.42.2026.03.18.15.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:56:35 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Reduce indentation in rtw_joinbss_event_prehandle
Date: Wed, 18 Mar 2026 23:55:44 +0100
Message-ID: <20260318225550.535368-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
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
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 158 ++++++++++++----------
 1 file changed, 83 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2adc98c955fd..09344997730f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1176,83 +1176,20 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
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
-
-			} else {
-				ptarget_wlan = _rtw_find_same_network(&pmlmepriv->scanned_queue, pnetwork);
-				if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-					if (ptarget_wlan)
-						ptarget_wlan->fixed = true;
-				}
-			}
-
-			/* s2. update cur_network */
-			if (ptarget_wlan) {
-				rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
-			} else {
-				netdev_dbg(adapter->pnetdev,
-					   "Can't find ptarget_wlan when joinbss_event callback\n");
-				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-				goto ignore_joinbss_callback;
-			}
-
-			/* s3. find ptarget_sta & update ptarget_sta after update cur_network only for station mode */
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-				ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
-				if (!ptarget_sta) {
-					spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-					goto ignore_joinbss_callback;
-				}
-			}
-
-			/* s4. indicate connect */
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-				pmlmepriv->cur_network_scanned = ptarget_wlan;
-				rtw_indicate_connect(adapter);
-			}
-
-			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-
-			spin_unlock_bh(&pmlmepriv->lock);
-			/* s5. Cancel assoc_timer */
-			timer_delete_sync(&pmlmepriv->assoc_timer);
-			spin_lock_bh(&pmlmepriv->lock);
-		} else {
-			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-		}
-	} else if (pnetwork->join_res == -4) {
+	if (pnetwork->join_res == -4) {
 		rtw_reset_securitypriv(adapter);
 		_set_timer(&pmlmepriv->assoc_timer, 1);
 
 		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
-	} else {/* if join_res < 0 (join fails), then try again */
+		goto ignore_joinbss_callback;
+	}
+
+	if (pnetwork->join_res <= 0) {
+#ifdef REJOIN
+		int res = _FAIL;
 
-		#ifdef REJOIN
-		res = _FAIL;
 		if (retry < 2)
 			res = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 
@@ -1260,21 +1197,92 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			/* extend time of assoc_timer */
 			_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 			retry++;
-		} else if (res == 2) {/* there is no need to wait for join */
+		} else if (res == 2) { /* there is no need to wait for join */
 			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 			rtw_indicate_connect(adapter);
 		} else {
-		#endif
-
+#endif
 			_set_timer(&pmlmepriv->assoc_timer, 1);
 			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
-		#ifdef REJOIN
+#ifdef REJOIN
 			retry = 0;
 		}
-		#endif
+#endif
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
+			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+							cur_network->network.mac_address);
+		} else {
+			pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+						     cur_network->network.mac_address);
+			if (pcur_wlan)
+				pcur_wlan->fixed = false;
+
+			pcur_sta = rtw_get_stainfo(pstapriv, cur_network->network.mac_address);
+			if (pcur_sta)
+				rtw_free_stainfo(adapter, pcur_sta);
+
+			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+							pnetwork->network.mac_address);
+			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+				if (ptarget_wlan)
+					ptarget_wlan->fixed = true;
+			}
+		}
+	} else {
+		ptarget_wlan = _rtw_find_same_network(&pmlmepriv->scanned_queue, pnetwork);
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+			if (ptarget_wlan)
+				ptarget_wlan->fixed = true;
+		}
+	}
+
+	/* s2. update cur_network */
+	if (!ptarget_wlan) {
+		netdev_dbg(adapter->pnetdev, "Can't find ptarget_wlan when joinbss_event callback\n");
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+		goto ignore_joinbss_callback;
+	}
+
+	rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
+
+	/* s3. find ptarget_wlan & update ptarget_sta after update
+	 * cur_network only for station mode
+	 */
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+		ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
+		if (!ptarget_sta) {
+			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+			goto ignore_joinbss_callback;
+		}
 	}
 
+	/* s4. indicate connect */
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+		pmlmepriv->cur_network_scanned = ptarget_wlan;
+		rtw_indicate_connect(adapter);
+	}
+
+	spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+
+	/* s5. cancel assoc_timer */
+	spin_unlock_bh(&pmlmepriv->lock);
+	timer_delete_sync(&pmlmepriv->assoc_timer);
+	return;
+
 ignore_joinbss_callback:
 
 	spin_unlock_bh(&pmlmepriv->lock);
-- 
2.53.0

