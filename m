Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD3643B483
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 07:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976376; cv=none; b=Zw4zuOvDZT+YHE+MW7rYuPtVpnZ6PBDnzWvClIVo2hgsZFJu5ImyU31EtyEaJmZqlO/Bn5p3c0ZvfCGCE8TU2tQmslxIq/KkF8cgscGvrsEeCemeoUuTCFUGPLCiHRyj9uSmINhlkuwDqXrxkHSIyGCN8oxwOagjiYb7o3zR2ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976376; c=relaxed/simple;
	bh=xeBhIxmRsum27iDWT8Aa34JVWKOPuH9V1w5RJETUoG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JI/n01K3/pGzSsiuidSKmH24F1yCiSu9x+squ6Vmvfl6YE29Je9LvP2/XzQZdQzhGQ7qEOpRlk/iLLwsNxndKRwzQ2QdaHNgpLpZ2QfQDtz4S0RkxY8b2FZRD3KvHB9P/Q/8JGdfzNz3u7GxTX43mfUoiX+7fqCbt2WT2Lm1/wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr; spf=pass smtp.mailfrom=dgu.ac.kr; dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b=Ls7xCYRP; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b="Ls7xCYRP"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb752so2180537a91.0
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 00:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dgu-ac-kr.20251104.gappssmtp.com; s=20251104; t=1789976374; x=1790581174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vRND0vTpxN3YvnuAQTZp+U0T55qZ1iCUcnaYlfD3cCA=;
        b=Ls7xCYRP4U8Hvxat5jke7exQf4Fx4/dDFpBKWqV9XOsV4gK3IqfjjTWKjocgOP5aeu
         1jYJvK+ReTWyti0AMIO21SVqRKmQsoW9gP23QGDqqzU07LWz/+6abX65JTcOtHlsIq58
         +q7/8wyz5FAz0wKpu8efR4XCc0UdcJ6AhqzAZn+vrUSEh2T8QB65bU9E/sbpYuCUXUh/
         CcyqRyvLgid9ibNFhxazZD7mrEhRBNg7O8ZHwPvwc+ceY1EksXSDCPlKkUQkYf90cq9N
         EPwSQYOo1MthIMptHQk5yXHJsjOXXehuSUPkyS17wHP8Dqqviabz+Htkh+tP1qiIW4iz
         D0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976374; x=1790581174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRND0vTpxN3YvnuAQTZp+U0T55qZ1iCUcnaYlfD3cCA=;
        b=fTrDZ0Qcir6BGW9RZLyRygA9WerVv0JZNp5xgiWNQyoD67AbA7c9WIazlHEV8nF3IJ
         46naUUj2f7sii1F+1JUllJf/gJ8ZMiMiyRoaRz3ykuBHwK6M1L8GN88yPV3wzB073qpu
         SRkH1ckGD3cpycqMQSjOFANmhS8xdUxHcRuYTepJUNnU6PT/afClzk4evo44YRFFUQsg
         vDaD1ozLoXXzMUEiHrUF+sUJsO52NRSTMHxhG8DMB/JbiNcsH9h8h5FttDwT+BA+K83r
         8mWd2QjFBvX0UzbyHT+a0wxrWXe58xdnPKlzOt8knXzYh6kMSj+PgsatokKkqJYqiIih
         7pDw==
X-Gm-Message-State: AFuF++lOxBalliLn65pLV8Kpz7Lm41LtNtWGAb8j4HI5KqsFHKiMG6OK
	RMMt9IVOok+vt1y4uE0titKnBAlqzAnjF70N9X8ahrCLq7GB0GkpGfaBP36aRFDyw+Y=
