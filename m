Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAE530F804
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016109; cv=none; b=Cdb7tYOWdGLGXrjxzBYFwmORYhlqGqTGGxp273BA5KP5e3wo4QGDApNDAXUj5NUumYaxE0DVCO/2Ki+VmyvwuM078+/Yky+goZmHA7jEminoM0Q94a0ihdAsOADI0Fu8tcZNXcKX04VVQCnukNgyJ5CdeBVD5IbyGMzO57tsc44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016109; c=relaxed/simple;
	bh=41zgYDgbnkyOQMqhsr2KsUP69VLL0Qp4SIBdcXepZy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VX9bfqlNSfmCS9PDX1zgm6XxZFwdskKbrBQ+yS+6gm307ZtCkXVjryIogl1nH0r7GebXa5Mzle4uwNx62Kg1ItFEsjyZHbXPKH5+Gg/K61u7fNNa6rmfgYMQCc4dMA85AHn6eiVMNywzWZawcJY9TLjz5odOBxgikIkgKjJdcA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWiykW4k; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWiykW4k"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so32064385e9.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 23:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770016099; x=1770620899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBuzjt2LRxef0TL7GSYxiUp/69wUdZJuPZv+/8VMa6c=;
        b=DWiykW4kzOhSUOOhuhyUjWhnmz0PQpxg/TcAPKceCk0gx17G9pzXcL9X7f+nFbuTlz
         vIk1TeyP2eelc9w9Mx7H1ZwJex0+zypizaXr/OwfrpResh3cldMVauzAgHhiAKUylLFM
         uZVuiw4rg6juvjdO0e33e1+flNAmBsvT7N3WHCpGe3Lo5ie2eqE5owabxv4r1MDjVC57
         cul03lWwqIRu9zS/1C9BteLmhugk1GqvsQMfLec5d9kQJxac9G+6AKw0Y8u6+2EvMU+x
         v0Cl018WqgLANldNXNgJdRLeHxR3VgUSgtuIgseeTAWWNtR4qWb9SISCH/qCTok4f9p0
         4mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016099; x=1770620899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LBuzjt2LRxef0TL7GSYxiUp/69wUdZJuPZv+/8VMa6c=;
        b=JgjEzUTuo/YHboTn3kSBxunWRgTmAvqc1LVNkT2aDYXnbGsK3JecKMgpskQB4D3kdy
         tq7ZSlvZYOQrq5rENaj41ETZzIMiukbdkumbWIK9A5YZaUOx17vJ/SUZNsdIgMz6raG0
         sYW4zH/UEy0XrGY1SdGA4ci7Y7UF7zcvaDNjt5wpcBIG6M6NZ2MVPpvo9cpUI8IWGnfO
         7jHgtNVQs9X/oYk+VnInSi32C6WXZs+6gt4bicxg5UQYl7yoAfSHY35pz1+N8/A8TW53
         NyxhTVNVgij5WJWsGnc2pZrsMf3E9MWvELqPoFWFwihFDykh3fwWjFhNEADxrfFakOC0
         fRfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuknzEJOM/n3GUA2Yi+CwZYrGnVZ8O45LnTlilFl7mCmFQsWKz7UQ+0pmallU0vvqemDoYzGl5L05CkFvP@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc7M7UOK77bHnAlgJGoJWQyWs6yxOY9qNIOWhJZHf6Fg8qnLWv
	ZVcPBdGDEHLJqxYogX7npNoFtfJeePSGKLGUAv7agk3MYqmvlhmIYu4=
X-Gm-Gg: AZuq6aJNWWZ+VgazzucFMJWX2TrtyQnRg/4psrXCzG5ZxInQebcjbJHsrLDML0KwdZ1
	6Hq+rtjnYJfiBvrux1634KfkhUqsnA8l8SAm9HEvAvzJSmhU/UweHfqCoVXX913YC5eh9Iem4N5
	HvOlgXj1jqGdC7TRfLje3OxBhMwWu1PG0IfaYVPONiCSlbqq41/z8tPlI/iNWsaGNv/f5W7YWYG
	999LiOkO8Dwhc8u9Nyeda0/a4eP3aeDKB+FvuyHuMw8kXV3L/v8E1v4BXE8EyD2AF7djNybSJxu
	NzEGJgBzCnzLn8wpViId45i1gSNx3YF6nTETJFFRLArBZGVAzH7LkE0DmrZMYNgqsSPGM5DwbU9
	gUSBLoFvpCP3AS3oqZ+adRMhCq9QQhrFThsqIaqGrFYFsRmAQ4uRJEdP0shGPp6YZYRxK5hgHwz
	gHOM6NxUt96Xhx6LtpnG9QLOD6PvKSQqYSpGz2PaRJQMosM1VUXZzv81Lw8t40Qg==
X-Received: by 2002:a05:600d:6402:20b0:482:e5d4:b7ca with SMTP id 5b1f17b1804b1-482e5d4b849mr78154975e9.8.1770016098557;
        Sun, 01 Feb 2026 23:08:18 -0800 (PST)
Received: from LGPC ([31.223.131.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cde00e8sm371369315e9.6.2026.02.01.23.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:08:17 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v1 5/5] staging: rtl8723bs: fix LONG_LINE warnings across C files
Date: Mon,  2 Feb 2026 08:07:52 +0100
Message-ID: <20260202070752.3391-6-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202070752.3391-1-lukagejak5@gmail.com>
References: <20260202070752.3391-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor lines exceeding 100 characters to comply with kernel coding
style. All changes preserve original logic and behavior.

Techniques used:
- Move trailing comments to separate lines above code
- Break long function signatures across multiple lines
- Extract complex expressions into named temp variables
- Use scoped blocks for local variable declarations
- Create pointer aliases for deeply nested struct accesses
- Simplify compound conditionals with intermediate booleans

Files modified:
- core/: rtw_cmd.c, rtw_ieee80211.c, rtw_io.c, rtw_ioctl_set.c,
         rtw_mlme.c, rtw_mlme_ext.c, rtw_pwrctrl.c, rtw_recv.c,
         rtw_security.c, rtw_wlan_util.c, rtw_xmit.c
- hal/:  HalBtc8723b1Ant.c, HalBtc8723b2Ant.c, HalPhyRf.c,
         HalPhyRf_8723B.c, hal_com.c, hal_com_phycfg.c, hal_intf.c,
         hal_sdio.c, odm.c, odm_DIG.c, odm_HWConfig.c, rtl8723b_cmd.c,
         rtl8723b_hal_init.c, rtl8723b_phycfg.c, rtl8723b_rf6052.c,
         rtl8723bs_recv.c, rtl8723bs_xmit.c, sdio_halinit.c
- os_dep/: ioctl_cfg80211.c, os_intfs.c, sdio_intf.c, xmit_linux.c

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 142 ++---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  36 +-
 drivers/staging/rtl8723bs/core/rtw_io.c       |   4 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  16 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 103 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 492 ++++++++++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   3 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 123 +++--
 drivers/staging/rtl8723bs/core/rtw_security.c |  11 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 215 +++++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  62 ++-
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |  35 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  29 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  36 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 166 ++++--
 drivers/staging/rtl8723bs/hal/hal_com.c       |  10 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  22 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   4 +-
 drivers/staging/rtl8723bs/hal/hal_sdio.c      |   4 +-
 drivers/staging/rtl8723bs/hal/odm.c           |  18 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |  38 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  17 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 103 +++-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  64 ++-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  54 +-
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   5 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  17 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 134 +++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  17 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |   3 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |   8 +-
 33 files changed, 1364 insertions(+), 639 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 27eddd22e064..1a417beb426c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -171,20 +171,18 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 	pcmdpriv->cmd_seq = 1;
 
 	pcmdpriv->cmd_allocated_buf = rtw_zmalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ);
-
 	if (!pcmdpriv->cmd_allocated_buf)
 		return -ENOMEM;
 
-	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ-1));
+	pcmdpriv->cmd_buf = PTR_ALIGN(pcmdpriv->cmd_allocated_buf, CMDBUFF_ALIGN_SZ);
 
 	pcmdpriv->rsp_allocated_buf = rtw_zmalloc(MAX_RSPSZ + 4);
-
 	if (!pcmdpriv->rsp_allocated_buf) {
 		kfree(pcmdpriv->cmd_allocated_buf);
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = PTR_ALIGN(pcmdpriv->rsp_allocated_buf, 4);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
@@ -393,7 +391,7 @@ int rtw_cmd_thread(void *context)
 	while (1) {
 		if (wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp)) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp) return != 0, break\n",
+				   FUNC_ADPT_FMT " cmd_queue_comp interrupted\n",
 				   FUNC_ADPT_ARG(padapter));
 			break;
 		}
@@ -727,31 +725,33 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], (256-1));
 
 	psecnetwork->ie_length = 0;
-	/*  Added by Albert 2009/02/18 */
-	/*  If the driver wants to use the bssid to create the connection. */
-	/*  If not,  we have to copy the connecting AP's MAC address to it so that */
-	/*  the driver just has the bssid information for PMKIDList searching. */
 
+	/*  If not using bssid, copy connecting AP's MAC for PMKIDList searching. */
 	if (!pmlmepriv->assoc_by_bssid)
-		memcpy(&pmlmepriv->assoc_bssid[0], &pnetwork->network.mac_address[0], ETH_ALEN);
-
-	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length);
+		memcpy(pmlmepriv->assoc_bssid, pnetwork->network.mac_address, ETH_ALEN);
 
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
-	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len, pnetwork->network.ie_length-12);
+		phtpriv->ht_option = false;
+		ptmp = rtw_get_ie(&src_ie[12], WLAN_EID_HT_CAPABILITY,
+				  &tmp_len, src_len - 12);
+	}
 	if (pregistrypriv->ht_enable && ptmp && tmp_len > 0) {
 		/* Added by Albert 2010/06/23 */
 		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
@@ -788,7 +788,8 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	return res;
 }
 
-u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue) /* for sta_mode */
+/* for sta_mode */
+u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue)
 {
 	struct cmd_obj *cmdobj = NULL;
 	struct disconnect_parm *param = NULL;
@@ -824,10 +825,12 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
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
@@ -881,10 +884,14 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
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
@@ -1105,22 +1112,23 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 static void collect_traffic_statistics(struct adapter *padapter)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
+	struct rtw_traffic_statistics *stats = &pdvobjpriv->traffic_stat;
 
-	/*  Tx */
-	pdvobjpriv->traffic_stat.tx_bytes = padapter->xmitpriv.tx_bytes;
-	pdvobjpriv->traffic_stat.tx_pkts = padapter->xmitpriv.tx_pkts;
-	pdvobjpriv->traffic_stat.tx_drop = padapter->xmitpriv.tx_drop;
+	/* Tx */
+	stats->tx_bytes = padapter->xmitpriv.tx_bytes;
+	stats->tx_pkts = padapter->xmitpriv.tx_pkts;
+	stats->tx_drop = padapter->xmitpriv.tx_drop;
 
-	/*  Rx */
-	pdvobjpriv->traffic_stat.rx_bytes = padapter->recvpriv.rx_bytes;
-	pdvobjpriv->traffic_stat.rx_pkts = padapter->recvpriv.rx_pkts;
-	pdvobjpriv->traffic_stat.rx_drop = padapter->recvpriv.rx_drop;
+	/* Rx */
+	stats->rx_bytes = padapter->recvpriv.rx_bytes;
+	stats->rx_pkts = padapter->recvpriv.rx_pkts;
+	stats->rx_drop = padapter->recvpriv.rx_drop;
 
-	/*  Calculate throughput in last interval */
-	pdvobjpriv->traffic_stat.cur_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
-	pdvobjpriv->traffic_stat.cur_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
-	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
-	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
+	/* Calculate throughput in last interval */
+	stats->cur_tx_bytes = stats->tx_bytes - stats->last_tx_bytes;
+	stats->cur_rx_bytes = stats->rx_bytes - stats->last_rx_bytes;
+	stats->last_tx_bytes = stats->tx_bytes;
+	stats->last_rx_bytes = stats->rx_bytes;
 
 	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8/2/1024/1024);
 	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8/2/1024/1024);
@@ -1168,28 +1176,33 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 				bHigherBusyTxTraffic = true;
 		}
 
-		/*  check traffic for  powersaving. */
-		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
-			(pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
-			bEnterPS = false;
+		/* check traffic for powersaving */
+		{
+			struct rt_link_detect_t *ldi = &pmlmepriv->LinkDetectInfo;
+			u32 total_ok = ldi->NumRxUnicastOkInPeriod + ldi->NumTxOkInPeriod;
+			bool has_traffic = (total_ok > 8) || (ldi->NumRxUnicastOkInPeriod > 2);
 
-			if (bBusyTraffic) {
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 4;
+			if (has_traffic) {
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
 
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount == 0)
-				bEnterPS = true;
+					if (ldi->TrafficTransitionCount > 30)
+						ldi->TrafficTransitionCount = 30;
+				}
+			} else {
+				if (ldi->TrafficTransitionCount >= 2)
+					ldi->TrafficTransitionCount -= 2;
+				else
+					ldi->TrafficTransitionCount = 0;
+
+				if (ldi->TrafficTransitionCount == 0)
+					bEnterPS = true;
+			}
 		}
 
 		/*  LeisurePS only work in infra mode. */
@@ -1739,7 +1752,8 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 	pdrvextra_cmd = (struct drvextra_cmd_parm *)pbuf;
 
 	switch (pdrvextra_cmd->ec_id) {
-	case DYNAMIC_CHK_WK_CID:/* only  primary padapter go to this cmd, but execute dynamic_chk_wk_hdl() for two interfaces */
+	/* only primary padapter goes to this cmd, but execute for two interfaces */
+	case DYNAMIC_CHK_WK_CID:
 		dynamic_chk_wk_hdl(padapter);
 		break;
 	case POWER_SAVING_CTRL_WK_CID:
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 8fdeeda88a6d..b7eab83989ca 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -333,11 +333,17 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1, (u8 *)&(pdev_network->configuration.ds_config), &sz);
 
 	/* IBSS Parameter Set */
+	{
+		u8 *atim = (u8 *)&pdev_network->configuration.atim_window;
 
-	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&(pdev_network->configuration.atim_window), &sz);
+		ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, atim, &sz);
+	}
+
+	if (rateLen > 8) {
+		u8 *ext_rates = pdev_network->supported_rates + 8;
 
-	if (rateLen > 8)
-		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rateLen - 8), (pdev_network->supported_rates + 8), &sz);
+		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, rateLen - 8, ext_rates, &sz);
+	}
 
 	/* HT Cap. */
 	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
@@ -437,7 +443,8 @@ int rtw_get_wpa2_cipher_suite(u8 *s)
 	return 0;
 }
 
-int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x)
+int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher,
+		     int *pairwise_cipher, int *is_8021x)
 {
 	int i, ret = _SUCCESS;
 	int left, count;
@@ -500,7 +507,8 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 	return ret;
 }
 
-int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x)
+int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher,
+		      int *pairwise_cipher, int *is_8021x)
 {
 	int i, ret = _SUCCESS;
 	int left, count;
@@ -738,7 +746,8 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
  *
  * Returns: the address of the specific WPS attribute content found, or NULL
  */
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content)
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id,
+			     u8 *buf_content, uint *len_content)
 {
 	u8 *attr_ptr;
 	u32 attr_len;
@@ -1019,7 +1028,11 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
 
 		if (pbuf && (wpa_ielen > 0)) {
-			if (_SUCCESS == rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
+			int ret2 = rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2,
+						     &group_cipher,
+						     &pairwise_cipher,
+						     &is8021x);
+			if (ret2 == _SUCCESS) {
 				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 				pnetwork->bcn_info.group_cipher = group_cipher;
 				pnetwork->bcn_info.is_8021x = is8021x;
@@ -1065,7 +1078,11 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 
 	/* get bwmode and ch_offset */
 	/* parsing HT_CAP_IE */
-	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
+	{
+		u8 *ies_start = pnetwork->network.ies + _FIXED_IE_LENGTH_;
+		uint ies_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
+
+		p = rtw_get_ie(ies_start, WLAN_EID_HT_CAPABILITY, &len, ies_len);
 	if (p && len > 0) {
 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 		pnetwork->bcn_info.ht_cap_info = le16_to_cpu(pht_cap->cap_info);
@@ -1073,7 +1090,8 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 		pnetwork->bcn_info.ht_cap_info = 0;
 	}
 	/* parsing HT_INFO_IE */
-	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(ies_start, WLAN_EID_HT_OPERATION, &len, ies_len);
+	}
 	if (p && len > 0) {
 		pht_info = (struct HT_info_element *)(p + 2);
 		pnetwork->bcn_info.ht_info_infos_0 = pht_info->infos[0];
diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index fe9f94001eed..9dd1b747acb9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -115,7 +115,9 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 	return _write_port(pintfhdl, addr, cnt, pmem);
 }
 
-int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapter *padapter, struct _io_ops *pops))
+int rtw_init_io_priv(struct adapter *padapter,
+		     void (*set_intf_ops)(struct adapter *padapter,
+					  struct _io_ops *pops))
 {
 	struct io_priv *piopriv = &padapter->iopriv;
 	struct intf_hdl *pintf = &piopriv->intf;
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..f16e94b28448 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -174,7 +174,11 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 						set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 					}
 				} else {
-					goto release_mlme_lock;/* it means driver is in WIFI_ADHOC_MASTER_STATE, we needn't create bss again. */
+					/*
+					 * already in WIFI_ADHOC_MASTER_STATE,
+					 * no need to create bss again
+					 */
+					goto release_mlme_lock;
 				}
 			} else {
 				rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_JOINBSS, 1);
@@ -309,8 +313,9 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 			rtw_free_assoc_resources(padapter, 1);
 
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
+			/* clr Linked_state; issue dis-assoc_cmd already checked above */
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
-				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
+				rtw_indicate_disconnect(padapter);
 		}
 
 		*pold_state = networktype;
@@ -365,7 +370,9 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 	return true;
 }
 
-u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_ssid *pssid, int ssid_max_num)
+u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter,
+				  struct ndis_802_11_ssid *pssid,
+				  int ssid_max_num)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 res = true;
@@ -399,7 +406,8 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 	return res;
 }
 
-u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11_authentication_mode authmode)
+u8 rtw_set_802_11_authentication_mode(struct adapter *padapter,
+				      enum ndis_802_11_authentication_mode authmode)
 {
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	int res;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5e79a720710f..1e4414af2c88 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -52,7 +52,8 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
 	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
-	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
+	/* 1: active, 0: passive. Maybe someday rename to "active_mode" */
+	pmlmepriv->scan_mode = SCAN_ACTIVE;
 
 	spin_lock_init(&pmlmepriv->lock);
 	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
@@ -376,7 +377,8 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 			(d_cap & WLAN_CAPABILITY_ESS));
 }
 
-struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network)
+struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
+					     struct wlan_network *network)
 {
 	struct list_head *phead, *plist;
 	struct wlan_network *found = NULL;
@@ -427,7 +429,8 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 	long rssi_final;
 
 	/* The rule below is 1/5 for sample value, 4/5 for history value */
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) &&
+	    is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
 		/* Take the recvpriv's value for the connected AP*/
 		ss_final = padapter->recvpriv.signal_strength;
 		sq_final = padapter->recvpriv.signal_qual;
@@ -469,10 +472,13 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 		&pmlmepriv->cur_network.network,
 		&pmlmepriv->cur_network.network);
 
-	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
+	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) &&
+	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
-		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+		rtw_update_protection(adapter,
+				      (pmlmepriv->cur_network.network.ies) +
+				      sizeof(struct ndis_802_11_fix_ie),
+				      pmlmepriv->cur_network.network.ie_length);
 	}
 }
 
@@ -609,7 +615,10 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 	privacy = pnetwork->network.privacy;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		if (rtw_get_wps_ie(pnetwork->network.ies+_FIXED_IE_LENGTH_, pnetwork->network.ie_length-_FIXED_IE_LENGTH_, NULL, &wps_ielen))
+		u8 *ies = pnetwork->network.ies + _FIXED_IE_LENGTH_;
+		uint ie_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
+
+		if (rtw_get_wps_ie(ies, ie_len, NULL, &wps_ielen))
 			return true;
 		else
 			return false;
@@ -617,12 +626,14 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
 		uint ie_len = 0;
+		u8 *ies = pnetwork->network.ies + _BEACON_IE_OFFSET_;
+		uint ies_len = pnetwork->network.ie_length - _BEACON_IE_OFFSET_;
 
 		if ((desired_encmode == Ndis802_11EncryptionDisabled) && (privacy != 0))
 			bselected = false;
 
 		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
-			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
+			p = rtw_get_ie(ies, WLAN_EID_RSN, &ie_len, ies_len);
 			if (p && ie_len > 0)
 				bselected = true;
 			else
@@ -968,7 +979,8 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = false;
 }
 
