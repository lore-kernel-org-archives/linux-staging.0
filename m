Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EEB33D6F9
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579086; cv=none; b=ReULAxdyrS0axaxsFGvjQaAfirRJk4Yibb9bZ7GnUrMWgizDovlw992ISx/MEPES/nI5U4EIfdh9BG1XIklgRodDjPRjRXtm9rE2Pwd+HknkomV58czq6EWIGSK+hOFnKurx8kDShAxiGE2a7wSefkHNWZdaKA4YFHI7uoUQMbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579086; c=relaxed/simple;
	bh=JXAD2S5gjced2RCSyd8Gg76f0u4Yt0GUFlm3pK64j7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ht6NYszZ8DubHC5K/tTPY9ko/jE8FrNjiQmH3U91n9fNeY71hayR7AU4TKdj3JqDV/WJ/kLtdMO5GhTIgdVjO9nlYM5egmxmHTrLPAiWtvDN+d47jKdcXEIY1iD47Vb2siGYb3D8OJgX4bDerzrLID7bRuWRFVe9j6ep7UFwrwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwGZdMKI; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwGZdMKI"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0f3f74587so14569805ad.2
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 07:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768579082; x=1769183882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nmv2ZPre15H6L6HoKv2iP93ngLK710j02rrDdrBXpLs=;
        b=BwGZdMKI0trkt+z7qlkSXOU4YHKl7Ahdu9EXwTNP788fX1RvWp0jrNLk7Lfwebx/7i
         HHJhkmV2ptmcuRDssj4yI4uWr8cOM2DQPfEk4+ALBj/o+51Y4C8GfA4pL1dAoQgauC+9
         gxHrm4wxCPboAjCJQc+CnifZPJU4oe9Il+HzGGln1iIFoPc3joTHEILlNvQw73XUL/S6
         Ksv7e4iYyOvSoBUPBAF2loG5MX38HMdP/JU1MusAP786QedrmGYmwlWIPrPj/E9q+yLY
         XNlx1MRwcsfnAhG5aI73hTmctAQH/aobrhQW75Q1X+CCUKN1C5niElZV5Ha0OsyNwDOQ
         LOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768579082; x=1769183882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nmv2ZPre15H6L6HoKv2iP93ngLK710j02rrDdrBXpLs=;
        b=khyuAciVezu0+Dgj9/zca5HvWkY+d6qxSbq4XF0uNn8gsD/cZoM+OYbzY45gE2iH1f
         EHbZl5PyZMGBXohXL+5TjOtmsL2V7eS5DeHIguF9i3cxX4OlTZF0uUrIR+4MBdsxs3k2
         ROK+qrLhUaUogxmujfmQBcb0Z2EKZGyMBVsTSipJOJTDszA0Kj6FRfZK3ASCUu/oIZPf
         eyjA65OX7ULWflKSp5LwH39RblWS/CBSh1vwvF/83nl9LbPNinycQzHaRYtBjO9CXCNA
         5rQd4m8UJtbieC5oW9o8Zqir3hzz6eVWoxN68Nqk4bFB8wwXZ5N+kyQXtxvxVPTERkVt
         EtkA==
X-Gm-Message-State: AOJu0YyYZAyEIswPtQ/qI6Mvn4uvabZFqqK7sNDhoLnuKvkHRsUUFpUX
	qeN7Okw2HUtVYcHm8OuNbSyFJrHJh1qzSHO51AcBESXV8t1sq3AN74TZyESNixYe
X-Gm-Gg: AY/fxX5qDUQYFUfcGItx+CeiRKcxWqnauQQ1GK0h/dicYN3PFm5VsUurI7EpkfIf/RH
	5mhWtiOShxJ22LlqrLnKLUZ3XxZwJs/7YL/Ug0RkDP7GZAkz0YN8U9P7T4g7RNkWOpnZf+GSxZI
	Q5m6fVA/iL+OZJCp3eqEqhyCFi/Qv4adYu07K29HdVvr5dGqN9QrBNaR/vpx8p2ETg4LYjvKu83
	YAl5wSPriXN/jO1y4nBDFcUs1KpRZWqLltOuD5qNUD5JWNgneN3iB+C6rfEGnQ8lgkvhfvgFmCP
	LUirSEi9v2pKUcJpF1nP02atDn0YBVsj+ffDmh+qxqV3MDJDjeDVOD5tMH3vT8uTcom3MmmVAr2
	iKFalUBY5Bk3yA67R+HOYAoUPlTdyaY3qSv8M/HVBhKhifdOEOT3dMAc+Jb9ZD4PynA0CIxzxbJ
	Zgt8pI8g5pUJunepPZfBbhNx+EzQJDWmE2Gt7iTtUc
X-Received: by 2002:a17:903:198c:b0:2a3:e6fa:4a17 with SMTP id d9443c01a7336-2a7177d5f2dmr25486255ad.51.1768579082277;
        Fri, 16 Jan 2026 07:58:02 -0800 (PST)
Received: from debian.ari ([152.58.178.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eee4fsm24738885ad.42.2026.01.16.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:58:01 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v3 1/2] staging: rtl8723bs: fix spacing around operators
Date: Fri, 16 Jan 2026 21:27:49 +0530
Message-Id: <20260116155750.3173-2-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260116155750.3173-1-architanant5@gmail.com>
References: <20260116155750.3173-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing spaces around mathematical and logical operators
(+, -, /, |, ?, :) and remove multiple spaces around operators
to comply with the Linux kernel coding style.

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

