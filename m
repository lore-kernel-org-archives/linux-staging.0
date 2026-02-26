Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A0F3A1CE6
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100274; cv=none; b=H0gwcusqT8/d/6H6UKgdrzWxIXF76BO+tCqGbzOZ6OG6G4YxmC4WK4t77Hrs5MWSyKyHq46YyxGz4QCvZK6PSPe62dOiStbYlhvSlwk8wSEYTRELMC6TUje6LRM1gfkVLFezuevhLsr8z1YTFT5IEUW4g7wsHtTYVRfPtFmfWFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100274; c=relaxed/simple;
	bh=za+MO11VmFh2nL8QZQLP1h9Vfeh2VrwgwCJpYYe5InE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aQwI24wPAcwr8eH4ZRBKwP0uJjsDJQpbxSq8w8NeToXRIWqo4SE7gNUFFQnPNUnOh+0DphbyaRzai5rY8GM79yQomxMfh305i6y95Qh9W6/H9ZMnDqhDUyC9iEvtzJvqVdXFRTX99IwKBOVGbL/iyvmiMpgbgiD3DLsu04VlXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eA4bFLLY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eA4bFLLY"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4398e347a08so13561f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100269; x=1772705069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAbRU6CC30zDOudkOkV5xr6kKVvSAbXzrRGA3Atet3I=;
        b=eA4bFLLYM3+NhPGWncBJEsLfvrkPaQutNDiidrLd7N17g8pu1VRu7KLSyUXZ+DCMq9
         BNk+P5+nbxC093kON2o5eDekDYJPkyvX9s0w4cyZ8/9P+PhYF9j93/KHFpuAA2sBmvID
         pw0R45WfEemw0hMNaabaQ6UVr6BQ9cN2dt4jdCgzkFFzIpqrQK+liCwC5lErB974OuDI
         86eRhz+grH7h0XLOHFUH6K/SsZ4Chm/fd3yTtqwrmL/glDyq0GILAujjlPMQ4Wj51Ns5
         JbbdFg+m2r3cGLnUV5UKEMH9QlnE/eZv4f8eSAtLxjw7yuqXMLxyFFYQXuufR7BYy73u
         lukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100269; x=1772705069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAbRU6CC30zDOudkOkV5xr6kKVvSAbXzrRGA3Atet3I=;
        b=RDkdGlcVpHt9RnBpNVOYI/3nCHRA4UGsB2AnFg03xRrDNppPz2JaLmFUWRINWT4sif
         ZhpITDRsNPQ7e6Ru8h75Z9OBN1xhVJzSoRBMfRmC58za8gvENcEDFhfI57th3BzPEPNq
         gcuBkCLfzJN2ggbsSLkZQg4amzJIeYVcScUuAT0Ri8XpcH8lojjELQggCignvdgcfnxQ
         9EaKEFD45ZswtD5xkSHBIpBjo9rwzfdv+5VVX3rKFlL9QNdW6ZgCzMPyez+ttSwtg3sc
         RfAUaO8Z8eETHSV08jee4jOz2GB48AEMz2E6X8JjqDe1UgBevzlso4eFT5JSgiYsx4lC
         5dAQ==
X-Gm-Message-State: AOJu0YxA7PNeZjXdzOACJHyA4QTdNNbsX+et0HbES8rDa/i0SnR6N9XI
	8Ua7Ao31gYME1xBzwcV3JQngGJOwus8RTp7ikajmgHq7K0VHOX5HWTo+
