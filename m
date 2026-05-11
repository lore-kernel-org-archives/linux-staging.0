Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC57421F10
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519168; cv=none; b=dmcdWy/q1LntbBvq/Rwc6T4o4SprYkgc1yb4KKclqcloCgyb6DUWG5KCU22ezGj8m90k9yPXzGgyiYMOZFC+cmZgVO5cPxFToCKnLr6Bz9ktPkHnCrzPIKSutC5QToRD/l5uwL8AImHoiqypsxTjSxKDH99QQLFjJahFmPlvLzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519168; c=relaxed/simple;
	bh=Rf0Cn4jll7ZOrJfZWaKXuFvQ+6Osk3POFETyOckuRjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXZ0pMywOxXOMulG1Wsve9yHlcCA4ec0NwjQmn+cj9oMxNWTCJzhCWStq7xD812Q5tDDJiKtdWlUuZNfEbX0EXGlY7vvGCCnH9VaxqUzZ+0ESC8tQR1qvIeF9jCzFeBIJ1qS4Q9r3aPfKCL1RzD7TKaUj8BoO1HVU55kq3lFU6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQzCTOoS; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQzCTOoS"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so723664466b.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 10:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519164; x=1779123964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEyQ0dx4b99eyqrmXV2BKWIdSYpmr4F2ENUgwTR4Qko=;
        b=rQzCTOoSNWUe4peBo74ELCc36AaBVS40RNUOPTmkv+aiV0/CVGSbiSj/MPZK7tZ/zo
         k7Tq7/wWa0vQM+KYKKt0Qwo+02kytEB/ZrXATweR2y+c9UmAerqyR4XDuOmPGpJ1buN3
         PqguoM63vXwawxT8b9pR6ipBVFDu53ezRBFusgh5F2BSdp1T/us4WSDCZ8qHJP+iZudD
         JHZdv3htcYZJqDu/Dgz/9+TUohid7Q1mUev9i5+kTsshi5O8u74R2Xpw6M1pql0AmGmd
         TulrrSC5vibq3jZ2gXiwvsd0tAH2e6gcvkIAKt+doXO1+JxRKIgLOQFeKT8bdhqFjATH
         s0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519164; x=1779123964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IEyQ0dx4b99eyqrmXV2BKWIdSYpmr4F2ENUgwTR4Qko=;
        b=MWhJN5BHA1DqI9wqoxKzo/ZyHqNWtPs6MTOn0dZ1nQacX4TjQ+sPrvAz0WBZarrbBp
         N3ZxxMexOhFE4e8kcdoKXyWRyHn65bOGDfaLCgPHFbys07xDjMmS/6tYlwDGuY4v67ei
         LhUGX3r0/5CbmIJ8GTE/OQVmps2sHGtEGN5qJJsFpbYdpFTxYtVI6qH/YXcErdu+KppI
         L8cOSch51+89A1M/TGYXmp4GcSYNPU/23VLowiD6EnxLPztZKnDn165eJ/6LTbEZPsvw
         Kyf/Ab0vpreQ1JOxbxT6bl8PSdKgZv094GLdUPq/L4SP1K1f6zrDecvifs5C0VP7aPox
         mW3Q==
X-Gm-Message-State: AOJu0YztOhGMWRbc/Yh4BIX0Xnc/7hmlGesn39reGbqj2/pGTBSixw56
	5RcYsXlJ+FW8I34/WHCX/sux/nTL+oXc8mWy9N3a898Mc5b1ktF3f+QhtaUV7w==
X-Gm-Gg: Acq92OGjqgl1x88xoQ0J5WzI3K9kXGMW5sl0zmrY07scu9/oGYnzMC2FZ3Qz9vp4vxa
	YIwXMHjcNqiccXbFDA1UVHfFFCbrQi1Ev4K4cRDIeSe0WvBTWQPtVpss7JpqVz7GqXUcvGUwAL1
	JuYPY2tdEfXQQVIqgtlrugQbSxf7MgYJ7CCvqJK1U0GFoSv623ipTvTipiu9HCeLVdMZnYoeqDE
	I+iZvbXEm9YseBF5mbRUCDozq0CNvDMxCegJsAYPee1LbHFgsCy6MqX6YYSIxV+VUgfo8a14W7X
	PEYmhqxXSZcGPOzmKFqIBmAyoMLJxEabyyP3HtDR3/Ci6NYjZ6aAdFKTokBXI8OcKwQSSxd9vD7
	encSFjo1Xp36GglYUB7V7qvD2Hb813ljGuflYhNN0yMDuqG1keAYKFYTp+xkDlgcJ1GthzzKoeG
	6dYjjdgolCdrvP7ftRbEDiHsfzLe8A7NQb5ZOBojAkp34VoMPw1/K6Z4UIDy+inA9SCSWOG82t+
	rofRstHBaQ8VTrqYSSiaYSIeIdS6HqAbjQvoYz9Nwc53AR5dxMs5WqEmjEJAK0sJA==
X-Received: by 2002:a17:907:da16:b0:bc2:e438:da0c with SMTP id a640c23a62f3a-bc56c72d871mr1459282166b.22.1778519163525;
        Mon, 11 May 2026 10:06:03 -0700 (PDT)
