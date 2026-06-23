Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF04367F25
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208344; cv=none; b=u8vBbLYCaln6ZJNLdzDWkVVardyIDD+9kflp2IVE69WCzHE/j6Cla9wdxzlSX+XDn1udT+Et+v1uVQ+9TCgfOVvrRM1FIxGxp9cEP2ZUmpzXCMM3wYHb34e3WZGQjyKhcnin2Ljsa+Ug7BqTW3uLxqFdmKIOF9YfQ1BohFEFzhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208344; c=relaxed/simple;
	bh=hgqCcq1PQRKQCWjcrZ/QjPKv99CFJ1qZGfzflF/vPgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTCwElN7QagOH5va+ex39w/S7wSnN8t3wIxs1yFNfz8nRYrj1KeFawpwelRk7gFOuOCixe7gYHCs4cnRwCHuo8AhFecCNEmW5lLDkAGI73JOhlI9UbvFC+1g+qlxfpeetG88cXGEUz+tOVHrt/h53HILT0hx3ED1Ps+Sb8+UOzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbgmeSOH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbgmeSOH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so372463f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782208340; x=1782813140; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rm+s6mk9ZAlc4wD5sMvSipKxCyMqx6sDtIEaiWJ9ULI=;
        b=qbgmeSOHvq6GV9MdVev6YrAJ29mRiehUj9hhFHPOYjNJY7TKRQVC8zcFfoG/e0S/tz
         5IK4bMJ8jfhXmKxSLPCxkeGo7QxHOw71cTKIcHrVrW2D5d9s4qe0oDHD9LXFHFmmZXNv
         H7tYHtsO91cXXjR0nJW18/KpzCgeP3bRhwd84QM2Vj47XPThqnfa2iDr3eGM+OFPS7qE
         FcbeQP9u0gGQ8Q0245T9CRC4eOoWweeefLPPkzOQtHKXO6HLFNI/BJzZwnVVvUEsKKue
         Jw0yHKnqFIFnI+k7vn3rUQwAiZXhIt4LFbslW/aLMRX3iE5U9m4w8CuCAMJXPPhIuN/d
         AL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782208340; x=1782813140;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rm+s6mk9ZAlc4wD5sMvSipKxCyMqx6sDtIEaiWJ9ULI=;
        b=Jfr22ImPePPUHT2QhiP4HyYXJfsDArmk3rzbk14Bdxr680tNpy1/UP02ObpTmkJ2hY
         quTWhdw1WHws24a21DIAw9BGwmmZLs+yyUPMT4Eq/bZJ0PfCZWXiEEmIANId/tzkfHfF
         5cVni21F+gqu5WVAVQEeHB3PClbGezZ/GEPJyx1rUhn+7UATqPpWUP0tBuegxep0KEd+
         mq/J19rj65RaLLwhqAlVOFKUHEJfxqSJZo7cO3CINaZQaBcbA7Cn4+mrAqTgnE0uSOD6
         lgm6jq2M367W3FvsbdUu5DJBmlAbkiyA4r0+0047CBT0m796p2aTrgG90mqSLXQlPjjc
         gS/w==
X-Gm-Message-State: AOJu0YzZa364EZkonqVr2thSvQiFzDLO7xuegJ9Pgp0d4NVpd0rtc/ZM
	mIgG+QeCIYUnRx75fuLRtRMlbSeQ8LTNfOu7mRC4HougAdJs1w+zC01K
X-Gm-Gg: AfdE7clhv+t3CADU7+lJTJg8mT1+EXwdfp91kswz44wLE+EnV2gSDtc/VP8MedVbqu4
	bPcCQoV1waOvjVgtu3L98wCGZ7ZHvdRZULvGP8GVpk4ILe5U3HWg8wuWwucnBDhGaQjB58Cy6T8
	Ep+zM4eGwoqdypnxZHpqHN9CSeB1QPpDSJ/KLcDg1efkhxCoUwCIAr20mkrxJYRJjDhUXJ20NG6
	nqUCdXYLA1QMyTOLmv/OpX8ORt4j/XCD0uvx338xvp4HSSV//uNf3q/V0cp0HrbeyQXi4ztaWZn
	DGAPnPJEswTcb8onAcOmBHiGlWAWtZKjTjrFYdLZgc1AKhQK9nTe5d+BAQn063oYY/ELxkfEV/d
	8tG1qaxqyrQVvphuoGlNf0Bo1ld2df010Ud6T74AqiBaZX6zD6jesO/WPocnGdNldVkYTRanygE
	xa1CEQ0kPKIXzDcEvzUe2de/EOYM/8N0tvky6Sk0A6CaTsddK/75gYH1jAnqjraKuTgbw=
