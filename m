Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBAC36215F
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472991; cv=none; b=kFmeLdjHfNCabz9am3dtjF1wECctyV8JDUzWMQu7xOWYHb7TFPyWJcCfCYRreGsEULgWnyLO5qdxUwt27UqQtketRVHCkb5f6msxDssRB1vrG9jqXB9slpv5f9wsdHVQ0ynBzoupBIzEF+W7ch6jNGDkpTSdDpp8XFMQyjX8QlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472991; c=relaxed/simple;
	bh=qDuq0yGOKI22gOlKBf0PGwkkhhxaOIQfECBpMMLXSL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bornwCaKtxtqdXaCTYNUrpC+D8uMBcSqk7LO3wJcFN8WOoKXytXYbvIBCJFY+/3yDgWH4w+yWqAjpkCImgbFGgtrTkI24W6dFZ5oJna/ceOzxJgwWDYEqR7dcDxGHmcqSfdS4uSiGdyCqAbmDRucalgvtNYOFIx3HtPUCajs2Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5IQnnot; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5IQnnot"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f223c70d8so617593b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 02:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768472989; x=1769077789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eND/NhtLaC/z2AB8mlhX2K83B1CurXmM8VX2+usxEK0=;
        b=X5IQnnotzRnv4Iq8qjCfYHj8T394giaVgllhPQjGbmZ222CsguSlgzU+qaVzM/dJBV
         i0djg44jTfXL6+o7BKp25ZhjcOU9ZN+Tv2nvUMXzm583xTEpluGQFo/FGmuyoDA4MgiG
         HdpzV5zh2DuT6XBtyxD6ZHfnwtBOGqSHnmC5+gJSm5HSpL3F2RW/3Wr/2zuftAA/zmDM
         zdbgUohS9ytgKvanac1mqTiGqedvaICsoreE4I0xsX2IIgdFnyWOm24yWLP5F9g/meXl
         ZckMEpO+LRrH1axrkGcf3dRsOFcqM1HvrSZyJJZwzkIwjx6DEFQzDjN+ubagnJIzQEg1
         KWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472989; x=1769077789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eND/NhtLaC/z2AB8mlhX2K83B1CurXmM8VX2+usxEK0=;
        b=w/EVIeIn/HbljWcd9YDTicYE+22gZ9RKofOHCR/EmebwgW24yMY6p/+kfFVBnSxD24
         Xf40iDE/0l5mzp8sh/NLd+yvoAxbVH5Y1otZKrhdyOMpHmIEx1oPwcCg/Hd4GQZDiPDv
         veuULW64BkHyi6K0rcituCojSLipyDw0/taTIgkKFdqFJPY0gr1Vgxs+Te1n5H2i1h7T
         CfR1fDc1h+xSHHNlsIaZu8zIvzy5ItdpXoLiJDdw5QXZAzzdtnGP67L7HKN/PfFnvBst
         83S/M9D/NdB+FccC/Mt9tQ5XLg7uuP/9Xw4x121j9ZYWBQxcPsVVuN3ZqA48QjP9QGF9
         d9oA==
X-Forwarded-Encrypted: i=1; AJvYcCUxhPtBlpDT72sb2FgTsXLywnUbie544wV/HEjVfn6fkrxB1meJkmr+Nx5DqR1tGn21rwsPWREPQbwxtKb2@lists.linux.dev
X-Gm-Message-State: AOJu0YzoJZUJE5dtZ8sjaQOkJIDNU6Ot+RalRmI4a5S+yln9b4BKDIgW
	fN7egvz3hJnSz673+EW3e18he/Ux5QIwtxDGzmkvxcI+A8kybN/+owgZ