-static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
+static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter,
+						    struct wlan_network *pnetwork)
 {
 	int i;
 	struct sta_info *bmc_sta, *psta = NULL;
@@ -1052,7 +1064,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
+static void rtw_joinbss_update_network(struct adapter *padapter,
+				       struct wlan_network *ptarget_wlan,
+				       struct wlan_network *pnetwork)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
@@ -1070,7 +1084,8 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
 	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
 	/* the ptarget_wlan->network.rssi is raw data, we use ptarget_wlan->network.phy_info.signal_strength instead (has scaled) */
-	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
+	padapter->recvpriv.rssi =
+		translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
@@ -1095,7 +1110,9 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
 									(cur_network->network.ie_length));
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_ht_cap(padapter, cur_network->network.ies,
+			  cur_network->network.ie_length,
+			  (u8)cur_network->network.configuration.ds_config);
 }
 
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
@@ -1117,7 +1134,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  Backup the btkip_countermeasure information. */
 		/*  When the countermeasure is trigger, the driver have to disconnect with AP for 60 seconds. */
 
-		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0],
+		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
 		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
 		backupTKIPCountermeasure = adapter->securitypriv.btkip_countermeasure;
 		backupTKIPcountermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
@@ -1129,7 +1147,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 		/*  Added by Albert 2009/02/18 */
 		/*  Restore the PMK information to securitypriv structure for the following connection. */
-		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0],
+		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
 		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
 		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
 		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
@@ -1177,7 +1196,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
 	unsigned int		the_same_macaddr = false;
 
-	the_same_macaddr = !memcmp(pnetwork->network.mac_address, cur_network->network.mac_address, ETH_ALEN);
+	the_same_macaddr = !memcmp(pnetwork->network.mac_address,
+				   cur_network->network.mac_address, ETH_ALEN);
 
 	pnetwork->network.length = get_wlan_bssid_ex_sz(&pnetwork->network);
 	if (pnetwork->network.length > sizeof(struct wlan_bssid_ex))
@@ -1361,9 +1381,9 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	/* for AD-HOC mode */
 	psta = rtw_get_stainfo(&adapter->stapriv, pstassoc->macaddr);
 	if (psta) {
-		/* the sta have been in sta_info_queue => do nothing */
-
-		return; /* between drv has received this event before and  fw have not yet to set key to CAM_ENTRY) */
+		/* sta already in sta_info_queue, do nothing */
+		/* drv received this event but fw hasn't set key to CAM_ENTRY yet */
+		return;
 	}
 
 	psta = rtw_alloc_stainfo(&adapter->stapriv, pstassoc->macaddr);
@@ -1447,7 +1467,8 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 		if (adapter->registrypriv.wifi_spec == 1) {
 			roam = false;
-		} else if (reason == WLAN_REASON_EXPIRATION_CHK && rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
+		} else if (reason == WLAN_REASON_EXPIRATION_CHK &&
+			   rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
 			roam = true;
 		} else if (reason == WLAN_REASON_ACTIVE_ROAM && rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 			roam = true;
@@ -1916,7 +1937,8 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 	return res;
 }
 
-signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, signed int keyid, u8 set_tx, bool enqueue)
+signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv,
+		       signed int keyid, u8 set_tx, bool enqueue)
 {
 	u8 keylen;
 	struct cmd_obj *pcmd;
@@ -1991,7 +2013,8 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 }
 
 /* adjust ies for rtw_joinbss_cmd in WMM */
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
+			uint in_len, uint initial_out_len)
 {
 	unsigned	int ielength = 0;
 	unsigned int i, j;
@@ -2021,7 +2044,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
@@ -2302,7 +2325,9 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 }
 
 /* the function is >= passive_level */
-unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
+unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie,
+				   u8 *out_ie, uint in_len,
+				   uint *pout_len, u8 channel)
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
@@ -2448,20 +2473,26 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 		phtpriv->ampdu_enable = true;
 
 	/* check Max Rx A-MPDU Size */
-	len = 0;
-	p = rtw_get_ie(pie+sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len, ie_len-sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
-		pht_capie = (struct ieee80211_ht_cap *)(p+2);
-		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
-		max_ampdu_sz = 1 << (max_ampdu_sz+3); /*  max_ampdu_sz (kbytes); */
-
-		phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
-	}
+	{
+		u8 *ies = pie + sizeof(struct ndis_802_11_fix_ie);
+		uint ies_len = ie_len - sizeof(struct ndis_802_11_fix_ie);
+
+		len = 0;
+		p = rtw_get_ie(ies, WLAN_EID_HT_CAPABILITY, &len, ies_len);
+		if (p && len > 0) {
+			pht_capie = (struct ieee80211_ht_cap *)(p+2);
+			max_ampdu_sz = pht_capie->ampdu_params_info &
+				       IEEE80211_HT_CAP_AMPDU_FACTOR;
+			max_ampdu_sz = 1 << (max_ampdu_sz+3); /*  max_ampdu_sz (kbytes); */
+
+			phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
+		}
 
-	len = 0;
-	p = rtw_get_ie(pie+sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len-sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
-		/* todo: */
+		len = 0;
+		p = rtw_get_ie(ies, WLAN_EID_HT_OPERATION, &len, ies_len);
+		if (p && len > 0) {
+			/* todo: */
+		}
 	}
 
 	if ((pregistrypriv->bw_mode & 0x0f) > 0)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8297cf85eb7b..62411b204be9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -62,12 +62,14 @@ static unsigned char REALTEK_96B_IE[] = {0x00, 0xe0, 0x4c, 0x02, 0x01, 0x20};
 
 /* ChannelPlan definitions */
 static struct rt_channel_plan_2g	RTW_ChannelPlan2G[RT_CHANNEL_DOMAIN_2G_MAX] = {
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x00, RT_CHANNEL_DOMAIN_2G_WORLD , Passive scan CH 12, 13 */
+	/* 0x00, RT_CHANNEL_DOMAIN_2G_WORLD, Passive scan CH 12, 13 */
+	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x01, RT_CHANNEL_DOMAIN_2G_ETSI1 */
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, 11},			/*  0x02, RT_CHANNEL_DOMAIN_2G_FCC1 */
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14},	/*  0x03, RT_CHANNEL_DOMAIN_2G_MIKK1 */
 	{{10, 11, 12, 13}, 4},						/*  0x04, RT_CHANNEL_DOMAIN_2G_ETSI2 */
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14},	/*  0x05, RT_CHANNEL_DOMAIN_2G_GLOBAL , Passive scan CH 12, 13, 14 */
+	/* 0x05, RT_CHANNEL_DOMAIN_2G_GLOBAL, Passive scan CH 12, 13, 14 */
+	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14},
 	{{}, 0},								/*  0x06, RT_CHANNEL_DOMAIN_2G_NULL */
 };
 
@@ -194,15 +196,24 @@ int init_hw_mlme_ext(struct adapter *padapter)
 void init_mlme_default_rate_set(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-
-	unsigned char mixed_datarate[NumRates] = {_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_, _6M_RATE_, _9M_RATE_, _12M_RATE_, _18M_RATE_, _24M_RATE_, _36M_RATE_, _48M_RATE_, _54M_RATE_, 0xff};
-	unsigned char mixed_basicrate[NumRates] = {_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_, _6M_RATE_, _12M_RATE_, _24M_RATE_, 0xff,};
-	unsigned char supported_mcs_set[16] = {0xff, 0xff, 0x00, 0x00, 0x01, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
+	static const unsigned char mixed_datarate[NumRates] = {
+		_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_,
+		_6M_RATE_, _9M_RATE_, _12M_RATE_, _18M_RATE_,
+		_24M_RATE_, _36M_RATE_, _48M_RATE_, _54M_RATE_, 0xff
+	};
+	static const unsigned char mixed_basicrate[NumRates] = {
+		_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_,
+		_6M_RATE_, _12M_RATE_, _24M_RATE_, 0xff
+	};
+	static const unsigned char supported_mcs_set[16] = {
+		0xff, 0xff, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+	};
 
 	memcpy(pmlmeext->datarate, mixed_datarate, NumRates);
 	memcpy(pmlmeext->basicrate, mixed_basicrate, NumRates);
-
-	memcpy(pmlmeext->default_supported_mcs_set, supported_mcs_set, sizeof(pmlmeext->default_supported_mcs_set));
+	memcpy(pmlmeext->default_supported_mcs_set, supported_mcs_set,
+	       sizeof(pmlmeext->default_supported_mcs_set));
 }
 
 static void init_mlme_ext_priv_value(struct adapter *padapter)
@@ -319,7 +330,8 @@ static void init_channel_list(struct adapter *padapter, struct rt_channel_info *
 
 }
 
-static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_channel_info *channel_set)
+static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan,
+			   struct rt_channel_info *channel_set)
 {
 	u8 index, chanset_size = 0;
 	u8 b2_4GBand = false;
@@ -340,22 +352,27 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 
 	if (b2_4GBand) {
 		for (index = 0; index < RTW_ChannelPlan2G[Index2G].Len; index++) {
-			channel_set[chanset_size].ChannelNum = RTW_ChannelPlan2G[Index2G].Channel[index];
-
-			if ((ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN) ||/* Channel 1~11 is active, and 12~14 is passive */
-				(ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_NULL)) {
-				if (channel_set[chanset_size].ChannelNum >= 1 && channel_set[chanset_size].ChannelNum <= 11)
-					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
-				else if ((channel_set[chanset_size].ChannelNum  >= 12 && channel_set[chanset_size].ChannelNum  <= 14))
-					channel_set[chanset_size].ScanType  = SCAN_PASSIVE;
+			struct rt_channel_info *ch = &channel_set[chanset_size];
+
+			ch->ChannelNum = RTW_ChannelPlan2G[Index2G].Channel[index];
+
+			if ((ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN) ||
+			    (ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_NULL)) {
+				/* Channel 1~11 active, 12~14 passive */
+				if (ch->ChannelNum >= 1 && ch->ChannelNum <= 11)
+					ch->ScanType = SCAN_ACTIVE;
+				else if (ch->ChannelNum >= 12 && ch->ChannelNum <= 14)
+					ch->ScanType = SCAN_PASSIVE;
 			} else if (ChannelPlan == RT_CHANNEL_DOMAIN_WORLD_WIDE_13 ||
-				 Index2G == RT_CHANNEL_DOMAIN_2G_WORLD) { /*  channel 12~13, passive scan */
-				if (channel_set[chanset_size].ChannelNum <= 11)
-					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+				   Index2G == RT_CHANNEL_DOMAIN_2G_WORLD) {
+				/* channel 12~13, passive scan */
+				if (ch->ChannelNum <= 11)
+					ch->ScanType = SCAN_ACTIVE;
 				else
-					channel_set[chanset_size].ScanType = SCAN_PASSIVE;
-			} else
-				channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+					ch->ScanType = SCAN_PASSIVE;
+			} else {
+				ch->ScanType = SCAN_ACTIVE;
+			}
 
 			chanset_size++;
 		}
@@ -391,8 +408,11 @@ void init_mlme_ext_priv(struct adapter *padapter)
 
 	init_mlme_ap_info(padapter);
 
-	pmlmeext->max_chan_nums = init_channel_set(padapter, pmlmepriv->ChannelPlan, pmlmeext->channel_set);
-	init_channel_list(padapter, pmlmeext->channel_set, pmlmeext->max_chan_nums, &pmlmeext->channel_list);
+	pmlmeext->max_chan_nums = init_channel_set(padapter,
+						   pmlmepriv->ChannelPlan,
+						   pmlmeext->channel_set);
+	init_channel_list(padapter, pmlmeext->channel_set,
+			  pmlmeext->max_chan_nums, &pmlmeext->channel_list);
 	pmlmeext->last_scan_time = 0;
 	pmlmeext->chan_scan_time = SURVEY_TO;
 	pmlmeext->mlmeext_init = true;
@@ -417,7 +437,9 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 	}
 }
 
-static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptable, union recv_frame *precv_frame)
+static void _mgt_dispatcher(struct adapter *padapter,
+			    struct mlme_handler *ptable,
+			    union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 
@@ -571,8 +593,10 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 	int ret = _SUCCESS;
 	u8 *p = NULL;
 	u32 ielen = 0;
+	u8 *ie_start = pframe + sizeof(struct ieee80211_hdr_3addr) + _BEACON_IE_OFFSET_;
+	int ie_len = len - sizeof(struct ieee80211_hdr_3addr) - _BEACON_IE_OFFSET_;
 
-	p = rtw_get_ie(pframe + sizeof(struct ieee80211_hdr_3addr) + _BEACON_IE_OFFSET_, WLAN_EID_EXT_SUPP_RATES, &ielen, precv_frame->u.hdr.len - sizeof(struct ieee80211_hdr_3addr) - _BEACON_IE_OFFSET_);
+	p = rtw_get_ie(ie_start, WLAN_EID_EXT_SUPP_RATES, &ielen, ie_len);
 	if (p && ielen > 0) {
 		if (p + 2 + ielen < pframe + len) {
 			if ((*(p + 1 + ielen) == 0x2D) && (*(p + 2 + ielen) != 0x2D))
@@ -599,7 +623,12 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			}
 
 			/* check the vendor of the assoc AP */
-			pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pframe+sizeof(struct ieee80211_hdr_3addr), len-sizeof(struct ieee80211_hdr_3addr));
+			{
+				u8 *ap_ie = pframe + sizeof(struct ieee80211_hdr_3addr);
+				int ap_ie_len = len - sizeof(struct ieee80211_hdr_3addr);
+
+				pmlmeinfo->assoc_AP_vendor = check_assoc_AP(ap_ie, ap_ie_len);
+			}
 
 			/* update TSF Value */
 			update_TSF(pmlmeext, pframe, len);
@@ -618,7 +647,8 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			return _SUCCESS;
 		}
 
-		if (((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) && (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
+		if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE &&
+		    (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
 			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 			if (psta) {
 				ret = rtw_check_bcn_info(padapter, pframe, len);
@@ -650,9 +680,17 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 					goto _END_ONBEACON_;
 
 				/* get supported rate */
-				if (update_sta_support_rate(padapter, (pframe + WLAN_HDR_A3_LEN + _BEACON_IE_OFFSET_), (len - WLAN_HDR_A3_LEN - _BEACON_IE_OFFSET_), cam_idx) == _FAIL) {
-					pmlmeinfo->FW_sta_info[cam_idx].status = 0;
-					goto _END_ONBEACON_;
+				{
+					u8 *rate_ie = pframe + WLAN_HDR_A3_LEN + _BEACON_IE_OFFSET_;
+					int rate_len = len - WLAN_HDR_A3_LEN - _BEACON_IE_OFFSET_;
+					int ret;
+
+					ret = update_sta_support_rate(padapter, rate_ie,
+								      rate_len, cam_idx);
+					if (ret == _FAIL) {
+						pmlmeinfo->FW_sta_info[cam_idx].status = 0;
+						goto _END_ONBEACON_;
+					}
 				}
 
 				/* update TSF Value */
@@ -800,9 +838,11 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->state |= WIFI_FW_AUTH_STATE;
 			pstat->authalg = algorithm;
 		} else if (seq == 3) {
+			u8 *auth_ie = pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_;
+			int auth_len = len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4;
 
-			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
-					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
+			p = rtw_get_ie(auth_ie, WLAN_EID_CHALLENGE, (int *)&ie_len,
+				       auth_len);
 
 			if (!p || ie_len <= 0) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
@@ -1021,7 +1061,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		goto OnAssocReqFail;
 
 	/*  check if the supported rate is ok */
-	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_SUPP_RATES, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+	{
+		u8 *rate_ie = pframe + WLAN_HDR_A3_LEN + ie_offset;
+		int rate_ie_len = pkt_len - WLAN_HDR_A3_LEN - ie_offset;
+
+		p = rtw_get_ie(rate_ie, WLAN_EID_SUPP_RATES, &ie_len, rate_ie_len);
+	}
 	if (!p) {
 		/*  use our own rate set as statoin used */
 		/* memcpy(supportRate, AP_BSSRATE, AP_BSSRATE_LEN); */
@@ -1070,7 +1115,9 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		wpa_ie = elems.rsn_ie;
 		wpa_ie_len = elems.rsn_ie_len;
 
-		if (rtw_parse_wpa2_ie(wpa_ie-2, wpa_ie_len+2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
+		if (rtw_parse_wpa2_ie(wpa_ie - 2, wpa_ie_len + 2,
+				      &group_cipher, &pairwise_cipher,
+				      NULL) == _SUCCESS) {
 			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
 			pstat->wpa_psk |= BIT(1);
 
@@ -1133,8 +1180,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			&& (pstat->flags & (WLAN_STA_WPS|WLAN_STA_MAYBE_WPS))) {
 			if (pmlmepriv->wps_beacon_ie) {
 				u8 selected_registrar = 0;
+				u8 *wps_ie = pmlmepriv->wps_beacon_ie;
+				uint wps_len = pmlmepriv->wps_beacon_ie_len;
 
-				rtw_get_wps_attr_content(pmlmepriv->wps_beacon_ie, pmlmepriv->wps_beacon_ie_len, WPS_ATTR_SELECTED_REGISTRAR, &selected_registrar, NULL);
+				rtw_get_wps_attr_content(wps_ie, wps_len,
+							 WPS_ATTR_SELECTED_REGISTRAR,
+							 &selected_registrar, NULL);
 
 				if (!selected_registrar) {
 					status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
@@ -2156,11 +2207,18 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 			u8 *wps_ie;
 			uint wps_ielen;
 			u8 sr = 0;
-
-			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr)+_BEACON_IE_OFFSET_,
-				pattrib->pktlen-sizeof(struct ieee80211_hdr_3addr)-_BEACON_IE_OFFSET_, NULL, &wps_ielen);
+			u8 *bcn_ie = pmgntframe->buf_addr + TXDESC_OFFSET +
+				     sizeof(struct ieee80211_hdr_3addr) +
+				     _BEACON_IE_OFFSET_;
+			int bcn_ie_len = pattrib->pktlen -
+					 sizeof(struct ieee80211_hdr_3addr) -
+					 _BEACON_IE_OFFSET_;
+
+			wps_ie = rtw_get_wps_ie(bcn_ie, bcn_ie_len, NULL, &wps_ielen);
 			if (wps_ie && wps_ielen > 0)
-				rtw_get_wps_attr_content(wps_ie,  wps_ielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
+				rtw_get_wps_attr_content(wps_ie, wps_ielen,
+							 WPS_ATTR_SELECTED_REGISTRAR,
+							 &sr, NULL);
 			if (sr != 0)
 				set_fwstate(pmlmepriv, WIFI_UNDER_WPS);
 			else
@@ -2191,33 +2249,47 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	pframe += 2;
 	pattrib->pktlen += 2;
 
-	/*  SSID */
-	pframe = rtw_set_ie(pframe, WLAN_EID_SSID, cur_network->ssid.ssid_length, cur_network->ssid.ssid, &pattrib->pktlen);
+	{
+		u8 *ssid = cur_network->ssid.ssid;
+		int ssid_len = cur_network->ssid.ssid_length;
+		u8 *rates = cur_network->supported_rates;
+		u8 ds_cfg = cur_network->configuration.ds_config;
 
-	/*  supported rates... */
-	rate_len = rtw_get_rateset_len(cur_network->supported_rates);
-	pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pattrib->pktlen);
+		/* SSID */
+		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, ssid_len, ssid,
+				    &pattrib->pktlen);
 
-	/*  DS parameter set */
-	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pattrib->pktlen);
+		/* supported rates */
+		rate_len = rtw_get_rateset_len(rates);
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES,
+				    min_t(int, rate_len, 8), rates,
+				    &pattrib->pktlen);
+
+		/* DS parameter set */
+		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, &ds_cfg,
+				    &pattrib->pktlen);
+	}
 
-	/* if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) */
 	{
 		u8 erpinfo = 0;
-		u32 ATIMWindow;
-		/*  IBSS Parameter Set... */
-		/* ATIMWindow = cur->configuration.ATIMWindow; */
-		ATIMWindow = 0;
-		pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2, (unsigned char *)(&ATIMWindow), &pattrib->pktlen);
+		u32 ATIMWindow = 0;
+
+		/* IBSS Parameter Set */
+		pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2,
+				    (unsigned char *)&ATIMWindow, &pattrib->pktlen);
 
 		/* ERP IE */
-		pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo, &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo,
+				    &pattrib->pktlen);
 	}
 
+	/* EXTENDED SUPPORTED RATE */
+	if (rate_len > 8) {
+		u8 *ext_rates = cur_network->supported_rates + 8;
 
-	/*  EXTERNDED SUPPORTED RATE */
-	if (rate_len > 8)
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    rate_len - 8, ext_rates, &pattrib->pktlen);
+	}
 
 
 	/* todo:HT for adhoc */
@@ -2296,7 +2368,10 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 		return;
 
 	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE) {
-		pwps_ie = rtw_get_wps_ie(cur_network->ies+_FIXED_IE_LENGTH_, cur_network->ie_length-_FIXED_IE_LENGTH_, NULL, &wps_ielen);
+		u8 *ie_ptr = cur_network->ies + _FIXED_IE_LENGTH_;
+		int ie_len = cur_network->ie_length - _FIXED_IE_LENGTH_;
+
+		pwps_ie = rtw_get_wps_ie(ie_ptr, ie_len, NULL, &wps_ielen);
 
 		/* inerset & update wps_probe_resp_ie */
 		if (pmlmepriv->wps_probe_resp_ie && pwps_ie && wps_ielen > 0) {
@@ -2392,33 +2467,49 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 		pattrib->pktlen += 2;
 
 		/* below for ad-hoc mode */
+		{
+			u8 *ssid = cur_network->ssid.ssid;
+			int ssid_len = cur_network->ssid.ssid_length;
+			u8 *rates = cur_network->supported_rates;
+			u8 ds_cfg = cur_network->configuration.ds_config;
+
+			/* SSID */
+			pframe = rtw_set_ie(pframe, WLAN_EID_SSID, ssid_len, ssid,
+					    &pattrib->pktlen);
+
+			/* supported rates */
+			rate_len = rtw_get_rateset_len(rates);
+			pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES,
+					    min_t(int, rate_len, 8), rates,
+					    &pattrib->pktlen);
+
+			/* DS parameter set */
+			pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, &ds_cfg,
+					    &pattrib->pktlen);
+		}
 
-		/*  SSID */
-		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, cur_network->ssid.ssid_length, cur_network->ssid.ssid, &pattrib->pktlen);
-
-		/*  supported rates... */
-		rate_len = rtw_get_rateset_len(cur_network->supported_rates);
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pattrib->pktlen);
-
-		/*  DS parameter set */
-		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pattrib->pktlen);
-
-		if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+		if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 			u8 erpinfo = 0;
-			u32 ATIMWindow;
-			/*  IBSS Parameter Set... */
-			/* ATIMWindow = cur->configuration.ATIMWindow; */
-			ATIMWindow = 0;
-			pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2, (unsigned char *)(&ATIMWindow), &pattrib->pktlen);
+			u32 ATIMWindow = 0;
+
+			/* IBSS Parameter Set */
+			pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2,
+					    (unsigned char *)&ATIMWindow,
+					    &pattrib->pktlen);
 
 			/* ERP IE */
