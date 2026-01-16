Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699F92D47F4
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 05:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768541489; cv=none; b=hshUqCdpo+ipcGtsuiUrgOnSkMDAzKrnComf5QPvKTAfUwWEQzuhXHY+5G4nWqNCDWK0I5n9vNtBXPCz4WyVP6YDACSILWClXBL27V1qKSXvhiAu2O6a1CLf4Ype71zgBMybps5zw5ZyU70kjoSecttSKI+fPf6SDyGqyTFvGrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768541489; c=relaxed/simple;
	bh=5b1LlWehatVX+sb5h96WFNtecIQVEi5N1k1ZIBqeS8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p41xb8F1I94Wdc5kkL9s8rc8/ec5oLKHCG9GdyJc/6XCU0jbmxZBPclu7nQfw95LFCyxsIr7J7e3QAqOhfCLDREMaAQDCsyYlz6zGb0ZJFVH+phjsmfzxiexWGHkEXKHsoeTfNtJbtM+A0pJ/4Lhm0EwkUtUm+oxuRBZUTLWhpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEc7C+rC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEc7C+rC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34c708702dfso848919a91.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 21:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768541488; x=1769146288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9GETDT21OzDnl6aqExkWZEHWIaqzzF9p3+XH4knavM=;
        b=TEc7C+rCKU0wArg8uWrUo0DdMq8YJAcmlAgDdZwpbWkdUmVfU3QY13sSJejKZuWmcS
         KuavZviLtBCNAe8PoldExnLTkXQNV1S+HYh0Y2W2x+J9xlX/pF4UKsUVIqUhxuAp0L0K
         Vy2LKAjSanFiZYoQJpkntulGP8o9xII+a22HVmn762AzuZPVxQd4bHLfs2o65mo2QAVU
         HmZPGjhLRmvFvYKdvvc8UrUe+yWROi0tzSsemD2jDdWcB+ibYEPx9EntQvdi7NF9ZUqT
         SFaidm2tm8I1GWGUNeaiHbZcc2FA+ePOJEXoUoB6LS10eqCjDwwclEu4dsgdwkLWKCyH
         +Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768541488; x=1769146288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9GETDT21OzDnl6aqExkWZEHWIaqzzF9p3+XH4knavM=;
        b=v/Lns+yC7t4pgitqdCVA8HfcVbiUFj172VRmjS7fksHNA0WKKuw9pVVDsAIWMG/bfY
         ZJvnaHMMJNqHOq7/bV8mpqVE77He/9LDfXlFlDOaHAidulbjTM6p2SIBJzUOqPq6N4vz
         q4lGpl69p05DaxJ37mRmFTBoJTT6dSKfEdaFD28acLKjP+yBPEqha8Kp8wSnZ+HAHIXt
         XLixH8PjUV8bv3EHX8bvP6Is+eu4X/uVrU7wms/IrK6WEag4MlQFuXzCrW3TRvGB6zg+
         gwY0jxwwQPkVKBr6bF17ZECv1fLNot2ulvdUYaV+6Ctu5XU+yv9vTXxnkZ3B4rzFSr//
         T0ng==
X-Forwarded-Encrypted: i=1; AJvYcCV7z5xuszqGE8qimwFjUsVeeOK5oz/vOsNQuYfA8yWW1WjO1LBgYM6jl6gRgUA7LEYyfSoidsGMM9EnS9Ki@lists.linux.dev
X-Gm-Message-State: AOJu0YxmS1ufhIpbNTisT4Z2rbXCze8FxLxIE0AaoPwngKLNorDfrISh
	JMCxn62BSezxYBLm+sXEKPBUAVeeDTFhCqQtdhdolsse/RapZZoQpNGM
X-Gm-Gg: AY/fxX7cHeXmg/hW43GIwqcIpWtUTwsSwhfdrHNLzCHqTeG3qpF64hKmiaQ7Z6HVaYn
	DX3Rw26L3iUPkIOTNMFEBW1EkP+/RNayyAhc2kesva0DmwOu9AAUDHp0PpKf/KqppW1+sN3oDM8
	FIIBqi65CxwDvCJSBFge+IQim8UxLIphtYdsQebwfnFoDABIQGz0KrJX1OUPC2Y54ZBe+D2N3RK
	eNZcoLCSZabJkW9FCgwpx7gunido4L3Ua4rETv/UduhreAPP+/DhmIwIasHhsAy0gOEBt4H9NTg
	PBkZRtitAwcfjX9tMGBwLMV9eQ3h+ZxHETEmIRURwLpNbJxEGZuZBwC3lX3i9SC/uFsvTzMC6+J
	Fj/fXetb4vyy/H9oRfN4DSLdndFVTp1VQcQiECpX7udMoiwc9an0joIfAJbA4TYY85DR65f3/JD
	RUYb56neGUYziAAF8u5A==