Received: from ahossu.localdomain ([2a02:a420:2368:9048:c0cb:8552:96ce:1210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bccffbac588sm325319366b.6.2026.05.11.09.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:06:02 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: greg@kroah.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 2/3] staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
Date: Mon, 11 May 2026 18:57:42 +0200
Message-ID: <20260511165743.1588637-3-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511165743.1588637-1-hossu.alexandru@gmail.com>
References: <20260511165743.1588637-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Seven out-of-bounds read paths in the IE parsing loops of
issue_assocreq() and join_cmd_hdl():

1. Vendor-specific OUI comparison reads 4 bytes past a possibly short
   IE payload (issue_assocreq).

   For WLAN_EID_VENDOR_SPECIFIC, the code calls memcmp(pIE->data,
   OUI, 4) on RTW_WPA_OUI, WMM_OUI, and WPS_OUI without first
   verifying that pIE->length is at least 4.  Add pIE->length >= 4
   guard before the comparisons.

2. WPS truncation path passes vs_ie_length = 14 when pIE->length < 14
   (issue_assocreq).

   When wifi_spec is 0 and the IE matches WPS_OUI, the code sets
   vs_ie_length = 14 and passes pIE->data to rtw_set_ie() regardless
   of pIE->length.  If pIE->length is between 4 and 13, rtw_set_ie()
   reads up to (14 - pIE->length) bytes past the IE payload.  Skip the
   IE with break when pIE->length < 14.

3. HT Capability IE memcpy reads sizeof(struct HT_caps_element) bytes
   from an IE that may be shorter (issue_assocreq).

   The WLAN_EID_HT_CAPABILITY handler copies:

     memcpy(&pmlmeinfo->HT_caps, pIE->data, sizeof(struct HT_caps_element));

   If pIE->length < sizeof(struct HT_caps_element), the memcpy reads
   beyond the end of the IE payload.  Add a minimum length check and
   skip the IE if it is too short.

4. rtw_set_ie called with untrusted pIE->length for HT Capability
   (issue_assocreq).

   After the memcpy the code passes pIE->length directly to
   rtw_set_ie() as the IE body length.  If pIE->length exceeds
   sizeof(struct HT_caps_element), rtw_set_ie copies that many bytes
   from pmlmeinfo->HT_caps, reading past the end of the struct.
   Use sizeof(struct HT_caps_element) instead.

5. WMM guard in join_cmd_hdl() insufficient for WMM_param_handler().

   The WLAN_EID_VENDOR_SPECIFIC handler in join_cmd_hdl() calls
   WMM_param_handler() after a pIE->length >= 4 OUI check.
   WMM_param_handler() reads pIE->data + 6 and copies
   sizeof(struct WMM_para_element) = 18 bytes, requiring a minimum of
   24 bytes total.  Strengthen the guard to pIE->length >= WLAN_WMM_LEN.

6. HT Operation IE accessed without minimum length check (join_cmd_hdl).

   The WLAN_EID_HT_OPERATION handler casts pIE->data to
   struct HT_info_element * and reads pht_info->infos[0] (offset 1)
   without verifying pIE->length >= sizeof(struct HT_info_element).
   A zero- or one-byte HT Operation IE causes an out-of-bounds read.
   Add a minimum length check and break if the IE is too short.

7. Loop advancement uses literal 2 instead of sizeof(*pIE) in both
   loops.

   i += (pIE->length + 2) is functionally equivalent to
   i += sizeof(*pIE) + pIE->length today, but the literal 2 is
   inconsistent with the sizeof(*pIE) guards added at the top of each
   loop.  Use sizeof(*pIE) + pIE->length for consistency.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v5:
  - In the WPS truncation path of issue_assocreq(), v4 set
    vs_ie_length = 14 and called rtw_set_ie() with pIE->data even when
    pIE->length < 14, reading (14 - pIE->length) bytes past the IE
    payload.  Fixed by breaking out of the switch when pIE->length < 14
    (sashiko review of v4).
  - The WMM guard in join_cmd_hdl() was pIE->length >= 4, sufficient for
    the OUI check but not for WMM_param_handler(), which reads
    pIE->data + 6 and copies sizeof(struct WMM_para_element) = 18 bytes
    (total 24).  Strengthened to pIE->length >= WLAN_WMM_LEN
    (sashiko review of v4).

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

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 68ce422305ed..0c4a73805d39 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2943,9 +2943,10 @@ void issue_assocreq(struct adapter *padapter)
 
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
@@ -2953,7 +2954,8 @@ void issue_assocreq(struct adapter *padapter)
 					 * would be fail if we append vendor
 					 * extensions information to AP
 					 */
-
+					if (pIE->length < 14)
+						break;
 					vs_ie_length = 14;
 				}
 
@@ -2967,8 +2969,10 @@ void issue_assocreq(struct adapter *padapter)
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
@@ -2981,7 +2985,7 @@ void issue_assocreq(struct adapter *padapter)
 			break;
 		}
 
-		i += (pIE->length + 2);
+		i += sizeof(*pIE) + pIE->length;
 	}
 
 	if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_REALTEK)
@@ -5340,7 +5344,8 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:/* Get WMM IE. */
-			if (!memcmp(pIE->data, WMM_OUI, 4))
+			if (pIE->length >= WLAN_WMM_LEN &&
+			    !memcmp(pIE->data, WMM_OUI, 4))
 				WMM_param_handler(padapter, pIE);
 			break;
 
@@ -5353,7 +5358,12 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
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
@@ -5384,7 +5394,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 			break;
 		}
 
-		i += (pIE->length + 2);
+		i += sizeof(*pIE) + pIE->length;
 	}
 
 	/* check channel, bandwidth, offset and switch */
--
2.53.0

