Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E83439B4BB
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277993; cv=none; b=Sy+dzFSYGJowybnRn5ix/9JFMlbzDIm8tM5guuWxNyXmVlvfotTQ+Opz/wa/KPTxF2fIAiGwh5O7mvsyapvGdm50HVqdXk1+KXTItfEtVgM1ueYB3PeIATj4s2znb6KMA6c00cKfot85/Vn04wa5Tfjbq1f+VOBrUhyQqI7qGC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277993; c=relaxed/simple;
	bh=+YeUIV1+wtcPKuOvB4oPRVaxMCPwWFWxjyfdg1SSC4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KArt6aONRqHB3aU9XVisaRfzbLCMj64VtRctLDCd3YR/R5ZnWh3TQNHkjbHyBmbnsnf8qKtonEFBTnolzBJ3wajh+afmaY7QkPkQE6aykzZGzz9Tdzgit3ztFx8tXx9LLYEq10aSZ1e1t6Tk6QFwD8OCRr+8excacYroBp0dK5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue9QdCsk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue9QdCsk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so123054055e9.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277990; x=1777882790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMczc9e1ajSbK4Mrr/Qq92dYlg6aGcU3H3gAe4DnWL8=;
        b=Ue9QdCskne7Eo0KEVvj1Lr97WKoWBpr894dY7y6HJinwIePKIT5x8VOM6FQii+tS73
         of26GJv29cRelFdJ8nU4VJSs2KJgV5k0grPYGmvxNuyynMdB3QC0BNPKTvxhzmKJ6qZ7
         U5AHzuYXEmdvK5dCKVJaXyaWivM/nrfYKCzN0gZBEM7x0x6c4ePsLZ0mL1KsDcDI9VFQ
         YjLn1ywQwIX+ql76CHx7y6YzW0XPrZqF49vy22EJVitDIdxRa2zQ9fvNfDqR9rhIYdvl
         kqKKNTpsPNpuy/A+4Axt1vXxYkfKIf9Apzm/hw6icE9GVphnNaKG5kxgGsERc91PKkKq
         n8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277990; x=1777882790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMczc9e1ajSbK4Mrr/Qq92dYlg6aGcU3H3gAe4DnWL8=;
        b=iAcCusBmNvO7Qg2GMMKmFsuGajZtkQfJc2k3gfAWEM/N7uwxucfh905Uu/jQkDBOFm
         fRucrNIM1mYB+prZn1qbBrtW97x0HEuh4ueElAzYhDWAR74XLR1Bkwbv8+hXdykTbvBG
         D6sqxsiOqmSO8M4mKodAGM9EkK7/dy181Rm6KAw0fd1VHEAOyGax8q1Uv9Z7xxS22VrV
         zXO7XIil7aruO0XhM1vNNO08sEQNoTpfRg4Xpnk6AP1KqcVwouYXevEEQNRqY1TkcUOT
         DDkjUsmPvelJ4of0EZx3WvGFCu6gPkWCoG6r5rD1WJDOKma69MhRGvLaT6goX6NUdrpP
         9NAw==
X-Forwarded-Encrypted: i=1; AFNElJ/jC1SGftI1PBttJHgQ777Ua8FKqHXBywWsBD7aMMXnod6wHsd0Byu4/zSBu0pu950Gnw9g1lsczcTUdkpg@lists.linux.dev
X-Gm-Message-State: AOJu0YwuzPLp3BQ7nD69ocBRD3+QAmYFqWxdBngv6pFiqkUvGy24Q25E
	E9XFK6GtXBT0HwU1vh1tpUXHAhCP0ud7IxKK1T7Ui25WXFCRmy0ICBMy
X-Gm-Gg: AeBDievWRNkFegNBKU4ylhPfVvp84Fz4DtcDyrHJLUVj2i7oAi3AgCIKXLkrAao/hXM
	B8vbxK6t4LF/LrBxMKM3P38do3DfdwIQ5VZrbcPn+33W36enDEsB3YUqQseSN5nCyNUpNpbJgCu
	vbA5BL3qLe9qxxbLbv+YBH/hr1oa1tC5A0zcjQtydG2anYruzIQkytdUSe9EIjlLbkM0U2ueneQ
	ro9iw/2Rilhz4AD9hw1Gz32wPNM+alTT9mreNUjByvOGTL1FlAPiFZS8sxVBPlbzlIlWY+evG1D
	JfU0QCTKO47Du6wb1tUfd1SlrTchCibctnuNkbXOYU/kr5mdrx3FgH9HjtcewhR4n4eahn1AY41
	uvBM8UfaWPHYr6It18jl3y/wOpGf+PpjrDC3c7w2oqYJ0jgCHN7nkPBAsGX7XJ9QAvKOAMoEIlL
	FYbEijmn7/jXFY/DkPvpZmCROwJQZpbqE01rctHRvvTLDBoP3Rd9dBCJ4bn5dfNEaKbnhF0rcJ8
	NAQve0TgmDGx4VPjKde+pQsgemf3n0Kq3RyxmCSlKAdpPG4LiY2nCsk7ls0tVlFNOtyTvo=
X-Received: by 2002:a05:600c:c090:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-488fb74e130mr452914045e9.8.1777277989920;
        Mon, 27 Apr 2026 01:19:49 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm90455670f8f.20.2026.04.27.01.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:19:49 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop
Date: Mon, 27 Apr 2026 10:17:48 +0200
Message-ID: <20260427081748.3407939-3-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IE parsing loop in OnAssocRsp() advances by (pIE->length + 2) each
iteration but only guards on i < pkt_len. When a malicious AP sends an
AssocResponse whose last IE has only one byte remaining in the frame
(the element_id byte lands at pkt_len-1), the loop reads pIE->length
from pframe[pkt_len], which is one byte past the allocated receive buffer.

Additionally, even when the header bytes are in bounds, pIE->length
itself can extend the data window beyond pkt_len, silently passing a
truncated IE to the handler functions.

Add two guards at the top of the loop body:
  1. Break if fewer than sizeof(*pIE) bytes remain (can't read header).
  2. Break if the IE's declared data extends past pkt_len.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c646dc2a1741..68ce422305ed 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1406,7 +1406,11 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
 	/* for not to handle the synchronous IO in the tasklet */
 	for (i = (6 + WLAN_HDR_A3_LEN); i < pkt_len;) {
+		if (i + sizeof(*pIE) > pkt_len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + i);
+		if (i + sizeof(*pIE) + pIE->length > pkt_len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-- 
2.53.0

