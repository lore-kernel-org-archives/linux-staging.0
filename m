Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FBC3161BF
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196240; cv=none; b=SjbXxOfoYBZFY1OU/i6ZfYM105CIYHzkiNii5Ncv7Qyn0jokr9ONq3RzsXV+bk7TgoXUyWjC5zG/TjSBCa6Dvofy5/pxTMFFPmRbVkOPhH/od5Glt3FUPTLfR0ikf/BXVsWkYFXs0P16AVSfOLNQrIOvmcqsR2LmC8z7rzGX9Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196240; c=relaxed/simple;
	bh=DyX43exB3N4Ushpdz+THDY2bHaGuN0iQC+jFFQtUJ0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b29oPvK1Ka3BXQpUKK1fZOEFVY/HnMb4S+N2mLZNPzDk1/hhHFFDYKZmLLPaRd2RXqvVeBJ1Vu2Fn3aKiyxDxP9nbHj8yjWhMKGiN6ZOT8l1lKtEEip5TlePasztF3MDXND2RRlT8eI0W5XJcPUnr1kvJ8eDVbqvdjfepm5fhnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RhgsFDce; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RhgsFDce"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776196225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8QvIvx3H+LYLSfWoOm3kOLIVw0Q8gYITocuslFEHp9U=;
	b=RhgsFDce0RPAj6D1HIpLprtRbVMJvaevavHTvjBbi3cWqST+NCmAzTjeMPyOe6eNgM8PNt
	Z8vMD6eHZFsVRZz/qOppJOEisINnRnS/u2R+zhdm6GUgl3NnCTK1oEuEd7EipqONvrSJ21
	9Asdn0Szfn6cy1Mm9QEgaxx3m2YE6+o=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix remote heap information disclosure in issue_assocreq
Date: Tue, 14 Apr 2026 21:49:45 +0200
Message-ID: <20260414194945.138626-1-luka.gejak@linux.dev>
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
Note: Note: Alignment of arguments in rtw_set_ie() is intentionally 
like that to avoid WARNING: line length of 105 exceeds 100 columns.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..a5f30c3fd47e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2954,7 +2954,9 @@ void issue_assocreq(struct adapter *padapter)
 			if (padapter->mlmepriv.htpriv.ht_option) {
 				if (!(is_ap_in_tkip(padapter))) {
 					memcpy(&(pmlmeinfo->HT_caps), pIE->data, sizeof(struct HT_caps_element));
-					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, pIE->length, (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
+					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY,
+					min_t(uint, pIE->length, sizeof(struct HT_caps_element)),
+					(u8 *)&pmlmeinfo->HT_caps, &pattrib->pktlen);
 				}
 			}
 			break;
-- 
2.53.0