X-Received: by 2002:a05:6000:250a:b0:463:3184:6310 with SMTP id ffacd0b85a97d-46a80f5c67amr4835644f8f.28.1782208340051;
        Tue, 23 Jun 2026 02:52:20 -0700 (PDT)
Received: from localhost (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e93sm36842772f8f.7.2026.06.23.02.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:52:19 -0700 (PDT)
Date: Tue, 23 Jun 2026 09:51:00 +0000
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix CamelCase warning for OnAssoc
Message-ID: <ajpXBI0GxOGkmTUF@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename OnAssoc values from CamelCase to snake_case to conform to
linux kernel coding style:
OnAssocReq	  -> on_assoc_req
OnAssocRsp	  -> on_assoc_rsp
WMMOnAssocRsp     -> WMM_on_assoc_rsp
HTOnAssocRsp	  -> HT_on_assoc_rsp
OnAssocReqFail	  -> on_assoc_req_fail

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 38 +++++++++----------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  4 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  8 ++--
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011455..f7662c918473 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1496,7 +1496,7 @@ void rtw_cpwm_event_callback(struct adapter *padapter, u8 *pbuf)
 
 void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
 {
-	WMMOnAssocRsp(padapter);
+	WMM_on_assoc_rsp(padapter);
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..b32e1e7ac4ba 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -12,10 +12,10 @@
 #include <linux/unaligned.h>
 
 static struct mlme_handler mlme_sta_tbl[] = {
-	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
-	{WIFI_ASSOCRSP,		"OnAssocRsp",	&OnAssocRsp},
-	{WIFI_REASSOCREQ,	"OnReAssocReq",	&OnAssocReq},
-	{WIFI_REASSOCRSP,	"OnReAssocRsp",	&OnAssocRsp},
+	{WIFI_ASSOCREQ,		"on_assoc_req",	&on_assoc_req},
+	{WIFI_ASSOCRSP,		"on_assoc_rsp",	&on_assoc_rsp},
+	{WIFI_REASSOCREQ,	"OnReAssocReq",	&on_assoc_req},
+	{WIFI_REASSOCRSP,	"OnReAssocRsp",	&on_assoc_rsp},
 	{WIFI_PROBEREQ,		"OnProbeReq",	&OnProbeReq},
 	{WIFI_PROBERSP,		"OnProbeRsp",		&OnProbeRsp},
 
@@ -908,7 +908,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	return _FAIL;
 }
 
-unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
+unsigned int on_assoc_req(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u16 capab_info;
 	struct rtw_ieee802_11_elems elems;
@@ -974,7 +974,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	if (rtw_ieee802_11_parse_elems(pos, left, &elems, 1) == PARSE_FAILED ||
 	    !elems.ssid) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
-		goto OnAssocReqFail;
+		goto on_assoc_req_fail;
 	}
 
 	/*  now we should check all the fields... */
@@ -985,7 +985,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	if (!p || ie_len == 0) {
 		/*  broadcast ssid, however it is not allowed in assocreq */
 		status = WLAN_STATUS_CHALLENGE_FAIL;
-		goto OnAssocReqFail;
+		goto on_assoc_req_fail;
 	} else {
 		/*  check if ssid match */
 		if (memcmp(p+2, cur->ssid.ssid, cur->ssid.ssid_length))
@@ -996,7 +996,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	if (status != WLAN_STATUS_SUCCESS)
-		goto OnAssocReqFail;
+		goto on_assoc_req_fail;
 
 	/*  check if the supported rate is ok */
 	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_SUPP_RATES, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
@@ -1006,7 +1006,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		/* support_rate_num = AP_BSSRATE_LEN; */
 
 		status = WLAN_STATUS_CHALLENGE_FAIL;
-		goto OnAssocReqFail;
+		goto on_assoc_req_fail;
 	} else {
 		if (ie_len > sizeof(supportRate))
 			ie_len = sizeof(supportRate);
@@ -1091,7 +1091,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	if (status != WLAN_STATUS_SUCCESS)
-		goto OnAssocReqFail;
+		goto on_assoc_req_fail;
 
 	pstat->flags &= ~(WLAN_STA_WPS | WLAN_STA_MAYBE_WPS);
 	if (!wpa_ie) {
@@ -1112,7 +1112,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 				if (!selected_registrar) {
 					status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
 
-					goto OnAssocReqFail;
+					goto on_assoc_req_fail;
 				}
 			}
 		}
@@ -1123,7 +1123,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		if (psecuritypriv->wpa_psk == 0) {
 			status = WLAN_STATUS_INVALID_IE;
 
-			goto OnAssocReqFail;
+			goto on_assoc_req_fail;
 		}
 
 		if (elems.wps_ie) {
@@ -1210,14 +1210,14 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	if (!pmlmepriv->htpriv.ht_option && (pstat->flags&WLAN_STA_HT)) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
-		goto OnAssocReqFail;
+		goto on_assoc_req_fail;
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) &&
 		    ((pstat->wpa2_pairwise_cipher&WPA_CIPHER_TKIP) ||
 		      (pstat->wpa_pairwise_cipher&WPA_CIPHER_TKIP))) {
 		/* status = WLAN_STATUS_CIPHER_SUITE_REJECTED; */
-		/* goto OnAssocReqFail; */
+		/* goto on_assoc_req_fail; */
 	}
 	pstat->flags |= WLAN_STA_NONERP;
 	for (i = 0; i < pstat->bssratelen; i++) {
@@ -1250,7 +1250,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 			status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
 
-			goto OnAssocReqFail;
+			goto on_assoc_req_fail;
 
 		} else {
 			pstapriv->sta_aid[pstat->aid - 1] = pstat;
@@ -1308,7 +1308,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	return _FAIL;
 
-OnAssocReqFail:
+on_assoc_req_fail:
 
 	pstat->aid = 0;
 	if (frame_type == WIFI_ASSOCREQ)
@@ -1319,7 +1319,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	return _FAIL;
 }
 
-unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
+unsigned int on_assoc_rsp(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	uint i;
 	int res;
@@ -4672,10 +4672,10 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	update_capinfo(padapter, pmlmeinfo->capability);
 
 	/* WMM, Update EDCA param */
-	WMMOnAssocRsp(padapter);
+	WMM_on_assoc_rsp(padapter);
 
 	/* HT */
-	HTOnAssocRsp(padapter);
+	HT_on_assoc_rsp(padapter);
 
 	/* Set cur_channel&cur_bwmode&cur_ch_offset */
 	set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b10d..68801977d54f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -701,7 +701,7 @@ static void sort_wmm_ac_params(u32 *inx, u32 *edca)
 	}
 }
 