-			pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo, &pattrib->pktlen);
+			pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo,
+					    &pattrib->pktlen);
 		}
 
+		/* EXTENDED SUPPORTED RATE */
+		if (rate_len > 8) {
+			u8 *ext_rates = cur_network->supported_rates + 8;
 
-		/*  EXTERNDED SUPPORTED RATE */
-		if (rate_len > 8)
-			pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
+			pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+					    rate_len - 8, ext_rates,
+					    &pattrib->pktlen);
+		}
 
 
 		/* todo:HT for adhoc */
@@ -2497,8 +2588,11 @@ static int _issue_probereq(struct adapter *padapter,
 	get_rate_set(padapter, bssrate, &bssrate_len);
 
 	if (bssrate_len > 8) {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (bssrate_len - 8), (bssrate + 8), &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate,
+				    &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    bssrate_len - 8, bssrate + 8,
+				    &pattrib->pktlen);
 	} else {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
 	}
@@ -2533,8 +2627,8 @@ inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 	_issue_probereq(padapter, pssid, da, 0, 1, false);
 }
 
-int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
-	int try_cnt, int wait_ms)
+int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
+		      u8 *da, u8 ch, bool append_wps, int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -2641,14 +2735,16 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		memcpy(pwlanhdr->addr2, myid(&padapter->eeprompriv), ETH_ALEN);
 		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
-		/*  setting auth algo number */
-		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
+		/* setting auth algo number: 0=OPEN System, 1=Shared key */
+		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;
 		if (val16)
 			use_shared_key = 1;
 		le_tmp = cpu_to_le16(val16);
 
 		/* setting IV for auth seq #3 */
-		if ((pmlmeinfo->auth_seq == 3) && (pmlmeinfo->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1)) {
+		if (pmlmeinfo->auth_seq == 3 &&
+		    (pmlmeinfo->state & WIFI_FW_AUTH_STATE) &&
+		    use_shared_key == 1) {
 			__le32 le_tmp32;
 
 			val32 = ((pmlmeinfo->iv++) | (pmlmeinfo->key_index << 30));
@@ -2670,8 +2766,11 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		pframe = rtw_set_fixed_ie(pframe, _STATUS_CODE_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
 
 		/*  then checking to see if sending challenging text... */
-		if ((pmlmeinfo->auth_seq == 3) && (pmlmeinfo->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1)) {
-			pframe = rtw_set_ie(pframe, WLAN_EID_CHALLENGE, 128, pmlmeinfo->chg_txt, &(pattrib->pktlen));
+		if (pmlmeinfo->auth_seq == 3 &&
+		    (pmlmeinfo->state & WIFI_FW_AUTH_STATE) &&
+		    use_shared_key == 1) {
+			pframe = rtw_set_ie(pframe, WLAN_EID_CHALLENGE, 128,
+					    pmlmeinfo->chg_txt, &pattrib->pktlen);
 
 			SetPrivacy(fctrl);
 
@@ -2694,7 +2793,8 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 }
 
 
-void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type)
+void issue_asocrsp(struct adapter *padapter, unsigned short status,
+		   struct sta_info *pstat, int pkt_type)
 {
 	struct xmit_frame	*pmgntframe;
 	struct ieee80211_hdr	*pwlanhdr;
@@ -2755,18 +2855,25 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	pframe = rtw_set_fixed_ie(pframe, _ASOC_ID_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
 
 	if (pstat->bssratelen <= 8) {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, pstat->bssratelen, pstat->bssrateset, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES,
+				    pstat->bssratelen, pstat->bssrateset,
+				    &pattrib->pktlen);
 	} else {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, pstat->bssrateset, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen-8), pstat->bssrateset+8, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8,
+				    pstat->bssrateset, &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    pstat->bssratelen - 8, pstat->bssrateset + 8,
+				    &pattrib->pktlen);
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) && (pmlmepriv->htpriv.ht_option)) {
 		uint ie_len = 0;
+		u8 *beacon_ie = ie + _BEACON_IE_OFFSET_;
+		int beacon_len = pnetwork->ie_length - _BEACON_IE_OFFSET_;
 
 		/* FILL HT CAP INFO IE */
-		/* p = hostapd_eid_ht_capabilities_info(hapd, p); */
-		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_CAPABILITY, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
+		pbuf = rtw_get_ie(beacon_ie, WLAN_EID_HT_CAPABILITY,
+				  &ie_len, beacon_len);
 		if (pbuf && ie_len > 0) {
 			memcpy(pframe, pbuf, ie_len+2);
 			pframe += (ie_len+2);
@@ -2774,8 +2881,8 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		}
 
 		/* FILL HT ADD INFO IE */
-		/* p = hostapd_eid_ht_operation(hapd, p); */
-		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_OPERATION, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
+		pbuf = rtw_get_ie(beacon_ie, WLAN_EID_HT_OPERATION,
+				  &ie_len, beacon_len);
 		if (pbuf && ie_len > 0) {
 			memcpy(pframe, pbuf, ie_len+2);
 			pframe += (ie_len+2);
@@ -2790,7 +2897,10 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		unsigned char WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 
 		for (pbuf = ie + _BEACON_IE_OFFSET_; ; pbuf += (ie_len + 2)) {
-			pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2)));
+			int remaining = pnetwork->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2);
+
+			pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC,
+					  &ie_len, remaining);
 			if (pbuf && !memcmp(pbuf+2, WMM_PARA_IE, 6)) {
 				memcpy(pframe, pbuf, ie_len+2);
 				pframe += (ie_len+2);
@@ -2880,7 +2990,13 @@ void issue_assocreq(struct adapter *padapter)
 	pattrib->pktlen += 2;
 
 	/* SSID */
-	pframe = rtw_set_ie(pframe, WLAN_EID_SSID,  pmlmeinfo->network.ssid.ssid_length, pmlmeinfo->network.ssid.ssid, &(pattrib->pktlen));
+	{
+		u8 *ssid = pmlmeinfo->network.ssid.ssid;
+		int ssid_len = pmlmeinfo->network.ssid.ssid_length;
+
+		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, ssid_len, ssid,
+				    &pattrib->pktlen);
+	}
 
 	/* supported rate & extended supported rate */
 
@@ -2928,10 +3044,15 @@ void issue_assocreq(struct adapter *padapter)
 
 
 	if (bssrate_len > 8) {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (bssrate_len - 8), (bssrate + 8), &(pattrib->pktlen));
-	} else
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate,
+				    &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    bssrate_len - 8, bssrate + 8,
+				    &pattrib->pktlen);
+	} else {
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len,
+				    bssrate, &pattrib->pktlen);
+	}
 
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
@@ -2953,7 +3074,9 @@ void issue_assocreq(struct adapter *padapter)
 					vs_ie_length = 14;
 				}
 
-				pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC, vs_ie_length, pIE->data, &(pattrib->pktlen));
+				pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC,
+						    vs_ie_length, pIE->data,
+						    &pattrib->pktlen);
 			}
 			break;
 
@@ -2963,15 +3086,22 @@ void issue_assocreq(struct adapter *padapter)
 		case WLAN_EID_HT_CAPABILITY:
 			if (padapter->mlmepriv.htpriv.ht_option) {
 				if (!(is_ap_in_tkip(padapter))) {
-					memcpy(&(pmlmeinfo->HT_caps), pIE->data, sizeof(struct HT_caps_element));
-					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, pIE->length, (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
+					memcpy(&pmlmeinfo->HT_caps, pIE->data,
+					       sizeof(struct HT_caps_element));
+					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY,
+							    pIE->length,
+							    (u8 *)&pmlmeinfo->HT_caps,
+							    &pattrib->pktlen);
 				}
 			}
 			break;
 
 		case WLAN_EID_EXT_CAPABILITY:
-			if (padapter->mlmepriv.htpriv.ht_option)
-				pframe = rtw_set_ie(pframe, WLAN_EID_EXT_CAPABILITY, pIE->length, pIE->data, &(pattrib->pktlen));
+			if (padapter->mlmepriv.htpriv.ht_option) {
+				pframe = rtw_set_ie(pframe, WLAN_EID_EXT_CAPABILITY,
+						    pIE->length, pIE->data,
+						    &pattrib->pktlen);
+			}
 			break;
 		default:
 			break;
@@ -3072,7 +3202,8 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
  * When wait_ms > 0, this function should be called at process context
  * da == NULL for station mode
  */
-int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms)
+int issue_nulldata(struct adapter *padapter, unsigned char *da,
+		   unsigned int power_mode, int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -3217,7 +3348,8 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 
 /* when wait_ms >0 , this function should be called at process context */
 /* da == NULL for station mode */
-int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int try_cnt, int wait_ms)
+int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid,
+		       int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -3346,7 +3478,8 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 	return ret;
 }
 
-void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short tid)
+void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr,
+			   unsigned char action, unsigned short tid)
 {
 	u8 category = RTW_WLAN_CATEGORY_SA_QUERY;
 	struct xmit_frame		*pmgntframe;
@@ -3413,7 +3546,8 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short status)
+void issue_action_BA(struct adapter *padapter, unsigned char *raddr,
+		     unsigned char action, unsigned short status)
 {
 	u8 category = RTW_WLAN_CATEGORY_BACK;
 	u16 start_seq;
@@ -3516,17 +3650,20 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 			else
 				rtw_hal_get_def_var(padapter,
 						    HW_VAR_MAX_RX_AMPDU_FACTOR, &max_rx_ampdu_factor);
-
-			if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_64K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x1000); /* 64 buffer size */
-			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_32K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0800); /* 32 buffer size */
-			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_16K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0400); /* 16 buffer size */
-			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_8K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0200); /* 8 buffer size */
-			else
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x1000); /* 64 buffer size */
+			{
+				u16 ba_mask = le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f;
+
+				if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_64K)
+					BA_para_set = ba_mask | 0x1000; /* 64 buffer size */
+				else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_32K)
+					BA_para_set = ba_mask | 0x0800; /* 32 buffer size */
+				else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_16K)
+					BA_para_set = ba_mask | 0x0400; /* 16 buffer size */
+				else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_8K)
+					BA_para_set = ba_mask | 0x0200; /* 8 buffer size */
+				else
+					BA_para_set = ba_mask | 0x1000; /* 64 buffer size */
+			}
 
 			if (hal_btcoex_IsBTCoexCtrlAMPDUSize(padapter) &&
 			    padapter->driver_rx_ampdu_factor == 0xFF) {
@@ -3542,8 +3679,16 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 			else /* auto */
 				le_tmp = cpu_to_le16(BA_para_set);
 
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(le_tmp)), &(pattrib->pktlen));
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(pmlmeinfo->ADDBA_req.BA_timeout_value)), &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp,
+						  &pattrib->pktlen);
+			{
+				unsigned char *ba_timeout;
+
+				ba_timeout = (unsigned char *)
+					&pmlmeinfo->ADDBA_req.BA_timeout_value;
+				pframe = rtw_set_fixed_ie(pframe, 2, ba_timeout,
+							  &pattrib->pktlen);
+			}
 			break;
 		case 2:/* DELBA */
 			BA_para_set = (status & 0x1F) << 3;
@@ -3657,7 +3802,13 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 			pbss_network = (struct wlan_bssid_ex *)&pnetwork->network;
 
-			p = rtw_get_ie(pbss_network->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pbss_network->ie_length - _FIXED_IE_LENGTH_);
+			{
+				u8 *bss_ie = pbss_network->ies + _FIXED_IE_LENGTH_;
+				int bss_len = pbss_network->ie_length - _FIXED_IE_LENGTH_;
+
+				p = rtw_get_ie(bss_ie, WLAN_EID_HT_CAPABILITY,
+					       &len, bss_len);
+			}
 			if (!p || len == 0) {/* non-HT */
 
 				if (pbss_network->configuration.ds_config <= 0)
@@ -3692,7 +3843,9 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 					}
 				}
 
-				pframe = rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k, InfoContent, &(pattrib->pktlen));
+				pframe = rtw_set_ie(pframe,
+						    WLAN_EID_BSS_INTOLERANT_CHL_REPORT,
+						    k, InfoContent, &pattrib->pktlen);
 
 			}
 
@@ -3762,9 +3915,12 @@ unsigned int send_beacon(struct adapter *padapter)
 			cond_resched();
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
-		} while ((poll%10) != 0 && false == bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while ((poll % 10) != 0 && !bxmitok &&
+			       !padapter->bSurpriseRemoved &&
+			       !padapter->bDriverStopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+	} while (!bxmitok && issue < 100 &&
+		 !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
 		return _FAIL;
@@ -3804,10 +3960,14 @@ void site_survey(struct adapter *padapter)
 		if (pmlmeext->sitesurvey_res.channel_idx == 0) {
 #ifdef DBG_FIXED_CHAN
 			if (pmlmeext->fixed_chan != 0xff)
-				set_channel_bwmode(padapter, pmlmeext->fixed_chan, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
+				set_channel_bwmode(padapter, pmlmeext->fixed_chan,
+						   HAL_PRIME_CHNL_OFFSET_DONT_CARE,
+						   CHANNEL_WIDTH_20);
 			else
 #endif
-				set_channel_bwmode(padapter, survey_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
+				set_channel_bwmode(padapter, survey_channel,
+						   HAL_PRIME_CHNL_OFFSET_DONT_CARE,
+						   CHANNEL_WIDTH_20);
 		} else {
 #ifdef DBG_FIXED_CHAN
 			if (pmlmeext->fixed_chan != 0xff)
@@ -3856,7 +4016,9 @@ void site_survey(struct adapter *padapter)
 			/* switch back to the original channel */
 			/* SelectChannel(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset); */
 
-			set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
+			set_channel_bwmode(padapter, pmlmeext->cur_channel,
+					   pmlmeext->cur_ch_offset,
+					   pmlmeext->cur_bwmode);
 
 			/* flush 4-AC Queue after site_survey */
 			/* val8 = 0; */
@@ -3893,7 +4055,8 @@ void site_survey(struct adapter *padapter)
 }
 
 /* collect bss info from Beacon and Probe request/response frames. */
-u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, struct wlan_bssid_ex *bssid)
+u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame,
+		    struct wlan_bssid_ex *bssid)
 {
 	int	i;
 	u32 len;
@@ -3940,9 +4103,13 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	memcpy(bssid->ies, (pframe + sizeof(struct ieee80211_hdr_3addr)), bssid->ie_length);
 
 	/* get the signal strength */
-	bssid->rssi = precv_frame->u.hdr.attrib.phy_info.RecvSignalPower; /*  in dBM.raw data */
-	bssid->phy_info.signal_quality = precv_frame->u.hdr.attrib.phy_info.SignalQuality;/* in percentage */
-	bssid->phy_info.signal_strength = precv_frame->u.hdr.attrib.phy_info.SignalStrength;/* in percentage */
+	{
+		struct phy_info *phy = &precv_frame->u.hdr.attrib.phy_info;
+
+		bssid->rssi = phy->RecvSignalPower; /* in dBM.raw data */
+		bssid->phy_info.signal_quality = phy->SignalQuality; /* in percentage */
+		bssid->phy_info.signal_strength = phy->SignalStrength; /* in percentage */
+	}
 
 	/*  checking SSID */
 	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_SSID, &len, bssid->ie_length - ie_offset);
@@ -3971,7 +4138,8 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 		i = len;
 	}
 
-	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_EXT_SUPP_RATES, &len, bssid->ie_length - ie_offset);
+	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_EXT_SUPP_RATES, &len,
+		       bssid->ie_length - ie_offset);
 	if (p) {
 		if (len > (NDIS_802_11_LENGTH_RATES_EX-i))
 			return _FAIL;
@@ -4029,7 +4197,8 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	if ((pregistrypriv->wifi_spec == 1) && (false == pmlmeinfo->bwmode_updated)) {
 		struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - ie_offset);
+		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_CAPABILITY, &len,
+			       bssid->ie_length - ie_offset);
 		if (p && len > 0) {
 			struct HT_caps_element	*pHT_caps;
 
@@ -4073,8 +4242,8 @@ void start_create_ibss(struct adapter *padapter)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DO_IQK, NULL);
 
 		/* switch channel */
-		/* SelectChannel(padapter, pmlmeext->cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE); */
-		set_channel_bwmode(padapter, pmlmeext->cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
+		set_channel_bwmode(padapter, pmlmeext->cur_channel,
+				   HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
 
 		beacon_timing_control(padapter);
 
@@ -4202,7 +4371,8 @@ void start_clnt_assoc(struct adapter *padapter)
 	set_link_timer(pmlmeext, REASSOC_TO);
 }
 
-unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
+unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr,
+				 unsigned short reason)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
@@ -4249,7 +4419,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		u8 noc; /*  number of channel */
 		u8 j, k;
 
-		ie = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_COUNTRY, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+		ie = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_COUNTRY, &len,
+			bssid->ie_length - _FIXED_IE_LENGTH_);
 		if (!ie)
 			return;
 		if (len < 6)