X-Gm-Gg: AY/fxX6A3Xm4gxsMr9/CBPDV2/Ia9oJjq1bw+1azkNmH9g99BiCZPIj85ns7XkXzSH9
	xk2BoJNM+lNKCgVfPJolBo3h2P6j4EYtLZbI6wbCvFzLvSqCQn08nnW1HOBy9HQ3hyd7uTT8qqk
	a4C5j8u6ztBTVUKk/+y9gYMqAN0X2I4RfLiwuRO7mJH0Ra9xjxdQaTH9oJF/3BsMgKvmj3yJQN5
	S+fUHhZplI5GJEF/eGgXSlFXuMLfBFwnDfs+ozpl6IUPqA0JxFrI7IMrY+mHRnzLvd6/lpIw4ds
	CgBJd77C1pIeebllvlRoUDRS/kaS3fyJXOB6w6a20fLQ5MvN/LOBhTpl3FD5NcQcViOZGfY6ODp
	ksDBxKZ7bqDFHA97v0xG9+U90C8XEiXOGpBCpG0PFG4jxumEB2W03w4JDe/AEtXgIod0KAh8Gmu
	wwTZTgM0QcJmLocF8=
X-Received: by 2002:a05:6a00:ad0f:b0:81e:e0dc:6d00 with SMTP id d2e1a72fcca58-81f81fe065fmr5133493b3a.58.1768472988856;
        Thu, 15 Jan 2026 02:29:48 -0800 (PST)
Received: from snowman ([223.196.193.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4f61fdsm2103488b3a.26.2026.01.15.02.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:29:48 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	hansg@kernel.org,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: fix operator and type cast spacing
Date: Thu, 15 Jan 2026 15:59:07 +0530
Message-ID: <20260115102910.10018-2-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115102910.10018-1-khushalchitturi@gmail.com>
References: <20260115102910.10018-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spacing around operators and type casts in rtw_xmit.c to
comply with the kernel coding style.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 89 +++++++++++++----------
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857fd62..bbc42db1c828 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -78,7 +78,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	}
 	pxmitpriv->pxmit_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_frame_buf), 4);
 
-	pxframe = (struct xmit_frame *) pxmitpriv->pxmit_frame_buf;
+	pxframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 
 	for (i = 0; i < NR_XMITFRAME; i++) {
 		INIT_LIST_HEAD(&pxframe->list);
@@ -238,7 +238,9 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->padapter = padapter;
 			pxmitbuf->buf_tag = XMITBUF_CMD;
 
-			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ, true);
+			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
+							 true);
 			if (res == _FAIL) {
 				res = _FAIL;
 				goto exit;
@@ -248,7 +250,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
 			pxmitbuf->len = 0;
 			pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
-			pxmitbuf->alloc_sz = MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ;
+			pxmitbuf->alloc_sz = MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ;
 		}
 	}
 
@@ -274,7 +276,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 {
 	int i;
 	struct adapter *padapter = pxmitpriv->adapter;
-	struct xmit_frame	*pxmitframe = (struct xmit_frame *) pxmitpriv->pxmit_frame_buf;
+	struct xmit_frame	*pxmitframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 	struct xmit_buf *pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
 
 	rtw_hal_free_xmit_priv(padapter);
@@ -321,7 +323,9 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	for (i = 0; i < CMDBUF_MAX; i++) {
 		pxmitbuf = &pxmitpriv->pcmd_xmitbuf[i];
 		if (pxmitbuf)
-			rtw_os_xmit_resource_free(padapter, pxmitbuf, MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ, true);
+			rtw_os_xmit_resource_free(padapter, pxmitbuf,
+						  MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
+						  true);
 	}
 
 	rtw_free_hwxmits(padapter);
@@ -736,7 +740,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->subtype = WIFI_DATA_TYPE;
 	pattrib->priority = 0;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE|WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE)) {
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE | WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
 		if (pattrib->qos_en)
 			set_qos(&pktfile, pattrib);
 	} else {
@@ -787,15 +791,15 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 				rtw_secmicsetkey(&micdata, &pattrib->dot11tkiptxmickey.skey[0]);
 			}
 
