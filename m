Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348783E51E6
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 17:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772559561; cv=none; b=uOBShqo8hcJTvWL7C2wbsqX8Gxr56fGAO0KwR4+u3IIe85nxUkJ+j0fp3R/F1R8AUN5ooRuCctw2aTZzOr8uqKzDvexQUPLvzTR48bGsR25v1eG2V1/g37ETZasXi9IC63bo8D4Q26HZvQ+lYLIKvbZorm91NyJzz+PelcReEF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772559561; c=relaxed/simple;
	bh=b+yZTqPH8Y6TiJwSVp5V/jMb31u/+xGJCvBFQMXmT3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7xAJuM+FqDQxaD+9WXH0dIkNnae3zMzAvwRAtmyxK4FZi6jL1TtwxjqbD7fW5jU+CXW1BU1UCetg8WTrMlIpvBlcIU1+5eBqzqSW5uN/gy+e9rPiyWobKiATk2m2axSrX8HLTG7sMmBW2gy3YucKOx5a5cb3uaqpQGwP53V+JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwSRIx4y; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwSRIx4y"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c4bde55cso344592f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 09:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772559558; x=1773164358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hASRQThJr3IxEG6XMzU0HE65M0rqQJ6eWNV3kzXSqfM=;
        b=JwSRIx4yatYZAnTNVNnWHoa+DySHjnTiTK5+Bm5bOEfWjnGw2MM+Fqz/myvz+Su1Qp
         10Wso5rKMXABvGtbwbGdJH/x9lDP+z9yIMH2j5cjJs5B1xuR74LA8qq2/Kcqd0Y4UyzI
         uXm0dHke9Gi9aRIk6G/DGk9vuGP2iCfj65phcd+Brh+JRU/zKxVTtTDUYK8WCg+n5r87
         Cl7Ipb19rCAXhT3NObTWO+LqKxsEA9yi7vvkkNTx5OajQlUerCH9OU8FC9nRg1nUk5mE
         p9jmlVZVgEL4jlDE219wQjtfuQEwin/3rW921X0Y9p2veHriNnWKjyulLQo8rw8Zy1vX
         AmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772559558; x=1773164358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hASRQThJr3IxEG6XMzU0HE65M0rqQJ6eWNV3kzXSqfM=;
        b=IJS3D5hv4G8yJrIaR34frJmlEmddrr+xCHdj9wH1QvBTzfxE51WWCz83z4ryz2ezzK
         xzgkreVIvjvyq4tLlCQ7kMEF9NmubO4vGMd5vvoe9PhlWy2LFp84LQAVojeQB+58L52S
         0uHKQ5IWjqj1jWsRLLS/iEc4pkoBRF7j/vlgmp5p6IvfTMszDa9b0AUWsYmNhPAUJJYv
         PquMu/1l8p3w8b9tMCdOIzjhuvi6LNOY0vdLZC5b4up/Lv8ZX5qdkAQeksSUbFJKJdD+
         tnOHJKM0VIsBuxBhA/5vlahKvz+aynZRJD5zWjBkpGWFEdgbBAVKAiPi97bQTmRQoQ6a
         7baQ==
X-Gm-Message-State: AOJu0YylW7Ikgmxfd3T2b8yuX4CaPfUR/IA+XLP9NccBolnQDwLGte+Z
	HTHcgc+e8YzLkoLW6MgfU8vP0hWrV5THbPuFtnCI8sG3JyVqTJBgmmsEeH/8cHbyIjc9BT6f
X-Gm-Gg: ATEYQzw00c71dIZXvx7q8S8ZG+I2H1tqv+poZzc9oVqCRKdQnsi95R7ulbJUVDXzFLH
	51zQ0c0eYKRmUaFjGwrfgA/g48r1R7ZNVsjpQlSEmRre9E9Ph5uh//zyrL4IK3962n2iILyQBX1
	Yb3pGUKSbm7VFiTsbuqxLBtWiGzGdvc7482cpMCnZWli8ob5L5McIYAj6d6gbc0UnWHl7sru++S
	nVaYGvYMQo2YG+UtjuXybkrLY1Hq6BZCIs2XCgvq57nJkV+alL4r6GYtYRnYib54vbpJwKEPzZ0
	WtpkMXRkLGsJgA748Hx7jvCvA7dYsA01eXdRwAbkZZGCepC0BLIaVYSDlckA9yslhG7Zyqj44By
	MVVXBUF93qInxMZuOIF83sqGVTTqQZqRRV0it+GOEL4KtJYTTBv3eB7JiB7ngvx7pMrgwjVYp0W
	1ylCJVIWlPbvwRpWPKMNcVo56XidrnHbG/tT1/4Pdwv/dfE3lVWw==
X-Received: by 2002:a05:6000:4305:b0:439:bcdb:95af with SMTP id ffacd0b85a97d-439bcdba1f4mr10636861f8f.0.1772559558276;
        Tue, 03 Mar 2026 09:39:18 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm16701884f8f.17.2026.03.03.09.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:39:17 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] staging: rtl8723bs: format operators and logical continuations