@@ -4510,7 +4681,8 @@ void report_join_res(struct adapter *padapter, int res)
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pjoinbss_evt = (struct joinbss_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
-	memcpy((unsigned char *)(&(pjoinbss_evt->network.network)), &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
+	memcpy((unsigned char *)(&(pjoinbss_evt->network.network)),
+	       &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
 	pjoinbss_evt->network.join_res	= pjoinbss_evt->network.aid = res;
 
 
@@ -4680,7 +4852,9 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 
 		psta->htpriv.ampdu_enable = pmlmepriv->htpriv.ampdu_enable;
 
-		psta->htpriv.rx_ampdu_min_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para&IEEE80211_HT_CAP_AMPDU_DENSITY)>>2;
+		psta->htpriv.rx_ampdu_min_spacing =
+			(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para &
+			 IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;
 
 		if (support_short_GI(padapter, &(pmlmeinfo->HT_caps), CHANNEL_WIDTH_20))
 			psta->htpriv.sgi_20m = true;
@@ -4895,7 +5069,9 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 	rtw_hal_update_sta_rate_mask(padapter, psta);
 
 	/*  ToDo: HT for Ad-hoc */
-	psta->wireless_mode = rtw_check_network_type(psta->bssrateset, psta->bssratelen, pmlmeext->cur_channel);
+	psta->wireless_mode = rtw_check_network_type(psta->bssrateset,
+						      psta->bssratelen,
+						      pmlmeext->cur_channel);
 	psta->raid = networktype_to_raid_ex(padapter, psta);
 
 	/* rate radaptive */
@@ -4989,9 +5165,14 @@ void linked_status_chk(struct adapter *padapter)
 			{
 				if (rx_chk != _SUCCESS) {
 					if (pmlmeext->retry == 0) {
-						issue_probereq_ex(padapter, &pmlmeinfo->network.ssid, pmlmeinfo->network.mac_address, 0, 0, 0, 0);
-						issue_probereq_ex(padapter, &pmlmeinfo->network.ssid, pmlmeinfo->network.mac_address, 0, 0, 0, 0);
-						issue_probereq_ex(padapter, &pmlmeinfo->network.ssid, pmlmeinfo->network.mac_address, 0, 0, 0, 0);
+						struct ndis_802_11_ssid *ssid;
+						u8 *mac;
+
+						ssid = &pmlmeinfo->network.ssid;
+						mac = pmlmeinfo->network.mac_address;
+						issue_probereq_ex(padapter, ssid, mac, 0, 0, 0, 0);
+						issue_probereq_ex(padapter, ssid, mac, 0, 0, 0, 0);
+						issue_probereq_ex(padapter, ssid, mac, 0, 0, 0, 0);
 					}
 				}
 
@@ -5409,9 +5590,12 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 	u8 val8;
 
 	if (is_client_associated_to_ap(padapter))
-		issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms/100, 100);
+		issue_deauth_ex(padapter, pnetwork->mac_address,
+				WLAN_REASON_DEAUTH_LEAVING,
+				param->deauth_timeout_ms / 100, 100);
 
-	if (((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)) {
+	if (((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) ||
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* Stop BCN */
 		val8 = 0;
 		rtw_hal_set_hwreg(padapter, HW_VAR_BCN_FUNC, (u8 *)(&val8));
@@ -5529,7 +5713,8 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		}
 	}
 
-	if ((pmlmeext->sitesurvey_res.state == SCAN_START) || (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
+	if ((pmlmeext->sitesurvey_res.state == SCAN_START) ||
+	    (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
 		Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);
@@ -5936,8 +6121,11 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	setChannelPlan_param = (struct SetChannelPlan_param *)pbuf;
 
-	pmlmeext->max_chan_nums = init_channel_set(padapter, setChannelPlan_param->channel_plan, pmlmeext->channel_set);
-	init_channel_list(padapter, pmlmeext->channel_set, pmlmeext->max_chan_nums, &pmlmeext->channel_list);
+	pmlmeext->max_chan_nums = init_channel_set(padapter,
+						    setChannelPlan_param->channel_plan,
+						    pmlmeext->channel_set);
+	init_channel_list(padapter, pmlmeext->channel_set,
+			  pmlmeext->max_chan_nums, &pmlmeext->channel_list);
 
 	if (padapter->rtw_wdev && padapter->rtw_wdev->wiphy) {
 		struct regulatory_request request;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 0ef788abf403..405df520e5cc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -335,7 +335,8 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	return true;
 }
 
-void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_ant_mode, const char *msg)
+void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps,
+		     u8 bcn_ant_mode, const char *msg)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index e893cb6fa273..341ab6ff5a88 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -47,14 +47,23 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 
 	precvpriv->free_recvframe_cnt = NR_RECVFRAME;
 
-	precvpriv->pallocated_frame_buf = vzalloc(NR_RECVFRAME * sizeof(union recv_frame) + RXFRAME_ALIGN_SZ);
+	{
+		size_t sz = NR_RECVFRAME * sizeof(union recv_frame) + RXFRAME_ALIGN_SZ;
+
+		precvpriv->pallocated_frame_buf = vzalloc(sz);
+	}
 
 	if (!precvpriv->pallocated_frame_buf) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	precvpriv->precv_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(precvpriv->pallocated_frame_buf), RXFRAME_ALIGN_SZ);
+	{
+		SIZE_PTR aligned = N_BYTE_ALIGMENT((SIZE_PTR)(precvpriv->pallocated_frame_buf),
+						 RXFRAME_ALIGN_SZ);
+
+		precvpriv->precv_frame_buf = (u8 *)aligned;
+	}
 	/* precvpriv->precv_frame_buf = precvpriv->pallocated_frame_buf + RXFRAME_ALIGN_SZ - */
 	/* ((SIZE_PTR) (precvpriv->pallocated_frame_buf) &(RXFRAME_ALIGN_SZ-1)); */
 
@@ -390,11 +399,15 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 				mickey = &stainfo->dot11tkiprxmickey.skey[0];
 			}
 
-			datalen = precvframe->u.hdr.len-prxattrib->hdrlen-prxattrib->iv_len-prxattrib->icv_len-8;/* icv_len included the mic code */
+			/* icv_len included the mic code */
+			datalen = precvframe->u.hdr.len - prxattrib->hdrlen -
+				  prxattrib->iv_len - prxattrib->icv_len - 8;
 			pframe = precvframe->u.hdr.rx_data;
-			payload = pframe+prxattrib->hdrlen+prxattrib->iv_len;
+			payload = pframe + prxattrib->hdrlen + prxattrib->iv_len;
 
-			rtw_seccalctkipmic(mickey, pframe, payload, datalen, &miccode[0], (unsigned char)prxattrib->priority); /* care the length of the data */
+			/* care the length of the data */
+			rtw_seccalctkipmic(mickey, pframe, payload, datalen,
+					   &miccode[0], (unsigned char)prxattrib->priority);
 
 			pframemic = payload+datalen;
 
@@ -409,7 +422,10 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			if (bmic_err == true) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
-				if ((is_multicast_ether_addr(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
+				bool is_mcast = is_multicast_ether_addr(prxattrib->ra);
+				bool key_mismatch = prxattrib->key_index != pmlmeinfo->key_index;
+
+				if (is_mcast && key_mismatch)
 					brpt_micerror = false;
 
 				if (prxattrib->bdecrypted && brpt_micerror)
@@ -463,28 +479,37 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 		}
 	}
 
-	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted == 0) || (psecuritypriv->sw_decrypt == true))) {
-		psecuritypriv->hw_decrypted = false;
+	{
+		bool need_decrypt = prxattrib->encrypt > 0;
+		bool not_decrypted = !prxattrib->bdecrypted;
+		bool sw_decrypt = psecuritypriv->sw_decrypt;
+		bool decrypted_ok;
 
-		switch (prxattrib->encrypt) {
-		case _WEP40_:
-		case _WEP104_:
-			rtw_wep_decrypt(padapter, (u8 *)precv_frame);
-			break;
-		case _TKIP_:
-			res = rtw_tkip_decrypt(padapter, (u8 *)precv_frame);
-			break;
-		case _AES_:
-			res = rtw_aes_decrypt(padapter, (u8 *)precv_frame);
-			break;
-		default:
+		if (need_decrypt && (not_decrypted || sw_decrypt)) {
+			psecuritypriv->hw_decrypted = false;
+
+			switch (prxattrib->encrypt) {
+			case _WEP40_:
+			case _WEP104_:
+				rtw_wep_decrypt(padapter, (u8 *)precv_frame);
+				break;
+			case _TKIP_:
+				res = rtw_tkip_decrypt(padapter, (u8 *)precv_frame);
+				break;
+			case _AES_:
+				res = rtw_aes_decrypt(padapter, (u8 *)precv_frame);
+				break;
+			default:
 				break;
+			}
+		} else {
+			decrypted_ok = prxattrib->bdecrypted == 1 &&
+				       prxattrib->encrypt > 0 &&
+				       (psecuritypriv->busetkipkey == 1 ||
+					prxattrib->encrypt != _TKIP_);
+			if (decrypted_ok)
+				psecuritypriv->hw_decrypted = true;
 		}
-	} else if (prxattrib->bdecrypted == 1 && prxattrib->encrypt > 0 &&
-		   (psecuritypriv->busetkipkey == 1 || prxattrib->encrypt != _TKIP_)
-		) {
-		psecuritypriv->hw_decrypted = true;
-	} else {
 	}
 
 	if (res == _FAIL) {
@@ -564,7 +589,8 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 	return prtnframe;
 }
 
-static signed int recv_decache(union recv_frame *precv_frame, u8 bretry, struct stainfo_rxcache *prxcache)
+static signed int recv_decache(union recv_frame *precv_frame, u8 bretry,
+			       struct stainfo_rxcache *prxcache)
 {
 	signed int tid = precv_frame->u.hdr.attrib.priority;
 
@@ -669,7 +695,8 @@ static void process_wmmps_data(struct adapter *padapter, union recv_frame *precv
 	}
 }
 
-static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe, struct sta_info *sta)
+static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
+			   struct sta_info *sta)
 {
 	int sz;
 	struct sta_info *psta = NULL;
@@ -1149,7 +1176,8 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 }
 
 /* check if need to defrag, if needed queue the frame to defrag_q */
-static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union recv_frame *precv_frame)
+static union recv_frame *recvframe_chk_defrag(struct adapter *padapter,
+					      union recv_frame *precv_frame)
 {
 	u8 ismfrag;
 	u8 fragnum;
@@ -1257,7 +1285,8 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
 
 	{
 		/* for rx pkt statistics */
-		struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->u.hdr.rx_data));
+		u8 *addr2 = GetAddr2Ptr(precv_frame->u.hdr.rx_data);
+		struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, addr2);
 
 		if (psta) {
 			psta->sta_stats.rx_mgnt_pkts++;
@@ -1622,7 +1651,8 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	return _SUCCESS;
 }
 
-static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata)
+static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe,
+					  u16 nSubframe_Length, u8 *pdata)
 {
 	u16 eth_type;
 	struct sk_buff *sub_skb;
@@ -1662,7 +1692,8 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubfra
 	return sub_skb;
 }
 
-static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib)
+static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt,
+				  struct rx_pkt_attrib *pattrib)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
@@ -1816,7 +1847,8 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 	return true;
 }
 
-static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, union recv_frame *prframe)
+static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl,
+				     union recv_frame *prframe)
 {
 	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
@@ -1861,7 +1893,8 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 
 }
 
-static void recv_indicatepkts_pkt_loss_cnt(struct debug_priv *pdbgpriv, u64 prev_seq, u64 current_seq)
+static void recv_indicatepkts_pkt_loss_cnt(struct debug_priv *pdbgpriv,
+					   u64 prev_seq, u64 current_seq)
 {
 	if (current_seq < prev_seq)
 		pdbgpriv->dbg_rx_ampdu_loss_count += (4096 + current_seq - prev_seq);
@@ -1907,7 +1940,9 @@ static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *prec
 	return _FAIL;
 }
 
