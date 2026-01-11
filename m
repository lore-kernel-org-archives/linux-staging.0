Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCF934D38F
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156626; cv=none; b=O1i5/INfD20YXpg39rgmRrnvaNJo7V4SKgt521QeGbkFbAhFjZOTGBlL7At+06MKpA3qo5LvvE4GeVwFngMUdEIgpefkuAS1PEPXdwutnkbscav0zunELq57woDvlhGqxtnj2d+w6FoJ5pQp0Sa575rqa5MrTa4dYP6VQMWa8SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156626; c=relaxed/simple;
	bh=kEwZiPUFrXyVTfLQuCVH7NR6bHJ5ULh6nxDKa5Y/yGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gReGClIgAdgcGco7IzRnunm4m5rxinLIW4UXePE6cdeILvUoj7Et0hbKfsRYyetQVPxcFNGAQvZ8cri9vg68WY6W2mUJYUQGe9LfiKOB3vMi6T1QXDZNGxphrqvCVfqFF+waZZW7Ak7ig0owftm3ttjQRCXTQjzUJ3AQrKkZeRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJi3uZxp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJi3uZxp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0bae9aca3so37639365ad.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156620; x=1768761420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQZSC/Rrg9Yg1EfbvaC7JoYAicHnfitzRP5DtHj1big=;
        b=CJi3uZxpY4e1HhTnED56z/cNTM5IyfXFxCF4Y79FmIrtOM58M+bcI9oNunh9+mhGZI
         ehTJfvIe7E0HeZMN6OOz7NHWjcmcCun+6A6fSjd0fX7kNRJhgQv17GmhwJMZgjvZlyMS
         Hy5W+1ARQr+zI+/jsSXEeCwr8kXTHLncfnjmg28ZkX49/cyg5mAR1QehxiwrDI3vUFaz
         BE/0UHjq9tI3Eq9+hpUd9yxzc48PZdLohayovO585iSKRLSZIb+psoBNMEmbyuL9J1yP
         lT8D8HQr6x1XqYOfcRxWDVUmbeMVvc+45FUznzmnsF3lenMsEABspCgFs5D1CPwTS1ax
         m2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156620; x=1768761420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LQZSC/Rrg9Yg1EfbvaC7JoYAicHnfitzRP5DtHj1big=;
        b=TC2pkOgs5aGSbw788wMFRe0VOSPFOiGRcqNhWjzOjJqvRi6rFE8YxUfYP8TMtkATww
         KLEE3PFOoXAeLppW/6KJF9YiM1VTgfrqrOMtojE8lRlit0X7hVXDADR0xxcMqBEzQaCE
         vcglGok8pc88giLIOuzme44FezNvC23+hXEJjDv7l2dEIOduqzb//BICenBMYh/bqwnj
         Vd9Om2lwa9Cxd4Gyy/jU5IZrrKnuU6NtSlpiQmZWSDYzABE8rUEob7nNMPPV57NwHzdR
         BPN6jyxc3UFOLadWjPEo1oSooTR4ScpQoCdvyaefUWA1gHR3s1Nb94i8b2+vEdCdr9c7
         i3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8IWhqrwD3Z1ZsupG7FwocVZyGbKSxaP7VP0IuiGHDy6a8NYGK+pDvxPWJ9kBYg6ggQ8RXFTpfxoZwGh9m@lists.linux.dev
X-Gm-Message-State: AOJu0YyYY/L/o/aKeCsbtiZagosE9oMXh7wuCAqkAD7SgI1Mnhz/kXIY
	8mBoV+u3iPiME3IdAhXNBcY7WaOynwP/Lt4h20fpzaLhXj3HJdylk3sq
X-Gm-Gg: AY/fxX5MnHnLfnoV5ERd6/5k07GIcZG9ROAi1tJ1ib1+PFWIfLPZl/SROkrKuGtSp2o
	rsLgdE0Dp33IDVM/9c6GF2opf4KIjVcg9FK3bi0MyTDgHaU670y0o82f9rbgMUMLVITkpvagSWm
	ujh2rqmzH5i/m/wIVR2/hfWoFq0wx3MGqVV9Q0zcOAk+8lD/Dd5mm8xTHRBA355kzj5ti9nCBH7
	wfUViBWjYDZkNddefod99qDYBBviXQ4sEJ8EQFyuaiKzHOa4c3HPEMOSWRqqsS0FJTabBUc8A/s
	okAcdV9TL1nhKGDXZTtiMMSdV4uW9qck/qRGSeKK7JQIwRNi2Ng1gfSfRLtmFOQY+msZ+mK2/Cw
	bGadXzmJBjaG2VVKda2F8qkai5J4ASNXUSVGbJw+d1peLsf9jS6BPqsOHizb5QU8k3WIVNsj4ET
	eKeak7LgC0SBCcL8Rdtcor/geP
