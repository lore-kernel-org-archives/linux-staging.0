Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F893612E2
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384203; cv=none; b=KroxW/2zF85Z18v5L1qxPLPn5+3/ZS3dsPkKbuZr69DZxZmsKa71Vbk/ZPDKDcRjHzy+ElcWuAFRDMLjAfJj49i8p4ZWq2HU4EeICVLORXlubuRobCkmXl/+z5vC/tdzeHwkPzprw1NqT84goctRp32+bo6eiaWSUPOBshN3W8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384203; c=relaxed/simple;
	bh=KBXMIkM8j4rAbftIGIXI/O0yzm6//3/JNq5qTa+St3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QjLcc+Gtc5w80Q8vACtqkB/Qv5zV65o+HJ/bt6pgK/lBGP8C1Mq2ZYO1tLk1TlECsL3SNrZBDTNOthOwRjSZ0eDWy1DsgSPO4Z8RqD7jR0iC3mNYVzIix9j3QUcYL1/SqPFi84AWTFbFqpJINz7Ru1lkC4Vdb9dJ8ePNRpSCa/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2F7N7vm; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2F7N7vm"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f3d6990d6so1873511b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 01:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768384200; x=1768989000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gsJIfHChgxQ29/0Rng7cOcZ+mVUeMihqij3RBasp5o=;
        b=D2F7N7vmEKPNAQjk8rtal48JV+FGHNAGfATw/YjWwc1m2vZDEt/v4kO00eZjnJY3l5
         BGnuKSOIAbiZi0eRtcpx/YXQ+NHs+hnVIAOZWuC4iKCGkZ8FNBuB/678/8N2+Yg+1OZ0
         moeg8yK258BGIRquN0ejFdroyVOZdBLUTnhjFvc+q2yG6IaYx5JXEZhGbD0BiZLt5Ygq
         sdQ5enGLAzu/ybjGjD8E9DsoiJzNvakG6425sXfOaSPb5TMSQ7kh/qtNuTIKg+3rla6w
         kDw/PknssGh4501Xrp1xrZOr2e4Dod2ZGTDpEVZTI7O5Cno4gd1eOcaAsMNhKe/4cKAz
         zQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384200; x=1768989000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/gsJIfHChgxQ29/0Rng7cOcZ+mVUeMihqij3RBasp5o=;
        b=pWjPsuE0difHZx/hMtXgwbSiQtXIyceHDWbF63G9hpzff15215laNyb60sea+ske23
         aoP7kLYy0JNIiYb9QGs1wqUJtbC04PQRlNBMcYThOgQ1Mkp9T0XUUoDsWoljBa3mgQKS
         vRSe9ChKLWsb2PlgrMCHgIvIjiBI9tCQo2Gaxm6QIaztQ0r9ygJPC7xuohFW9d7lmu9W
         oKA0Iq6GiQR6vPkA7z19I+eT+KTL/9hIazdUyMA574bxS4ahH1hn321QowA8OzlIFEab
         7vItY+A5HKoB/SZ2pQrIOSHK9Z4NmQzDMBPvUWA1GvtpOCdqXx/HpclpRQoIF9T1ltff
         +mUA==
X-Gm-Message-State: AOJu0YzZThRA4F6AdYTrSqaMIGCEdKSsSuCVL2+w3Rtx64SUG9Zd4dl+
	sVwBt7lvX3hWPhUC6NpK072r7RhGPZGT45WGaOrr/9iNoYh5uOHcLy8t
X-Gm-Gg: AY/fxX77c9ZGCcr7wpGGRbZN1o55jEtVCv51a8or+tT94VImP5qBK0SYN5Zsda15PZi
	aniePgc0VkyVzhRBDzL2szagbkM9szV9PamOCJmxpQaUC2vuPa1mf/TC1hekHy8qBuxB5wg69Ub
	LqhZU55I2w1Lhs2HBqbVKnuoYazS66Hd5B8Ps1cx86E+yyEREdv10phYOuWt6TMPDeqC3m9wV/u
	8rRcT6uEQox/GeVMEa4HrPYcVd8wed/+ixGAb1JebXPQcAVYArBg+giumTNkuMJg1y1Dx9yuYrt
	zRTQe22vhGmOsGjA/WgWUrelkrICzZqEq4YVxbAj4qtB6HMoDRQwvANEzqVH4CRRajch0O3M5V7
	zl2JHjI0+aiKio9Iv41SyJKQ1dki55DbviBlYa3LMcXqC3teOlkTbg1/RmSJUnxuAxS3uLr34tL
	teQU+cy+4kyxbJWUaStD+s/3nuY/m3ZGyu8wKXKfRT
