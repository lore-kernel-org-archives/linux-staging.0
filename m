Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF49527FB3A
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368645; cv=none; b=iM5pbd4tfNdvfVkiPKP7xRLVnqanyo8BZKS72bP+GrIvmEKyUaAKNIX49K29Hl7BzZSM7MGwlo6YsXc/+nh/AzrmOp+YxVpvt34Cw2f3ml7xBreEGuhD63QNV6HkHZAAfXCATNhylH9HYZqY5LuomeBEIX+Jtu0H76MwZB+Ger0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368645; c=relaxed/simple;
	bh=SZ6iIQiWartgOTaRV20kjPJz0KhW6LdfmYVl452V6ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U7A+vxGw5YZPpt/J/dsNaXGHCamBweKcaHrzbRnN7I60Ns6rmKzPFooP1UMUHvNp8GJYIftUWGiS7q398y/8mdxj8lIXnNPEjc8DRSyAtrZIYEKRKDNPYDTiK3K2hkMK/zXxPCRjCCtrn5LDrKQ7F6O/WuNt9JiyVZuPp1Se/EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5GPJaMA; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5GPJaMA"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67f94c078e8so10066769a12.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368642; x=1779973442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gR4iXkLc+1Doc0CtFipdBHFsWa2YpiIn7RpSK8c9C0=;
        b=C5GPJaMAZmxYDJdM6WYtMLYWpCvbdm5XCzM1afgwQH7KG+P25Tr/DQX92qq/gRbqAL
         UL4V7b60DoBfgey/n9mHNeiR+5KFRhBP3/y9540gfPo8WVDnk3mDuoHSKNTUnzNvycsu
         F2/18TCwHefSHQSVEB7kpAue+YVa+8UMXIRHn/Zh2eFtpSTahlzHYSXD63bsik1YiDaL
         GFLCnZmQXoW387z/OUSf32VugqjDN1JeZKKOB/wLj5gMNN87F+gDcNmelVgNu8qsph6V
         eRyncGJ8BYvoWKMa09t7srC7NL0Qpw8KYnuQ/BNnPrHRNnmpnhwsH/ZpHt4MFmQDAZWS
         Gk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368642; x=1779973442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5gR4iXkLc+1Doc0CtFipdBHFsWa2YpiIn7RpSK8c9C0=;
        b=HRZo8AYyrvbDL92VmnPofscFiZGas2W6BCtqIGqbExMpe7Lf1UQpMTqrxVpBNhWNxJ
         q0wxRUKF+WUhFxFaaviZZU7lFIRju6naN+4lAGH+GwsX5iAnbupeeg5hIfB6Szj5apdV
         F5JIvpBH3FPxshuHeZuojzxKEmBrd+6rC3Gxssbv46X9k4tatJpzx/qlJx9yIa923QWw
         Gsw0LY2+oHZnIZiK58zMv28mEMPS6JdHWvdnrt5AP4q16c++UOKJJfUcTDiplCsExnEV
         wMMHdZlyN1uTCGValbxQgY1QhGWZcQBudVDYsuyXf8oCEzqIMsg00e/lzTKcaM6HXz7E
         Je1A==
X-Gm-Message-State: AOJu0YzfiHZf2E5rYbCE+ihOaTzTR8pyRHDQOUzl2pW0pcylsfPVSgmY
	OcgwHtSOCQwg0Frn4Gp8d8laDx+CWey4DjTxxlpI08UkCEMsjo5Mlec6
X-Gm-Gg: Acq92OFIe4BbHZVsLXQahr3+3vgDDsGDmyZfaybgOopML+hvXlA4ewbBKBjtUuu/7yw
	Antt2enW9VSrGc9FsWVbxek4kZ78/PQQFY0k+H69kH9paT9iXkuY0aAMBHZuP5KwhS0K+UHgS+2
	DI6mh8uAm05/6yLQ6/J0adVw3j5GpsHcCjylnEPMzwuB8zVaH/mKGGTxyBpzF4hF403s/wtjwuP
	jnBZP1sSyy9NTfuY83g6S7/2kc80syui+rKOerYK2/NRH9ITZf6v0uxionM+hqU5TUtLGZiyq1Q
	zZZofubJVGyd6u6FsmVMKyEaeY+daPEzhbc8epK0g0pOmyJjpwsqiUuv4LzYJawEXcV8MKVwHK3
	Tw4e85PMeTyIMNrvBSzUx0laEYT6zwoVKigYpH9gAT8pjeqwTZqTKC+e6kWwPrs8b4BYskrYPuQ
	qPO4pAN9JoVAMXQaQ/EO3zwjeuMNJ/87hS+tHP87SSwU4P4DymckGhPBPr3oa7KywLQxZ4WeQYg
	pOL1LLRvriTuq9BnqGUtoro9s+CGRX8Vgy++urd0EuwFz1sRLzRU6l53rZvQdrqb3f1CgWDihpV
	tjn47bTWeEH2z0mDHoViKXUh54/0sLIibhp65nmHpN+C+CH+qA==
X-Received: by 2002:a17:906:eec4:b0:bd2:8386:2a39 with SMTP id a640c23a62f3a-bdc16a2fbd4mr165156166b.36.1779368641947;
        Thu, 21 May 2026 06:04:01 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a505905sm43766266b.37.2026.05.21.06.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:04:01 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v6 1/7] staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
Date: Thu, 21 May 2026 15:03:24 +0200
Message-ID: <20260521130330.754181-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521130330.754181-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IE parsing loop in update_beacon_info() advances by
(pIE->length + 2) each iteration but only guards on i < len.
When a malicious AP sends a Beacon whose last IE has only one byte
remaining in the frame (the element_id byte lands at len-1), the loop
reads pIE->length from one byte past the allocated receive buffer.

Additionally, even when the header bytes are in bounds, pIE->length
itself can extend the data window beyond len, passing a truncated IE
to the handler functions.

Add two guards at the top of the loop body:
  1. Break if fewer than sizeof(*pIE) bytes remain (can't read header).
  2. Break if the IE's declared data extends past len.

Also replace i += (pIE->length + 2) with i += sizeof(*pIE) + pIE->length
for consistency with the sizeof(*pIE) guards added above.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..e0d73c267786 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1289,7 +1289,11 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 	len = pkt_len - (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN);
 
 	for (i = 0; i < len;) {
+		if (i + sizeof(*pIE) > len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN) + i);
+		if (i + sizeof(*pIE) + pIE->length > len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
@@ -1314,7 +1318,7 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 			break;
 		}
 
-		i += (pIE->length + 2);
+		i += sizeof(*pIE) + pIE->length;
 	}
 }
 
-- 
2.54.0

