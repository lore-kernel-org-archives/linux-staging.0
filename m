Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A50338936
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576253; cv=none; b=Jv2WM53aSc6jWUUVmPw0uFLE2fGO6lbOYAPfiqo2npm18EBO/bIeD3ZbO26mSkWG5qwDMXklkOagAeKUYXKk/nW6gLlYKWEWllzHBwtfsDQgpq+4YHeZavBGWaOyVzCromGX3QIXWwC/dmjx5uRGFGZM4pwjCd1onalBbapTIKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576253; c=relaxed/simple;
	bh=q4aqz4jX+IZIfpAOlfggSxCAYHViKJ77MAWeuZUHbus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QUFtQkveJDLf5s2fIcoRWuPutRPB23AuPpvMHgWljM0yHgSmz94yjC76+6FF9jgd56s7IsNzfYcAqy/hZEx9z4QGIGyHOB1Hbs5VPPptQ6sX0p6vgODmnFfjwpbEFKHiBg2J1y65f55L7F6LKjMJjUlHbXCTjX9OVidaPyBRA8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YL+3d6WT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YL+3d6WT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so1031934b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 07:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768576250; x=1769181050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HI4ugOChhghFWMDLlFVD89OCH3voT8CxNuOe0b5u9rQ=;
        b=YL+3d6WTKsq/U0ZRs9PIZoun1Jr+E095juYGZyElUDZaA/Age+t6bydtcs+lU4EtQY
         6Q7CTQc0j5G0TlY+rrV3jyKVvgSzKdebL5fCh8r7jvnfvGEmVf3C6iYiB8f/D/bgaQG6
         yAt82gcZEVyzfK50qb7XgRzrp2L4k26yT04cXK490dnQBcUZXk6sD8WJ6CYXjefvMjlk
         6wsKz7yrdl0SIpvsHiRC7AozcBoDs4pZl7c4aUSHIBVKzkUwqcOTTvc4w7+Tc3UF2sxR
         FcUzXdKMi7uxqw21I+AUrx7hX1aVvlI+L8I/wBMHbl8XYkRjk2zjYBrJ7dIB5GEuXJDz
         J2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576250; x=1769181050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HI4ugOChhghFWMDLlFVD89OCH3voT8CxNuOe0b5u9rQ=;
        b=NdHLE8Ay6Gf7FeB98TVA5YFVLtfRrsS0gH9/tb1/xXaruRY8o7YHluadyiBuYtPC0J
         2UOEyTbV49sK0K3/aztNrCOHuXZq9SHzLy54VNzNFgBwDSpK11sAp8iwPTpEVaa2liut
         fYuoWb8DWBnc0shRV/JjlfOk1RJt7tEwiBRcUPJW2An55sL5L7Muh6C8eKmFo6ptYWDY
         tEoHN/gKn8LsxiMMsIUsPFsxdm8SV7KRwis4ekKT1tX6+Hliw2tdY9m41kMGVa3b9tPF
         eI2W52Z2jifxTHCnlUG/3XP0JUBjOBRO+GYO2azocWr57ZcCqHdg4URHKyidnE+WXY7N
         VqLg==
X-Gm-Message-State: AOJu0Yy2vqVTknbMdIJRtnhTJwuCIxj2bjL7MeRXQdljy15+BLCY0mGZ
	gIP4X92sf17ImUKozzb+pjFrev8FV/0SqPlEhw3HYTR7CIYjlPzEHOch
X-Gm-Gg: AY/fxX5Z/x0WJXzIaKL+/6MuUKplDirs4y+RbysqejQFH6rSbIG+ns+yTRvrAROphVZ
	+drCdVSbYAi1qv05+FlCqxTSxAidDdzvINSl9XdTpAWvIk3wHOl7t23x8X/G3RH0J8txs941Q42
	XiSG+7EaGGBzaumFUEHKTGEcb0U64B8q5dLQ4/UnRrcMdLtLGAeN/H+Qlmpq8QuvOD3QpDKMPBn
	NorYgUVakFaSRuP8j9m88i16yboBtoBdyEIKWQJrOG4SYi0NZgmlgYW51zeenZ7LO/yzPYmMn0Q
	+gexbJhOa22FTLVcNbOQ+H8Xj+V6c4SyRrSnKTNU9Ep44b4ZUKNgu08zXQDmfqsbre/ZIvkWXJ4
	uVQHc9zUBcEL6PI8AWCPEPagVZwcykIQL6HsUiY7J7haKwWN/X+6JPQBnk2bze2kgYynxC735A9
	5u0e1XjbTkzewsqlD4grcsA1cxwStIsA==
