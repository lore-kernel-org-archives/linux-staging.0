Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749C223183F
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156610; cv=none; b=kJorxN7TxBaEgcJRKWDH8AH7U05/Yhkov2SryzPsr8fO7oOQPabSyGnoywatLkiksrfpLgUIhcwqEw3fmv9AVFzw5LSF3nqSnfZRWrFc8UmIDB3MxOvegKLHMPvmE2F9XITatImqOqM0VnlVPfeuHIA0RLiIMDL6NckFILHYVtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156610; c=relaxed/simple;
	bh=d6C/dia0qGxeSDOXk6Hxgv9NMkIPmeQmTrn7QidYSrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9dJcf9yOXvKYMkjCksdMCbBVZJuNneAMmETikqQuBxZmXr+ksA9eCEdYQX+85TjdEp7vxJ72B61N+6/6it2lEroaFVB7FwB+Crv9pP7JhEhb3zgFzCF/qEAtTsRhtNLgglDxMkcfcYaKUDvIjNrTvdBE27mGEXapZnpVxMzmHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlophcCC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlophcCC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a12ebe4b74so56104905ad.0
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156609; x=1768761409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8mkfx/tVoOUsfABu5Q990K51/MRrsUFb3XWiRKeDdI=;
        b=VlophcCCRGqzfQQDUOFDI8zHpU+8fQ3C2W7yMuOVJr3msm29quPl7+j12cIVa4zOho
         Oa96QtB3kO5IR36tghOYweYH7kB0koJ9tyjMQSE+V0QuXnVflLlx5jG6IUOTQB8ofsPv
         jBBBuqG/MnMdh5LLdNzqM433cF/uFnhbxDEXG33bdDt/q+knl+iJvEdMwifVK7RF1uMu
         U3orCjxPztTaL0Vrt0/++m5cmjE0lT2fmnmnPzG2d5mZvHHnazWyOfAB5PkXs7ppaCAZ
         5pXygy7IPe+as27N9IqV++yw1tMT2o0VIj1KeJijQywmRrz3J3+DSCawORQsYgCGSagg
         1NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156609; x=1768761409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8mkfx/tVoOUsfABu5Q990K51/MRrsUFb3XWiRKeDdI=;
        b=eDXRZBbw3uvqjFNsh5Tfjl7qXxyn0ZpVZSKvC4kBSfmuQSxNHZJ5YKEWCbFXNWq9FL
         q/rDDNGhiXcmdrsOB5DtMq5WpT9PSgA996Q4Amp2cyIXDqw/6oNxdigKXolh1kn3Fg0S
         0CQa1FrDDuEmVWmvwrG1WFCjyGVXuTKLvYv08x2Uf15HDcjlmYV9cz8cpnv0FQPxteEU
         bJYic2cwpzniOsP0O81OfLeVei2N5sBgfI613mN4RpgpjIR72Yh+tj724u6DEKOJ8L/T
         kDPyP3FUAm7laaz8N7+sYAsMUocrK2peh4Dmms76R88rV3ovo+7mM0MBLkIhPGccbL3V
         mtBg==
X-Forwarded-Encrypted: i=1; AJvYcCXdys9y028ENeqrA+uX4o4M2S88DHPeIeQqCF+IqMvENCDyr13Ci7eua7jKR637o2emWveLJ2ZaPCHtWWZw@lists.linux.dev
X-Gm-Message-State: AOJu0YyZIXPO8j2yBxA08BLBYoRV9idKa6mg/1FFH1qptmfX1gGQ9zgC
	0Bt5PEkx24Pqy9c0NASdVTRiAW2ztgX8xquTrTedciS+gxhONBxGEaEd
