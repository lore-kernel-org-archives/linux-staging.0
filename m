Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D5B3D88F7
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326185; cv=none; b=EOExTmgJAWN5xDemsNg9NPTpzTu29nbONScabbGRwFr6iB5KMQS4uHvtNd0dDNhDx6De/8Zm/N9xU8GCR1XXq+tjeIwKAjI24JkhVaczGs6q6bw6QggQU9f1r8JSU8dTikbLzUi8+EDRkJrl/tW0N2mumqIiOq9oB83iRKpWfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326185; c=relaxed/simple;
	bh=+adKIxAZwmZ6+hjn6pwKLlTrWbw/SQApQgu1grRm+Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNBlyjhmkb7qOAS66+eV/bCJABY6YqWbRkFn5VscACTMddeaoqd5yV/LG92JZNin7XuLT/NgJTje7kWSphEqGs2FoLNlIGCdhh8OG9qekCPPSKUQa5IjxOIascYAjEcCBSYRLsg9zKPSNjM8wzWnta2ngiQ+aFtR4vvUb4YH8tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qx/giWWH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qx/giWWH"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-beeba001887so35265166b.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326183; x=1780930983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zik6Tl9LCLzqEXXgs3iwGTVTHmwW7Mj9rb7ltjfp1Wg=;
        b=qx/giWWHcrPHhWK/v1IFRZOokC5XJgNyG3HN7jMwZrNMzJrLWhpavQQ8biwuxweHcK
         mQUS9cHSh5Gj2RXa4UT8jqZXTHTJ8ZFQCHod9OYk6SmYX/H3zzgDjrwmoB0ye7HmUa3f
         vLmEoqzXseGxQgFZNk9DXDLcEKAdud1Kugn05Wo22tT5EQVA3rW51GV1Gw+uraOJW+Ek
         SgW8YBsGMAE678BhfOEYb6kE5ek1hjSTpi00QKBfOlx9HlnoElfrESdtJncAfB2NhLPE
         mmnkVG8HNRepK/DnAJ1cdgMrPQFRWnWuAi6/OHty9SfHXvbhP1ov/Ul/91yxCGmvDUdY
         nG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326183; x=1780930983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zik6Tl9LCLzqEXXgs3iwGTVTHmwW7Mj9rb7ltjfp1Wg=;
        b=RFBljepXmG02qLeDRjYgHt+GoGM+zW2Qh+gPgJutKltUNnT/7UkYDy2NRjeyBNpTHm
         cJaezosmyec5PPOn7P9pTRBKtDZqRm+DrLg6fjn5R5U8HxUJ2zDgw0CfN0+XHaakTCbJ
         nK57qQ2Vf6rtwivN5eqVIDfFZEZwzkkyX4Lm29oC+dE3VwEqMXBZnDEdDO7yz+5laJwE
         v75jsuKtZ2a04+lULhM6Fg+sYBWJdWZV5ZE8qjG4XpYjI9btRU5am03beOEXzercsYR3
         mEeznZxGDwnBg7t5NfaWnPxoZxcpcTYAuxO+4PVIzWdvZnjnKClkuh+hPsquGogVCEOb
         9eEA==
X-Gm-Message-State: AOJu0YzW3qre+H+lxBj46VaDkgzrc5z3prpRn3BPDMBQJ1Sug2J4QmSR
	HDC0Ig9WjE0KVk7mycKiGsCSLPevncAv7MDTtVCXuHDKFkkZ6ii9VVBu
X-Gm-Gg: Acq92OG1Fg9/NBp3exneoVCk6wtGfA2fZ0zyRO2RkD0uepVDV9csZWiWkBb7b/ePbp/
	/fLkE7fpDov1yh6JhtQZeZ25WISO69QAvSfgBRSkB0Z6kSL9i2m58BHCgQJaqQF+uvOUHRLYC1m
	v6DeuT1EALgDrC+dkSV82vCerW3MkWVAxfjG8B+dr4JqTxR3a9i+esk44Ye8bg9DA1XhgXCujWz
	f/XA7uuOdIyQSHjekO6Wh+Rs7RfOKHqmGfszSy8j8yKwAGuTJPLqWGe2Pz75WGh98v42LNeXYmx
	yC9hmLv4EsZeZKSOmxBWTNY8sWWXPByJATvHvQNj4M7W9+lXuWZ1ZQwCGwgriIX9o75vIt9q+Nt
	TIG2O2CFDdoMSxcYvv8sX+GAQZzYzfOFATLSx8wvZPJSnYpyNwm9C3EVqioAytNrjni/R4dzXZa
	PUXvxFmByykkBuJYR7xh/P8UvS7ErsGNWelA==
