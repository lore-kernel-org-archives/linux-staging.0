Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA5F23D2A3
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 20:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769544285; cv=none; b=vCvr42GVfpfs5Y5oEVV9XvDKsFXRCd8aW/OWbXTvKj00CzuPJa8Sk8bF3A6ZgN55Tq2vv0XxI90O/LUKhA4yAMyb2u+7fVhvwQaeMkD7NprC2oOdTuanXcbvkLnHNWcJDtkg4zZrsYuCMAlwzQsSnSqMl8oPUjpW0OlaeMpxmwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769544285; c=relaxed/simple;
	bh=DUj73dpWvUOs0SJwzs0brB8xwJyrnqPA8rObzZywce4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqiHFWdDqDItwRZzdDz7Wk0DSXzb4jJSmywzzPAfICug6aCKL9X44mq4sCY9WsQYFb29SADgT0vYJhOHSdR1jWeiYQF72pqS2V29rJFVnfTYxuHo7ovMr7CW+FG4dBCbwybBfHOVHPejlmTJ7M9f0xdMqYgRawuOlujDxvFybNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0SRl9qz; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0SRl9qz"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82307c6902eso2778511b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 12:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769544284; x=1770149084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGjbMrQgBawKbwUUinu/j0+8frJya7hwRgmP5T/sjNw=;
        b=G0SRl9qzt0xeohVhLmTrpKYWz/P0OUCzS7q1zPUWfr364zIGoHRLH5uxJyLTQLJbGD
         UezTq7pLa7KEDttcFVacby0bZkQkZaI5iqz8DdfPH8En/Ymc8QSXZZJWoB+o+16XOwn5
         r/dvtpj25l/8USMcMh9OLSYOuwXKSVAn5VBUO9HM/1oKLTmpCjowMikdd2Raf+pWlgNC
         6ySFp2vT2TBkozJMC4p9hXjwnlCrRlPA7bh/XiLUwUqpOPBvd1Orsh1I201YdYO3SXLo
         5YnwN1r9HHnystzY88J+hVTFO/cryAvWeA4Fchq8RG2xqffsnw62FySULfgcQxHX1Flo
         sV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769544284; x=1770149084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xGjbMrQgBawKbwUUinu/j0+8frJya7hwRgmP5T/sjNw=;
        b=jK2EA/dzWu0x1vlVE88PGk0BLbUgswhBhgPPoRDlYRJWHQgqf0Zq/8A8jG3oTgMLp8
         imX6pX6t1i3ic2fhvhTqsHC3kzdYmKt/rW8figvgrz5u0Mtda31fqxsISM3vEvvIaUQj
         vfTErdfKq7wpbnaywnMgwrwhqGtYo76dd+q5Z78W+wh9aMz1nRx7nslRHxO0DAWc1lFv
         OXmJQ+JvFHTpd8/pbx5Ikfp56PjJ4Ff1DAT5D5TuwzIqAN57//VP3UB2EuPzU94475f1
         xZs4nTFDjaH31Z36/VqhUp756jXjJrbShb5JBXlcfGyxidRBy6b6ktleri5j2QiCWs9r
         eT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1dBmhrwfGV/Y162TKJZoCOJ/ePMKb5Xh5DuGEQYVPKZ+qa8npl6DFliEpwzAHkXG/Mxaf9fax6QsIvG0U@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1q5fTqDQECPQ3+VppdL/wOt2KccNI5ZwWCMPGRSw3Ll6yEHFl
	9F732WOaBbZIx0GJFHMB0RS/BUnMhMjw7A7zOzZONlEB7wWnHSmnaZu3
X-Gm-Gg: AZuq6aIW51xtuBrFi69XHgw7FEthj875RaH3Pxpq+JmoYpXRPjFnE+6f9Axhi+4agtp
	O71FWLq7yeHH88zkMvGsGZKYyURxHPhDX6MTDrTSN7trN/DOdjxqF9GGlMn95jdlUIm9ZAkJ/hu
	UOWP/O0vckeB0RPlYJmVWOD3+rSqg6tWU+yzxnnaYGb36ayy8J50PmOrjgqLucsc2ZzGIHhykQU
	NHsApLShSgTe7sLDAtcLf/UI9R2QntdALaJ2JSf1WZbWbbopBbzKW5LRir+v0qXeKsEzCrpN56p
	cDO78vea/lTIKjRq+9NBsvNli8sMoRgpSsfggDqUOY+scmUD4+gS5348BX0PYNm+ZdBMzLO2n16
	fRCI29WDUGo5VdjXtYWPPMaW33lMbPqVV48b2oomUq5zifJxpHfgfbqC2PbPd2n7Lvb2mrc/OLI
	mDJQ+i1djoIDeVOIQn
X-Received: by 2002:a05:6a00:1d86:b0:81f:41c8:765a with SMTP id d2e1a72fcca58-8236914c62cmr2980358b3a.4.1769544283631;
        Tue, 27 Jan 2026 12:04:43 -0800 (PST)
Received: from snowman ([2401:4900:646d:9a6e:84d0:c92:d353:cd21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b59e10sm377771b3a.25.2026.01.27.12.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:04:43 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v5 1/3] staging: rtl8723bs: simplify boolean expressions
Date: Wed, 28 Jan 2026 01:34:25 +0530
Message-ID: <20260127200427.3669-2-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127200427.3669-1-khushalchitturi@gmail.com>
References: <20260127200427.3669-1-khushalchitturi@gmail.com>
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
v4 -> v5: Rebased onto current staging-testing.
v3 -> v4: Fixed alignment and removed extra parentheses.
v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
v1 -> v2: Corrected commit messages.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 40 ++++++++++++-----------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 9cead1455bfa..314027ea79a4 100644
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
@@ -881,7 +883,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 	SetFrameSubType(fctrl, pattrib->subtype);
 
 	if (pattrib->subtype & WIFI_DATA_TYPE) {
-		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE) == true) {
+		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE)) {
 			/* to_ds = 1, fr_ds = 0; */
 
 			{
@@ -895,7 +897,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pqospriv->qos_option)
 				qos_option = true;
-		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE) == true) {
+		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
 			/* to_ds = 0, fr_ds = 1; */
 			SetFrDs(fctrl);
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
@@ -904,8 +906,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pattrib->qos_en)
 				qos_option = true;
-		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+			   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
@@ -963,7 +965,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 						pattrib->ampdu_en = true;
 
 				/* re-check if enable ampdu by BA_starting_seqctrl */
-				if (pattrib->ampdu_en == true) {
+				if (pattrib->ampdu_en) {
 					u16 tx_seq;
 
 					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
@@ -1114,7 +1116,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		frg_inx++;
 
-		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
+		if (bmcst || rtw_endofpktfile(&pktfile)) {
 			pattrib->nr_frags = frg_inx;
 
 			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len +
@@ -1140,7 +1142,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	xmitframe_swencrypt(padapter, pxmitframe);
 
-	if (bmcst == false)
+	if (!bmcst)
 		update_attrib_vcs_info(padapter, pxmitframe);
 	else
 		pattrib->vcs_mode = NONE_VCS;
@@ -1977,14 +1979,14 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
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
@@ -2028,7 +2030,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	signed int bmcst = is_multicast_ether_addr(pattrib->ra);
 	bool update_tim = false;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == false)
+	if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return ret;
 	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
 	if (pattrib->psta != psta)
@@ -2153,7 +2155,7 @@ static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struc
 
 		ret = xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
 
-		if (true == ret) {
+		if (ret) {
 			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
 
 			ptxservq->qcnt--;
-- 
2.52.0