X-Gm-Gg: ATEYQzy5wHQ7pKBde2lLWpzYwnZtMJbAfe8zhkERkuOmDnLbq5bFxPbW/hssPxn8Ej6
	zD6NTjdQYJxixFPbqO5sQ8NYCTuEZjt/Bwn1Pewb2anaXpMnpY4ExgXKhzxEwEt0tKaarbK/8u7
	TPj2j+DYM5Xv2cniQvo+7XaKxxllRd/czsotE092KOPO8sTcQyTs+dIhIp+zcu+iKUK8pnIm0mD
	sh+JNDbbeTOFs07+TI4Hu7jLJc9SLGCwSfSh26yPr5Qr55ZXohEosbI5x2PwGE9bNxQGaCGZUBT
	M1MBsO+K3HTJQSNdbv9dI260LfnUA9omjdRAv8E2uRniMjaaU//t7qxYutlc0IP13xx8HD0uwME
	rkXvRytd2oPl2Vh2E/c5/uREn39RaHlDAwb5nJDJ0iT7wO+kk0UQMysKHhBFsd4usvNWLIcAoJd
	yPbgunx+k9WE2eaYFEYtWdu9Rra4ZE7HZXH9pvDAXiVXJRScl3xTmRxkeeK9EJiEvtTbAEudAsU
	F1J8DNeQbu4hjVndJC7wNXOT9o00u3N43EKJJqtBc8/PBSLsEsT
X-Received: by 2002:a05:6000:1101:b0:439:8bee:b984 with SMTP id ffacd0b85a97d-4398beebf07mr5884024f8f.4.1772100269050;
        Thu, 26 Feb 2026 02:04:29 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:28 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 04/12] staging: rtl8723bs: remove unnecessary casts in rtw_mlme_ext.c
Date: Thu, 26 Feb 2026 14:02:48 +0400
Message-ID: <20260226100255.167059-6-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 40 ++++++++++---------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b1f20aa81efb..a458ca1475e0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -525,7 +525,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		if (is_valid_p2p_probereq)
 			goto _issue_probersp;
 