Date: Tue,  3 Mar 2026 18:38:28 +0100
Message-ID: <20260303173844.47975-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303173844.47975-1-azpijr@gmail.com>
References: <20260303173844.47975-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spaces around different operators. Move logical continuations to the
end of the previous line.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 48 ++++++++++----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 7d2af0f1be52..e75dd21b3390 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -93,10 +93,10 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 	if (time_before(jiffies, adapter_to_pwrctl(adapter)->ips_deny_time))
 		goto exit;

-	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE|WIFI_SITE_MONITOR)
-		|| check_fwstate(pmlmepriv, WIFI_UNDER_LINKING|WIFI_UNDER_WPS)
-		|| check_fwstate(pmlmepriv, WIFI_AP_STATE)
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_ADHOC_STATE)
+	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE | WIFI_SITE_MONITOR) ||
+	    check_fwstate(pmlmepriv, WIFI_UNDER_LINKING | WIFI_UNDER_WPS) ||
+	    check_fwstate(pmlmepriv, WIFI_AP_STATE) ||
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE)
 	)
 		goto exit;

@@ -104,10 +104,10 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 	if (buddy) {
 		struct mlme_priv *b_pmlmepriv = &(buddy->mlmepriv);

-		if (check_fwstate(b_pmlmepriv, WIFI_ASOC_STATE|WIFI_SITE_MONITOR)
-			|| check_fwstate(b_pmlmepriv, WIFI_UNDER_LINKING|WIFI_UNDER_WPS)
-			|| check_fwstate(b_pmlmepriv, WIFI_AP_STATE)
-			|| check_fwstate(b_pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_ADHOC_STATE)
+		if (check_fwstate(b_pmlmepriv, WIFI_ASOC_STATE | WIFI_SITE_MONITOR) ||
+		    check_fwstate(b_pmlmepriv, WIFI_UNDER_LINKING | WIFI_UNDER_WPS) ||
+		    check_fwstate(b_pmlmepriv, WIFI_AP_STATE) ||
+		    check_fwstate(b_pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE)
 		)
 			goto exit;
 	}
@@ -155,7 +155,7 @@ void rtw_ps_processor(struct adapter *padapter)
 	if (!rtw_pwr_unassociated_idle(padapter))
 		goto exit;

-	if ((pwrpriv->rf_pwrstate == rf_on) && ((pwrpriv->pwr_state_check_cnts%4) == 0)) {
+	if ((pwrpriv->rf_pwrstate == rf_on) && ((pwrpriv->pwr_state_check_cnts % 4) == 0)) {
 		pwrpriv->change_rfpwrstate = rf_off;
 		{
 			ips_enter(padapter);
@@ -189,9 +189,9 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets

 		if (jiffies_to_msecs(jiffies - start_time) > 2000) { /*  2 sec == watch dog timer */
 			if (xmit_cnt > 8) {
-				if (adapter_to_pwrctl(padapter)->bLeisurePs
-				    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
-				    && !(hal_btcoex_IsBtControlLps(padapter))) {
+				if (adapter_to_pwrctl(padapter)->bLeisurePs &&
+				    (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE) &&
+				    !(hal_btcoex_IsBtControlLps(padapter))) {
 					bLeaveLPS = true;
 				}
 			}
@@ -202,16 +202,16 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets

 	} else { /*  from rx path */
 		if (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 4) {
-			if (adapter_to_pwrctl(padapter)->bLeisurePs
-			    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
-			    && !(hal_btcoex_IsBtControlLps(padapter)))
+			if (adapter_to_pwrctl(padapter)->bLeisurePs &&
+			    (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE) &&
+			    !(hal_btcoex_IsBtControlLps(padapter)))
 				bLeaveLPS = true;
 		}
 	}

 	if (bLeaveLPS)
 		/* rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1); */
-		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, tx?0:1);
+		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, tx ? 0 : 1);
 }

 /*
@@ -306,11 +306,11 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	if (delta_time < LPS_DELAY_TIME)
 		return false;

-	if (check_fwstate(pmlmepriv, WIFI_SITE_MONITOR)
-		|| check_fwstate(pmlmepriv, WIFI_UNDER_LINKING|WIFI_UNDER_WPS)
-		|| check_fwstate(pmlmepriv, WIFI_AP_STATE)
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_ADHOC_STATE)
-		|| rtw_is_scan_deny(padapter)
+	if (check_fwstate(pmlmepriv, WIFI_SITE_MONITOR) ||
+	    check_fwstate(pmlmepriv, WIFI_UNDER_LINKING | WIFI_UNDER_WPS) ||
+	    check_fwstate(pmlmepriv, WIFI_AP_STATE) ||
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE) ||
+	    rtw_is_scan_deny(padapter)
 	)
 		return false;

@@ -339,9 +339,9 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a

 	/* if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) */
 	if (ps_mode == PS_MODE_ACTIVE) {
-		if (!(hal_btcoex_IsBtControlLps(padapter))
-				|| (hal_btcoex_IsBtControlLps(padapter)
-					&& !(hal_btcoex_IsLpsOn(padapter)))) {
+		if (!(hal_btcoex_IsBtControlLps(padapter)) ||
+		    (hal_btcoex_IsBtControlLps(padapter) &&
+		    !(hal_btcoex_IsLpsOn(padapter)))) {
 			pwrpriv->pwr_mode = ps_mode;
 			rtw_set_rpwm(padapter, PS_STATE_S4);

--
2.53.0

