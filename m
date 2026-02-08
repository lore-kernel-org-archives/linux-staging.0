Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B14034D904
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548518; cv=none; b=PYtNdO0ukgmS6muy0UiYJS/u29qOC3SvJsmZyAlKlLnQAcY1KzBz5DUL66pWIh172zZGGm4iKxZxfqBTYw+wiLUK3wMKJdIwy6NplWtmd/gxwfW/9KCyUA7r+C8pWzY2OYj0FMgnvYii11g0hmiQ8h5OyrYr6xDFOBVsAUPgOu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548518; c=relaxed/simple;
	bh=z9XAtCrvIlGYPYtMoQcHsVZjZyfrVVpzGrP3d+Bm3+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ksv7oxxqQ0eP4xPF2yt78vdMey42Xx1kLa4xFRXcMOLVmdRusrxROXHiZYEkALjKP4Z7BYROjAdNhklRqv0UfiaJEdxSNA3xHM8RbB4/PjmubW9MGsvVBsSKTsPIYgKA0VuhWfjB+T+8saev79+9VHO5nxpWno2LzqZa3DUT+a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AWx+OLeB; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AWx+OLeB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vej7qKyyOe/4LKltSUUYftdzu8lwTOX3et1fcSF3nlo=;
	b=AWx+OLeBESKM5YBHHq9CEnnesLJR5MD6dq2ZKPd4T/0WK29NcECEBbQzMTf7Xujb2UafJh
	iL6nVSknodLsbmSK4LW0dgac7JZVaCR8aSySN/BVHUfaVBtchF30/MA/gB0LLaQJxtVehI
	XF2z4Jg8NV8NoR5MG2Qb4Up4SDw6piE=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 18/22] staging: rtl8723bs: core: fix line lengths in rtw_cmd.c
Date: Sun,  8 Feb 2026 12:01:07 +0100
Message-ID: <20260208110111.46642-19-luka.gejak@linux.dev>
In-Reply-To: <20260208110111.46642-1-luka.gejak@linux.dev>
References: <20260208110111.46642-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 147 +++++++++++++----------
 1 file changed, 81 insertions(+), 66 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b2e7f479f72b..b2e34a6842fc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -183,7 +183,7 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = PTR_ALIGN(pcmdpriv->rsp_allocated_buf, 4);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
@@ -392,7 +392,7 @@ int rtw_cmd_thread(void *context)
 	while (1) {
 		if (wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp)) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp) return != 0, break\n",
+				   FUNC_ADPT_FMT " cmd_queue_comp interrupted\n",
 				   FUNC_ADPT_ARG(padapter));
 			break;
 		}
@@ -726,31 +726,33 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
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
@@ -787,7 +789,8 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	return res;
 }
 
-u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue) /* for sta_mode */
+/* for sta_mode */
+u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue)
 {
 	struct cmd_obj *cmdobj = NULL;
 	struct disconnect_parm *param = NULL;
@@ -823,10 +826,12 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
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
@@ -879,10 +884,14 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
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
@@ -1104,25 +1113,26 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
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
@@ -1168,27 +1178,31 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
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
@@ -1734,7 +1748,8 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
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