X-Received: by 2002:a05:6a00:9197:b0:81f:adb2:a426 with SMTP id d2e1a72fcca58-81fadb2a499mr858058b3a.51.1768576250136;
        Fri, 16 Jan 2026 07:10:50 -0800 (PST)
Received: from debian.ari ([152.58.178.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10e6ec7sm2353920b3a.28.2026.01.16.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:10:49 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v2 1/2] Add missing spaces around mathematical and logical operators (+, -, /, |, ?, :) and remove multiple spaces around operators to comply with the Linux kernel coding style.
Date: Fri, 16 Jan 2026 20:40:37 +0530
Message-Id: <20260116151038.23519-2-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260116151038.23519-1-architanant5@gmail.com>
References: <20260116151038.23519-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue identified by checkpatch.pl and review feedback.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 26 ++++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index f80476946622..1f5b3ea1f272 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -185,7 +185,7 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
@@ -697,7 +697,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	t_len = sizeof(struct wlan_bssid_ex);
 
 	/* for hidden ap to set fw_state here */
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE|WIFI_ADHOC_STATE) != true) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE) != true) {
 		switch (ndis_network_mode) {
 		case Ndis802_11IBSS:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
@@ -722,10 +722,10 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	psecuritypriv->authenticator_ie[0] = (unsigned char)psecnetwork->ie_length;
 
-	if ((psecnetwork->ie_length-12) < (256-1))
-		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], psecnetwork->ie_length-12);
+	if ((psecnetwork->ie_length - 12) < (256 - 1))
+		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], psecnetwork->ie_length - 12);
 	else
-		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], (256-1));
+		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], (256 - 1));
 
 	psecnetwork->ie_length = 0;
 	/*  Added by Albert 2009/02/18 */
@@ -752,7 +752,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	}
 
 	phtpriv->ht_option = false;
-	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len, pnetwork->network.ie_length-12);
+	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len, pnetwork->network.ie_length - 12);
 	if (pregistrypriv->ht_enable && ptmp && tmp_len > 0) {
 		/* Added by Albert 2010/06/23 */
 		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
@@ -766,7 +766,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 			/* rtw_restructure_ht_ie */
 			rtw_restructure_ht_ie(padapter, &pnetwork->network.ies[12], &psecnetwork->ies[0],
-									pnetwork->network.ie_length-12, &psecnetwork->ie_length,
+									pnetwork->network.ie_length - 12, &psecnetwork->ie_length,
 									pnetwork->network.configuration.ds_config);
 		}
 	}
@@ -1124,8 +1124,8 @@ static void collect_traffic_statistics(struct adapter *padapter)
 	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
 	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
 
-	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8/2/1024/1024);
-	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8/2/1024/1024);
+	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
+	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
 u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
@@ -1596,9 +1596,9 @@ static void rtw_btinfo_hdl(struct adapter *adapter, u8 *buf, u16 buf_len)
 
 	cmd_idx = info->cid;
 
-	if (info->len > buf_len-2) {
+	if (info->len > buf_len - 2) {
 		rtw_warn_on(1);
-		len = buf_len-2;
+		len = buf_len - 2;
 	} else {
 		len = info->len;
 	}
@@ -1608,7 +1608,7 @@ static void rtw_btinfo_hdl(struct adapter *adapter, u8 *buf, u16 buf_len)
 		buf[1] = 0;
 	else if (cmd_idx == BTINFO_BT_AUTO_RPT)
 		buf[1] = 2;
-	hal_btcoex_BtInfoNotify(adapter, len+1, &buf[1]);
+	hal_btcoex_BtInfoNotify(adapter, len + 1, &buf[1]);
 }
 
 u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
@@ -1668,7 +1668,7 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 
 	pdrvextra_cmd_parm->ec_id = C2H_WK_CID;
 	pdrvextra_cmd_parm->type = 0;
-	pdrvextra_cmd_parm->size =  c2h_evt?16:0;
+	pdrvextra_cmd_parm->size =  c2h_evt ? 16 : 0;
 	pdrvextra_cmd_parm->pbuf = c2h_evt;
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
-- 
2.39.5

