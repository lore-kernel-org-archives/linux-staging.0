Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B354A2E38
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778002712; cv=none; b=OIShqMN3PyBrxYiHxlWC5FzDMnqNrfvClGrqw0r5w7OapC8ueJWVVUIghq1ne2GQVKr72CSBdc8Uaqf3gQs5ERrs+wwpYw5Y2ZvpAbz7FpmFf2G2DTfn4whpH2FPwdQqj8/LwMddMRMrmMrQoxZ2b3GR9/LN+tWga/DELR9KDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778002712; c=relaxed/simple;
	bh=2eHvbI1mk/aj/Zi5PxQSpJypU7yoSMe2lKX08aSATJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9BKrZyHHF8idyruiVe4QLStnT3nmxE5yg91tkY/XbFzKGkba3uHDuQIXlQTSTurWNR1zbGQoGiHKzfVl4WkgPd244ctICiH7jw7khZ9TmfbZWsi+jTXRZGOAur5uvlYwqA3pNxwneH8io3Q5vyYo5o0R8jjbDOdv47tIcQyAk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCyxs/Hd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCyxs/Hd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so666995e9.1
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778002708; x=1778607508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HzUgHbapU2iUW6a55uMohE0Ic8YmFRsZ+OhWqMaW50=;
        b=QCyxs/HdwZ2LMgTrs+QQEr3iIwZFClxpoKSYzNJszousbWjcVzOyRDPsI+gasVnDWD
         KjM0S+nKhKtFUqP3P2WH1YSrEJOqKnPr50EGq/NMKH8Scy77sdrY5q2HZjDFt7l4Thr5
         d29uxqDzOiqz3abAaXithuL3lPC2CdCZ3xpvZnPai1U+6t9G2wRLOP1LI//YkTJnX4tF
         X685XmZhf4f89MzvGQS6j3zzffdyUVgzdNlSHQuqayJTlfn0ml3awg9u1kSM/wQAdeMc
         7lDG/bdSOoYMiB/F9TW4r1pYS/krIJ8+onDFjla+VWgFGBKEyKKR3E/QxD2lf0P6puXp
         DQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778002708; x=1778607508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3HzUgHbapU2iUW6a55uMohE0Ic8YmFRsZ+OhWqMaW50=;
        b=IuQUW/7U6ac5PCxb2gfMO3QOVG5RghfVHjHFjvYGeXe3kUGxziFmME6Q1g2wqFENAK
         mawBKx8oQ8yeBAru4KGCc5lvg9GHWmVHx9cake0Aqw5tpVAeGHmdokBKVN/w/6s2nXBQ
         BoPTAec1Kil9svtnbtiFoxf4lHnevm0mcNqOlnMV4gQWVFSbwwunjCMqsI1lz40ywxQ+
         U/8xGS+J0Y665s6knWX26WOfcLcBaDJDSERsDi1m7gsW/Z0tDVN5TYCGPNUy+u2Pbmy5
         qvt/tizLDPm8wTk46bkt8rhfkO8g0Lgu/Zm87jo2KvlCzkolb2SfWXlC4uxtt35Xk2uZ
         WwSw==
X-Gm-Message-State: AOJu0YxGzO25WWTHI4yA/dEtkjKMP1fMgCyQzDygfXO/W7kTaBxXxxV4
	OFWdXNCMtGi+mo4WBd9Jh3WuuTzfBwPa7slH/t5Ekhd2uwaFxiGtMUiw