X-Google-Smtp-Source: AGHT+IEGqCaGQ14ckEcZ5sTiLa0Zi3xvfCRfTt9I/wBNx1nKepif/5yc5g5wiDHSrnuQN/y1xcnzlQ==
X-Received: by 2002:a17:902:c945:b0:2a3:6b54:5d42 with SMTP id d9443c01a7336-2a3ee5072a4mr162188095ad.59.1768156620151;
        Sun, 11 Jan 2026 10:37:00 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152220415ad.86.2026.01.11.10.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:36:59 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 3/9] staging: rtl8723bs: simplify boolean expressions
Date: Mon, 12 Jan 2026 00:06:24 +0530
Message-ID: <20260111183630.12816-4-khushalchitturi@gmail.com>
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

Simplify boolean expressions in rtw_xmit.c to
comply with the kernel coding style

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 36 +++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index cf7d92a85d6c..b0a16130a883 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -380,7 +380,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
+			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en) &&
 			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
@@ -416,7 +416,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 			/* to do list: check MIMO power save condition. */
 
 			/* check AMPDU aggregation for TXOP */
-			if (pattrib->ampdu_en == true) {
+			if (pattrib->ampdu_en) {
 				pattrib->vcs_mode = RTS_CTS;
 				break;
 			}
@@ -478,10 +478,10 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
 	pattrib->mac_id = psta->mac_id;
 
-	if (psta->ieee8021x_blocked == true) {
+	if (psta->ieee8021x_blocked) {
 		pattrib->encrypt = 0;
 
-		if ((pattrib->ether_type != 0x888e) && (check_fwstate(pmlmepriv, WIFI_MP_STATE) == false)) {
+		if ((pattrib->ether_type != 0x888e) && !(check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -635,8 +635,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -700,7 +700,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
 			res = _FAIL;
 			goto exit;
-		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) && (!(psta->state & _FW_LINKED))) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)) && (!(psta->state & _FW_LINKED))) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -872,7 +872,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 	SetFrameSubType(fctrl, pattrib->subtype);
 
 	if (pattrib->subtype & WIFI_DATA_TYPE) {
-		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE) == true) {
+		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE)) {
 			/* to_ds = 1, fr_ds = 0; */
 
 			{
@@ -886,7 +886,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pqospriv->qos_option)
 				qos_option = true;
-		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE) == true) {
+		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
 			/* to_ds = 0, fr_ds = 1; */
 			SetFrDs(fctrl);
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
@@ -895,8 +895,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pattrib->qos_en)
 				qos_option = true;
-		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
@@ -954,7 +954,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 						pattrib->ampdu_en = true;
 
 				/* re-check if enable ampdu by BA_starting_seqctrl */
-				if (pattrib->ampdu_en == true) {
+				if (pattrib->ampdu_en) {
 					u16 tx_seq;
 
 					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
@@ -1105,7 +1105,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		frg_inx++;
 
-		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
+		if (bmcst || (rtw_endofpktfile(&pktfile))) {
 			pattrib->nr_frags = frg_inx;
 
 			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz : 0) +
@@ -1129,7 +1129,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	xmitframe_swencrypt(padapter, pxmitframe);
 
-	if (bmcst == false)
+	if (!bmcst)
 		update_attrib_vcs_info(padapter, pxmitframe);
 	else
 		pattrib->vcs_mode = NONE_VCS;
@@ -1965,14 +1965,14 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
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
+	if (rtw_hal_xmit(padapter, pxmitframe))
 		return 1;
 
 	return 0;
@@ -2016,7 +2016,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	signed int bmcst = is_multicast_ether_addr(pattrib->ra);
 	bool update_tim = false;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == false)
+	if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return ret;
 	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
 	if (pattrib->psta != psta)
@@ -2141,7 +2141,7 @@ static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struc
 
 		ret = xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
 
-		if (true == ret) {
+		if (ret) {
 			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
 
 			ptxservq->qcnt--;
-- 
2.52.0

