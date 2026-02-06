Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B35346E5F
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364529; cv=none; b=qH9QMaiffHN0kZ+G9Tc0pQOtdMd/PTji3mpSinCe5aIeeMwkf6YCTu/xFhe9LCjCQPMtjdUOuwUus0kiSaxMtZe+FzxNcGOpCAg5qV6CZfRzZ/6hBaSGFzHjdz1cN3pk4GrJNrKHxf9++y/EXsEevPnkTLZ4M6Ypcsb30BgSWgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364529; c=relaxed/simple;
	bh=RZDaxRseW8NLtF3AqOo4q119tWImR2umqmOQEHxzEvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmLA9dBEQaqgu9gMzhJ3+WkROhg+W/2dJVH4dbhLS6Aggkr+ZoC12FL2AJp/SbGvD3iZS1Hccp4rUAHgJtGzz2mkOl/Tlbb/zwMnk1C+6q7I8gFBT5z7Ile8YGKHCNmHXhFo9JV+O1/TwNSrFNAsaQcnUonT1+TR+wPsobsJjh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNeNPFNb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNeNPFNb"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4362507f0feso716660f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364528; x=1770969328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQ+Eis57/vHR1vw6pHuCr0O2ZIvIK8HRZ4Efzrz373A=;
        b=eNeNPFNbPxlTbEWudW5mWQitII3JX5lM3J8gnsx3QuWcCvYPIe6ZVzmzQheg4XfYcn
         +6isUM7zYESfWPGLKpz56LPJBBs3eyf/H0jv2ztjice1Z/5gpDfWT8IMjVM5UrTZ2Abq
         s6JBzT1bEE4XGGdU2H0NvyHyzRohwuw0ITQ/rCzKUKRyts+4zrEDE2hKpdI6cKc5F5dO
         KWoHM7G1WrrmsK+fKPA0ZOMHw32nJ3UAfm+6H6E7abRfPJ0Bm9Jw0RB9RxQc89xI51EW
         EYI5Vmh9+ZCyO7nXxaR8ipLD0xoYhqmQ5v5/NvDpw4byysKxewHcFHKgcnORWPelqZKx
         gkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364528; x=1770969328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zQ+Eis57/vHR1vw6pHuCr0O2ZIvIK8HRZ4Efzrz373A=;
        b=U7FdVisyyDjRu0UUM4AOYFumLsOsuKpbLkL3Teadhl6YhVUKwYpRVBXIKIfxeoINgO
         ByVhBf8+KAQICuCfWoyrZ6jK+ldZ/W0P2KhYJiX0fQOue/gCAo3iHJyOHHJihxLTZytO
         Z5dRwpLD8xkxOwKmrVUvoZyX2bX7XfrGqVOh0wMR8drpHSn9iOfLvZ9eYcYahIFP5on+
         t4n0ssjgl+Q7RYdjFebUCsc4b2qWOTMlLfOUaXsTTr4MtDJoaxXBMZpMS9WGrVBBrRJY
         +apiCZCvHU3O1wR3iNncw5qVYy2Q67Eb+J/y4eTIKgChrv1GW7sS+Nvu5wZ7ZRGgapCZ
         WsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjUaYDl5/KJK5QJBKpQ5c73Z3gsfL5KKtUIcIoN2VvKJDBRiG1FfjcPw8Qxbk75fDw0MqiSRLNfritChPK@lists.linux.dev
X-Gm-Message-State: AOJu0YxrCKOUNie4egL2OcLocDKDdlAPE5M7YkC6uFAFXyOzNYTi39/W
	0jesxO869Bowcd+wgqmqUsGyV+iWJ9CRUfc/lERk4BR2Kg9l0qodRHc=
X-Gm-Gg: AZuq6aKHuKXZ2i8GzgQErmoi4sZU2+ax/KUP+ijUJgDb308EsepTa1YBZPE2R1VnTqw
	OTYOblo2HTzRsorGvEeoFxFqQc+AK7Mw1C13+nke5wLDMmnsnHtyVnCFXlj0dmO4V7NajysOdnT
	56tAr4IKxko3E1X0obAlkR2J5JTI/P++ozai/8bBAk+tVN+3fmQxgtNmTXLWWy+0pAZlN3Ceu/O
	/0WDHg6L4uiEFR2x5Tauj7tF5nvoOD/ad0Hx6EB/bcixsmDtEKgW4Zn4oY9oxEVJfni585XgC48
	h8zOJhEHf++DMpxvjimHlPv6xvu+Ixcwkth1hyXIl/GnChu+gwCi1uUdfs73tlFCLzS5bDgi2s0
	9GRLITQdliY4/QUhS9o8mRpVA9D7h5kfUeT/Ixqq6A6jwYVOiXk4m7t282ZR/eI0Yj6Rqa9v4RH
	3A1lqos8zRUygvy128z/GKgL8j08g22tcbOZKMD0EjD/zbZmyfAXmOwZIATDEJv70=
