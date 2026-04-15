Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDE32EFDAF
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776229419; cv=none; b=PlSUcp0M3wbW7w7xm/l0c96vEFa9KbwFjsRi237lJOIH9DFNURn+EF2i1AJtaTjrRVMi2txf86rkjERQmQnkQ1uwh5BNjaBDWZZOqzLAxi7UYyM2CYayVyOFh0XOhsSiDzDpwTHJdAE/A6YVVt/IBlBnbUDaldssldQrfP/e7jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776229419; c=relaxed/simple;
	bh=taa0CwCjVbXqFGiZcdkHJGwrumVBY9KfsS7dlDxF2K4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a50KK7GGo8LPV6TojtCjL2aI9eJSNXoooOFkJxjEUzt9pfdNUmWfEzxS+g9ED6J2t52V1RBQfDrQEzV5h5SXVejirQN561Stk/dPuBFF0DtMrDS84W41/H9xlzhoE9UZ7C00KUPwdvv4Y99Mq0JrnzkmKqv4MHf8X5Htl9px1zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d0pQqK0J; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d0pQqK0J"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776229406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w42Bb8W0m4L1gMevaj9Gu/MZ0eylxAEDTa/wabJlGLs=;
	b=d0pQqK0JrSUyUofD6zR5/OPXLSEeQvVJ9yQlajtEoLcY/lt9t9mhWVRncu497bsrMeWvlK
	DC+bb0D3O1R38gIDHCInoUuAHsxSrSMDuR/VbT/dhK7G2DDkixX0ITu/6UpI1hpC//ZzZJ
	QrB+OPXDV6XpI06NFEpEqyURZ05kMVs=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix remote heap information disclosure in issue_assocreq
Date: Wed, 15 Apr 2026 07:03:02 +0200
Message-ID: <20260415050302.9934-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

When building an association request frame, the driver copies the
ht capability ie using the attacker-controlled pIE->length from the
ap's beacon. If the ap provides a length greater than the size of
struct HT_caps_element (26 bytes), it causes an out-of-bounds read
of the adjacent heap memory (HT_info and network structures).
This uninitialized or sensitive memory is then transmitted over the air,
resulting in a remote heap information disclosure.

Fix this by clamping the length passed to rtw_set_ie() to the actual
size of struct HT_caps_element.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
---
Changes in v2:
- Refactored rtw_set_ie() alignment to follow "open parenthesis" style.
- Allowed the line length to exceed 100 characters for better readability as requested by Greg KH.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..08e597bc0345 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2954,7 +2954,9 @@ void issue_assocreq(struct adapter *padapter)
 			if (padapter->mlmepriv.htpriv.ht_option) {
 				if (!(is_ap_in_tkip(padapter))) {
 					memcpy(&(pmlmeinfo->HT_caps), pIE->data, sizeof(struct HT_caps_element));
-					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, pIE->length, (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
+					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY,
+							    min_t(uint, pIE->length, sizeof(struct HT_caps_element)),
+							    (u8 *)&pmlmeinfo->HT_caps, &pattrib->pktlen);
 				}
 			}
 			break;
-- 
2.53.0