X-Gm-Gg: AY/fxX7//DQLO8mbaJ0zWm8jC0eAVUop4kAuMtomL2K9ZJ/218X9/u0NsDIPUU3dA0X
	FiLq/HMia9pKsAAi8Js+IRkLnaaDeEqSNgjuDLwRWTZdA3qbdwxoQNmm2dkOxntVEWmANenaGLk
	720jtqhGDn08EDIsoth/ggHjl7y+QfXis5GXlcH/WstYz3NfyZsYZ8YuasOJ1HegAn7zT+ZF9tG
	rYn2rDKOvt3cg+LOdmRxQIXQcG8ddRhoNemYmUb6RyKUp091fBAWd+4Iz1tYboWq20T5JMu6dkP
	HTr3HzP7QfjO27FNVqvROFookpTHNzXBufBK2R84zkfV1ch8xlQkQj6hG2tmCwAVQ4ZdcJKiXv9
	CwG25T6/SK8pWPP4TfgclInwPimaApqo7LTk4eWBmmHEx/uxd93l34lCCoqBRVsDfpiB78bSo3X
	fzNV/onWk48EWPJVrrhWitW4j2
X-Google-Smtp-Source: AGHT+IHBeaN9Ve7eKGrK9bYR2KOFgKPEBKFQvqQ1eh0w5zA5cxq2BUB4KK9iVsoYYpmZAyW3QMCzRg==
X-Received: by 2002:a17:902:c407:b0:2a1:14dd:573 with SMTP id d9443c01a7336-2a3ee429d3amr138295615ad.23.1768156608600;
        Sun, 11 Jan 2026 10:36:48 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152220415ad.86.2026.01.11.10.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:36:48 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 1/9] staging: rtl8723bs: fix operator and type cast spacing
Date: Mon, 12 Jan 2026 00:06:22 +0530
Message-ID: <20260111183630.12816-2-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111183630.12816-1-khushalchitturi@gmail.com>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 76 +++++++++++------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857fd62..b0d7e59e492d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -78,7 +78,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	}
 	pxmitpriv->pxmit_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_frame_buf), 4);
 
-	pxframe = (struct xmit_frame *) pxmitpriv->pxmit_frame_buf;
+	pxframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 
 	for (i = 0; i < NR_XMITFRAME; i++) {
 		INIT_LIST_HEAD(&pxframe->list);
@@ -238,7 +238,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->padapter = padapter;
 			pxmitbuf->buf_tag = XMITBUF_CMD;
 
-			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ, true);
+			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ, true);
 			if (res == _FAIL) {
 				res = _FAIL;
 				goto exit;
@@ -248,7 +248,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
 			pxmitbuf->len = 0;
 			pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
-			pxmitbuf->alloc_sz = MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ;
+			pxmitbuf->alloc_sz = MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ;
 		}
 	}
 
@@ -274,7 +274,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 {
 	int i;
 	struct adapter *padapter = pxmitpriv->adapter;
-	struct xmit_frame	*pxmitframe = (struct xmit_frame *) pxmitpriv->pxmit_frame_buf;
+	struct xmit_frame	*pxmitframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 	struct xmit_buf *pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
 
 	rtw_hal_free_xmit_priv(padapter);
@@ -321,7 +321,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	for (i = 0; i < CMDBUF_MAX; i++) {
 		pxmitbuf = &pxmitpriv->pcmd_xmitbuf[i];
 		if (pxmitbuf)
-			rtw_os_xmit_resource_free(padapter, pxmitbuf, MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ, true);
+			rtw_os_xmit_resource_free(padapter, pxmitbuf, MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ, true);
 	}
 
 	rtw_free_hwxmits(padapter);
@@ -736,7 +736,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->subtype = WIFI_DATA_TYPE;
 	pattrib->priority = 0;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE|WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE)) {
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE | WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
 		if (pattrib->qos_en)
 			set_qos(&pktfile, pattrib);
 	} else {
@@ -787,15 +787,15 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
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
@@ -810,16 +810,16 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 				payload = (u8 *)round_up((SIZE_PTR)(payload), 4);
-				payload = payload+pattrib->hdrlen+pattrib->iv_len;
+				payload = payload + pattrib->hdrlen + pattrib->iv_len;
 
-				if ((curfragnum+1) == pattrib->nr_frags) {
-					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-((pattrib->bswenc) ? pattrib->icv_len : 0);
+				if ((curfragnum + 1) == pattrib->nr_frags) {
+					length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - ((pattrib->bswenc) ? pattrib->icv_len : 0);
 					rtw_secmicappend(&micdata, payload, length);
-					payload = payload+length;
+					payload = payload + length;
 				} else {
-					length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-((pattrib->bswenc) ? pattrib->icv_len : 0);
+					length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - ((pattrib->bswenc) ? pattrib->icv_len : 0);
 					rtw_secmicappend(&micdata, payload, length);
-					payload = payload+length+pattrib->icv_len;
+					payload = payload + length + pattrib->icv_len;
 				}
 			}
 			rtw_secgetmic(&micdata, &mic[0]);
@@ -1108,7 +1108,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
 			pattrib->nr_frags = frg_inx;
 
-			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz:0) +
+			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz : 0) +
 					((pattrib->bswenc) ? pattrib->icv_len : 0) + mem_sz;
 
 			ClearMFrag(mem_start);