X-Received: by 2002:a5d:5f48:0:b0:435:91b8:e01b with SMTP id ffacd0b85a97d-4362938d530mr3055057f8f.45.1770364527665;
        Thu, 05 Feb 2026 23:55:27 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:26 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 22/26] staging: rtl8723bs: core: fix line lengths in rtw_cmd.c
Date: Fri,  6 Feb 2026 08:54:35 +0100
Message-ID: <20260206075439.103287-23-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 147 +++++++++++++----------
 1 file changed, 81 insertions(+), 66 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 27da987d881f..39c22db2e824 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -185,7 +185,7 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = PTR_ALIGN(pcmdpriv->rsp_allocated_buf, 4);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
@@ -394,7 +394,7 @@ int rtw_cmd_thread(void *context)
 	while (1) {
 		if (wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp)) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp) return != 0, break\n",
+				   FUNC_ADPT_FMT " cmd_queue_comp interrupted\n",
 				   FUNC_ADPT_ARG(padapter));
 			break;
 		}
@@ -728,31 +728,33 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], (256 - 1));
 
 	psecnetwork->ie_length = 0;
-	/*  Added by Albert 2009/02/18 */
-	/*  If the driver wants to use the bssid to create the connection. */
-	/*  If not,  we have to copy the connecting AP's MAC address to it so that */
-	/*  the driver just has the bssid information for PMKIDList searching. */
 
+	/* If not using bssid, copy connecting AP's MAC for PMKIDList searching. */
 	if (!pmlmepriv->assoc_by_bssid)
-		memcpy(&pmlmepriv->assoc_bssid[0], &pnetwork->network.mac_address[0], ETH_ALEN);
+		memcpy(pmlmepriv->assoc_bssid, pnetwork->network.mac_address, ETH_ALEN);
 
-	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length);
-
-	pqospriv->qos_option = 0;
-
-	if (pregistrypriv->wmm_enable) {
-		tmp_len = rtw_restruct_wmm_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length, psecnetwork->ie_length);
-
-		if (psecnetwork->ie_length != tmp_len) {
-			psecnetwork->ie_length = tmp_len;
-			pqospriv->qos_option = 1; /* There is WMM IE in this corresp. beacon */
-		} else {
-			pqospriv->qos_option = 0;/* There is no WMM IE in this corresp. beacon */
+	{
+		u8 *src_ie = pnetwork->network.ies;
+		u8 *dst_ie = psecnetwork->ies;
+		int src_len = pnetwork->network.ie_length;
+
+		psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, src_ie,
+							     dst_ie, src_len);
+
+		pqospriv->qos_option = 0;
+		if (pregistrypriv->wmm_enable) {
+			tmp_len = rtw_restruct_wmm_ie(padapter, src_ie, dst_ie,
+						      src_len, psecnetwork->ie_length);
+			if (psecnetwork->ie_length != tmp_len) {
+				psecnetwork->ie_length = tmp_len;
+				pqospriv->qos_option = 1;
+			}
 		}
-	}
 
-	phtpriv->ht_option = false;
-	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len, pnetwork->network.ie_length - 12);
+		phtpriv->ht_option = false;
+		ptmp = rtw_get_ie(&src_ie[12], WLAN_EID_HT_CAPABILITY,
+				  &tmp_len, src_len - 12);
+	}
 	if (pregistrypriv->ht_enable && ptmp && tmp_len > 0) {
 		/* Added by Albert 2010/06/23 */
 		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
@@ -789,7 +791,8 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	return res;
 }
 
-u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue) /* for sta_mode */
+/* for sta_mode */
+u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue)
 {
 	struct cmd_obj *cmdobj = NULL;
 	struct disconnect_parm *param = NULL;
@@ -825,10 +828,12 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 	return res;
 }
 
-u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrastructure networktype, bool enqueue)
+u8 rtw_setopmode_cmd(struct adapter *padapter,
+		     enum ndis_802_11_network_infrastructure networktype,
+		     bool enqueue)
 {
-	struct	cmd_obj *ph2c;
-	struct	setopmode_parm *psetop;
+	struct cmd_obj *ph2c;
+	struct setopmode_parm *psetop;
 
 	struct	cmd_priv   *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
@@ -882,10 +887,14 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	else
 		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm, false);
 
