Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815623624C0
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472999; cv=none; b=k0O3pP568cu/73IJLg8UgvtezmmUKrY/FWx3O2U9wgVKbDBsOWEQoo9kjG2XypC2hmRY8Lad8g2htTXbGDO5gLw78qa8GCmsbcHzHCjteCjIMlW+EpL49xh0nL+2AsIQF7RL7oPEo50gsekR5dfdun24C7rHGNHXIbri4U/Ca8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472999; c=relaxed/simple;
	bh=MSoFKp0LmmZvHV7rSDfoOeOdR7GFOpphUpJmOesMH58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G90rk4Owr0L4waRbvM3yrnqrT+x4udTjt2Jtm5egH53oB8z/F/N95iLn3/u1IkUsVE+8A2rV9Mm2Bor2rOcDDKfaFzohxVwHeE8Kef4J8NMYWTRn/r0wju8oXZLRRBdi5/eIgGXlRGuWGQsQsgGAEBFZySPIxwz3uW+qz7KRBmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qp/uumSC; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qp/uumSC"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81e7477828bso388340b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 02:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768472998; x=1769077798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYv7ARBp1kGaj0EE4/j9Qg31wyJiLU5Fgq9K+a3qdd8=;
        b=Qp/uumSCsLqRbmM/dYKT+IuOH11PGhi7xPsHb/yXPXfHBLLUp1nCxz8cPrK70wxy2q
         LkYnP0re7itYKyAVsCD9In3ehuDsvpPP/QqggaeuaN4LjPEQyISz0Fy/ALN44FFJhEfC
         K+PzPmPoGOa7MxqwkbD2NHW8I2Ph2UpAHPDjtQVo96kzb47/Fv1yipAcTFCU3IdskYtt
         ZDCJnjuLSA+1Bo/G/KlKOMA4dHJ8T4jvRrJeNRu0af3e173hveCQdaZ63FFi3fdkS8WL
         GTb6tO8j3dmlGdBryOOa0JCK7tD0WCkTLar8I7Ua+UsC3xjQ+hlJEMBK2kAVx2qfS5Ih
         TPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472998; x=1769077798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYv7ARBp1kGaj0EE4/j9Qg31wyJiLU5Fgq9K+a3qdd8=;
        b=L0TP0gJVC7zvQB11yY73iQEmp6b5gUACj1UMlAcR9xfEMmF2GuBGO/HmT/Y7ywh06Q
         A8YV5D6ebDHmqFBGxBVGGcpcuu7SWoMKtUrkXmEzo9lDUL/kxr4C9kRZc/o/EYZB/NjG
         lxNHcIE0VoGs0E/8Bb3fgLqrbfcbMluzdA1W4NbTtffDZDQqRu/zH1B3sXQmLSHv0kDY
         o7bGecIlfpfqC9TrcZs2o37N/ie4MEFtLLlYnBdzXxDjHuDK4p0u+IRkiVUCXUpBilyi
         bR8wyNSsRSb+BuaPaYsvJrpjctYmsBKbg53SsVQGd1igHmU4fHCRdWUUQE5o2uklYuSt
         nt9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS0zOWJ9zC05QTc89HM6q0O6VKz8KIubSpCFTn3WZbhAdAsFApmkSpCVm0EzA/NYos7TMwpDIQmaHhl0Bp@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo4PJf/QrV/E9CpKTQTqi8zfRCtRH87mgL1diGfJzlMv/9g+FK
	X27oiNszXilqG2LH6+om95umipdLfYs0XR7ovDC5ziMSaXAzAEH3DUYL
X-Gm-Gg: AY/fxX4e/lSvqV1FhX2z0ouMWR+SKAojv/ARLc68qvfEg6rhEQSoVQmG1sK4LT20vdI
	h7SywHJRSOgYsIMztPTh0LnJ26j3mQabtSM2nQw8Bxx3bwNH7vMevWt70uyQTILJxVZQ/idOksU
	MDsyX8AUozaaq1krA5L7T+VsrGu2jjBtej8UsllHtxE7XwHcNgF8tmJ5gAma0AEieHs17H+mOZH
	p1dVZfdVoZdtqvfnzzCp8R0szZ1YTEbnjcfLV+3UvP1laFwn1LpY9GLqVduhVVAnD5eg6KhXim4
	5osT3TcNNMKXW7JnRrbLsRdnrc2eeVmcskYmUcRjbamJhOtMIHDlcHMBHRrUUL7rXIGLj5s0scl
	t/jM3EPf9gCZOaa6LHaP9Wn3JP5g9JT0W13Tyk0XLWL7YKAr2hXDjQ6shyyUCW4HblBJqw566uH
	TiGi4KkQWDvV3LIY4=
X-Received: by 2002:a05:6a00:b45:b0:81d:8872:941 with SMTP id d2e1a72fcca58-81f8f151963mr2294193b3a.26.1768472997849;
        Thu, 15 Jan 2026 02:29:57 -0800 (PST)
Received: from snowman ([223.196.193.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4f61fdsm2103488b3a.26.2026.01.15.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:29:57 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	hansg@kernel.org,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: simplify boolean expressions
Date: Thu, 15 Jan 2026 15:59:08 +0530
Message-ID: <20260115102910.10018-3-khushalchitturi@gmail.com>
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

Simplify boolean expressions in rtw_xmit.c to
comply with the kernel coding style

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
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