-static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reorder_ctrl *preorder_ctrl, int bforced)
+static int recv_indicatepkts_in_order(struct adapter *padapter,
+				      struct recv_reorder_ctrl *preorder_ctrl,
+				      int bforced)
 {
 	struct list_head	*phead, *plist;
 	union recv_frame *prframe;
@@ -2118,7 +2153,8 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 	if (phtpriv->ht_option == true) { /* B/G/N Mode */
 		/* prframe->u.hdr.preorder_ctrl = &precvpriv->recvreorder_ctrl[pattrib->priority]; */
 
-		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
+		/* including perform A-MPDU Rx Ordering Buffer Control */
+		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) {
 
 			if ((padapter->bDriverStopped == false) &&
 			    (padapter->bSurpriseRemoved == false)) {
@@ -2277,12 +2313,15 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 	u8 avg_signal_qual = 0;
 	u32 num_signal_strength = 0;
 	u32 __maybe_unused num_signal_qual = 0;
-	u8 _alpha = 5; /*  this value is based on converging_constant = 5000 and sampling_interval = 1000 */
+	/* based on converging_constant = 5000 and sampling_interval = 1000 */
+	u8 _alpha = 5;
 
 	if (adapter->recvpriv.is_signal_dbg) {
 		/* update the user specific value, signal_strength_dbg, to signal_strength, rssi */
-		adapter->recvpriv.signal_strength = adapter->recvpriv.signal_strength_dbg;
-		adapter->recvpriv.rssi = (s8)translate_percentage_to_dbm((u8)adapter->recvpriv.signal_strength_dbg);
+		u8 strength_dbg = adapter->recvpriv.signal_strength_dbg;
+
+		adapter->recvpriv.signal_strength = strength_dbg;
+		adapter->recvpriv.rssi = (s8)translate_percentage_to_dbm(strength_dbg);
 	} else {
 
 		if (recvpriv->signal_strength_data.update_req == 0) {/*  update_req is clear, means we got rx */
@@ -2300,9 +2339,11 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 		}
 
 		if (num_signal_strength == 0) {
-			if (rtw_get_on_cur_ch_time(adapter) == 0 ||
-			    jiffies_to_msecs(jiffies - rtw_get_on_cur_ch_time(adapter)) < 2 * adapter->mlmeextpriv.mlmext_info.bcn_interval
-			) {
+			unsigned long on_ch_time = rtw_get_on_cur_ch_time(adapter);
+			u32 bcn_intvl = adapter->mlmeextpriv.mlmext_info.bcn_interval;
+
+			if (on_ch_time == 0 ||
+			    jiffies_to_msecs(jiffies - on_ch_time) < 2 * bcn_intvl) {
 				goto set_timer;
 			}
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..11231f0d8fd0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -60,9 +60,12 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		keylength = psecuritypriv->dot11DefKeylen[psecuritypriv->dot11PrivacyKeyIndex];
 
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
+			u8 keyidx = psecuritypriv->dot11PrivacyKeyIndex;
+			u8 *defkey = psecuritypriv->dot11DefKey[keyidx].skey;
+
 			iv = pframe + pattrib->hdrlen;
 			memcpy(&wepkey[0], iv, 3);
-			memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength);
+			memcpy(&wepkey[3], defkey, keylength);
 			payload = pframe + pattrib->iv_len + pattrib->hdrlen;
 
 			if ((curfragnum + 1) == pattrib->nr_frags) {	/* the last fragment */
@@ -1063,7 +1066,8 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-	} else if ((frtype == WIFI_DATA) && /* only for data packet . add for CONFIG_IEEE80211W, none 11w also can use */
+	/* only for data packet . add for CONFIG_IEEE80211W, none 11w also can use */
+	} else if ((frtype == WIFI_DATA) &&
 		   ((frsubtype == 0x08) ||
 		   (frsubtype == 0x09) ||
 		   (frsubtype == 0x0a) ||
@@ -1487,8 +1491,9 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 {
 	struct security_priv *securitypriv = &(adapter->securitypriv);
 	signed int keyid;
+	u32 alg = securitypriv->dot11PrivacyAlgrthm;
 
-	if ((_WEP40_ == securitypriv->dot11PrivacyAlgrthm) || (_WEP104_ == securitypriv->dot11PrivacyAlgrthm)) {
+	if ((alg == _WEP40_) || (alg == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 3f71e62d0198..6b1377dc5fec 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -335,7 +335,8 @@ void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode)
+void set_channel_bwmode(struct adapter *padapter, unsigned char channel,
+			unsigned char channel_offset, unsigned short bwmode)
 {
 	u8 center_ch, chnl_offset80 = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
@@ -351,7 +352,9 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 	rtw_set_oper_bw(padapter, bwmode);
 	rtw_set_oper_choffset(padapter, channel_offset);
 
-	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80); /*  set center channel */
+	/* set center channel */
+	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode,
+			    channel_offset, chnl_offset80);
 
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
@@ -381,10 +384,14 @@ int is_client_associated_to_ap(struct adapter *padapter)
 	pmlmeext = &padapter->mlmeextpriv;
 	pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
-		return true;
-	else
-		return _FAIL;
+	{
+		bool assoc_ok = pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS;
+		bool is_station = (pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE;
+
+		if (assoc_ok && is_station)
+			return true;
+	}
+	return _FAIL;
 }
 
 int is_client_associated_to_ibss(struct adapter *padapter)
@@ -392,10 +399,14 @@ int is_client_associated_to_ibss(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
-		return true;
-	else
-		return _FAIL;
+	{
+		bool assoc_ok = pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS;
+		bool is_adhoc = (pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE;
+
+		if (assoc_ok && is_adhoc)
+			return true;
+	}
+	return _FAIL;
 }
 
 int is_IBSS_empty(struct adapter *padapter)
@@ -467,7 +478,7 @@ void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 void _clear_cam_entry(struct adapter *padapter, u8 entry)
 {
 	unsigned char null_sta[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
-	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	unsigned char null_key[16] = {0};
 
 	_write_cam(padapter, entry, 0, null_sta, null_key);
 }
@@ -571,62 +582,74 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 	mlmeinfo = &adapter->mlmeextpriv.mlmext_info;
 
-	if ((((mlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) || ((mlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
-		&& !sta) {
-		/* AP/Ad-hoc mode group key: static alloction to default key by key ID */
-		if (kid > 3) {
-			netdev_dbg(adapter->pnetdev,
-				   FUNC_ADPT_FMT " group key with invalid key id:%u\n",
-				   FUNC_ADPT_ARG(adapter), kid);
-			rtw_warn_on(1);
-			goto bitmap_handle;
-		}
-
-		cam_id = kid;
-	} else {
-		int i;
-		u8 *addr = sta ? sta->hwaddr : NULL;
+	{
+		u8 state = mlmeinfo->state & 0x03;
+		bool is_ap_or_adhoc = (state == WIFI_FW_AP_STATE) ||
+				      (state == WIFI_FW_ADHOC_STATE);
 
-		if (!sta) {
-			if (!(mlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
-				/* bypass STA mode group key setting before connected(ex:WEP) because bssid is not ready */
+		if (is_ap_or_adhoc && !sta) {
+			/* AP/Ad-hoc mode group key: static alloction to default key by key ID */
+			if (kid > 3) {
+				netdev_dbg(adapter->pnetdev,
+					   FUNC_ADPT_FMT " group key with invalid key id:%u\n",
+					   FUNC_ADPT_ARG(adapter), kid);
+				rtw_warn_on(1);
 				goto bitmap_handle;
 			}
 
-			addr = get_bssid(&adapter->mlmepriv);
-		}
+			cam_id = kid;
+		} else {
+			int i;
+			u8 *addr = sta ? sta->hwaddr : NULL;
+
+			if (!sta) {
+				if (!(mlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
+					/*
+					 * bypass STA mode group key setting before
+					 * connected(ex:WEP) because bssid is not ready
+					 */
+					goto bitmap_handle;
+				}
+
+				addr = get_bssid(&adapter->mlmepriv);
+			}
 
-		i = _rtw_camid_search(adapter, addr, kid);
-		if (i >= 0) {
-			/* Fix issue that pairwise and group key have same key id. Pairwise key first, group key can overwirte group only(ex: rekey) */
-			if (sta || _rtw_camid_is_gk(adapter, i))
-				cam_id = i;
-			else
-				netdev_dbg(adapter->pnetdev,
-					   FUNC_ADPT_FMT " group key id:%u the same key id as pairwise key\n",
-					   FUNC_ADPT_ARG(adapter), kid);
-			goto bitmap_handle;
-		}
+			i = _rtw_camid_search(adapter, addr, kid);
+			if (i >= 0) {
+				/*
+				 * Fix issue that pairwise and group key have same
+				 * key id. Pairwise key first, group key can
+				 * overwirte group only(ex: rekey)
+				 */
+				if (sta || _rtw_camid_is_gk(adapter, i))
+					cam_id = i;
+				else
+					netdev_dbg(adapter->pnetdev,
+						   FUNC_ADPT_FMT " grp key:%u same as pairwise\n",
+						   FUNC_ADPT_ARG(adapter), kid);
+				goto bitmap_handle;
+			}
 
-		for (i = 4; i < TOTAL_CAM_ENTRY; i++)
-			if (!(cam_ctl->bitmap & BIT(i)))
-				break;
+			for (i = 4; i < TOTAL_CAM_ENTRY; i++)
+				if (!(cam_ctl->bitmap & BIT(i)))
+					break;
+
+			if (i == TOTAL_CAM_ENTRY) {
+				if (sta)
+					netdev_dbg(adapter->pnetdev,
+						   FUNC_ADPT_FMT " pairwise %pM id:%u no room\n",
+						   FUNC_ADPT_ARG(adapter),
+						   sta->hwaddr, kid);
+				else
+					netdev_dbg(adapter->pnetdev,
+						   FUNC_ADPT_FMT " group key id:%u no room\n",
+						   FUNC_ADPT_ARG(adapter), kid);
+				rtw_warn_on(1);
+				goto bitmap_handle;
+			}
 
-		if (i == TOTAL_CAM_ENTRY) {
-			if (sta)
-				netdev_dbg(adapter->pnetdev,
-					   FUNC_ADPT_FMT " pairwise key with %pM id:%u no room\n",
-					   FUNC_ADPT_ARG(adapter),
-					   sta->hwaddr, kid);
-			else
-				netdev_dbg(adapter->pnetdev,
-					   FUNC_ADPT_FMT " group key id:%u no room\n",
-					   FUNC_ADPT_ARG(adapter), kid);
-			rtw_warn_on(1);
-			goto bitmap_handle;
+			cam_id = i;
 		}
-
-		cam_id = i;
 	}
 
 bitmap_handle:
@@ -1136,9 +1159,14 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (!bssid)
 		return true;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
-		pmlmepriv->timeBcnInfoChkStart = 0;
-		pmlmepriv->NumOfBcnInfoChkFail = 0;
+	if (pmlmepriv->timeBcnInfoChkStart != 0) {
+		unsigned long elapsed;
+
+		elapsed = jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart);
+		if (elapsed > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS) {
+			pmlmepriv->timeBcnInfoChkStart = 0;
+			pmlmepriv->NumOfBcnInfoChkFail = 0;
+		}
 	}
 
 	subtype = GetFrameSubType(pframe) >> 4;
@@ -1154,7 +1182,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	/* check bw and channel offset */
 	/* parsing HT_CAP_IE */
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	{
+		u8 *ies = bssid->ies + _FIXED_IE_LENGTH_;
+		uint ie_len = bssid->ie_length - _FIXED_IE_LENGTH_;
+
+		p = rtw_get_ie(ies, WLAN_EID_HT_CAPABILITY, &len, ie_len);
+	}
 	if (p && len > 0) {
 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 		ht_cap_info = le16_to_cpu(pht_cap->cap_info);
@@ -1162,7 +1195,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 		ht_cap_info = 0;
 	}
 	/* parsing HT_INFO_IE */
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	{
+		u8 *ies = bssid->ies + _FIXED_IE_LENGTH_;
+		uint ie_len = bssid->ie_length - _FIXED_IE_LENGTH_;
+
+		p = rtw_get_ie(ies, WLAN_EID_HT_OPERATION, &len, ie_len);
+	}
 	if (p && len > 0) {
 		pht_info = (struct HT_info_element *)(p + 2);
 		ht_info_infos_0 = pht_info->infos[0];
@@ -1181,7 +1219,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	}
 
 	/* Checking for channel */
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_DS_PARAMS, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	{
+		u8 *ies = bssid->ies + _FIXED_IE_LENGTH_;
+		uint ie_len = bssid->ie_length - _FIXED_IE_LENGTH_;
+
+		p = rtw_get_ie(ies, WLAN_EID_DS_PARAMS, &len, ie_len);
+	}
 	if (p) {
 		bcn_channel = *(p + 2);
 	} else {/* In 5G, some ap do not have DSSET IE checking HT info for channel */
@@ -1198,7 +1241,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	/* checking SSID */
 	ssid_len = 0;
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	{
+		u8 *ies = bssid->ies + _FIXED_IE_LENGTH_;
+		uint ie_len = bssid->ie_length - _FIXED_IE_LENGTH_;
+
+		p = rtw_get_ie(ies, WLAN_EID_SSID, &len, ie_len);
+	}
 	if (p) {
 		ssid_len = *(p + 1);
 		if (ssid_len > NDIS_802_11_LENGTH_SSID)
@@ -1269,11 +1317,16 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	pmlmepriv->NumOfBcnInfoChkFail++;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)
-		&& (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
-		pmlmepriv->timeBcnInfoChkStart = 0;
-		pmlmepriv->NumOfBcnInfoChkFail = 0;
-		return _FAIL;
+	if (pmlmepriv->timeBcnInfoChkStart != 0) {
+		unsigned long elapsed;
+
+		elapsed = jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart);
+		if (elapsed <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS &&
+		    pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD) {
+			pmlmepriv->timeBcnInfoChkStart = 0;
+			pmlmepriv->NumOfBcnInfoChkFail = 0;
+			return _FAIL;
+		}
 	}
 
 	return _SUCCESS;
@@ -1528,7 +1581,11 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
 		if (pmlmeext->cur_wireless_mode & (WIRELESS_11_24N)) {
 			pmlmeinfo->slotTime = SHORT_SLOT_TIME;
 		} else if (pmlmeext->cur_wireless_mode & (WIRELESS_11G)) {
-			if ((updateCap & cShortSlotTime) /* && (!(pMgntInfo->pHTInfo->RT2RT_HT_Mode & RT_HT_CAP_USE_LONG_PREAMBLE)) */)
+			/*
+			 * cShortSlotTime check:
+			 * (!(pMgntInfo->pHTInfo->RT2RT_HT_Mode & RT_HT_CAP_USE_LONG_PREAMBLE))
+			 */
+			if (updateCap & cShortSlotTime)
 				/*  Short Slot Time */
 				pmlmeinfo->slotTime = SHORT_SLOT_TIME;
 			else
@@ -1609,9 +1666,17 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 	memcpy(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates, pIE->data, ie_len);
 	supportRateNum = ie_len;
 
-	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_EXT_SUPP_RATES, &ie_len, var_ie_len);
-	if (pIE && (ie_len <= sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) - supportRateNum))
-		memcpy((pmlmeinfo->FW_sta_info[cam_idx].SupportedRates + supportRateNum), pIE->data, ie_len);
+	{
+		u8 *rates = pmlmeinfo->FW_sta_info[cam_idx].SupportedRates;
+		size_t max_ext = sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) -
+				 supportRateNum;
+
+		pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie,
+							     WLAN_EID_EXT_SUPP_RATES,
+							     &ie_len, var_ie_len);
+		if (pIE && ie_len <= max_ext)
+			memcpy(rates + supportRateNum, pIE->data, ie_len);
+	}
 
 	return _SUCCESS;
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857fd62..14d761c2fb3e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -431,7 +431,9 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		pattrib->vcs_mode = padapter->driver_vcs_type;
 }
 
-static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static void update_attrib_phy_info(struct adapter *padapter,
+				   struct pkt_attrib *pattrib,
+				   struct sta_info *psta)
 {
 	struct mlme_ext_priv *mlmeext = &padapter->mlmeextpriv;
 
@@ -467,7 +469,9 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->retry_ctrl = false;
 }
 
-static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static s32 update_attrib_sec_info(struct adapter *padapter,
+				  struct pkt_attrib *pattrib,
+				  struct sta_info *psta)
 {
 	signed int res = _SUCCESS;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -506,8 +510,14 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		}
 
 		/* For WPS 1.0 WEP, driver should not encrypt EAPOL Packet for WPS handshake. */
-		if (((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) && (pattrib->ether_type == 0x888e))
-			pattrib->encrypt = _NO_PRIVACY_;
+		{
+			bool is_wep = pattrib->encrypt == _WEP40_ ||
+				      pattrib->encrypt == _WEP104_;
+			bool is_eapol = pattrib->ether_type == 0x888e;
+
+			if (is_wep && is_eapol)
+				pattrib->encrypt = _NO_PRIVACY_;
+		}
 	}
 
 	switch (pattrib->encrypt) {
@@ -771,15 +781,18 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	if (pattrib->encrypt == _TKIP_) {
 		/* encode mic code */
 		{
-			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
+			static const u8 null_key[16] = {0};
 
 			pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
 			if (bmcst) {
-				if (!memcmp(psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey, null_key, 16))
+				u8 grpkeyid = psecuritypriv->dot118021XGrpKeyid;
+				u8 *grp_mic = psecuritypriv->dot118021XGrptxmickey[grpkeyid].skey;
+
+				if (!memcmp(grp_mic, null_key, 16))
 					return _FAIL;
 				/* start to calculate the mic code */
-				rtw_secmicsetkey(&micdata, psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey);
+				rtw_secmicsetkey(&micdata, grp_mic);
 			} else {
 				if (!memcmp(&pattrib->dot11tkiptxmickey.skey[0], null_key, 16))
 					return _FAIL;
@@ -809,15 +822,21 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 			payload = pframe;
 
 			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
+				u32 icv = pattrib->bswenc ? pattrib->icv_len : 0;
+
 				payload = (u8 *)round_up((SIZE_PTR)(payload), 4);
 				payload = payload+pattrib->hdrlen+pattrib->iv_len;
 
 				if ((curfragnum+1) == pattrib->nr_frags) {
-					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-((pattrib->bswenc) ? pattrib->icv_len : 0);
+					length = pattrib->last_txcmdsz -
+						 pattrib->hdrlen -
+						 pattrib->iv_len - icv;
 					rtw_secmicappend(&micdata, payload, length);
 					payload = payload+length;
 				} else {
-					length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-((pattrib->bswenc) ? pattrib->icv_len : 0);
+					length = pxmitpriv->frag_len -
+						 pattrib->hdrlen -
+						 pattrib->iv_len - icv;
 					rtw_secmicappend(&micdata, payload, length);
 					payload = payload+length+pattrib->icv_len;
 				}
@@ -1020,7 +1039,8 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
  * 5. move frag chunk from pframe to pxmitframe->mem
  * 6. apply sw-encrypt, if necessary.
  */
-s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+			   struct xmit_frame *pxmitframe)
 {
 	struct pkt_file pktfile;
 
@@ -1106,10 +1126,12 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 		frg_inx++;
 
 		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
-			pattrib->nr_frags = frg_inx;
+			u32 llc = (pattrib->nr_frags == 1) ? llc_sz : 0;
+			u32 icv = pattrib->bswenc ? pattrib->icv_len : 0;
 
-			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz:0) +
-					((pattrib->bswenc) ? pattrib->icv_len : 0) + mem_sz;
+			pattrib->nr_frags = frg_inx;
+			pattrib->last_txcmdsz = pattrib->hdrlen +
+					       pattrib->iv_len + llc + icv + mem_sz;
 
 			ClearMFrag(mem_start);
 
@@ -1139,7 +1161,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
-s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+				struct xmit_frame *pxmitframe)
 {
 	u8 *pframe, *mem_start = NULL, *tmp_buf = NULL;
 	u8 subtype;
@@ -1754,7 +1777,9 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac)
+struct tx_servq *rtw_get_sta_pending(struct adapter *padapter,
+					 struct sta_info *psta,
+					 signed int up, u8 *ac)
 {
 	struct tx_servq *ptxservq = NULL;
 
@@ -2008,7 +2033,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	return allow;
 }
 
-signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_frame *pxmitframe)
+signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter,
+					      struct xmit_frame *pxmitframe)
 {
 	signed int ret = false;
 	struct sta_info *psta = NULL;
@@ -2123,7 +2149,9 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	return ret;
 }
 
-static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta, struct __queue *pframequeue)
+static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter,
+						 struct sta_info *psta,
+						 struct __queue *pframequeue)
 {
 	signed int ret;
 	struct list_head *plist, *phead, *tmp;
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index b3d7f50fac4c..f56e799da702 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -810,7 +810,8 @@ static void halbtc8723b1ant_SetAntPath(
 	u8 H2C_Parameter[2] = {0}, u1Tmp = 0;
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer); /*  [31:16]=fw ver, [15:0]=fw sub ver */
+	/* [31:16]=fw ver, [15:0]=fw sub ver */
+	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);
 
 	if ((fwVer > 0 && fwVer < 0xc0000) || bPgExtSwitch)
 		bUseExtSwitch = true;
@@ -829,7 +830,8 @@ static void halbtc8723b1ant_SetAntPath(
 		/* set wlan_act control by PTA */
 		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
 
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
+		/* BT select s0/s1 is controlled by WiFi */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1);
 
 		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x39, 0x8, 0x1);
 		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x974, 0xff);
@@ -847,10 +849,13 @@ static void halbtc8723b1ant_SetAntPath(
 		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
 
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_IS_IN_MP_MODE, &bIsInMpMode);
-		if (!bIsInMpMode)
-			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0); /* BT select s0/s1 is controlled by BT */
-		else
-			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
+		if (!bIsInMpMode) {
+			/* BT select s0/s1 is controlled by BT */
+			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0);
+		} else {
+			/* BT select s0/s1 is controlled by WiFi */
+			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1);
+		}
 
 		/*  0x4c[24:23]= 00, Set Antenna control by BT_RFE_CTRL	BT Vendor 0xac = 0xf002 */
 		u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x4c);
@@ -1059,8 +1064,10 @@ static void halbtc8723b1ant_PsTdma(
 
 
 	if (bTurnOn) {
-		if (pBtLinkInfo->bSlaveRole)
-			psTdmaByte4Val = psTdmaByte4Val | 0x1;  /* 0x778 = 0x1 at wifi slot (no blocking BT Low-Pri pkts) */
+		if (pBtLinkInfo->bSlaveRole) {
+			/* 0x778 = 0x1 at wifi slot (no blocking BT Low-Pri pkts) */
+			psTdmaByte4Val = psTdmaByte4Val | 0x1;
+		}
 
 
 		switch (type) {
@@ -1868,7 +1875,8 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *pBtCoexist)
 					pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0
 				);
 			else { /* busy */
-				if  (pCoexSta->nScanAPNum >= BT_8723B_1ANT_WIFI_NOISY_THRESH)  /* no force LPS, no PS-TDMA, use pure TDMA */
+				/* no force LPS, no PS-TDMA, use pure TDMA */
+				if (pCoexSta->nScanAPNum >= BT_8723B_1ANT_WIFI_NOISY_THRESH)
 					halbtc8723b1ant_PowerSaveState(
 						pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0
 					);
@@ -2246,7 +2254,8 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 	if (type == BTC_SCAN_START) {
 		pCoexSta->bWiFiIsHighPriTask = true;
 
-		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8);  /* Force antenna setup for no scan result issue */
+		/* Force antenna setup for no scan result issue */
+		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8);
 		pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
 		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
 		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
@@ -2432,7 +2441,8 @@ void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 ty
 		if (type == BTC_PACKET_ARP) {
 			pCoexDm->nArpCnt++;
 
-			if (pCoexDm->nArpCnt >= 10) /*  if APR PKT > 10 after connect, do not go to ActionWifiConnectedSpecialPacket(pBtCoexist) */
+			/* if ARP PKT > 10 after connect, skip special packet action */
+			if (pCoexDm->nArpCnt >= 10)
 				pCoexSta->bWiFiIsHighPriTask = false;
 			else
 				pCoexSta->bWiFiIsHighPriTask = true;
@@ -2578,7 +2588,8 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 
 	halbtc8723b1ant_UpdateBtLinkInfo(pBtCoexist);
 
-	btInfo = btInfo & 0x1f;  /* mask profile bit for connect-ilde identification (for CSR case: A2DP idle --> 0x41) */
+	/* mask profile bit for connect-idle identification (CSR case: A2DP idle = 0x41) */
+	btInfo = btInfo & 0x1f;
 
 	if (!(btInfo & BT_INFO_8723B_1ANT_B_CONNECTION)) {
 		pCoexDm->btStatus = BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE;
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index d32dbf94858f..42fc4de0cc64 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -830,7 +830,8 @@ static void halbtc8723b2ant_SetAntPath(
 	u8 	H2C_Parameter[2] = {0};
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);	/*  [31:16]=fw ver, [15:0]=fw sub ver */
+	/* [31:16]=fw ver, [15:0]=fw sub ver */
+	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);
 
 	if ((fwVer > 0 && fwVer < 0xc0000) || bPgExtSwitch)
 		bUseExtSwitch = true;
@@ -901,13 +902,16 @@ static void halbtc8723b2ant_SetAntPath(
 			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
 		}
 
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x64, 0x1, 0x0); /* fixed external switch S1->Main, S0->Aux */
+		/* fixed external switch S1->Main, S0->Aux */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x64, 0x1, 0x0);
 		switch (antPosType) {
 		case BTC_ANT_WIFI_AT_MAIN:
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0); /*  fixed internal switch S1->WiFi, S0->BT */
+			/* fixed internal switch S1->WiFi, S0->BT */
+			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0);
 			break;
 		case BTC_ANT_WIFI_AT_AUX:
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x280); /*  fixed internal switch S0->WiFi, S1->BT */
+			/* fixed internal switch S0->WiFi, S1->BT */
+			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x280);
 			break;
 		}
 	}
@@ -2279,7 +2283,8 @@ static void halbtc8723b2ant_WifiOffHwCfg(struct btc_coexist *pBtCoexist)
 	/*  set wlan_act to low */
 	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
 
-	pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x780); /* WiFi goto standby while GNT_BT 0-->1 */
+	/* WiFi goto standby while GNT_BT 0-->1 */
+	pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x780);
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);
 	if (fwVer >= 0x180000) {
 		/* Use H2C to set GNT_BT to HIGH */
@@ -2289,10 +2294,13 @@ static void halbtc8723b2ant_WifiOffHwCfg(struct btc_coexist *pBtCoexist)
 		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x18);
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_IS_IN_MP_MODE, &bIsInMpMode);
-	if (!bIsInMpMode)
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0); /* BT select s0/s1 is controlled by BT */
-	else
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
+	if (!bIsInMpMode) {
+		/* BT select s0/s1 is controlled by BT */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0);
+	} else {
+		/* BT select s0/s1 is controlled by WiFi */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1);
+	}
 }
 
 static void halbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bBackUp)
@@ -2595,7 +2603,8 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 void EXhalbtc8723b2ant_HaltNotify(struct btc_coexist *pBtCoexist)
 {
 	halbtc8723b2ant_WifiOffHwCfg(pBtCoexist);
-	pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x15); /* BT goto standby while GNT_BT 1-->0 */
+	/* BT goto standby while GNT_BT 1-->0 */
+	pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x15);
 	halbtc8723b2ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, true);
 
 	EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_DISCONNECT);
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 7bef05a9a063..2b4b5468f87b 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -65,7 +65,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	u8 ThermalValue_AVG_count = 0;
 	u32 ThermalValue_AVG = 0;
 
-	u8 OFDM_min_index = 0;  /*  OFDM BB Swing should be less than +3.0dB, which is required by Arthur */
+	/* OFDM BB Swing should be less than +3.0dB, which is required by Arthur */
+	u8 OFDM_min_index = 0;
 	u8 Indexforchannel = 0; /*  GetRightChnlPlaceforIQK(pHalData->CurrentChannel) */
 
 	struct txpwrtrack_cfg c;
@@ -93,7 +94,9 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	pDM_Odm->RFCalibrateInfo.TXPowerTrackingCallbackCnt++;
 	pDM_Odm->RFCalibrateInfo.bTXPowerTrackingInit = true;
 
-	ThermalValue = (u8)PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, c.ThermalRegAddr, 0xfc00);	/* 0x42: RF Reg[15:10] 88E */
+	/* 0x42: RF Reg[15:10] 88E */
+	ThermalValue = (u8)PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A,
+					   c.ThermalRegAddr, 0xfc00);
 	if (
 		!pDM_Odm->RFCalibrateInfo.TxPowerTrackControl ||
 		pHalData->EEPROMThermalMeter == 0 ||
@@ -104,11 +107,15 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	/* 4 3. Initialize ThermalValues of RFCalibrateInfo */
 
 	/* 4 4. Calculate average thermal meter */
-
-	pDM_Odm->RFCalibrateInfo.ThermalValue_AVG[pDM_Odm->RFCalibrateInfo.ThermalValue_AVG_index] = ThermalValue;
-	pDM_Odm->RFCalibrateInfo.ThermalValue_AVG_index++;
-	if (pDM_Odm->RFCalibrateInfo.ThermalValue_AVG_index == c.AverageThermalNum)   /* Average times =  c.AverageThermalNum */
-		pDM_Odm->RFCalibrateInfo.ThermalValue_AVG_index = 0;
+	{
+		struct odm_rf_cal_t *cal = &pDM_Odm->RFCalibrateInfo;
+
+		cal->ThermalValue_AVG[cal->ThermalValue_AVG_index] = ThermalValue;
+		cal->ThermalValue_AVG_index++;
+		/* Average times = c.AverageThermalNum */
+		if (cal->ThermalValue_AVG_index == c.AverageThermalNum)
+			cal->ThermalValue_AVG_index = 0;
+	}
 
 	for (i = 0; i < c.AverageThermalNum; i++) {
 		if (pDM_Odm->RFCalibrateInfo.ThermalValue_AVG[i]) {
@@ -200,10 +207,16 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 			if (
 				pDM_Odm->RFCalibrateInfo.DeltaPowerIndex[p] ==
 				pDM_Odm->RFCalibrateInfo.DeltaPowerIndexLast[p]
-			) /*  If Thermal value changes but lookup table value still the same */
+			) {
+				/* If Thermal value changes but lookup table value still the same */
 				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
-			else
-				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = pDM_Odm->RFCalibrateInfo.DeltaPowerIndex[p] - pDM_Odm->RFCalibrateInfo.DeltaPowerIndexLast[p];      /*  Power Index Diff between 2 times Power Tracking */
+			} else {
+				/* Power Index Diff between 2 times Power Tracking */
+				s8 delta_idx = pDM_Odm->RFCalibrateInfo.DeltaPowerIndex[p];
+				s8 last_idx = pDM_Odm->RFCalibrateInfo.DeltaPowerIndexLast[p];
+
+				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = delta_idx - last_idx;
+			}
 
 			pDM_Odm->RFCalibrateInfo.OFDM_index[p] =
 				pDM_Odm->BbSwingIdxOfdmBase[p] +
@@ -245,7 +258,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	 ) {
 		/* 4 7.2 Configure the Swing Table to adjust Tx Power. */
 
-		pDM_Odm->RFCalibrateInfo.bTxPowerChanged = true; /*  Always true after Tx Power is adjusted by power tracking. */
+		/* Always true after Tx Power is adjusted by power tracking. */
+		pDM_Odm->RFCalibrateInfo.bTxPowerChanged = true;
 		/*  */
 		/*  2012/04/23 MH According to Luke's suggestion, we can not write BB digital */
 		/*  to increase TX power. Otherwise, EVM will be bad. */
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 34692cca33f5..567a23627db9 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -101,13 +101,15 @@ static void setIqkMatrix_8723B(
 	} else {
 		switch (RFPath) {
 		case RF_PATH_A:
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
+			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance,
+				     bMaskDWord, OFDMSwingTable_New[OFDM_index]);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskH4Bits, 0x00);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT24, 0x00);
 			break;
 
 		case RF_PATH_B:
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
+			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance,
+				     bMaskDWord, OFDMSwingTable_New[OFDM_index]);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskH4Bits, 0x00);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT28, 0x00);
 			break;