X-Received: by 2002:a17:907:9453:b0:bea:5cc7:95a4 with SMTP id a640c23a62f3a-beab03de8a1mr694214066b.0.1780326182532;
        Mon, 01 Jun 2026 08:03:02 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bec1642a049sm189607466b.61.2026.06.01.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:03:02 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove unused case from update_beacon()
Date: Mon,  1 Jun 2026 18:01:23 +0300
Message-ID: <20260601150253.69930-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601150253.69930-1-nikolayof23@gmail.com>
References: <20260601150253.69930-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The update_beacon() function is never called with 'ie_id' equal to
'WLAN_EID_VENDOR_SPECIFIC', meaning this case branch will never be
called, so remove it and several related functions.

Removing this case branch also fixes a possible null pointer
dereference in update_bcn_vendor_spec() if 'oui' is NULL, since
its value is not checked in any way.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 84 -------------------------
 1 file changed, 84 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 065850a9e894..316f879923f5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1336,84 +1336,6 @@ static void update_bcn_rsn_ie(struct adapter *padapter)
 {
 }
 
-static void update_bcn_wpa_ie(struct adapter *padapter)
-{
-}
-
-static void update_bcn_wmm_ie(struct adapter *padapter)
-{
-}
-
-static void update_bcn_wps_ie(struct adapter *padapter)
-{
-	u8 *pwps_ie = NULL;
-	u8 *pwps_ie_src;
-	u8 *premainder_ie;
-	u8 *pbackup_remainder_ie = NULL;
-
-	unsigned int wps_ielen = 0, wps_offset, remainder_ielen;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex *pnetwork = &pmlmeinfo->network;
-	unsigned char *ie = pnetwork->ies;
-	u32 ielen = pnetwork->ie_length;
-
-	pwps_ie = rtw_get_wps_ie(ie + _FIXED_IE_LENGTH_,
-				 ielen - _FIXED_IE_LENGTH_,
-				 NULL,
-				 &wps_ielen);
-
-	if (!pwps_ie || wps_ielen == 0)
-		return;
-
-	pwps_ie_src = pmlmepriv->wps_beacon_ie;
-	if (!pwps_ie_src)
-		return;
-
-	wps_offset = (unsigned int)(pwps_ie - ie);
-
-	premainder_ie = pwps_ie + wps_ielen;
-
-	remainder_ielen = ielen - wps_offset - wps_ielen;
-
-	if (remainder_ielen)
-		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);
-
-	wps_ielen = (unsigned int)pwps_ie_src[1];/* to get ie data len */
-	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
-		memcpy(pwps_ie, pwps_ie_src, wps_ielen + 2);
-		pwps_ie += (wps_ielen + 2);
-
-		if (pbackup_remainder_ie)
-			memcpy(pwps_ie, pbackup_remainder_ie, remainder_ielen);
-
-		/* update ie_length */
-		pnetwork->ie_length = wps_offset + (wps_ielen + 2) + remainder_ielen;
-	}
-
-	kfree(pbackup_remainder_ie);
-}
-
-static void update_bcn_p2p_ie(struct adapter *padapter)
-{
-}
-
-static void update_bcn_vendor_spec_ie(struct adapter *padapter, u8 *oui)
-{
-	if (!memcmp(RTW_WPA_OUI, oui, 4))
-		update_bcn_wpa_ie(padapter);
-
-	else if (!memcmp(WMM_OUI, oui, 4))
-		update_bcn_wmm_ie(padapter);
-
-	else if (!memcmp(WPS_OUI, oui, 4))
-		update_bcn_wps_ie(padapter);
-
-	else if (!memcmp(P2P_OUI, oui, 4))
-		update_bcn_p2p_ie(padapter);
-}
-
 void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
 {
 	struct mlme_priv *pmlmepriv;
@@ -1467,12 +1389,6 @@ void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
 
 		break;
 
-	case WLAN_EID_VENDOR_SPECIFIC:
-
-		update_bcn_vendor_spec_ie(padapter, oui);
-
-		break;
-
 	default:
 		break;
 	}
-- 
2.54.0