X-Gm-Gg: AYBFou3ES6mSd7OdZ9QxXAlmM9RtX5vPcgRcDC3jlUda7qjPejCJjTM3SMU1g93GvjW
	jtzgrxuTYLXvz+bB86HsmJeIcmme6QLAWbDLw95XuTWc2dscDyYD4T6cGLXVGTbofAd6AYtDZR/
	b+ZCGEm/nFyEtO3gQknHwJdCz1lZBRJbo7dcTi1Yd2kAEEtPRwlVSU+HTN2louiidR2BNCBfD1G
	ohGuqNQURG9tXiTcKPICcywHoZB3cmAffS5jdSf5FjmMrg3YlcBFzviKSK9RTkodkPsSvFO9TaB
	Gq6PJZ/pZCo3XzLeWtvwC1oHOOgnvJTzq73jfmch/Jg32JrzfozUDG320FX3S499/U8SfAFq5HT
	wR5pYZmWPNPAUT9Ai50KhC/NARMQAdaHnauLscLdW9/18tO7Zvgv5ss2j0ozKhn2iJZWKTu7Vti
	uSOEKvmFv9kUWMTZkMono7zVdt4yhcG84z5xZjuWvvDrRI8lx2Ne0MxiuUb1i17vaaa91Uo/TBc
	yVa5dE=
X-Received: by 2002:a17:90b:38cc:b0:3a0:41ad:6b9b with SMTP id 98e67ed59e1d1-3a041ad747dmr3326538a91.34.1789976374181;
        Mon, 21 Sep 2026 00:39:34 -0700 (PDT)