@@ -957,20 +959,25 @@ static void _PHY_PathAFillIQKMatrix8723B(
 		TX0_C = (Y * Oldval_0) >> 8;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, 0xF0000000, ((TX0_C&0x3C0)>>6));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, 0x003F0000, (TX0_C&0x3F));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(29), ((Y*Oldval_0>>7) & 0x1));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
 
 		if (bTxOnly) {
 			/*  <20130226, Kordan> Saving RxIQC, otherwise not initialized. */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] =
+				0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter,
+							   rOFDM0_RxIQExtAnta, bMaskDWord);
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
 /* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = 0x40000100;
@@ -984,12 +991,14 @@ static void _PHY_PathAFillIQKMatrix8723B(
 		reg = result[final_candidate][3] & 0x3F;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, 0xFC00, reg);
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][3] >> 6) & 0xF;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, 0xF0000000, reg);
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 
 	}
 }
@@ -1035,22 +1044,27 @@ static void _PHY_PathBFillIQKMatrix8723B(
 /* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
 /* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, 0x003F0000, (TX1_C&0x3F));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(25), ((Y*Oldval_1>>7) & 0x1));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
 
 		if (bTxOnly) {
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
 /* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = 0x40000100;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = 0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] =
+				0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter,
+							    rOFDM0_RxIQExtAnta, bMaskDWord);
 			return;
 		}
 
@@ -1060,12 +1074,15 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		reg = result[final_candidate][7] & 0x3F;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, 0xFC00, reg);
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][7] >> 6) & 0xF;
 /* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28) |
+			(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord) &
+			 0x0fffffff);
 	}
 }
 
@@ -1086,21 +1103,29 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
 		(pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] != 0x0)
 	) {
 		if (RFpath) { /* S1: RFpath = 0, S0:RFpath = 1 */
+			u32 (*tx)[2] = pRFCalibrateInfo->TxIQC_8723B[PATH_S0];
+			u32 (*rx)[2] = pRFCalibrateInfo->RxIQC_8723B[PATH_S0];
+			struct adapter *a = pDM_Odm->Adapter;
+
 			/* S0 TX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC94][KEY], bMaskDWord, tx[IDX_0xC94][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC80][KEY], bMaskDWord, tx[IDX_0xC80][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC4C][KEY], bMaskDWord, tx[IDX_0xC4C][VAL]);
 			/* S0 RX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL]);
+			PHY_SetBBReg(a, rx[IDX_0xC14][KEY], bMaskDWord, rx[IDX_0xC14][VAL]);
+			PHY_SetBBReg(a, rx[IDX_0xCA0][KEY], bMaskDWord, rx[IDX_0xCA0][VAL]);
 		} else {
+			u32 (*tx)[2] = pRFCalibrateInfo->TxIQC_8723B[PATH_S1];
+			u32 (*rx)[2] = pRFCalibrateInfo->RxIQC_8723B[PATH_S1];
+			struct adapter *a = pDM_Odm->Adapter;
+
 			/* S1 TX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC94][KEY], bMaskDWord, tx[IDX_0xC94][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC80][KEY], bMaskDWord, tx[IDX_0xC80][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC4C][KEY], bMaskDWord, tx[IDX_0xC4C][VAL]);
 			/* S1 RX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL]);
+			PHY_SetBBReg(a, rx[IDX_0xC14][KEY], bMaskDWord, rx[IDX_0xC14][VAL]);
+			PHY_SetBBReg(a, rx[IDX_0xCA0][KEY], bMaskDWord, rx[IDX_0xCA0][VAL]);
 		}
 	}
 }
@@ -1360,11 +1385,15 @@ static void phy_IQCalibrate_8723B(
 	/* u32 bbvalue; */
 
 	if (t == 0) {
+		struct odm_rf_cal_t *cal = &pDM_Odm->RFCalibrateInfo;
 
 		/*  Save ADDA parameters, turn Path A ADDA on */
-		_PHY_SaveADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
-		_PHY_SaveMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
-		_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
+		_PHY_SaveADDARegisters8723B(padapter, ADDA_REG,
+					    cal->ADDA_backup, IQK_ADDA_REG_NUM);
+		_PHY_SaveMACRegisters8723B(padapter, IQK_MAC_REG,
+					   cal->IQK_MAC_backup);
+		_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C,
+					    cal->IQK_BB_backup, IQK_BB_REG_NUM);
 	}
 
 	_PHY_PathADDAOn8723B(padapter, ADDA_REG, is2T);
@@ -1407,12 +1436,20 @@ static void phy_IQCalibrate_8723B(
 		PathAOK = phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
 /* 		if (PathAOK == 0x03) { */
 		if (PathAOK == 0x01) {
+			u32 val;
+
 			/*  Path A Tx IQK Success */
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
-
-				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] =
+				PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8,
+					       bRFRegOffsetMask);
+
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rTx_Power_Before_IQK_A, bMaskDWord);
+			result[t][0] = (val & 0x3FF0000) >> 16;
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rTx_Power_After_IQK_A, bMaskDWord);
+			result[t][1] = (val & 0x3FF0000) >> 16;
 			break;
 		}
 	}
@@ -1421,10 +1458,15 @@ static void phy_IQCalibrate_8723B(
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
 		if (PathAOK == 0x03) {
+			u32 val;
 /* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 /* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rRx_Power_Before_IQK_A_2, bMaskDWord);
+			result[t][2] = (val & 0x3FF0000) >> 16;
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rRx_Power_After_IQK_A_2, bMaskDWord);
+			result[t][3] = (val & 0x3FF0000) >> 16;
 			break;
 		}
 	}
@@ -1439,12 +1481,20 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_IQK_8723B(padapter);
 			if (PathBOK == 0x01) {
+				u32 val;
+
 				/*  Path B Tx IQK Success */
 				PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-				pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_B, 0x8, bRFRegOffsetMask);
-
-				result[t][4] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][5] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+				pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B] =
+					PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_B,
+						       0x8, bRFRegOffsetMask);
+
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rTx_Power_Before_IQK_A, bMaskDWord);
+				result[t][4] = (val & 0x3FF0000) >> 16;
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rTx_Power_After_IQK_A, bMaskDWord);
+				result[t][5] = (val & 0x3FF0000) >> 16;
 				break;
 			}
 		}
@@ -1453,10 +1503,15 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_RxIQK8723B(padapter, is2T);
 			if (PathBOK == 0x03) {
+				u32 val;
 /* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 /* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rRx_Power_Before_IQK_A_2, bMaskDWord);
+				result[t][6] = (val & 0x3FF0000) >> 16;
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rRx_Power_After_IQK_A_2, bMaskDWord);
+				result[t][7] = (val & 0x3FF0000) >> 16;
 				break;
 			}
 		}
@@ -1468,13 +1523,18 @@ static void phy_IQCalibrate_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0);
 
 	if (t != 0) {
+		struct odm_rf_cal_t *cal = &pDM_Odm->RFCalibrateInfo;
+
 		/*  Reload ADDA power saving parameters */
-		_PHY_ReloadADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
+		_PHY_ReloadADDARegisters8723B(padapter, ADDA_REG,
+					      cal->ADDA_backup, IQK_ADDA_REG_NUM);
 
 		/*  Reload MAC parameters */
-		_PHY_ReloadMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
+		_PHY_ReloadMACRegisters8723B(padapter, IQK_MAC_REG,
+					     cal->IQK_MAC_backup);
 
-		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
+		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C,
+					      cal->IQK_BB_backup, IQK_BB_REG_NUM);
 
 		/* Reload RF path */
 /* 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
@@ -1613,8 +1673,10 @@ void PHY_IQCalibrate_8723B(
 		u32 offset, data;
 		u8 path, bResult = SUCCESS;
 		struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
+		struct adapter *a = pDM_Odm->Adapter;
 
-		path = (PHY_QueryBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskByte0) == 0x00) ? RF_PATH_A : RF_PATH_B;
+		path = (PHY_QueryBBReg(a, rS0S1_PathSwitch, bMaskByte0) == 0x00) ?
+			RF_PATH_A : RF_PATH_B;
 
 		/*  Restore TX IQK */
 		for (i = 0; i < 3; ++i) {
@@ -1624,7 +1686,7 @@ void PHY_IQCalibrate_8723B(
 				bResult = FAIL;
 				break;
 			}
-			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
+			PHY_SetBBReg(a, offset, bMaskDWord, data);
 		}
 
 		/*  Restore RX IQK */
@@ -1635,14 +1697,16 @@ void PHY_IQCalibrate_8723B(
 				bResult = FAIL;
 				break;
 			}
-			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
+			PHY_SetBBReg(a, offset, bMaskDWord, data);
 		}
 
 		if (pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] == 0) {
 			bResult = FAIL;
 		} else {
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXM_IDAC, bRFRegOffsetMask, pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A]);
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, RF_TXM_IDAC, bRFRegOffsetMask, pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B]);
+			PHY_SetRFReg(a, RF_PATH_A, RF_TXM_IDAC, bRFRegOffsetMask,
+				     pRFCalibrateInfo->TxLOK[RF_PATH_A]);
+			PHY_SetRFReg(a, RF_PATH_B, RF_TXM_IDAC, bRFRegOffsetMask,
+				     pRFCalibrateInfo->TxLOK[RF_PATH_B]);
 		}
 
 		if (bResult == SUCCESS)
@@ -1650,7 +1714,9 @@ void PHY_IQCalibrate_8723B(
 	}
 
 	if (bReCovery) {
-		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
+		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C,
+					      pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover,
+					      9);
 		return;
 	}
 
@@ -1752,7 +1818,9 @@ void PHY_IQCalibrate_8723B(
 			pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[0][i] = result[final_candidate][i];
 	}
 
-	_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
+	_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C,
+				    pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover,
+				    9);
 
 	/* restore GNT_BT */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 70b5b289f9cb..1b0e38a1e993 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -792,10 +792,14 @@ void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 	/* todo: other chips */
 
 	if (save_cnt) {
+		u16 last, curr;
+
 		/* rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xa0); */
-		pdbgpriv->dbg_rx_fifo_last_overflow = pdbgpriv->dbg_rx_fifo_curr_overflow;
-		pdbgpriv->dbg_rx_fifo_curr_overflow = rtw_read16(adapter, REG_RXERR_RPT);
-		pdbgpriv->dbg_rx_fifo_diff_overflow = pdbgpriv->dbg_rx_fifo_curr_overflow-pdbgpriv->dbg_rx_fifo_last_overflow;
+		last = pdbgpriv->dbg_rx_fifo_curr_overflow;
+		curr = rtw_read16(adapter, REG_RXERR_RPT);
+		pdbgpriv->dbg_rx_fifo_last_overflow = last;
+		pdbgpriv->dbg_rx_fifo_curr_overflow = curr;
+		pdbgpriv->dbg_rx_fifo_diff_overflow = curr - last;
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index cd76e26e868f..9c5c649e493b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -318,7 +318,8 @@ static void PHY_StoreTxPowerByRateNew(struct adapter *padapter,	u32 RfPath,
 	u8 i = 0, rateIndex[4] = {0}, rateNum = 0;
 	s8	PwrByRateVal[4] = {0};
 
-	PHY_GetRateValuesOfTxPowerByRate(padapter, RegAddr, BitMask, Data, rateIndex, PwrByRateVal, &rateNum);
+	PHY_GetRateValuesOfTxPowerByRate(padapter, RegAddr, BitMask, Data,
+					 rateIndex, PwrByRateVal, &rateNum);
 
 	if (RfPath >= RF_PATH_MAX)
 		return;
@@ -436,7 +437,10 @@ void PHY_SetTxPowerIndexByRateSection(
 					       ARRAY_SIZE(ofdmRates));
 
 	} else if (RateSection == HT_MCS0_MCS7) {
-		u8 htRates1T[]  = {MGN_MCS0, MGN_MCS1, MGN_MCS2, MGN_MCS3, MGN_MCS4, MGN_MCS5, MGN_MCS6, MGN_MCS7};
+		u8 htRates1T[]  = {
+			MGN_MCS0, MGN_MCS1, MGN_MCS2, MGN_MCS3,
+			MGN_MCS4, MGN_MCS5, MGN_MCS6, MGN_MCS7
+		};
 		PHY_SetTxPowerIndexByRateArray(padapter, RFPath,
 					       pHalData->CurrentChannelBW,
 					       Channel, htRates1T,
@@ -844,11 +848,15 @@ void PHY_SetTxPowerLimit(
 
 	if (channelIndex == -1)
 		return;
-
-	prevPowerLimit = pHalData->TxPwrLimit_2_4G[regulation][bandwidth][rateSection][channelIndex][RF_PATH_A];
-
-	if (powerLimit < prevPowerLimit)
-		pHalData->TxPwrLimit_2_4G[regulation][bandwidth][rateSection][channelIndex][RF_PATH_A] = powerLimit;
+	{
+		s8 *pLimit = &pHalData->TxPwrLimit_2_4G[regulation][bandwidth]
+						       [rateSection][channelIndex]
+						       [RF_PATH_A];
+		prevPowerLimit = *pLimit;
+
+		if (powerLimit < prevPowerLimit)
+			*pLimit = powerLimit;
+	}
 }
 
 void Hal_ChannelPlanToRegulation(struct adapter *Adapter, u16 ChannelPlan)
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 462553d296ff..adccc5566e10 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -120,7 +120,9 @@ u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable
 	return GetHalDefVar8723BSDIO(padapter, eVariable, pValue);
 }
 
-void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
+void rtw_hal_set_odm_var(struct adapter *padapter,
+			 enum hal_odm_variable eVariable,
+			 void *pValue1, bool bSet)
 {
 	SetHalODMVar(padapter, eVariable, pValue1, bSet);
 }
diff --git a/drivers/staging/rtl8723bs/hal/hal_sdio.c b/drivers/staging/rtl8723bs/hal/hal_sdio.c
index 665c85eccbdf..fb4196af681f 100644
--- a/drivers/staging/rtl8723bs/hal/hal_sdio.c
+++ b/drivers/staging/rtl8723bs/hal/hal_sdio.c
@@ -23,8 +23,10 @@ u8 rtw_hal_sdio_query_tx_freepage(
 )
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
+	u8 page_free = pHalData->SdioTxFIFOFreePage[PageIdx];
+	u8 pub_free = pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX];
 
-	if ((pHalData->SdioTxFIFOFreePage[PageIdx]+pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]) >= (RequiredPageNum))
+	if ((page_free + pub_free) >= RequiredPageNum)
 		return true;
 	else
 		return false;
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index a22354f728c1..978fb7a2630c 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -131,8 +131,13 @@ u8 CCKSwingTable_Ch14_New[CCK_TABLE_SIZE][8] = {
 
 static void odm_CommonInfoSelfInit(struct dm_odm_t *pDM_Odm)
 {
-	pDM_Odm->bCckHighPower = (bool) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(CCK_RPT_FORMAT, pDM_Odm), ODM_BIT(CCK_RPT_FORMAT, pDM_Odm));
-	pDM_Odm->RFPathRxEnable = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(BB_RX_PATH, pDM_Odm), ODM_BIT(BB_RX_PATH, pDM_Odm));
+	u32 cck_reg = ODM_REG(CCK_RPT_FORMAT, pDM_Odm);
+	u32 cck_bit = ODM_BIT(CCK_RPT_FORMAT, pDM_Odm);
+	u32 rx_reg = ODM_REG(BB_RX_PATH, pDM_Odm);
+	u32 rx_bit = ODM_BIT(BB_RX_PATH, pDM_Odm);
+
+	pDM_Odm->bCckHighPower = (bool)PHY_QueryBBReg(pDM_Odm->Adapter, cck_reg, cck_bit);
+	pDM_Odm->RFPathRxEnable = (u8)PHY_QueryBBReg(pDM_Odm->Adapter, rx_reg, rx_bit);
 
 	pDM_Odm->TxRate = 0xFF;
 }
@@ -267,12 +272,15 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 		struct sta_info *pstat = pDM_Odm->pODM_StaInfo[i];
 
 		if (IS_STA_VALID(pstat)) {
-			if (is_multicast_ether_addr(pstat->hwaddr))  /* if (psta->mac_id == 1) */
+			u32 rssi = pstat->rssi_stat.UndecoratedSmoothedPWDB;
+			bool changed;
+
+			if (is_multicast_ether_addr(pstat->hwaddr))
 				continue;
 
-			if (true == ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
+			changed = ODM_RAStateCheck(pDM_Odm, rssi, false, &pstat->rssi_level);
+			if (changed)
 				rtw_hal_update_ra_mask(pstat, pstat->rssi_level);
-			}
 
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index f10427abd849..58bb45feea22 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -10,17 +10,23 @@
 void odm_NHMCounterStatisticsInit(void *pDM_VOID)
 {
 	struct dm_odm_t	*pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct adapter *adapter = pDM_Odm->Adapter;
 
 	/* PHY parameters initialize for n series */
-	rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TIMER_11N+2, 0x2710);	/* 0x894[31:16]= 0x2710	Time duration for NHM unit: 4us, 0x2710 =40ms */
-	/* rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TIMER_11N+2, 0x4e20);	0x894[31:16]= 0x4e20	Time duration for NHM unit: 4us, 0x4e20 =80ms */
-	rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N+2, 0xffff);	/* 0x890[31:16]= 0xffff	th_9, th_10 */
-	/* rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH3_TO_TH0_11N, 0xffffff5c);	0x898 = 0xffffff5c		th_3, th_2, th_1, th_0 */
-	rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH3_TO_TH0_11N, 0xffffff52);	/* 0x898 = 0xffffff52		th_3, th_2, th_1, th_0 */
-	rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH7_TO_TH4_11N, 0xffffffff);	/* 0x89c = 0xffffffff		th_7, th_6, th_5, th_4 */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_FPGA0_IQK_11N, bMaskByte0, 0xff);		/* 0xe28[7:0]= 0xff		th_8 */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT10|BIT9|BIT8, 0x7);	/* 0x890[9:8]=3			enable CCX */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_OFDM_FA_RSTC_11N, BIT7, 0x1);		/* 0xc0c[7]= 1			max power among all RX ants */
+	/* 0x894[31:16]=0x2710, Time duration for NHM unit: 4us, 0x2710=40ms */
+	rtw_write16(adapter, ODM_REG_NHM_TIMER_11N + 2, 0x2710);
+	/* 0x890[31:16]=0xffff, th_9, th_10 */
+	rtw_write16(adapter, ODM_REG_NHM_TH9_TH10_11N + 2, 0xffff);
+	/* 0x898=0xffffff52, th_3, th_2, th_1, th_0 */
+	rtw_write32(adapter, ODM_REG_NHM_TH3_TO_TH0_11N, 0xffffff52);
+	/* 0x89c=0xffffffff, th_7, th_6, th_5, th_4 */
+	rtw_write32(adapter, ODM_REG_NHM_TH7_TO_TH4_11N, 0xffffffff);
+	/* 0xe28[7:0]=0xff, th_8 */
+	PHY_SetBBReg(adapter, ODM_REG_FPGA0_IQK_11N, bMaskByte0, 0xff);
+	/* 0x890[9:8]=3, enable CCX */
+	PHY_SetBBReg(adapter, ODM_REG_NHM_TH9_TH10_11N, BIT10 | BIT9 | BIT8, 0x7);
+	/* 0xc0c[7]=1, max power among all RX ants */
+	PHY_SetBBReg(adapter, ODM_REG_OFDM_FA_RSTC_11N, BIT7, 0x1);
 }
 
 void odm_NHMCounterStatistics(void *pDM_VOID)
@@ -80,8 +86,8 @@ void odm_NHMBB(void *pDM_VOID)
 	pDM_Odm->NHMLastRxOkcnt =
 		*(pDM_Odm->pNumRxBytesUnicast);
 
-
-	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt<<2) + 1) { /* Tx > 4*Rx possible for adaptivity test */
+	/* Tx > 4*Rx possible for adaptivity test */
+	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt << 2) + 1) {
 		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag == true) {
 			/* Enable EDCCA since it is possible running Adaptivity testing */
 			/* test_status = 1; */
@@ -343,7 +349,9 @@ void odm_DIGInit(void *pDM_VOID)
 
 	pDM_DigTable->bStopDIG = false;
 	pDM_DigTable->bPSDInProgress = false;
-	pDM_DigTable->CurIGValue = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm));
+	pDM_DigTable->CurIGValue = (u8)PHY_QueryBBReg(pDM_Odm->Adapter,
+						       ODM_REG(IGI_A, pDM_Odm),
+						       ODM_BIT(IGI, pDM_Odm));
 	pDM_DigTable->RssiLowThresh	= DM_DIG_THRESH_LOW;
 	pDM_DigTable->RssiHighThresh	= DM_DIG_THRESH_HIGH;
 	pDM_DigTable->FALowThresh	= DMfalseALARM_THRESH_LOW;