X-Received: by 2002:a05:6a00:1ca2:b0:81f:3f88:89f9 with SMTP id d2e1a72fcca58-81f83c58793mr1343450b3a.2.1768384200398;
        Wed, 14 Jan 2026 01:50:00 -0800 (PST)
Received: from debian.ari ([152.58.176.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f43dfd462sm10201075b3a.27.2026.01.14.01.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:50:00 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ArchitAnant <architanant5@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: fix spacing around operators
Date: Wed, 14 Jan 2026 15:19:47 +0530
Message-Id: <20260114094949.14825-2-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260114094949.14825-1-architanant5@gmail.com>
References: <20260114094949.14825-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ArchitAnant <architanant5@gmail.com>

Add missing spaces around mathematical and logical operators
(+, -, /, |, ?, :) to comply with the Linux kernel coding style.

Issue identified by checkpatch.pl.

Signed-off-by: ArchitAnant <architanant5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 28 ++++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..03274738c94e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -175,7 +175,7 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 	if (!pcmdpriv->cmd_allocated_buf)
 		return -ENOMEM;
 
-	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ-1));
+	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ - 1));
 
 	pcmdpriv->rsp_allocated_buf = rtw_zmalloc(MAX_RSPSZ + 4);
 
@@ -204,7 +204,7 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 	_init_workitem(&pevtpriv->c2h_wk, c2h_wk_callback, NULL);
 	pevtpriv->c2h_wk_alive = false;
-	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN+1);
+	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
 	if (!pevtpriv->c2h_queue)
 		return -ENOMEM;
 
@@ -696,7 +696,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	t_len = sizeof(struct wlan_bssid_ex);
 
 	/* for hidden ap to set fw_state here */
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE|WIFI_ADHOC_STATE) != true) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE) != true) {
 		switch (ndis_network_mode) {
 		case Ndis802_11IBSS:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
@@ -721,10 +721,10 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
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
@@ -751,7 +751,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	}
 
 	phtpriv->ht_option = false;
-	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len, pnetwork->network.ie_length-12);
+	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len, pnetwork->network.ie_length - 12);
 	if (pregistrypriv->ht_enable && ptmp && tmp_len > 0) {
 		/* Added by Albert 2010/06/23 */
 		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
@@ -765,7 +765,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 			/* rtw_restructure_ht_ie */
 			rtw_restructure_ht_ie(padapter, &pnetwork->network.ies[12], &psecnetwork->ies[0],
-									pnetwork->network.ie_length-12, &psecnetwork->ie_length,
+									pnetwork->network.ie_length - 12, &psecnetwork->ie_length,
 									pnetwork->network.configuration.ds_config);
 		}
 	}
@@ -1122,8 +1122,8 @@ static void collect_traffic_statistics(struct adapter *padapter)
 	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
 	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
 
-	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8/2/1024/1024);
-	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8/2/1024/1024);
+	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
+	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
 u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
@@ -1598,9 +1598,9 @@ static void rtw_btinfo_hdl(struct adapter *adapter, u8 *buf, u16 buf_len)
 
 	cmd_idx = info->cid;
 
-	if (info->len > buf_len-2) {
+	if (info->len > buf_len - 2) {
 		rtw_warn_on(1);
-		len = buf_len-2;
+		len = buf_len - 2;
 	} else {
 		len = info->len;
 	}
@@ -1610,7 +1610,7 @@ static void rtw_btinfo_hdl(struct adapter *adapter, u8 *buf, u16 buf_len)
 		buf[1] = 0;
 	else if (cmd_idx == BTINFO_BT_AUTO_RPT)
 		buf[1] = 2;
-	hal_btcoex_BtInfoNotify(adapter, len+1, &buf[1]);
+	hal_btcoex_BtInfoNotify(adapter, len + 1, &buf[1]);
 }
 
 u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
@@ -1670,7 +1670,7 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 
 	pdrvextra_cmd_parm->ec_id = C2H_WK_CID;
 	pdrvextra_cmd_parm->type = 0;
-	pdrvextra_cmd_parm->size =  c2h_evt?16:0;
+	pdrvextra_cmd_parm->size =  c2h_evt ? 16 : 0;
 	pdrvextra_cmd_parm->pbuf = c2h_evt;
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
-- 
2.39.5

