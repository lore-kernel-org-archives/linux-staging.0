Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8635949
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 21:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773522458; cv=none; b=h3QszLjegCRp9nk1JcjE4lIlkk1VijTEOl5XUWqtCNR4qEbOh6eU9g3UfiFLW8rcvBkDF18lg/w6/OLCkkf6LMRyt+mLrrLP0gLKa2fWFq7SfawZxL+x6Q58XObrAG4SK7OOHzIgVGALPJnlOmJK2JV+kPGbhTm6jPUzuNOpokQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773522458; c=relaxed/simple;
	bh=9DDMenW0vPqf5+5xZn3R/D3TLty3tgMEZVUg1GjdBnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msSMSh8b6xjFFccXXv/D5IOOCWBX+Qfz7AruUG9WU0wBbt8QJaf5jn67/ysn6X079dAoAzRl9dPyo29dhyK1i8ag1KlydYoSU5wHpKyp/XZBqicpcM/ox88xEtxX0z1T5Au4frt+4vREkYjYsbVs28Z5HWM1ibj0iAW9vXaCjss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFXycbD8; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFXycbD8"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so26459e0c.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 14:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773522456; x=1774127256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U8R2pGjILFy8GTgK2aL2ly1h4FzvaEh9yan4utzdYfY=;
        b=WFXycbD804Pm45uVH8114OKs1qSPAO6XXC/tewp1uGv1+goKsU8I85KpjIylLeeH2L
         cyL4GplvZzn5oOo0l7YbECXnHkWZ3yLCyw4SuY+MIGg5+Xv3PqUOVSFX+aWF6mf5fhQD
         LccySfj5roLgx2Ec5FnX5INwntp8A6hsnQ8iinaimf8yHRNDXIuYmle5yV9e5aSjge9k
         DMQhXM4k/Zp1kT4iBO5n3Jt57nu3bDFpFHEUCB1Bdraal/93LjPhktWjvPmO6PkJxSzv
         yMaysB6DgAbz27m6x0TG7H2slojwybWgvvS/st7kkEWlzZsrh9fi+1/W8+l7NSPb9/y5
         Gk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773522456; x=1774127256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8R2pGjILFy8GTgK2aL2ly1h4FzvaEh9yan4utzdYfY=;
        b=UOgFHZkkIwhXdngDaqfbYX43WUw43zHqyYaFBJVBiLUFGAm4UmLKVsImbt0jjmg6Hn
         ZUmmxboFq6F9LKaaoOSzNaojjEeTiV4SHDo+CI9qcJUuEI6Wwr+dRj6UQEsResKxK2SN
         efRU1EEIrx9x7EKDVUYRryLmZPxh5REKehw7qgGMiXvdv4Rb+G1/ZMkNJez+5MP/o1+3
         oyY1cZ+XzKUVVGJYPP61CGT5GRG141e487YXCdiCg9ysYbfLhpf5EtpjidrjFjASW8Av
         XRFuKi5SmW+kHHpWIWkxJMaGhQoF7/UcwMvC1Zz8QmLw++RyQJbGdU6nIXQ+SE7UOi57
         LUdA==
X-Gm-Message-State: AOJu0YwG5xZl7v/AEGFANjIiApo3+/nUCxPXLo/LnyLBfRpLqLuKshvK
	zm3f0zP4lfgfQj/dEOPG3XJvxK26yR/JhKDC+xjCv6Tji7cupVIITHCw
X-Gm-Gg: ATEYQzwmPxIwbvCGfWPFyOPeYyNJS1zZtP2L80f1nZswcWEBChheWEHNY6hL3KiDoQD
	fzwjsiVnUNCyX+MWEzJkJ1gLUfyNvNdhY/W8U/G6f4QdNUkoDSCVEpEHbSvzb4fAzxZ6Nr/iNrl
	iT/+V6gN4kCynfpcCRCYU7CouUGq8LDuRecihB4kRXgK0bqUUmpVMWoAACYmAl14m/t6b+0tWrA
	ap8ipssw1vF0ub1medv5f6J2Kx7J/AXLE6o2Q+ah3Na158/toViUFhQrTvKQLYs1PK8bJq4/vze
	oS0mOQhkD0M1DfVG/7KjjrH9ZAVFVdu41nr4yrLHQ2tNKIj4Gxgf6KNX7nZ7Kmd5A45JklbahG+
	pPGh2G5dwmH06BNvltZ9mqFqxhdOsnOm0Cu7pOo+R0ZaetDZOXT/HHbjP0MEuGg9Zpqw3MgkllA
	X4UAp2p99E7n2XolCu+a8EL54yTnhK801RrxGqGha0D0/LohUE8FqXfyKUyA==
X-Received: by 2002:a05:6122:1d43:b0:56a:8f7c:49aa with SMTP id 71dfb90a1353d-56b61566e5amr2851584e0c.4.1773522455918;
        Sat, 14 Mar 2026 14:07:35 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4649c813sm5606083e0c.15.2026.03.14.14.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:07:35 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Replace network magic numbers with EtherType macros
Date: Sat, 14 Mar 2026 18:04:26 -0300
Message-ID: <20260314210426.42532-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded magic numbers for network protocols (e.g., 0x0806
for ARP, 0x888e for EAPOL) with their standard EtherType macro
equivalents (ETH_P_ARP, ETH_P_PAE) defined in <linux/if_ether.h>.

This change improves code readability and aligns the driver with
standard Linux networking definitions.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7b18be891..313d8b80b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -4,6 +4,8 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
+#include "linux/delay.h"
+#include "linux/if_ether.h"
 #include <drv_types.h>
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
@@ -128,7 +130,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 		if (res == _FAIL) {
-			msleep(10);
+			usleep_range(10000, 11000);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res == _FAIL)
 				goto exit;
@@ -2026,8 +2028,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_SPECIAL) {
 		struct pkt_attrib *attrib = &xmitframe->attrib;
 
-		if (attrib->ether_type == 0x0806 ||
-		    attrib->ether_type == 0x888e ||
+		if (attrib->ether_type == ETH_P_ARP ||
+		    attrib->ether_type == ETH_P_PAE ||
 		    attrib->dhcp_pkt
 		)
 			allow = true;
-- 
2.53.0