-			if (pframe[1]&1) {   /* ToDS == 1 */
+			if (pframe[1] & 1) {   /* ToDS == 1 */
 				rtw_secmicappend(&micdata, &pframe[16], 6);  /* DA */
-				if (pframe[1]&2)  /* From Ds == 1 */
+				if (pframe[1] & 2)  /* From Ds == 1 */
 					rtw_secmicappend(&micdata, &pframe[24], 6);
 				else
 					rtw_secmicappend(&micdata, &pframe[10], 6);
 			} else {	/* ToDS == 0 */
 				rtw_secmicappend(&micdata, &pframe[4], 6);   /* DA */
-				if (pframe[1]&2)  /* From Ds == 1 */
+				if (pframe[1] & 2)  /* From Ds == 1 */
 					rtw_secmicappend(&micdata, &pframe[16], 6);
 				else
 					rtw_secmicappend(&micdata, &pframe[10], 6);
@@ -810,16 +814,20 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 				payload = (u8 *)round_up((SIZE_PTR)(payload), 4);
-				payload = payload+pattrib->hdrlen+pattrib->iv_len;
+				payload = payload + pattrib->hdrlen + pattrib->iv_len;
 
-				if ((curfragnum+1) == pattrib->nr_frags) {
-					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-((pattrib->bswenc) ? pattrib->icv_len : 0);
+				if ((curfragnum + 1) == pattrib->nr_frags) {
+					length = pattrib->last_txcmdsz - pattrib->hdrlen -
+						 pattrib->iv_len -
+						 ((pattrib->bswenc) ? pattrib->icv_len : 0);
 					rtw_secmicappend(&micdata, payload, length);
-					payload = payload+length;
+					payload = payload + length;
 				} else {
-					length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-((pattrib->bswenc) ? pattrib->icv_len : 0);
+					length = pxmitpriv->frag_len - pattrib->hdrlen -
+						 pattrib->iv_len -
+						 ((pattrib->bswenc) ? pattrib->icv_len : 0);
 					rtw_secmicappend(&micdata, payload, length);
-					payload = payload+length+pattrib->icv_len;
+					payload = payload + length + pattrib->icv_len;
 				}
 			}
 			rtw_secgetmic(&micdata, &mic[0]);
@@ -1108,8 +1116,10 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
 			pattrib->nr_frags = frg_inx;
 
-			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz:0) +
-					((pattrib->bswenc) ? pattrib->icv_len : 0) + mem_sz;
+			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len +
+						((pattrib->nr_frags == 1) ? llc_sz : 0) +
+						((pattrib->bswenc) ? pattrib->icv_len : 0) +
+						mem_sz;
 
 			ClearMFrag(mem_start);
 
@@ -1158,7 +1168,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	mem_start = pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
-	ori_len = BIP_AAD_SIZE+pattrib->pktlen;
+	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
 	tmp_buf = BIP_AAD = rtw_zmalloc(ori_len);
 	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
 
@@ -1211,14 +1221,14 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		/* conscruct AAD, copy address 1 to address 3 */
 		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 		/* copy management fram body */
-		memcpy(BIP_AAD+BIP_AAD_SIZE, MGMT_body, frame_body_len);
+		memcpy(BIP_AAD + BIP_AAD_SIZE, MGMT_body, frame_body_len);
 		/* calculate mic */
 		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
-			, BIP_AAD, BIP_AAD_SIZE+frame_body_len, mic))
+			, BIP_AAD, BIP_AAD_SIZE + frame_body_len, mic))
 			goto xmitframe_coalesce_fail;
 
 		/* copy right BIP mic value, total is 128bits, we use the 0~63 bits */