-	if (unicast_key)
+	if (unicast_key) {
 		memcpy(&psetstakey_para->key, &sta->dot118021x_UncstKey, 16);
-	else
-		memcpy(&psetstakey_para->key, &psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey, 16);
+	} else {
+		u8 keyid = psecuritypriv->dot118021XGrpKeyid;
+		u8 *grpkey = psecuritypriv->dot118021XGrpKey[keyid].skey;
+
+		memcpy(&psetstakey_para->key, grpkey, 16);
+	}
 
 	/* jeff: set this because at least sw key is ready */
 	padapter->securitypriv.busetkipkey = true;
@@ -1107,25 +1116,26 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 static void collect_traffic_statistics(struct adapter *padapter)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
-
-	/*  Tx */
-	pdvobjpriv->traffic_stat.tx_bytes = padapter->xmitpriv.tx_bytes;
-	pdvobjpriv->traffic_stat.tx_pkts = padapter->xmitpriv.tx_pkts;
-	pdvobjpriv->traffic_stat.tx_drop = padapter->xmitpriv.tx_drop;
-
-	/*  Rx */
-	pdvobjpriv->traffic_stat.rx_bytes = padapter->recvpriv.rx_bytes;
-	pdvobjpriv->traffic_stat.rx_pkts = padapter->recvpriv.rx_pkts;
-	pdvobjpriv->traffic_stat.rx_drop = padapter->recvpriv.rx_drop;
-
-	/*  Calculate throughput in last interval */
-	pdvobjpriv->traffic_stat.cur_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
-	pdvobjpriv->traffic_stat.cur_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
-	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
-	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
-
-	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
-	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
+	struct rtw_traffic_statistics *stats = &pdvobjpriv->traffic_stat;
+
+	/* Tx */
+	stats->tx_bytes = padapter->xmitpriv.tx_bytes;
+	stats->tx_pkts = padapter->xmitpriv.tx_pkts;
+	stats->tx_drop = padapter->xmitpriv.tx_drop;
+
+	/* Rx */
+	stats->rx_bytes = padapter->recvpriv.rx_bytes;
+	stats->rx_pkts = padapter->recvpriv.rx_pkts;
+	stats->rx_drop = padapter->recvpriv.rx_drop;
+
+	/* Calculate throughput in last interval */
+	stats->cur_tx_bytes = stats->tx_bytes - stats->last_tx_bytes;
+	stats->cur_rx_bytes = stats->rx_bytes - stats->last_rx_bytes;
+	stats->last_tx_bytes = stats->tx_bytes;
+	stats->last_rx_bytes = stats->rx_bytes;
+
+	stats->cur_tx_tp = (u32)(stats->cur_tx_bytes * 8 / 2 / 1024 / 1024);
+	stats->cur_rx_tp = (u32)(stats->cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
 u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
@@ -1171,27 +1181,31 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 		}
 
 		/*  check traffic for  powersaving. */
-		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
-		    (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
-			bEnterPS = false;
+		{
+			struct rt_link_detect_t *ldi = &pmlmepriv->LinkDetectInfo;
+			u32 rx_tx_sum = ldi->NumRxUnicastOkInPeriod + ldi->NumTxOkInPeriod;
 
-			if (bBusyTraffic) {
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 4;
+			if ((rx_tx_sum > 8) || (ldi->NumRxUnicastOkInPeriod > 2)) {
+				bEnterPS = false;
 
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount++;
+				if (bBusyTraffic) {
+					if (ldi->TrafficTransitionCount <= 4)
+						ldi->TrafficTransitionCount = 4;
 
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 30;
-			}
-		} else {
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount >= 2)
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount -= 2;
-			else
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
+					ldi->TrafficTransitionCount++;
+
+					if (ldi->TrafficTransitionCount > 30)
+						ldi->TrafficTransitionCount = 30;
+				}
+			} else {
+				if (ldi->TrafficTransitionCount >= 2)
+					ldi->TrafficTransitionCount -= 2;
+				else
+					ldi->TrafficTransitionCount = 0;
 
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount == 0)
-				bEnterPS = true;
+				if (ldi->TrafficTransitionCount == 0)
+					bEnterPS = true;
+			}
 		}
 
 		/*  LeisurePS only work in infra mode. */
@@ -1737,7 +1751,8 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 	pdrvextra_cmd = (struct drvextra_cmd_parm *)pbuf;
 
 	switch (pdrvextra_cmd->ec_id) {
-	case DYNAMIC_CHK_WK_CID:/* only  primary padapter go to this cmd, but execute dynamic_chk_wk_hdl() for two interfaces */
+	/* only primary padapter goes to this cmd, but execute for two interfaces */
+	case DYNAMIC_CHK_WK_CID:
 		dynamic_chk_wk_hdl(padapter);
 		break;
 	case POWER_SAVING_CTRL_WK_CID:
-- 
2.52.0

