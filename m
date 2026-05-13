Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB193A7832
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696377; cv=none; b=XlFtVJV4Ps9ZYdjXAs5yRN8fImfM8HCkxI0mJaqH9NAAcBhtLbLuhKOy8Q91x6BH1IKj+9e+77jrBameSECqcY5Ed92B6ARh8fnIXyE3DydbCXWoNGIrxl5XfvpMaXGfjjoGgOg2k4JqbxEGbpTzb3dJKN7oIiP+Bb3ticj2TAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696377; c=relaxed/simple;
	bh=SqDUWOcGg1DOG4eUjn40UHul3iQc8hPYMTUPRK26v3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ugx9Nzgm+W73sTOHAZ7DqvGu6C50jz+TwEtfwaH3XwmPtMJQj8xepZCgpZZTWdF1hBQSiD9uduL2R7gqFo5KoBafNnylgzqBnkJpWcEMeJp9OxX+XmpMwyhNr9pLtpesrGGmcWaWwcv5FAXlQJ2ie+LTWJ2/b/GPV/g1BsEIF/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=htpyC556; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="htpyC556"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778696362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=duqhmHkP8CnjyuzNSByI4zMgLaDiBfY8Brm9nHr4YjQ=;
	b=htpyC556PcUJy2nSSjLWiV0n3vFFgZ0V1IIgR0H9tWyAUPxXKjUHTnxsUJyZukHvNPNWnB
	68rQYgEEtZP++jErvLlDcfdBFOVkfPPtzru+YxPJeH53+psZ/O5o3mlo9lNR19FyCPZ2Ps
	aeq3MabgSlPjfcUPy/lkaf8a4Q8bLn4=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH v5] staging: rtl8723bs: fix remote heap info disclosure and OOB reads
Date: Wed, 13 May 2026 20:18:42 +0200
Message-ID: <20260513181842.17480-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

When building an association request frame, the driver iterates over
the ies received from the ap. In three places, the driver trusts the
attacker-controlled pIE->length without validating that it meets the
minimum expected size for the respective ie.

For WLAN_EID_HT_CAPABILITY, this causes an oob read of adjacent heap
memory which is then transmitted over the air (remote heap information
disclosure). For WLAN_EID_VENDOR_SPECIFIC, it causes two separate oob
reads: one when checking the 4-byte oui, and another when copying the
14-byte wps ie.

Fix these issues by adding upper-bound checks at the start of the loop
to ensure the ie fits within the buffer, and explicit lower-bound
checks to return a failure if the length is insufficient. For
HT_CAPABILITY, also clamp the length passed to rtw_set_ie() to the
struct size.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
Changes in v5:
 - Address shamiko comments.
 
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 32 ++++++++++++++++++-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  6 ++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index cfd3eb253350..e448a814eb1c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2862,6 +2862,9 @@ void issue_assocreq(struct adapter *padapter)
 		if (pmlmeinfo->network.supported_rates[i] == 0)
 			break;
 
+		if (index >= NumRates)
+			break;
+
 		/*  Check if the AP's supported rates are also supported by STA. */
 		for (j = 0; j < sta_bssrate_len; j++) {
 			 /*  Avoid the proprietary data rate (22Mbps) of Handlink WSG-4000 AP */
@@ -2891,10 +2894,25 @@ void issue_assocreq(struct adapter *padapter)
 
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
+		if (i + 2 > pmlmeinfo->network.ie_length) {
+			rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+			rtw_free_xmitframe(pxmitpriv, pmgntframe);
+			goto exit;
+		}
+
 		pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
 
+		if (pIE->length > pmlmeinfo->network.ie_length - i - 2) {
+			rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+			rtw_free_xmitframe(pxmitpriv, pmgntframe);
+			goto exit;
+		}
+
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
+			if (pIE->length < 4)
+				goto exit;
+
 			if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) ||
 					(!memcmp(pIE->data, WMM_OUI, 4)) ||
 					(!memcmp(pIE->data, WPS_OUI, 4))) {
@@ -2906,6 +2924,9 @@ void issue_assocreq(struct adapter *padapter)
 					 * extensions information to AP
 					 */
 
+					if (pIE->length < 14)
+						goto exit;
+
 					vs_ie_length = 14;
 				}
 
@@ -2919,8 +2940,17 @@ void issue_assocreq(struct adapter *padapter)
 		case WLAN_EID_HT_CAPABILITY:
 			if (padapter->mlmepriv.htpriv.ht_option) {
 				if (!(is_ap_in_tkip(padapter))) {
+					if (pIE->length < sizeof(struct HT_caps_element)) {
+						rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+						rtw_free_xmitframe(pxmitpriv, pmgntframe);
+						goto exit;
+					}
+
 					memcpy(&(pmlmeinfo->HT_caps), pIE->data, sizeof(struct HT_caps_element));
-					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, pIE->length, (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
+					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY,
+							    sizeof(struct HT_caps_element),
+							    (u8 *)&pmlmeinfo->HT_caps,
+							    &pattrib->pktlen);
 				}
 			}
 			break;
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index cc1a7497764c..dc4abef3a7b8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1327,8 +1327,14 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 
 	if (rtw_get_capability((struct wlan_bssid_ex *)cur_network) & WLAN_CAPABILITY_PRIVACY) {
 		for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
+			if (i + 2 > pmlmeinfo->network.ie_length)
+				return false;
+
 			pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
 
+			if (pIE->length > pmlmeinfo->network.ie_length - i - 2)
+				return false;
+
 			switch (pIE->element_id) {
 			case WLAN_EID_VENDOR_SPECIFIC:
 				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) && (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
-- 
2.54.0