X-Received: by 2002:a17:90b:5603:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-35272ef6716mr1407450a91.4.1768541487705;
        Thu, 15 Jan 2026 21:31:27 -0800 (PST)
Received: from snowman ([2401:4900:4ffd:9a9f:7003:5e9c:3fa9:4130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35274445a03sm297321a91.7.2026.01.15.21.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 21:31:27 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v3 2/4] staging: rtl8723bs: simplify boolean expressions
Date: Fri, 16 Jan 2026 11:00:50 +0530
Message-ID: <20260116053052.4198-3-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116053052.4198-1-khushalchitturi@gmail.com>
References: <20260116053052.4198-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify boolean expressions in rtw_xmit.c to
comply with the kernel coding style

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

---
Changelog:
v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
v1 -> v2: Corrected commit messages.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 38 ++++++++++++-----------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index bbc42db1c828..97e38ef62ac4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -384,7 +384,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
+			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) &&
+			    (pattrib->ampdu_en) &&
 			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
@@ -420,7 +421,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 			/* to do list: check MIMO power save condition. */
 
 			/* check AMPDU aggregation for TXOP */
-			if (pattrib->ampdu_en == true) {
+			if (pattrib->ampdu_en) {
 				pattrib->vcs_mode = RTS_CTS;
 				break;
 			}
@@ -482,10 +483,10 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
 	pattrib->mac_id = psta->mac_id;
 
-	if (psta->ieee8021x_blocked == true) {
+	if (psta->ieee8021x_blocked) {
 		pattrib->encrypt = 0;
 
-		if ((pattrib->ether_type != 0x888e) && (check_fwstate(pmlmepriv, WIFI_MP_STATE) == false)) {
+		if ((pattrib->ether_type != 0x888e) && (!check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -639,8 +640,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -704,7 +705,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
 			res = _FAIL;
 			goto exit;
-		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) && (!(psta->state & _FW_LINKED))) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)) &&
+			   (!(psta->state & _FW_LINKED))) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -880,7 +882,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 	SetFrameSubType(fctrl, pattrib->subtype);
 
 	if (pattrib->subtype & WIFI_DATA_TYPE) {
-		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE) == true) {
+		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE)) {
 			/* to_ds = 1, fr_ds = 0; */
 
 			{
@@ -894,7 +896,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pqospriv->qos_option)
 				qos_option = true;
-		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE) == true) {
+		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
 			/* to_ds = 0, fr_ds = 1; */
 			SetFrDs(fctrl);
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
@@ -903,8 +905,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pattrib->qos_en)
 				qos_option = true;
-		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
@@ -962,7 +964,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 						pattrib->ampdu_en = true;
 
 				/* re-check if enable ampdu by BA_starting_seqctrl */
-				if (pattrib->ampdu_en == true) {
+				if (pattrib->ampdu_en) {
 					u16 tx_seq;
 
 					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
@@ -1113,7 +1115,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		frg_inx++;
 
-		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
+		if (bmcst || (rtw_endofpktfile(&pktfile))) {
 			pattrib->nr_frags = frg_inx;
 
 			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len +
@@ -1139,7 +1141,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	xmitframe_swencrypt(padapter, pxmitframe);
 
-	if (bmcst == false)
+	if (!bmcst)
 		update_attrib_vcs_info(padapter, pxmitframe);
 	else
 		pattrib->vcs_mode = NONE_VCS;
@@ -1978,14 +1980,14 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	do_queue_select(padapter, &pxmitframe->attrib);
 
 	spin_lock_bh(&pxmitpriv->lock);
-	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe) == true) {
+	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe)) {
 		spin_unlock_bh(&pxmitpriv->lock);
 		return 1;
 	}
 	spin_unlock_bh(&pxmitpriv->lock);
 
 	/* pre_xmitframe */
-	if (rtw_hal_xmit(padapter, pxmitframe) == false)
+	if (!rtw_hal_xmit(padapter, pxmitframe))
 		return 1;
 
 	return 0;
@@ -2029,7 +2031,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	signed int bmcst = is_multicast_ether_addr(pattrib->ra);
 	bool update_tim = false;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == false)
+	if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return ret;
 	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
 	if (pattrib->psta != psta)
@@ -2154,7 +2156,7 @@ static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struc
 
 		ret = xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
 
-		if (true == ret) {
+		if (ret) {
 			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
 
 			ptxservq->qcnt--;
-- 
2.52.0

