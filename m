Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B33357A4E
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 16:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769100513; cv=none; b=l/DfwirYdyQyBt1cDQHx05GSoKruztlJ0CfyXHCGtUOGio6JOMFp0FufvuZ9pE/yebowKrDKiPSsDDqwOBZ/rqmKe2P+CtBRZisgQ7MRxs6lr0iTI2n0VhkatupuIoiS+eYio9JEhciRlqbxVg9fbThVH0+ayHk1CWF5SUejFv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769100513; c=relaxed/simple;
	bh=Fk179Kgjd49eZpOBo6DakzximVAgFm87dme/OzzAm9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADPLkN5nUsGC0vpgdp+fdSr7WjDCxPGutH9IYK/y4/zTOOP4u9ByN2/xdODYzBYanM7h5GSxYN/9o7AuHfv1CfhZc64w00IK+GZMxtkQWPTahGiOyHd7JSuMxlZ3C0PGu8AggaZLPC+AsBHLxOOYSb/K6zvt99zu4NxZ+G3vPCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQPeiqGv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQPeiqGv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a07fac8aa1so10510725ad.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 08:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100491; x=1769705291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTvK+LM7xjOnWwqq+wggWH8zsPRVLVMxxDlcC5gcvWE=;
        b=IQPeiqGvVbBBuYBgLmpmsdmU7T/W5KcAPcySIM8wxFZAasphn32MCkxuHCBae9jRq1
         gLTPC9OyXdX3hx8YYgmj0wDOugzkiSvW85/rWjXwFt9Bt+2Fc4Wolp/4Vf2biEJvbQeG
         /oP/NNZbIjxdJASiZINpvLBfcipf1OE/X4KhAkwDpsIwmqdaY0AJQCgKqHdlBr8lqiTp
         CzC19b9xC+NYfZ65ACJSj/Sb3tx3zTn+SAgTw/58QoyfzCnq2E7lzgo+MxUGbt7LKgKx
         xBAuoIGCHZD/c4VI5PW9LZEzDshIKqS+c4jp3+QcrRnfHvLrHWNpB1/nLfokLF/ojXm2
         TMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100491; x=1769705291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TTvK+LM7xjOnWwqq+wggWH8zsPRVLVMxxDlcC5gcvWE=;
        b=HkmxWH+1FPZgJw4ezxzmGrROTXptSgv9LgyOR6EIu2LRgtA+CofC1KJhstFVKH+Owe
         1p+w8HJ+mppq7693uzx3mrEfF3qJN0/UqJEYo9wBJGqqXVmYYN8epGDNnbxneKJlqkl/
         0nGeZVpyBGmmLsqEp8d7Zb31X4w8T8816vAorX9SIiG6fVddLQAUjFUb5o6/1CQmCLmE
         EvWf9qkJ5/ikKpou413Y8+XLcr54GKZFmwRYnqOrljLL6VCEnGH03CcOKN3CwFmGQl8m
         oPSce8IiAhqCnVFmIq+8WDQDsZnX34DOnPLH5Sgxx80NVWfZgMl2SXfqLl3R2s6Clzrk
         4WkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWSlMG9jEyCqe4mLWcHHBwjPdl2aFL+Ia+E8YLq1eborPkXvkliwvxJTF7A8gdNEaQ0G8NLNUsD+va4AYR@lists.linux.dev
X-Gm-Message-State: AOJu0Yy63eMk0xiqp+pR3o+CzoEbI5+a4Z89tr+jdb5u1I0GE9YI4eIJ
	qEiMyRSyhf7cvXZWUf0yAA6DVt1C6VvjJ2UbmZUKAjozLzZvWrv+730B
X-Gm-Gg: AZuq6aJb/3IewHBkp65ilj0R7QY2rzaZdNk/+U89DhJ0F7a344CSg9bZGNDOuDMYrGQ
	Rqwk4zrweWsboaHV5RmwEla0J/isXPAm9WHe62KFmWTOb1YwLumJi7+8mbJFQe2vNYyh9O8a5tM
	YlZpxx/l2L/h4L3knTs5MLu4RHx+zCdPalhuAMtWpHqagGWBazgrbWDwgPl7XA2ie38bXsE+jYC
	l0deVeGk9ozJCelcEB2dPzcXb+NLKsRVJTvC060MqGu6qvR4A/LJNx0kVS+Aa0d43Jdj1tn+ezm
	s8g825lbtqyx1brxY2HbtKcSo0XTtnJbegwiQN42EQ+hypDbv6j42rVFAH9Vb7TOvQC/2V4auSk
	Wa4AVGMi3XUQf2gf6EyK1k8wpeOvkV4iSDOL2gZoQAgo+F45gVLaKtVFdGvZpFnVHUQd4UKIb7X
	Lq6AAfzzbKdLW1H31fqP048ikom0PzvV4igl4=
X-Received: by 2002:a17:902:ced0:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a7fe73eb54mr302975ad.41.1769100490992;
        Thu, 22 Jan 2026 08:48:10 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd523sm189986225ad.62.2026.01.22.08.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:48:10 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v4 1/3] staging: rtl8723bs: simplify boolean expressions
Date: Thu, 22 Jan 2026 22:17:49 +0530
Message-ID: <20260122164751.37796-2-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122164751.37796-1-khushalchitturi@gmail.com>
References: <20260122164751.37796-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify boolean expressions in rtw_xmit.c to comply with the kernel
coding style

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

---
Changelog:
v3 -> v4: Fixed alignment and removed extra parentheses.
v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
v1 -> v2: Corrected commit messages.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 40 ++++++++++++-----------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index bbc42db1c828..1ab1937fa2d7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -384,8 +384,9 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
-			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+			if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS &&
+			    pattrib->ampdu_en &&
+			    padapter->securitypriv.dot11PrivacyAlgrthm == _AES_) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
 			}
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
+		if (pattrib->ether_type != 0x888e && !check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -639,8 +640,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -704,7 +705,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
 			res = _FAIL;
 			goto exit;
-		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) && (!(psta->state & _FW_LINKED))) {
+		} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) &&
+			   !(psta->state & _FW_LINKED)) {
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
+		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+			   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
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
+		if (bmcst || rtw_endofpktfile(&pktfile)) {
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

