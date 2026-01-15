Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C0535CB95
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469853; cv=none; b=qp5WZ382rkiNOWx7pL1Ub9IKZwLD1gg6tuHNn5qjRX8Yt7SmduMH2Cs0RPbES5nm3YrsY7hzi42LFTozgkwuGJkUlF9bLYnldKm6kQW3mbl2MbFNdxtK21kevfAq1Nj4e0Bhg7G+ztEsIJssU6EnkFAz1lbJmt9C8zSbMhvclAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469853; c=relaxed/simple;
	bh=3QdS/denaq16/3sivzZA0Q6Ucn9w5M5cvWYwrrN/Rcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8iPgH3eFFE0yKPkpc1VIg55xklubyFAiMzaelcVyKmo7YFYiYtlQ3xr0lIL9p940qb9Pr0OVWMWISD5D7bz21k5FLvrKQGIauxiFd9/eSuqaPprBsVuiYn99EaXXQl8vCB0pGiWbpWXP5jHSvqIpjakPItNM0LYy/T9DyLpBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZaeiXXj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZaeiXXj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f102b013fso7796155ad.2
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 01:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768469850; x=1769074650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KWROqewGtb9x4YqcV1XLj0HExKDP9GByF0lRk9d/q0=;
        b=AZaeiXXjxIPhNei8mgudxn6JVg4YqSMl+FpgUHXI/ZoaRH0OX56lrsh5tE6e6+0b94
         MvBaKwoaoQUYeNghLuyEUyyegtCbOvbsvzoxYBKeItnpwQHyofkbk7yVz5zF04LxVhCn
         hCQfsEnbVg2hmlzxTDhbtNWAl2OJajHTuAWHGXRAaybUn4qnpuzJEoJ6n9A72DDR55Zq
         +yvlwwA4p11K7L9BoSa/wehCTiDUfEWG2ooxzH/0/aiHQ0SmSJSa0OyUIqYrTZO3pj04
         x+iugjxA1hWYMAbjbrlZDJhq55Rsx4FeICQKGiodS+Hnv7l603LBL/KYjYDGe5pdRGmH
         5teA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469850; x=1769074650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/KWROqewGtb9x4YqcV1XLj0HExKDP9GByF0lRk9d/q0=;
        b=v5nje74SGRsVENw6IeTPb0dSfk+RSjs3Y1gKApGehPtWXBeFrIwbbDOr17iEnwWkMt
         IsUv04O+YfKI34kgtvyqm3zO7kQY7Ot0w0AumOI2Vpihd71Zx89Mxk41Q+n3qziShp/O
         Ovu6Of5ykIHXN5q7j7cVp0biMvFiyrPBlwa9dALDPahgl5H0t3M+mhiwAjb4ITleHgqZ
         zUiZ9yKCW28By9SNch5l05yJQ+mrZD8r9VQuOCDPFyd2V0HGRTca/VTP+PWOXXbREyAS
         4AdP1qucPJ6qWW9Y+7gdBQdPmRJapLYr9SIspuJW+XrbRlLfA4NyCc4VqTzFoBQl4A9h
         0Wlg==
X-Forwarded-Encrypted: i=1; AJvYcCUsNXfX2BgatNyyOmzHfrC/P7b2AvG7Qm5fB8LvN43qUFfB5rUeKiwQPCqaPmtkJs3/2mbk4waRjjCeTwG6@lists.linux.dev
X-Gm-Message-State: AOJu0YyGUaQGZNFHrFfWtTYTUVF6TJ7xAT1V3OQvQUy1kvo3ejOInx6Z
	04K6D0x26UBoEHrbHD0rTh1wfEmBNry1vqjVy614xHQS3lnBRAQol7rA/kOK4/zKodE=
X-Gm-Gg: AY/fxX7PCuR8G0b5nujLu3DKkmLvKY7TvhILoCLKre3oRhWYCslgr8DqF4OdDPfwltw
	lBufuovHIbMomBAKBhhSs56+R75QWfnQxFjv6iJS0myKD2+w5911AYxYYl86RtMwwNrasjBBK1A
	vIhP3PipxdnxPNAtlafCrGzoRHFjYIpe7e8EuyL2RQTdd8u0f3h3cdbcJZPf/c5hAc574MrgVIP
	7MmKhi51efZVeDuJxposmInERZi33CQWrnHQ+DvZ06mjYlturk4v3I5/11qWpFOoYK4XLfbjKh7
	leP1TD+j7fXWmqk4nBfPLeZhAxfjgtfDKmCO5fGJvJ8Tvc3g4G5a0Y1z96tvx6x52hW8zxfz6SF
	rLG83NkVWopEyRRQ/lNfs7FSYCv894WfORpIOpBpSDA44KhLU39R6kzpBKqVT/LfaBAmBdHKDMr
	crfiEMhjF3c4VoLiQ=
X-Received: by 2002:a17:903:46cb:b0:2a0:b06d:1585 with SMTP id d9443c01a7336-2a599e12199mr61486395ad.34.1768469850051;
        Thu, 15 Jan 2026 01:37:30 -0800 (PST)
Received: from snowman ([223.196.193.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48dc1sm244063595ad.40.2026.01.15.01.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:37:29 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	hansg@kernel.org,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: simplify boolean expressions
Date: Thu, 15 Jan 2026 15:04:37 +0530
Message-ID: <20260115093439.7588-3-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115093439.7588-1-khushalchitturi@gmail.com>
References: <20260115093439.7588-1-khushalchitturi@gmail.com>
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

hi

to be squashed
---
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

