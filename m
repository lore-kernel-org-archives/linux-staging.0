Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B913CF032
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 16:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776270853; cv=none; b=K+CPAsCaE4QQyUaILwY0kM29+vh+9/Qg3EjFXr0iu3jH4MvCAoutoqUDWzLfqb3GI+D41O/qFY7WoTja8iwSm5ByqPlMbp8SWVAhUxV7Z6jR0QlgxA3BFW9BxU3dHqhq44oDUOeFL6tC7LCcMAG+ScE00m7VR/F/rhYfS7RZxMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776270853; c=relaxed/simple;
	bh=BvgwX0Kixv06gv1D+xvgtwmqP0epM+duq0sIiCTkQnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2pNxI6yqC9M9b3QXSdHNFgVuKOrgaqeDs2IyuNGZTjuiBxEq+xnGIqQhwMTbRDowCjSOZy2y+/U7a7p8VT+eRnMzwY6XWmTIYA11eJMg1ECsf27Nkf7d9IEWoXAGWnbvdx122gDXeJyHaYeopeEEIHml74dM40aluGzz9sh+zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qwe1Fhqq; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qwe1Fhqq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776270849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pBq1Q6Ow5wSMRcimcwMcZX84aCssngkOPJwRUeKJoXM=;
	b=qwe1FhqqKL7pPcxiLCor7gPr7Q5yEC5+wQqQ35uWEqsJcVRckHtghi5Ocmgn0wuvY5blgl
	I2Y0zM3YlXgiVWJYRhqfC3m1yAdVD4FdHJ6SKiMnuP8ybwnNS0x0LF6+09ECCDsa5U4Fo5
	4miEH+5kYrlSx+UARBhNTvY481D4TXk=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] staging: rtl8723bs: fix remote heap info disclosure and OOB reads
Date: Wed, 15 Apr 2026 18:33:22 +0200
Message-ID: <20260415163322.42682-1-luka.gejak@linux.dev>
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
Changes in v4:
- Added upper-bound checks at the start of the loop to ensure the ie
fits within the received buffer, as pointed out by Dan.
- Updated commit message to reflect the addition of upper-bound checks.

Changes in v3:
- Switched to fail-fast handling for malformed IEs in issue_assocreq().
- Fixed HT capability path to use structure-sized output length in rtw_set_ie().
- Updated commit message to reflect all oob read cases.

Changes in v2:
- Refactored rtw_set_ie() alignment to follow "open parenthesis" style.
- Allowed the line length to exceed 100 characters for better readability as requested by Greg KH.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..1e85a230e2f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2925,10 +2925,19 @@ void issue_assocreq(struct adapter *padapter)
 
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
+		if (i + 2 > pmlmeinfo->network.ie_length)
+			goto exit;
+
 		pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
 
+		if (pIE->length > pmlmeinfo->network.ie_length - i - 2)
+			goto exit;
+
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
+			if (pIE->length < 4)
+				goto exit;
+
 			if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) ||
 					(!memcmp(pIE->data, WMM_OUI, 4)) ||
 					(!memcmp(pIE->data, WPS_OUI, 4))) {
@@ -2940,6 +2949,9 @@ void issue_assocreq(struct adapter *padapter)
 					 * extensions information to AP
 					 */
 
+					if (pIE->length < 14)
+						goto exit;
+
 					vs_ie_length = 14;
 				}
 
@@ -2953,8 +2965,14 @@ void issue_assocreq(struct adapter *padapter)
 		case WLAN_EID_HT_CAPABILITY:
 			if (padapter->mlmepriv.htpriv.ht_option) {
 				if (!(is_ap_in_tkip(padapter))) {
+					if (pIE->length < sizeof(struct HT_caps_element))
+						goto exit;
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
-- 
2.53.0