-		memcpy(pframe-8, mic, 8);
+		memcpy(pframe - 8, mic, 8);
 	} else { /* unicast mgmt frame TX */
 		/* start to encrypt mgmt frame */
 		if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
@@ -1267,9 +1277,10 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 			memcpy(pframe, pattrib->iv, pattrib->iv_len);
 			pframe += pattrib->iv_len;
 			/* copy mgmt data portion after CCMP header */
-			memcpy(pframe, tmp_buf+pattrib->hdrlen, pattrib->pktlen-pattrib->hdrlen);
+			memcpy(pframe, tmp_buf + pattrib->hdrlen,
+			       pattrib->pktlen - pattrib->hdrlen);
 			/* move pframe to end of mgmt pkt */
-			pframe += pattrib->pktlen-pattrib->hdrlen;
+			pframe += pattrib->pktlen - pattrib->hdrlen;
 			/* add 8 bytes CCMP IV header to length */
 			pattrib->pktlen += pattrib->iv_len;
 			if ((pattrib->icv_len > 0) && (pattrib->bswenc)) {
@@ -1375,7 +1386,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 pkt_num = 1;
 
-	if ((pxmitframe->frame_tag&0x0f) == DATA_FRAMETAG) {
+	if ((pxmitframe->frame_tag & 0x0f) == DATA_FRAMETAG) {
 		pkt_num = pxmitframe->agg_num;
 
 		pmlmepriv->LinkDetectInfo.NumTxOkInPeriod += pkt_num;
@@ -2070,7 +2081,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 
 	spin_lock_bh(&psta->sleep_q.lock);
 
-	if (psta->state&WIFI_SLEEP_STATE) {
+	if (psta->state & WIFI_SLEEP_STATE) {
 		u8 wmmps_ac = 0;
 
 		if (pstapriv->sta_dz_bitmap & BIT(psta->aid)) {
@@ -2083,20 +2094,20 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 			switch (pattrib->priority) {
 			case 1:
 			case 2:
-				wmmps_ac = psta->uapsd_bk&BIT(0);
+				wmmps_ac = psta->uapsd_bk & BIT(0);
 				break;
 			case 4:
 			case 5:
-				wmmps_ac = psta->uapsd_vi&BIT(0);
+				wmmps_ac = psta->uapsd_vi & BIT(0);
 				break;
 			case 6:
 			case 7:
-				wmmps_ac = psta->uapsd_vo&BIT(0);
+				wmmps_ac = psta->uapsd_vo & BIT(0);
 				break;
 			case 0:
 			case 3:
 			default:
-				wmmps_ac = psta->uapsd_be&BIT(0);
+				wmmps_ac = psta->uapsd_be & BIT(0);
 				break;
 			}
 
@@ -2214,20 +2225,20 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 		switch (pxmitframe->attrib.priority) {
 		case 1:
 		case 2:
-			wmmps_ac = psta->uapsd_bk&BIT(1);
+			wmmps_ac = psta->uapsd_bk & BIT(1);
 			break;
 		case 4:
 		case 5:
-			wmmps_ac = psta->uapsd_vi&BIT(1);
+			wmmps_ac = psta->uapsd_vi & BIT(1);
 			break;
 		case 6:
 		case 7:
-			wmmps_ac = psta->uapsd_vo&BIT(1);
+			wmmps_ac = psta->uapsd_vo & BIT(1);
 			break;
 		case 0:
 		case 3:
 		default:
-			wmmps_ac = psta->uapsd_be&BIT(1);
+			wmmps_ac = psta->uapsd_be & BIT(1);
 			break;
 		}
 
@@ -2259,7 +2270,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 
 		pstapriv->tim_bitmap &= ~BIT(psta->aid);
 
-		if (psta->state&WIFI_SLEEP_STATE)
+		if (psta->state & WIFI_SLEEP_STATE)
 			psta->state ^= WIFI_SLEEP_STATE;
 
 		if (psta->state & WIFI_STA_ALIVE_CHK_STATE) {
@@ -2274,7 +2285,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 	if (!psta_bmc)
 		goto _exit;
 
-	if ((pstapriv->sta_dz_bitmap&0xfffe) == 0x0) { /* no any sta in ps mode */
+	if ((pstapriv->sta_dz_bitmap & 0xfffe) == 0x0) { /* no any sta in ps mode */
 		xmitframe_phead = get_list_head(&psta_bmc->sleep_q);
 		list_for_each_safe(xmitframe_plist, tmp, xmitframe_phead) {
 			pxmitframe = list_entry(xmitframe_plist,
@@ -2327,20 +2338,20 @@ void xmit_delivery_enabled_frames(struct adapter *padapter, struct sta_info *pst
 		switch (pxmitframe->attrib.priority) {
 		case 1:
 		case 2:
-			wmmps_ac = psta->uapsd_bk&BIT(1);
+			wmmps_ac = psta->uapsd_bk & BIT(1);
 			break;
 		case 4:
 		case 5:
-			wmmps_ac = psta->uapsd_vi&BIT(1);
+			wmmps_ac = psta->uapsd_vi & BIT(1);
 			break;
 		case 6:
 		case 7:
-			wmmps_ac = psta->uapsd_vo&BIT(1);
+			wmmps_ac = psta->uapsd_vo & BIT(1);
 			break;
 		case 0:
 		case 3:
 		default:
-			wmmps_ac = psta->uapsd_be&BIT(1);
+			wmmps_ac = psta->uapsd_be & BIT(1);
 			break;
 		}
 
-- 
2.52.0