X-Gm-Gg: AeBDievcDMu+cD1hCJxjMcDNO9P4N9hOjawJRpuJ5xUA/V1HlXFLKZN+YI7boJuosn4
	FFuMdAqIGhJdIfpw/7iF+a5OgEit7Iw97bbEp+SjaJn5EfMcnrAaeL5veORYEeISN6Oc8c3kUMt
	z4gLt9oSdLhLQCzMuTlUv7gxbZ32BlSXJ47x2B8Mm77vPnzzE6kXSYRSQMk8H9HCLHquzE890DF
	+H46Z0jpoBg/bmn2wgsg5YXtmHlN5xxB6aaosMLQBqE5iXxQRmsRdXc8GgtwssT9Sixr9/k4YG7
	l7Y9RRFVtRuDqsaLm7A3N5k7hSIqNp4HMwNrJClAr78kaLp8wUX4JofkAaLRx5arVV8auUb2w5o
	IO+OoQ8kt1WNDcDdXtDZKVI+2oj8wC8Aog/tI3eoNio7hs0UMYz30grekSBqBH4tTMbek1nOsLU
	+/LqoKvIh2AEIDPOrUajjKOI46lcR9mDTlFHvR4tw0+26PcbgyefTS4W7NYbanCQFbEfjFbUbpo
	vXadyrX1l7z04dAy8km4XLToEE0vVf4IVcm3RKZB1tEQdzBglUaCgJpGlUXVNEE373reDU=
X-Received: by 2002:a05:600c:3152:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48d1422bafamr75630445e9.3.1778002707536;
        Tue, 05 May 2026 10:38:27 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm655473875e9.9.2026.05.05.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:38:27 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v4 2/3] staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
Date: Tue,  5 May 2026 19:38:17 +0200
Message-ID: <20260505173818.3674164-3-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505173818.3674164-1-hossu.alexandru@gmail.com>
References: <2026050436-italics-clumsy-e83c@gregkh>
 <20260505173818.3674164-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Five out-of-bounds read paths in the IE parsing loops of
issue_assocreq() and join_cmd_hdl():

1. Missing IE header bounds checks (both functions).

   Both loops advance by pIE->length + 2 per iteration but only guard
   on i < ie_length.  When the buffer ends with a single element_id
   byte and no length byte, the loop reads pIE->length from one byte
   past the end of the buffer.  Even when both header bytes are in
   bounds, pIE->length can extend the data window past ie_length,
   silently passing a truncated IE to handler functions.  Add two
   guards at the top of each loop: break if fewer than sizeof(*pIE)
   bytes remain, and break if the declared IE payload extends past
   ie_length.

2. Vendor-specific OUI comparison reads 4 bytes past a possibly short
   IE payload (both functions).

   For WLAN_EID_VENDOR_SPECIFIC, the code calls memcmp(pIE->data,
   OUI, 4) on RTW_WPA_OUI, WMM_OUI, and WPS_OUI without first
   verifying that pIE->length is at least 4.  A short IE at the end
   of the frame causes the memcmp to read into adjacent frame data.
   Add pIE->length >= 4 guard before the comparisons.

3. HT Capability IE memcpy reads sizeof(struct HT_caps_element) bytes
   from an IE that may be shorter (issue_assocreq only).

   The WLAN_EID_HT_CAPABILITY handler copies:

     memcpy(&pmlmeinfo->HT_caps, pIE->data, sizeof(struct HT_caps_element));

   If pIE->length < sizeof(struct HT_caps_element), the memcpy reads
   beyond the end of the IE payload into adjacent frame data.  Add a
   minimum length check and skip the IE if it is too short.

4. rtw_set_ie called with untrusted pIE->length for HT Capability
   (issue_assocreq only).

   After the memcpy the code passes pIE->length directly to
   rtw_set_ie() as the IE body length.  If pIE->length exceeds
   sizeof(struct HT_caps_element), rtw_set_ie copies that many bytes
   from pmlmeinfo->HT_caps, reading past the end of the struct into
   adjacent fields.  Use sizeof(struct HT_caps_element) instead.