-void WMMOnAssocRsp(struct adapter *padapter)
+void WMM_on_assoc_rsp(struct adapter *padapter)
 {
 	u8 ACI, ACM, AIFS, ECWMin, ECWMax, aSifsTime;
 	u8 acm_mask;
@@ -977,7 +977,7 @@ void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	memcpy(&(pmlmeinfo->HT_info), pIE->data, pIE->length);
 }
 
-void HTOnAssocRsp(struct adapter *padapter)
+void HT_on_assoc_rsp(struct adapter *padapter)
 {
 	unsigned char max_AMPDU_len;
 	unsigned char min_MPDU_spacing;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index cb23c6939bfc..1395a82a33e1 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -483,11 +483,11 @@ int is_IBSS_empty(struct adapter *padapter);
 unsigned char check_assoc_AP(u8 *pframe, uint len);
 
 int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
-void WMMOnAssocRsp(struct adapter *padapter);
+void WMM_on_assoc_rsp(struct adapter *padapter);
 
 void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
 void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
-void HTOnAssocRsp(struct adapter *padapter);
+void HT_on_assoc_rsp(struct adapter *padapter);
 
 void ERP_IE_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
 void VCS_update(struct adapter *padapter, struct sta_info *psta);
@@ -558,8 +558,8 @@ void start_clnt_auth(struct adapter *padapter);
 void start_clnt_join(struct adapter *padapter);
 void start_create_ibss(struct adapter *padapter);
 
-unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame);
+unsigned int on_assoc_req(struct adapter *padapter, union recv_frame *precv_frame);
+unsigned int on_assoc_rsp(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnProbeRsp(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int DoReserved(struct adapter *padapter, union recv_frame *precv_frame);
-- 
2.54.0