-		if ((ielen != 0 && false == !memcmp((void *)(p+2), (void *)cur->ssid.ssid, cur->ssid.ssid_length))
+		if ((ielen != 0 && false == !memcmp(p + 2, cur->ssid.ssid, cur->ssid.ssid_length))
 			|| (ielen == 0 && pmlmeinfo->hidden_ssid_mode)
 		)
 			return _SUCCESS;
@@ -791,7 +791,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	} else { /*  shared system or auto authentication */
 		if (seq == 1) {
 			/* prepare for the challenging txt... */
-			memset((void *)pstat->chg_txt, 78, 128);
+			memset(pstat->chg_txt, 78, 128);
 
 			pstat->state &= ~WIFI_FW_AUTH_NULL;
 			pstat->state |= WIFI_FW_AUTH_STATE;
@@ -806,7 +806,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 				goto auth_fail;
 			}
 
-			if (!memcmp((void *)(p + 2), pstat->chg_txt, 128)) {
+			if (!memcmp(p + 2, pstat->chg_txt, 128)) {
 				pstat->state &= (~WIFI_FW_AUTH_STATE);
 				pstat->state |= WIFI_FW_AUTH_SUCCESS;
 				/*  challenging txt is correct... */
@@ -839,7 +839,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		rtw_free_stainfo(padapter, pstat);
 
 	pstat = &stat;
-	memset((char *)pstat, '\0', sizeof(stat));
+	memset(pstat, '\0', sizeof(stat));
 	pstat->auth_seq = 2;
 	memcpy(pstat->hwaddr, sa, 6);
 
@@ -893,7 +893,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			if (!p)
 				goto authclnt_fail;
 
-			memcpy((void *)(pmlmeinfo->chg_txt), (void *)(p + 2), len);
+			memcpy(pmlmeinfo->chg_txt, p + 2, len);
 			pmlmeinfo->auth_seq = 3;
 			issue_auth(padapter, NULL, 0);
 			set_link_timer(pmlmeext, REAUTH_TO);
@@ -1007,7 +1007,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		goto OnAssocReqFail;
 	} else {
 		/*  check if ssid match */
-		if (memcmp((void *)(p+2), cur->ssid.ssid, cur->ssid.ssid_length))
+		if (memcmp(p + 2, cur->ssid.ssid, cur->ssid.ssid_length))
 			status = WLAN_STATUS_CHALLENGE_FAIL;
 
 		if (ie_len != cur->ssid.ssid_length)
@@ -2167,14 +2167,14 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 
 	/*  beacon interval: 2 bytes */
 
-	memcpy(pframe, (unsigned char *)(rtw_get_beacon_interval_from_ie(cur_network->ies)), 2);
+	memcpy(pframe, rtw_get_beacon_interval_from_ie(cur_network->ies), 2);
 
 	pframe += 2;
 	pattrib->pktlen += 2;
 
 	/*  capability info: 2 bytes */
 
-	memcpy(pframe, (unsigned char *)(rtw_get_capability_from_ie(cur_network->ies)), 2);
+	memcpy(pframe, rtw_get_capability_from_ie(cur_network->ies), 2);
 
 	pframe += 2;
 	pattrib->pktlen += 2;
@@ -2367,14 +2367,16 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 
 		/*  beacon interval: 2 bytes */
 
-		memcpy(pframe, (unsigned char *)(rtw_get_beacon_interval_from_ie(cur_network->ies)), 2);
+		memcpy(pframe,
+		       (rtw_get_beacon_interval_from_ie(cur_network->ies)), 2);
 
 		pframe += 2;
 		pattrib->pktlen += 2;
 
 		/*  capability info: 2 bytes */
 
-		memcpy(pframe, (unsigned char *)(rtw_get_capability_from_ie(cur_network->ies)), 2);
+		memcpy(pframe, rtw_get_capability_from_ie(cur_network->ies),
+		       2);
 
 		pframe += 2;
 		pattrib->pktlen += 2;
@@ -2715,9 +2717,10 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	memcpy((void *)GetAddr1Ptr(pwlanhdr), pstat->hwaddr, ETH_ALEN);
-	memcpy((void *)GetAddr2Ptr(pwlanhdr), myid(&(padapter->eeprompriv)), ETH_ALEN);
-	memcpy((void *)GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
+	memcpy(GetAddr1Ptr(pwlanhdr), pstat->hwaddr, ETH_ALEN);
+	memcpy(GetAddr2Ptr(pwlanhdr), myid(&(padapter->eeprompriv)), ETH_ALEN);
+	memcpy(GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)),
+	       ETH_ALEN);
 
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
@@ -2863,7 +2866,7 @@ void issue_assocreq(struct adapter *padapter)
 	/* listen interval */
 	/* todo: listen interval for power saving */
 	val16 = cpu_to_le16(3);
-	memcpy(pframe, (unsigned char *)&val16, 2);
+	memcpy(pframe, &val16, 2);
 	pframe += 2;
 	pattrib->pktlen += 2;
 
@@ -4500,7 +4503,8 @@ void report_join_res(struct adapter *padapter, int res)
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pjoinbss_evt = (struct joinbss_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
-	memcpy((unsigned char *)(&(pjoinbss_evt->network.network)), &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
+	memcpy(&pjoinbss_evt->network.network, &(pmlmeinfo->network),
+	       sizeof(struct wlan_bssid_ex));
 	pjoinbss_evt->network.join_res	= pjoinbss_evt->network.aid = res;
 
 
@@ -4595,8 +4599,8 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pdel_sta_evt = (struct stadel_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
-	memcpy((unsigned char *)(&(pdel_sta_evt->macaddr)), MacAddr, ETH_ALEN);
-	memcpy((unsigned char *)(pdel_sta_evt->rsvd), (unsigned char *)(&reason), 2);
+	memcpy(&pdel_sta_evt->macaddr, MacAddr, ETH_ALEN);
+	memcpy(pdel_sta_evt->rsvd, &reason, 2);
 
 
 	psta = rtw_get_stainfo(&padapter->stapriv, MacAddr);
@@ -4646,7 +4650,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	padd_sta_evt = (struct stassoc_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
-	memcpy((unsigned char *)(&(padd_sta_evt->macaddr)), MacAddr, ETH_ALEN);
+	memcpy(&padd_sta_evt->macaddr, MacAddr, ETH_ALEN);
 	padd_sta_evt->cam_id = cam_idx;
 
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
-- 
2.52.0