Received: from localhost.localdomain ([175.193.106.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cabb771sm13003713a91.9.2026.09.21.00.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:39:33 -0700 (PDT)
From: Park Tae-sun <ts930@dgu.ac.kr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Park Tae-sun <ts930@dgu.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix buffer overflow and OOB accesses in rtw_check_beacon_data()
Date: Mon, 21 Sep 2026 16:37:30 +0900
Message-ID: <20260921073730.83679-1-ts930@dgu.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rtw_check_beacon_data(), the Information Element (IE) parsing logic
has boundary validation issues and search window calculations that can
lead to out-of-bounds accesses:

First, IEEE 802.11 beacon frames contain 12 bytes of fixed parameters
(Timestamp, Beacon Interval, Capability Info) before variable IEs start
at _BEACON_IE_OFFSET_ (12). The function checks len < 0, but if len is
smaller than _BEACON_IE_OFFSET_, (pbss_network->ie_length -
_BEACON_IE_OFFSET_) underflows on the u32 field, and reading the beacon
interval at offset 8 via rtw_get_beacon_interval_from_ie() accesses
out-of-bounds data if len < 10.

Second, the manual vendor IE loops for WPA and WMM advance p by
(ie_len + 2) on non-matching elements, but calculate the limit passed
to rtw_get_ie() as:
  (pbss_network->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2))
This only subtracts the previous element's length rather than the
accumulated offset (p - start), causing p + limit to extend past the
end of the buffer on subsequent iterations. In addition, calling
memcmp() without checking ie_len can read past short vendor elements.

Third, in the WMM loop, once the OUI matches, bytes up to *(p + 22)
are modified without checking whether the IE contains the full
24-byte WMM parameter payload (WLAN_WMM_LEN). A truncated element
leads to out-of-bounds writes.

Address these by:
  1. Checking len < _BEACON_IE_OFFSET_ at function entry.
  2. Using the existing rtw_get_ie_ex() helper which validates
     element boundaries and OUI lengths before calling memcmp().
  3. Passing ie_len directly to rtw_parse_wpa_ie() without +2,
     because rtw_get_ie_ex() already includes the 2-byte header.
  4. Verifying that the WMM element has at least WLAN_WMM_LEN + 2
     bytes before modifying the parameter records.
Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 81 ++++++++++---------------
 1 file changed, 33 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4728f62a1557..70e95b07ca2a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -771,7 +771,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return _FAIL;
 
-	if (len < 0 || len > MAX_IE_SZ)
+	if (len < _BEACON_IE_OFFSET_ || len > MAX_IE_SZ)
 		return _FAIL;
 
 	pbss_network->ie_length = len;
@@ -885,61 +885,46 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	group_cipher = 0; pairwise_cipher = 0;
 	psecuritypriv->wpa_group_cipher = _NO_PRIVACY_;
 	psecuritypriv->wpa_pairwise_cipher = _NO_PRIVACY_;
-	for (p = ie + _BEACON_IE_OFFSET_; ; p += (ie_len + 2)) {
-		p = rtw_get_ie(p,
-			       WLAN_EID_VENDOR_SPECIFIC,
-			       &ie_len,
-			       (pbss_network->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2)));
-		if ((p) && (!memcmp(p + 2, OUI1, 4))) {
-			if (rtw_parse_wpa_ie(p,
-					     ie_len + 2,
-					     &group_cipher,
-					     &pairwise_cipher,
-					     NULL) == _SUCCESS) {
-				psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
-
-				psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
-
-				psecuritypriv->wpa_psk |= BIT(0);
-
-				psecuritypriv->wpa_group_cipher = group_cipher;
-				psecuritypriv->wpa_pairwise_cipher = pairwise_cipher;
-			}
+	p = rtw_get_ie_ex(ie + _BEACON_IE_OFFSET_,
+			  pbss_network->ie_length - _BEACON_IE_OFFSET_,
+			  WLAN_EID_VENDOR_SPECIFIC,
+			  OUI1, sizeof(OUI1), NULL, &ie_len);
+	if (p) {
+		if (rtw_parse_wpa_ie(p,
+				     ie_len,
+				     &group_cipher,
+				     &pairwise_cipher,
+				     NULL) == _SUCCESS) {
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
-			break;
-		}
+			psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 
-		if (!p || ie_len == 0)
-			break;
+			psecuritypriv->wpa_psk |= BIT(0);
+
+			psecuritypriv->wpa_group_cipher = group_cipher;
+			psecuritypriv->wpa_pairwise_cipher = pairwise_cipher;
+		}
 	}
 
 	/* wmm */
 	ie_len = 0;
 	pmlmepriv->qospriv.qos_option = 0;
 	if (pregistrypriv->wmm_enable) {
-		for (p = ie + _BEACON_IE_OFFSET_; ; p += (ie_len + 2)) {
-			p = rtw_get_ie(p,
-				       WLAN_EID_VENDOR_SPECIFIC,
-				       &ie_len,
-				       (pbss_network->ie_length -
-					_BEACON_IE_OFFSET_ - (ie_len + 2)));
-			if ((p) && !memcmp(p + 2, WMM_PARA_IE, 6)) {
-				pmlmepriv->qospriv.qos_option = 1;
-
-				*(p + 8) |= BIT(7);/* QoS Info, support U-APSD */
-
-				/* disable all ACM bits since the WMM admission */
-				/* control is not supported */
-				*(p + 10) &= ~BIT(4); /* BE */
-				*(p + 14) &= ~BIT(4); /* BK */
-				*(p + 18) &= ~BIT(4); /* VI */
-				*(p + 22) &= ~BIT(4); /* VO */
-
-				break;
-			}
-
-			if (!p || ie_len == 0)
-				break;
+		p = rtw_get_ie_ex(ie + _BEACON_IE_OFFSET_,
+				  pbss_network->ie_length - _BEACON_IE_OFFSET_,
+				  WLAN_EID_VENDOR_SPECIFIC,
+				  WMM_PARA_IE, sizeof(WMM_PARA_IE), NULL, &ie_len);
+		if (p && ie_len >= WLAN_WMM_LEN + 2) {
+			pmlmepriv->qospriv.qos_option = 1;
+
+			*(p + 8) |= BIT(7);/* QoS Info, support U-APSD */
+
+			/* disable all ACM bits since the WMM admission */
+			/* control is not supported */
+			*(p + 10) &= ~BIT(4); /* BE */
+			*(p + 14) &= ~BIT(4); /* BK */
+			*(p + 18) &= ~BIT(4); /* VI */
+			*(p + 22) &= ~BIT(4); /* VO */
 		}
 	}
 
-- 
2.43.0