@@ -565,10 +573,12 @@ void odm_DIG(void *pDM_VOID)
 			else if (pDM_Odm->bBtConnectProcess)
 				ODM_Write_DIG(pDM_Odm, 0x28);
 			else
-				ODM_Write_DIG(pDM_Odm, pDM_DigTable->BT30_CurIGI);/* ODM_Write_DIG(pDM_Odm, pDM_DigTable->CurIGValue); */
+				/* ODM_Write_DIG(pDM_Odm, pDM_DigTable->CurIGValue); */
+				ODM_Write_DIG(pDM_Odm, pDM_DigTable->BT30_CurIGI);
 		}
 	} else { /*  BT is not using */
-		ODM_Write_DIG(pDM_Odm, CurrentIGI);/* ODM_Write_DIG(pDM_Odm, pDM_DigTable->CurIGValue); */
+		/* ODM_Write_DIG(pDM_Odm, pDM_DigTable->CurIGValue); */
+		ODM_Write_DIG(pDM_Odm, CurrentIGI);
 		pDM_DigTable->bMediaConnect_0 = pDM_Odm->bLinked;
 		pDM_DigTable->DIG_Dynamic_MIN_0 = DIG_Dynamic_MIN;
 	}
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 5bb27b872052..86f41b8f9fe2 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -372,13 +372,22 @@ static void odm_Process_RSSIForDM(
 				OFDM_pkt += (u8)(pEntry->rssi_stat.PacketMap>>i)&BIT0;
 
 			if (pEntry->rssi_stat.ValidBit == 64) {
+				u32 ofdm_weight, cck_weight;
+
 				Weighting = ((OFDM_pkt<<4) > 64)?64:(OFDM_pkt<<4);
-				UndecoratedSmoothedPWDB = (Weighting*UndecoratedSmoothedOFDM+(64-Weighting)*UndecoratedSmoothedCCK)>>6;
+				ofdm_weight = Weighting * UndecoratedSmoothedOFDM;
+				cck_weight = (64 - Weighting) * UndecoratedSmoothedCCK;
+				UndecoratedSmoothedPWDB = (ofdm_weight + cck_weight) >> 6;
 			} else {
-				if (pEntry->rssi_stat.ValidBit != 0)
-					UndecoratedSmoothedPWDB = (OFDM_pkt*UndecoratedSmoothedOFDM+(pEntry->rssi_stat.ValidBit-OFDM_pkt)*UndecoratedSmoothedCCK)/pEntry->rssi_stat.ValidBit;
-				else
+				if (pEntry->rssi_stat.ValidBit != 0) {
+					u8 valid = pEntry->rssi_stat.ValidBit;
+					u32 ofdm_sum = OFDM_pkt * UndecoratedSmoothedOFDM;
+					u32 cck_sum = (valid - OFDM_pkt) * UndecoratedSmoothedCCK;
+
+					UndecoratedSmoothedPWDB = (ofdm_sum + cck_sum) / valid;
+				} else {
 					UndecoratedSmoothedPWDB = 0;
+				}
 			}
 
 			pEntry->rssi_stat.UndecoratedSmoothedCCK = UndecoratedSmoothedCCK;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..92951ba4561e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -154,14 +154,28 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	/* below for ad-hoc mode */
 
 	/*  SSID */
-	pframe = rtw_set_ie(pframe, WLAN_EID_SSID, cur_network->ssid.ssid_length, cur_network->ssid.ssid, &pktlen);
+	{
+		uint ssid_len = cur_network->ssid.ssid_length;
+
+		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, ssid_len,
+				    cur_network->ssid.ssid, &pktlen);
+	}
 
 	/*  supported rates... */
 	rate_len = rtw_get_rateset_len(cur_network->supported_rates);
-	pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pktlen);
+	{
+		uint len = (rate_len > 8) ? 8 : rate_len;
+
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, len,
+				    cur_network->supported_rates, &pktlen);
+	}
 
 	/*  DS parameter set */
-	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pktlen);
+	{
+		unsigned char *ds = (unsigned char *)&cur_network->configuration.ds_config;
+
+		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, ds, &pktlen);
+	}
 
 	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
 		u32 ATIMWindow;
@@ -176,8 +190,12 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 
 
 	/*  EXTERNDED SUPPORTED RATE */
-	if (rate_len > 8)
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pktlen);
+	if (rate_len > 8) {
+		u8 *ext_rates = cur_network->supported_rates + 8;
+
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    rate_len - 8, ext_rates, &pktlen);
+	}
 
 
 	/* todo:HT for adhoc */
@@ -309,10 +327,12 @@ void rtl8723b_set_FwMediaStatusRpt_cmd(struct adapter *padapter, u8 mstatus, u8
 	SET_8723B_H2CCMD_MSRRPT_PARM_MACID(u1H2CMediaStatusRptParm, macid);
 	SET_8723B_H2CCMD_MSRRPT_PARM_MACID_END(u1H2CMediaStatusRptParm, macid_end);
 
-	FillH2CCmd8723B(padapter, H2C_8723B_MEDIA_STATUS_RPT, H2C_MEDIA_STATUS_RPT_LEN, u1H2CMediaStatusRptParm);
+	FillH2CCmd8723B(padapter, H2C_8723B_MEDIA_STATUS_RPT,
+			H2C_MEDIA_STATUS_RPT_LEN, u1H2CMediaStatusRptParm);
 }
 
-void rtl8723b_set_FwMacIdConfig_cmd(struct adapter *padapter, u8 mac_id, u8 raid, u8 bw, u8 sgi, u32 mask)
+void rtl8723b_set_FwMacIdConfig_cmd(struct adapter *padapter, u8 mac_id,
+					u8 raid, u8 bw, u8 sgi, u32 mask)
 {
 	u8 u1H2CMacIdConfigParm[H2C_MACID_CFG_LEN] = {0};
 
@@ -386,7 +406,8 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 	SET_8723B_H2CCMD_PWRMODE_PARM_SMART_PS(u1H2CPwrModeParm, pwrpriv->smart_ps);
 	SET_8723B_H2CCMD_PWRMODE_PARM_RLBM(u1H2CPwrModeParm, rlbm);
 	SET_8723B_H2CCMD_PWRMODE_PARM_BCN_PASS_TIME(u1H2CPwrModeParm, awake_intvl);
-	SET_8723B_H2CCMD_PWRMODE_PARM_ALL_QUEUE_UAPSD(u1H2CPwrModeParm, padapter->registrypriv.uapsd_enable);
+	SET_8723B_H2CCMD_PWRMODE_PARM_ALL_QUEUE_UAPSD(u1H2CPwrModeParm,
+						      padapter->registrypriv.uapsd_enable);
 	SET_8723B_H2CCMD_PWRMODE_PARM_PWR_STATE(u1H2CPwrModeParm, PowerState);
 	SET_8723B_H2CCMD_PWRMODE_PARM_BYTE5(u1H2CPwrModeParm, byte5);
 	if (psmode != PS_MODE_ACTIVE) {
@@ -402,7 +423,9 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 			pmlmeext->DrvBcnTimeOut = 0xff;
 
 			for (i = 0; i < 9; i++) {
-				pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i]*100)/pmlmeext->bcn_cnt;
+				u32 cnt = pmlmeext->bcn_delay_cnt[i];
+
+				pmlmeext->bcn_delay_ratio[i] = (cnt * 100) / pmlmeext->bcn_cnt;
 
 				ratio_20_delay += pmlmeext->bcn_delay_ratio[i];
 				ratio_80_delay += pmlmeext->bcn_delay_ratio[i];
@@ -429,7 +452,9 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 		pmlmeext->DrvBcnTimeOut =7;
 
 		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
-			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
+			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] =
+				BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |
+				((pmlmeext->DrvBcnTimeOut<<4)&0xf0);
 */
 
 	}
@@ -528,7 +553,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 	/* 3 (2) ps-poll */
 	RsvdPageLoc.LocPsPoll = TotalPageNum;
 	ConstructPSPoll(padapter, &ReservedPagePacket[BufIndex], &PSPollLength);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], PSPollLength, true, false, false);
+	{
+		u8 *desc = &ReservedPagePacket[BufIndex - TxDescLen];
+
+		rtl8723b_fill_fake_txdesc(padapter, desc, PSPollLength,
+					  true, false, false);
+	}
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + PSPollLength);
 
@@ -545,7 +575,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		false, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], NullDataLength, false, false, false);
+	{
+		u8 *desc = &ReservedPagePacket[BufIndex - TxDescLen];
+
+		rtl8723b_fill_fake_txdesc(padapter, desc, NullDataLength,
+					  false, false, false);
+	}
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + NullDataLength);
 
@@ -562,7 +597,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], QosNullLength, false, false, false);
+	{
+		u8 *desc = &ReservedPagePacket[BufIndex - TxDescLen];
+
+		rtl8723b_fill_fake_txdesc(padapter, desc, QosNullLength,
+					  false, false, false);
+	}
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + QosNullLength);
 
@@ -579,7 +619,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], BTQosNullLength, false, true, false);
+	{
+		u8 *desc = &ReservedPagePacket[BufIndex - TxDescLen];
+
+		rtl8723b_fill_fake_txdesc(padapter, desc, BTQosNullLength,
+					  false, true, false);
+	}
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
 
@@ -656,6 +701,8 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 		DLBcnCount = 0;
 		poll = 0;
 		do {
+			bool stop;
+
 			/*  download rsvd page. */
 			rtl8723b_set_FwRsvdPagePkt(padapter, 0);
 			DLBcnCount++;
@@ -663,11 +710,16 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				yield();
 				/* mdelay(10); */
 				/*  check rsvd page download OK. */
-				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
+				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID,
+						  (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+				stop = padapter->bSurpriseRemoved ||
+				       padapter->bDriverStopped;
+			} while (!bcn_valid && (poll % 10) != 0 && !stop);
 
-		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			if (stop)
+				break;
+		} while (!bcn_valid && DLBcnCount <= 100);
 
 		if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
 		} else {
@@ -850,7 +902,12 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 		NULL,
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], BTQosNullLength, false, true, false);
+	{
+		u8 *desc = &ReservedPagePacket[BufIndex - TxDescLen];
+
+		rtl8723b_fill_fake_txdesc(padapter, desc, BTQosNullLength,
+					  false, true, false);
+	}
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
 
@@ -922,6 +979,8 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 	DLBcnCount = 0;
 	poll = 0;
 	do {
+		bool stop;
+
 		SetFwRsvdPagePkt_BTCoex(padapter);
 		DLBcnCount++;
 		do {
@@ -930,8 +989,12 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
-	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			stop = padapter->bSurpriseRemoved || padapter->bDriverStopped;
+		} while (!bcn_valid && (poll % 10) != 0 && !stop);
+
+		if (stop)
+			break;
+	} while (!bcn_valid && (DLBcnCount <= 100));
 
 	if (bcn_valid) {
 		struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ae5e4980ed06..017096857d67 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -58,7 +58,10 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 	remainSize_p1 = buffSize % blockSize_p1;
 
 	for (i = 0; i < blockCount_p1; i++) {
-		ret = rtw_write32(padapter, (FW_8723B_START_ADDRESS + i * blockSize_p1), *((u32 *)(bufferPtr + i * blockSize_p1)));
+		u32 addr = FW_8723B_START_ADDRESS + i * blockSize_p1;
+		u32 data = *((u32 *)(bufferPtr + i * blockSize_p1));
+
+		ret = rtw_write32(padapter, addr, data);
 		if (ret == _FAIL) {
 			netdev_dbg(padapter->pnetdev, "write failed at %s %d, block:%d\n",
 				   __func__, __LINE__, i);
@@ -261,27 +264,34 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u8 val;
 	u8 Delay = 100;
+	bool old_fw;
 
-	if (
-		!(IS_FW_81xxC(padapter) && ((pHalData->FirmwareVersion < 0x21) || (pHalData->FirmwareVersion == 0x21 && pHalData->FirmwareSubVersion < 0x01)))
-	) { /*  after 88C Fw v33.1 */
-		/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
-		rtw_write8(padapter, REG_HMETFR+3, 0x20);
+	/* Check for old firmware version */
+	old_fw = IS_FW_81xxC(padapter) &&
+		 ((pHalData->FirmwareVersion < 0x21) ||
+		  (pHalData->FirmwareVersion == 0x21 &&
+		   pHalData->FirmwareSubVersion < 0x01));
+
+	if (old_fw)
+		return;
 
+	/* after 88C Fw v33.1 */
+	/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
+	rtw_write8(padapter, REG_HMETFR + 3, 0x20);
+
+	val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+	while (val & BIT2) {
+		Delay--;
+		if (Delay == 0)
+			break;
+		udelay(50);
 		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-		while (val & BIT2) {
-			Delay--;
-			if (Delay == 0)
-				break;
-			udelay(50);
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-		}
+	}
 
-		if (Delay == 0) {
-			/* force firmware reset */
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-			rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT2));
-		}
+	if (Delay == 0) {
+		/* force firmware reset */
+		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT2));
 	}
 }
 
@@ -1000,9 +1010,13 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == true) {
-		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
-		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
+	{
+		u16 state_mask = WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE;
+
+		if (check_fwstate(&padapter->mlmepriv, state_mask)) {
+			rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
+			rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
+		}
 	}
 
 	_BeaconFunctionEnable(padapter, true, true);
@@ -1655,7 +1669,9 @@ static u8 fill_txdesc_sectype(struct pkt_attrib *pattrib)
 	return sectype;
 }
 
-static void fill_txdesc_vcs_8723b(struct adapter *padapter, struct pkt_attrib *pattrib, struct txdesc_8723b *ptxdesc)
+static void fill_txdesc_vcs_8723b(struct adapter *padapter,
+				  struct pkt_attrib *pattrib,
+				  struct txdesc_8723b *ptxdesc)
 {
 	if (pattrib->vcs_mode) {
 		switch (pattrib->vcs_mode) {
@@ -1686,7 +1702,9 @@ static void fill_txdesc_vcs_8723b(struct adapter *padapter, struct pkt_attrib *p
 	}
 }
 
-static void fill_txdesc_phy_8723b(struct adapter *padapter, struct pkt_attrib *pattrib, struct txdesc_8723b *ptxdesc)
+static void fill_txdesc_phy_8723b(struct adapter *padapter,
+				  struct pkt_attrib *pattrib,
+				  struct txdesc_8723b *ptxdesc)
 {
 	if (pattrib->ht_en) {
 		ptxdesc->data_bw = BWMapping_8723B(padapter, pattrib);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index d8709d40cb33..90c49a32549e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -109,18 +109,26 @@ static u32 phy_RFSerialRead_8723B(
 	NewOffset = Offset;
 
 	if (eRFPath == RF_PATH_A) {
-		tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord);
+		u32 regA = rFPGA0_XA_HSSIParameter2 | MaskforPhySet;
+
+		tmplong2 = PHY_QueryBBReg(Adapter, regA, bMaskDWord);
 		tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset<<23) | bLSSIReadEdge;	/* T65 RF */
-		PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2&(~bLSSIReadEdge));
+		PHY_SetBBReg(Adapter, regA, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
 	} else {
-		tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter2|MaskforPhySet, bMaskDWord);
+		u32 regB = rFPGA0_XB_HSSIParameter2 | MaskforPhySet;
+
+		tmplong2 = PHY_QueryBBReg(Adapter, regB, bMaskDWord);
 		tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset<<23) | bLSSIReadEdge;	/* T65 RF */
-		PHY_SetBBReg(Adapter, rFPGA0_XB_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2&(~bLSSIReadEdge));
+		PHY_SetBBReg(Adapter, regB, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
 	}
 
-	tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord);
-	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
-	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2 | bLSSIReadEdge);
+	{
+		u32 reg = rFPGA0_XA_HSSIParameter2 | MaskforPhySet;
+
+		tmplong2 = PHY_QueryBBReg(Adapter, reg, bMaskDWord);
+		PHY_SetBBReg(Adapter, reg, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
+		PHY_SetBBReg(Adapter, reg, bMaskDWord, tmplong2 | bLSSIReadEdge);
+	}
 
 	udelay(10);
 
@@ -307,22 +315,29 @@ static void phy_InitBBRFRegisterDefinition(struct adapter *Adapter)
 	struct hal_com_data		*pHalData = GET_HAL_DATA(Adapter);
 
 	/*  RF Interface Sowrtware Control */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfs = rFPGA0_XAB_RFInterfaceSW; /*  16 LSBs if read 32-bit from 0x870 */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfs = rFPGA0_XAB_RFInterfaceSW; /*  16 MSBs if read 32-bit from 0x870 (16-bit for 0x872) */
+	/* 16 LSBs if read 32-bit from 0x870 */
+	pHalData->PHYRegDef[RF_PATH_A].rfintfs = rFPGA0_XAB_RFInterfaceSW;
+	/* 16 MSBs if read 32-bit from 0x870 (16-bit for 0x872) */
+	pHalData->PHYRegDef[RF_PATH_B].rfintfs = rFPGA0_XAB_RFInterfaceSW;
 
 	/*  RF Interface Output (and Enable) */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfo = rFPGA0_XA_RFInterfaceOE; /*  16 LSBs if read 32-bit from 0x860 */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfo = rFPGA0_XB_RFInterfaceOE; /*  16 LSBs if read 32-bit from 0x864 */
+	/* 16 LSBs if read 32-bit from 0x860 */
+	pHalData->PHYRegDef[RF_PATH_A].rfintfo = rFPGA0_XA_RFInterfaceOE;
+	/* 16 LSBs if read 32-bit from 0x864 */
+	pHalData->PHYRegDef[RF_PATH_B].rfintfo = rFPGA0_XB_RFInterfaceOE;
 
 	/*  RF Interface (Output and)  Enable */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfe = rFPGA0_XA_RFInterfaceOE; /*  16 MSBs if read 32-bit from 0x860 (16-bit for 0x862) */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfe = rFPGA0_XB_RFInterfaceOE; /*  16 MSBs if read 32-bit from 0x864 (16-bit for 0x866) */
+	/* 16 MSBs if read 32-bit from 0x860 (16-bit for 0x862) */
+	pHalData->PHYRegDef[RF_PATH_A].rfintfe = rFPGA0_XA_RFInterfaceOE;
+	/* 16 MSBs if read 32-bit from 0x864 (16-bit for 0x866) */
+	pHalData->PHYRegDef[RF_PATH_B].rfintfe = rFPGA0_XB_RFInterfaceOE;
 
 	pHalData->PHYRegDef[RF_PATH_A].rf3wireOffset = rFPGA0_XA_LSSIParameter; /* LSSI Parameter */
 	pHalData->PHYRegDef[RF_PATH_B].rf3wireOffset = rFPGA0_XB_LSSIParameter;
 
-	pHalData->PHYRegDef[RF_PATH_A].rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;  /* wire control parameter2 */
-	pHalData->PHYRegDef[RF_PATH_B].rfHSSIPara2 = rFPGA0_XB_HSSIParameter2;  /* wire control parameter2 */
+	/* wire control parameter2 */
+	pHalData->PHYRegDef[RF_PATH_A].rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;
+	pHalData->PHYRegDef[RF_PATH_B].rfHSSIPara2 = rFPGA0_XB_HSSIParameter2;
 
 	/*  Transceiver Readback LSSI/HSPI mode */
 	pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBack = rFPGA0_XA_LSSIReadBack;
@@ -648,8 +663,12 @@ static void phy_PostSetBwMode8723B(struct adapter *Adapter)
 		PHY_SetBBReg(Adapter, rCCK0_System, bCCKSideBand, (pHalData->nCur40MhzPrimeSC>>1));
 
 		PHY_SetBBReg(Adapter, rOFDM1_LSTF, 0xC00, pHalData->nCur40MhzPrimeSC);
+		{
+			u32 val;
 
-		PHY_SetBBReg(Adapter, 0x818, (BIT26|BIT27), (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1);
+			val = (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1;
+			PHY_SetBBReg(Adapter, 0x818, (BIT26 | BIT27), val);
+		}
 		break;
 	default:
 		break;
@@ -774,5 +793,6 @@ void PHY_SetSwChnlBWMode8723B(
 	u8 Offset80
 )
 {
-	PHY_HandleSwChnlAndSetBW8723B(Adapter, true, true, channel, Bandwidth, Offset40, Offset80, channel);
+	PHY_HandleSwChnlAndSetBW8723B(Adapter, true, true, channel,
+				      Bandwidth, Offset40, Offset80, channel);
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index ffb35e1ace62..e0fb36b0b666 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -113,10 +113,12 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 		udelay(1);/* PlatformStallExecution(1); */
 
 		/* Set bit number of Address and Data for RF register */
-		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireAddressLength, 0x0);	/*  Set 1 to 4 bits for 8255 */
+		/* Set 1 to 4 bits for 8255 */
+		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireAddressLength, 0x0);
 		udelay(1);/* PlatformStallExecution(1); */
 
-		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);	/*  Set 0 to 12  bits for 8255 */
+		/* Set 0 to 12 bits for 8255 */
+		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);
 		udelay(1);/* PlatformStallExecution(1); */
 
 		/*----Initialize RF fom connfiguration file----*/
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 399edfbf8ec6..5bbf958d792e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -300,8 +300,10 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 
 				pkt_copy->dev = padapter->pnetdev;
 				precvframe->u.hdr.pkt = pkt_copy;