@@ -1158,7 +1158,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	mem_start = pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
-	ori_len = BIP_AAD_SIZE+pattrib->pktlen;
+	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
 	tmp_buf = BIP_AAD = rtw_zmalloc(ori_len);
 	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
 
@@ -1211,14 +1211,14 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
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
@@ -1267,9 +1267,9 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 			memcpy(pframe, pattrib->iv, pattrib->iv_len);
 			pframe += pattrib->iv_len;
 			/* copy mgmt data portion after CCMP header */
-			memcpy(pframe, tmp_buf+pattrib->hdrlen, pattrib->pktlen-pattrib->hdrlen);
+			memcpy(pframe, tmp_buf + pattrib->hdrlen, pattrib->pktlen - pattrib->hdrlen);
 			/* move pframe to end of mgmt pkt */
-			pframe += pattrib->pktlen-pattrib->hdrlen;
+			pframe += pattrib->pktlen - pattrib->hdrlen;
 			/* add 8 bytes CCMP IV header to length */
 			pattrib->pktlen += pattrib->iv_len;
 			if ((pattrib->icv_len > 0) && (pattrib->bswenc)) {
@@ -1375,7 +1375,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 pkt_num = 1;
 
-	if ((pxmitframe->frame_tag&0x0f) == DATA_FRAMETAG) {
+	if ((pxmitframe->frame_tag & 0x0f) == DATA_FRAMETAG) {
 		pkt_num = pxmitframe->agg_num;
 
 		pmlmepriv->LinkDetectInfo.NumTxOkInPeriod += pkt_num;
@@ -2070,7 +2070,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 
 	spin_lock_bh(&psta->sleep_q.lock);
 
-	if (psta->state&WIFI_SLEEP_STATE) {
+	if (psta->state & WIFI_SLEEP_STATE) {
 		u8 wmmps_ac = 0;
 
 		if (pstapriv->sta_dz_bitmap & BIT(psta->aid)) {
@@ -2083,20 +2083,20 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
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
 
@@ -2214,20 +2214,20 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
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
 
@@ -2259,7 +2259,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 
 		pstapriv->tim_bitmap &= ~BIT(psta->aid);
 
-		if (psta->state&WIFI_SLEEP_STATE)
+		if (psta->state & WIFI_SLEEP_STATE)
 			psta->state ^= WIFI_SLEEP_STATE;
 
 		if (psta->state & WIFI_STA_ALIVE_CHK_STATE) {
@@ -2274,7 +2274,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 	if (!psta_bmc)
 		goto _exit;
 
-	if ((pstapriv->sta_dz_bitmap&0xfffe) == 0x0) { /* no any sta in ps mode */
+	if ((pstapriv->sta_dz_bitmap & 0xfffe) == 0x0) { /* no any sta in ps mode */
 		xmitframe_phead = get_list_head(&psta_bmc->sleep_q);
 		list_for_each_safe(xmitframe_plist, tmp, xmitframe_phead) {
 			pxmitframe = list_entry(xmitframe_plist,
@@ -2327,20 +2327,20 @@ void xmit_delivery_enabled_frames(struct adapter *padapter, struct sta_info *pst
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