5. HT Operation IE accessed without minimum length check (join_cmd_hdl
   only).

   The WLAN_EID_HT_OPERATION handler casts pIE->data to
   struct HT_info_element * and reads pht_info->infos[0] (offset 1)
   without verifying pIE->length >= sizeof(struct HT_info_element).
   A zero- or one-byte HT Operation IE causes an out-of-bounds read.
   Add a minimum length check and break if the IE is too short.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v4:
  - Add pIE->length >= 4 guard before the 4-byte OUI memcmps in the
    WLAN_EID_VENDOR_SPECIFIC cases of both functions (sashiko review of v3).
  - In issue_assocreq() WLAN_EID_HT_CAPABILITY: add minimum length check
    (pIE->length < sizeof(struct HT_caps_element)) and use
    sizeof(struct HT_caps_element) instead of pIE->length in rtw_set_ie()
    to prevent OOB reads past the HT_caps struct (sashiko review of v3).
  - In join_cmd_hdl() WLAN_EID_HT_OPERATION: add minimum length check
    (pIE->length < sizeof(struct HT_info_element)) before casting pIE->data
    to struct HT_info_element * and reading infos[0] (sashiko review of v3).

Changes in v3:
  - No code changes from v2.

Changes in v2:
  - Add IE loop header and payload bounds checks for issue_assocreq()
    and join_cmd_hdl().

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 30 ++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..0c130d0f9a48 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2925,13 +2925,18 @@ void issue_assocreq(struct adapter *padapter)
 
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
+		if (i + sizeof(*pIE) > pmlmeinfo->network.ie_length)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
+		if (i + sizeof(*pIE) + pIE->length > pmlmeinfo->network.ie_length)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) ||
+			if (pIE->length >= 4 &&
+			    ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) ||
 					(!memcmp(pIE->data, WMM_OUI, 4)) ||
-					(!memcmp(pIE->data, WPS_OUI, 4))) {
+					(!memcmp(pIE->data, WPS_OUI, 4)))) {
 				vs_ie_length = pIE->length;
 				if ((!padapter->registrypriv.wifi_spec) && (!memcmp(pIE->data, WPS_OUI, 4))) {
 					/* Commented by Kurt 20110629
@@ -2953,8 +2958,10 @@ void issue_assocreq(struct adapter *padapter)
 		case WLAN_EID_HT_CAPABILITY:
 			if (padapter->mlmepriv.htpriv.ht_option) {
 				if (!(is_ap_in_tkip(padapter))) {
+					if (pIE->length < sizeof(struct HT_caps_element))
+						break;
 					memcpy(&(pmlmeinfo->HT_caps), pIE->data, sizeof(struct HT_caps_element));
-					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, pIE->length, (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
+					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, sizeof(struct HT_caps_element), (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
 				}
 			}
 			break;
@@ -2967,7 +2974,7 @@ void issue_assocreq(struct adapter *padapter)
 			break;
 		}
 
-		i += (pIE->length + 2);
+		i += sizeof(*pIE) + pIE->length;
 	}
 
 	if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_REALTEK)
@@ -5318,11 +5325,15 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
 	/* sizeof(struct ndis_802_11_fix_ie) */
 	for (i = _FIXED_IE_LENGTH_; i < pnetwork->ie_length;) {
+		if (i + sizeof(*pIE) > pnetwork->ie_length)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pnetwork->ies + i);
+		if (i + sizeof(*pIE) + pIE->length > pnetwork->ie_length)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:/* Get WMM IE. */
-			if (!memcmp(pIE->data, WMM_OUI, 4))
+			if (pIE->length >= 4 && !memcmp(pIE->data, WMM_OUI, 4))
 				WMM_param_handler(padapter, pIE);
 			break;
 
@@ -5335,7 +5346,12 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
 			/* spec case only for cisco's ap because cisco's ap issue assoc rsp using mcs rate @40MHz or @20MHz */
 			{
-				struct HT_info_element *pht_info = (struct HT_info_element *)(pIE->data);
+				struct HT_info_element *pht_info;
+
+				if (pIE->length < sizeof(struct HT_info_element))
+					break;
+
+				pht_info = (struct HT_info_element *)(pIE->data);
 
 				if (pnetwork->configuration.ds_config <= 14) {
 					if ((pregpriv->bw_mode & 0x0f) > CHANNEL_WIDTH_20)
@@ -5366,7 +5382,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 			break;
 		}
 
-		i += (pIE->length + 2);
+		i += sizeof(*pIE) + pIE->length;
 	}
 
 	/* check channel, bandwidth, offset and switch */
-- 
2.53.0