-				skb_reserve(pkt_copy, 8 - ((SIZE_PTR)(pkt_copy->data) & 7));/* force pkt_copy->data at 8-byte alignment address */
-				skb_reserve(pkt_copy, shift_sz);/* force ip_hdr at 8-byte alignment address according to shift_sz. */
+				/* force pkt_copy->data at 8-byte alignment address */
+				skb_reserve(pkt_copy, 8 - ((SIZE_PTR)(pkt_copy->data) & 7));
+				/* force ip_hdr at 8-byte alignment per shift_sz */
+				skb_reserve(pkt_copy, shift_sz);
 				memcpy(pkt_copy->data, (ptr + rx_report_sz + pattrib->shift_sz), skb_len);
 				precvframe->u.hdr.rx_head = pkt_copy->head;
 				precvframe->u.hdr.rx_data = precvframe->u.hdr.rx_tail = pkt_copy->data;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index abb6fdfe7e1f..7ed4c710ae8d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -446,7 +446,10 @@ s32 rtl8723bs_mgnt_xmit(
 	pxmitbuf->priv_data = NULL;
 
 	if (GetFrameSubType(pframe) == WIFI_BEACON) { /* dump beacon directly */
-		ret = rtw_write_port(padapter, pdvobjpriv->Queue2Pipe[pxmitbuf->ff_hwaddr], pxmitbuf->len, (u8 *)pxmitbuf);
+		u8 ff_addr = pxmitbuf->ff_hwaddr;
+
+		ret = rtw_write_port(padapter, pdvobjpriv->Queue2Pipe[ff_addr],
+				     pxmitbuf->len, (u8 *)pxmitbuf);
 		if (ret != _SUCCESS)
 			rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_WRITE_PORT_ERR);
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 668616efa68a..d1f1778a4ec6 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -28,7 +28,9 @@ static u8 CardEnable(struct adapter *padapter)
 		/*  unlock ISO/CLK/Power control register */
 		rtw_write8(padapter, REG_RSV_CTRL, 0x0);
 
-		ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_enable_flow);
+		ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK,
+					  PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK,
+					  rtl8723B_card_enable_flow);
 		if (ret == _SUCCESS) {
 			u8 bMacPwrCtrlOn = true;
 			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
@@ -111,7 +113,9 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 }
 
 /* Tx Page FIFO threshold */
-static void _init_available_page_threshold(struct adapter *padapter, u8 numHQ, u8 numNQ, u8 numLQ, u8 numPubQ)
+static void _init_available_page_threshold(struct adapter *padapter,
+					   u8 numHQ, u8 numNQ,
+					   u8 numLQ, u8 numPubQ)
 {
 	u16 HQ_threshold, NQ_threshold, LQ_threshold;
 
@@ -852,7 +856,8 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	u8 bMacPwrCtrlOn;
 
 	/*  Run LPS WL RFOFF flow */
-	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
+	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK,
+			    PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
 
 	/* 	==== Reset digital sequence   ====== */
 
@@ -881,7 +886,8 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 
 	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
-	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
+	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK,
+			    PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
 }
 
 u32 rtl8723bs_hal_deinit(struct adapter *padapter)
@@ -1116,7 +1122,8 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 
 	if (!padapter->hw_init_completed) {
 		rtw_write8(padapter, 0x67, 0x00); /*  for BT, Switch Ant control to BT */
-		CardDisableRTL8723BSdio(padapter);/* for the power consumption issue,  wifi ko module is loaded during booting, but wifi GUI is off */
+		/* Power consumption issue: wifi module loaded at boot but GUI off */
+		CardDisableRTL8723BSdio(padapter);
 	}
 
 	return _SUCCESS;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 5488940ffe2e..fe5015b8d649 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -125,8 +125,10 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 	if (!spt_band)
 		goto exit;
 
-	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
-	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + sizeof(struct ieee80211_channel) * n_channels);
+	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) +
+			      sizeof(struct ieee80211_supported_band));
+	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) +
+			     sizeof(struct ieee80211_channel) * n_channels);
 	spt_band->band = band;
 	spt_band->n_channels = n_channels;
 	spt_band->n_bitrates = n_bitrates;
@@ -205,7 +207,8 @@ int rtw_ieee80211_channel_to_frequency(int chan)
 }
 
 #define MAX_BSSINFO_LEN 1000
-struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wlan_network *pnetwork)
+struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter,
+					     struct wlan_network *pnetwork)
 {
 	struct ieee80211_channel *notify_channel;
 	struct cfg80211_bss *bss = NULL;
@@ -246,7 +249,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 		u32 wpsielen = 0;
 		u8 *wpsie = NULL;
 
-		wpsie = rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
+		u8 *ies = pnetwork->network.ies + _FIXED_IE_LENGTH_;
+		uint ie_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
+
+		wpsie = rtw_get_wps_ie(ies, ie_len, NULL, &wpsielen);
 
 		if (wpsie && wpsielen > 0)
 			psr = rtw_get_wps_attr_content(wpsie, wpsielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
@@ -275,9 +281,13 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	/* We've set wiphy's signal_type as CFG80211_SIGNAL_TYPE_MBM: signal strength in mBm (100*dBm) */
 	if (check_fwstate(pmlmepriv, _FW_LINKED) == true &&
 	    is_same_network(&pmlmepriv->cur_network.network, &pnetwork->network, 0)) {
-		notify_signal = 100 * translate_percentage_to_dbm(padapter->recvpriv.signal_strength);/* dbm */
+		u8 sig = padapter->recvpriv.signal_strength;
+
+		notify_signal = 100 * translate_percentage_to_dbm(sig);
 	} else {
-		notify_signal = 100 * translate_percentage_to_dbm(pnetwork->network.phy_info.signal_strength);/* dbm */
+		u8 sig = pnetwork->network.phy_info.signal_strength;
+
+		notify_signal = 100 * translate_percentage_to_dbm(sig);
 	}
 
 	buf = kzalloc(MAX_BSSINFO_LEN, GFP_ATOMIC);
@@ -377,9 +387,10 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 				rtw_warn_on(1);
 				return;
 			}
-			if (!memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
-				&& !memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN)
-			)
+			if (!memcmp(&scanned->network.ssid, &pnetwork->ssid,
+				    sizeof(struct ndis_802_11_ssid)) &&
+			    !memcmp(scanned->network.mac_address,
+				    pnetwork->mac_address, ETH_ALEN))
 				rtw_cfg80211_inform_bss(padapter, scanned);
 			else
 				rtw_warn_on(1);
@@ -490,18 +501,24 @@ void rtw_cfg80211_indicate_disconnect(struct adapter *padapter)
 	}
 }
 
-static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_param *param, u32 param_len)
+static int rtw_cfg80211_ap_set_encryption(struct net_device *dev,
+					  struct ieee_param *param,
+					  u32 param_len)
 {
 	int ret = 0;
 	u32 wep_key_idx, wep_key_len;
+	u32 key_len;
 	struct sta_info *psta = NULL, *pbcmc_sta = NULL;
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv =  &(padapter->securitypriv);
 	struct sta_priv *pstapriv = &padapter->stapriv;
-	char *grpkey = padapter->securitypriv.dot118021XGrpKey[param->u.crypt.idx].skey;
-	char *txkey = padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey;
-	char *rxkey = padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey;
+	char *grpkey = psecuritypriv->dot118021XGrpKey[param->u.crypt.idx].skey;
+	char *txkey = psecuritypriv->dot118021XGrptxmickey[param->u.crypt.idx].skey;
+	char *rxkey = psecuritypriv->dot118021XGrprxmickey[param->u.crypt.idx].skey;
+
+	/* Clamp key_len to max 16 */
+	key_len = min_t(u32, param->u.crypt.key_len, 16);
 
 	param->u.crypt.err = 0;
 	param->u.crypt.alg[IEEE_CRYPT_ALG_NAME_LEN - 1] = '\0';
@@ -601,12 +618,15 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
-			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
+			rtw_ap_set_group_key(padapter, param->u.crypt.key,
+					     psecuritypriv->dot118021XGrpPrivacy,
+					     param->u.crypt.idx);
 
 			pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 			if (pbcmc_sta) {
 				pbcmc_sta->ieee8021x_blocked = false;
-				pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+				/* rx will use bmc_sta's dot118021XPrivacy */
+				pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;
 			}
 		}
 
@@ -616,7 +636,8 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
-				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+				memcpy(psta->dot118021x_UncstKey.skey,
+				       param->u.crypt.key, key_len);
 
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
 					psta->dot118021XPrivacy = _WEP40_;
@@ -645,7 +666,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			} else { /* group key??? */
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
-					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(grpkey, param->u.crypt.key, key_len);
 
 					psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 					if (param->u.crypt.key_len == 13)
@@ -653,7 +674,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
 					psecuritypriv->dot118021XGrpPrivacy = _TKIP_;
 
-					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(grpkey, param->u.crypt.key, key_len);
 
 					/* set mic key */
 					memcpy(txkey, &(param->u.crypt.key[16]), 8);
@@ -664,7 +685,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
 					psecuritypriv->dot118021XGrpPrivacy = _AES_;
 
-					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(grpkey, param->u.crypt.key, key_len);
 				} else {
 					psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 				}
@@ -675,12 +696,16 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 				psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
-				rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
+				rtw_ap_set_group_key(padapter, param->u.crypt.key,
+						     psecuritypriv->dot118021XGrpPrivacy,
+						     param->u.crypt.idx);
 
 				pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 				if (pbcmc_sta) {
 					pbcmc_sta->ieee8021x_blocked = false;
-					pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+					/* rx will use bmc_sta's dot118021XPrivacy */
+					pbcmc_sta->dot118021XPrivacy =
+						psecuritypriv->dot118021XGrpPrivacy;
 				}
 			}
 		}
@@ -691,15 +716,20 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 	return ret;
 }
 
-static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param *param, u32 param_len)
+static int rtw_cfg80211_set_encryption(struct net_device *dev,
+				       struct ieee_param *param, u32 param_len)
 {
 	int ret = 0;
 	u8 max_idx;
 	u32 wep_key_idx, wep_key_len;
+	u32 key_len;
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
+	/* Clamp key_len to max 16 */
+	key_len = min_t(u32, param->u.crypt.key_len, 16);
+
 	param->u.crypt.err = 0;
 	param->u.crypt.alg[IEEE_CRYPT_ALG_NAME_LEN - 1] = '\0';
 
@@ -779,7 +809,8 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
 
-					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(psta->dot118021x_UncstKey.skey,
+					       param->u.crypt.key, key_len);
 
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
 						memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
@@ -792,17 +823,27 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 					rtw_setstakey_cmd(padapter, psta, true, true);
 				} else { /* group key */
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0 || strcmp(param->u.crypt.alg, "CCMP") == 0) {
-						memcpy(padapter->securitypriv.dot118021XGrpKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						memcpy(padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[16]), 8);
-						memcpy(padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[24]), 8);
+						u8 grp_idx = param->u.crypt.idx;
+						struct security_priv *sec = psecuritypriv;
+
+						memcpy(sec->dot118021XGrpKey[grp_idx].skey,
+						       param->u.crypt.key, key_len);
+						memcpy(sec->dot118021XGrptxmickey[grp_idx].skey,
+						       &param->u.crypt.key[16], 8);
+						memcpy(sec->dot118021XGrprxmickey[grp_idx].skey,
+						       &param->u.crypt.key[24], 8);
 						padapter->securitypriv.binstallGrpkey = true;
 
-						padapter->securitypriv.dot118021XGrpKeyid = param->u.crypt.idx;
-						rtw_set_key(padapter, &padapter->securitypriv, param->u.crypt.idx, 1, true);
+						padapter->securitypriv.dot118021XGrpKeyid = grp_idx;
+						rtw_set_key(padapter, &padapter->securitypriv,
+							    grp_idx, 1, true);
 					} else if (strcmp(param->u.crypt.alg, "BIP") == 0) {
 						/* save the IGTK key, length 16 bytes */
-						memcpy(padapter->securitypriv.dot11wBIPKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						padapter->securitypriv.dot11wBIPKeyid = param->u.crypt.idx;
+						u8 idx = param->u.crypt.idx;
+
+						memcpy(psecuritypriv->dot11wBIPKey[idx].skey,
+						       param->u.crypt.key, key_len);
+						padapter->securitypriv.dot11wBIPKeyid = idx;
 						padapter->securitypriv.binstallBIPkey = true;
 					}
 				}
@@ -939,8 +980,10 @@ static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
 {
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
+	u32 alg = psecuritypriv->dot11PrivacyAlgrthm;
+	bool is_wep = (alg == _WEP40_) || (alg == _WEP104_);
 
-	if ((key_index < WEP_KEYS) && ((psecuritypriv->dot11PrivacyAlgrthm == _WEP40_) || (psecuritypriv->dot11PrivacyAlgrthm == _WEP104_))) { /* set wep default key */
+	if ((key_index < WEP_KEYS) && is_wep) { /* set wep default key */
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
 		psecuritypriv->dot11PrivacyKeyIndex = key_index;
@@ -952,7 +995,8 @@ static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
 			psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 		}
 
-		psecuritypriv->bWepDefaultKeyIdxSet = 1; /* set the flag to represent that wep default key has been set */
+		/* set the flag to represent that wep default key has been set */
+		psecuritypriv->bWepDefaultKeyIdxSet = 1;
 	}
 
 	return 0;
@@ -1136,7 +1180,8 @@ void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter)
 		pnetwork = list_entry(plist, struct wlan_network, list);
 
 		/* report network only if the current channel set contains the channel to which this network belongs */
-		if (rtw_ch_set_search_ch(padapter->mlmeextpriv.channel_set, pnetwork->network.configuration.ds_config) >= 0
+		if (rtw_ch_set_search_ch(padapter->mlmeextpriv.channel_set,
+					 pnetwork->network.configuration.ds_config) >= 0
 			&& true == rtw_validate_ssid(&(pnetwork->network.ssid))) {
 			/* ev =translate_scan(padapter, a, pnetwork, ev, stop); */
 			rtw_cfg80211_inform_bss(padapter, pnetwork);
@@ -1276,7 +1321,8 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 		for (j = request->n_channels - 1; j >= 0; j--)
 			for (i = 0; i < survey_times; i++)
 				memcpy(&ch[j * survey_times + i], &ch[j], sizeof(struct rtw_ieee80211_channel));
-		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, ch, survey_times * request->n_channels);
+		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT,
+					     ch, survey_times * request->n_channels);
 	} else {
 		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, NULL, 0);
 	}
@@ -1860,10 +1906,14 @@ static int cfg80211_rtw_set_pmksa(struct wiphy *wiphy,
 	}
 
 	if (!blInserted) {
-		memcpy(psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].Bssid, (u8 *)pmksa->bssid, ETH_ALEN);
-		memcpy(psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].PMKID, (u8 *)pmksa->pmkid, WLAN_PMKID_LEN);
+		u8 idx = psecuritypriv->PMKIDIndex;
+
+		memcpy(psecuritypriv->PMKIDList[idx].Bssid,
+		       (u8 *)pmksa->bssid, ETH_ALEN);
+		memcpy(psecuritypriv->PMKIDList[idx].PMKID,
+		       (u8 *)pmksa->pmkid, WLAN_PMKID_LEN);
 
-		psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].bUsed = true;
+		psecuritypriv->PMKIDList[idx].bUsed = true;
 		psecuritypriv->PMKIDIndex++;
 		if (psecuritypriv->PMKIDIndex == 16)
 			psecuritypriv->PMKIDIndex = 0;
@@ -1932,7 +1982,9 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 	}
 }
 
-void rtw_cfg80211_indicate_sta_disassoc(struct adapter *padapter, unsigned char *da, unsigned short reason)
+void rtw_cfg80211_indicate_sta_disassoc(struct adapter *padapter,
+					unsigned char *da,
+					unsigned short reason)
 {
 	struct net_device *ndev = padapter->pnetdev;
 
@@ -2111,7 +2163,8 @@ static const struct net_device_ops rtw_cfg80211_monitor_if_ops = {
 	.ndo_start_xmit = rtw_cfg80211_monitor_if_xmit_entry,
 };
 
-static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, struct net_device **ndev)
+static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name,
+				       struct net_device **ndev)
 {
 	int ret = 0;
 	struct net_device *mon_ndev = NULL;
@@ -2244,7 +2297,8 @@ static int cfg80211_rtw_del_virtual_intf(struct wiphy *wiphy,
 	return ret;
 }
 
-static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_len, const u8 *tail, size_t tail_len)
+static int rtw_add_beacon(struct adapter *adapter, const u8 *head,
+			  size_t head_len, const u8 *tail, size_t tail_len)
 {
 	int ret = 0;
 	u8 *pbuf = NULL;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 6ca6dc548805..36f02bf26a00 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -70,9 +70,11 @@ int rtw_ht_enable = 1;
  * 0x01 means enable 2.4G 40MHz
  */
 static int rtw_bw_mode = 0x01;
-static int rtw_ampdu_enable = 1;/* for enable tx_ampdu ,0: disable, 0x1:enable (but wifi_spec should be 0), 0x2: force enable (don't care wifi_spec) */
+/* for enable tx_ampdu: 0=disable, 0x1=enable (wifi_spec=0), 0x2=force enable */
+static int rtw_ampdu_enable = 1;
 static int rtw_rx_stbc = 1;/*  0: disable, 1:enable 2.4g */
-static int rtw_ampdu_amsdu;/*  0: disabled, 1:enabled, 2:auto . There is an IOT issu with DLINK DIR-629 when the flag turn on */
+/* 0: disabled, 1:enabled, 2:auto. IOT issue with DLINK DIR-629 when on */
+static int rtw_ampdu_amsdu;
 /*  Short GI support Bit Map */
 /*  BIT0 - 20MHz, 0: non-support, 1: support */
 /*  BIT1 - 40MHz, 0: non-support, 1: support */
@@ -97,7 +99,8 @@ module_param(rtw_ant_num, int, 0644);
 MODULE_PARM_DESC(rtw_ant_num, "Antenna number setting");
 
 static int rtw_antdiv_cfg = 1; /*  0:OFF , 1:ON, 2:decide by Efuse config */
-static int rtw_antdiv_type; /* 0:decide by efuse  1: for 88EE, 1Tx and 1RxCG are diversity.(2 Ant with SPDT), 2:  for 88EE, 1Tx and 2Rx are diversity.(2 Ant, Tx and RxCG are both on aux port, RxCS is on main port), 3: for 88EE, 1Tx and 1RxCG are fixed.(1Ant, Tx and RxCG are both on aux port) */
+/* 0:efuse, 1:1Tx/1RxCG diversity(2Ant+SPDT), 2:1Tx/2Rx diversity, 3:fixed */
+static int rtw_antdiv_type;
 
 static int rtw_hw_wps_pbc;
 
@@ -1157,9 +1160,11 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	}
 	rtw_hal_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
-	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
-		ret = -1;
-		goto exit;
+	if (padapter->intf_alloc_irq) {
+		if (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) {
+			ret = -1;
+			goto exit;
+		}
 	}
 
 	rtw_reset_drv_sw(padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 1d0239eef114..ec6f3e884322 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -237,7 +237,8 @@ static void sd_intf_stop(struct adapter *padapter)
 }
 
 
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj,
+					 const struct sdio_device_id *pdid)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 944b9c724b32..69e0407e780b 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -43,7 +43,9 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 	return false;
 }
 
-int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag)
+int rtw_os_xmit_resource_alloc(struct adapter *padapter,
+			       struct xmit_buf *pxmitbuf,
+			       u32 alloc_sz, u8 flag)
 {
 	if (alloc_sz > 0) {
 		pxmitbuf->pallocated_buf = rtw_zmalloc(alloc_sz);
@@ -56,7 +58,9 @@ int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitb
 	return _SUCCESS;
 }
 
-void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
+void rtw_os_xmit_resource_free(struct adapter *padapter,
+			       struct xmit_buf *pxmitbuf,
+			       u32 free_sz, u8 flag)
 {
 	if (free_sz > 0)
 		kfree(pxmitbuf->pallocated_buf);
-- 
2.52.0

