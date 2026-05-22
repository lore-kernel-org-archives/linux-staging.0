Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5515281525
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 00:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410771; cv=none; b=j2p1FnSN7z0avCRhc/z+LIzT+yc8LzXZcm2F1KyzjcdYF+6oiO2WGuXR9slsQlEQaop5iISugdgrF5hCOQsK+nDzBHtCjJmRxEvmyW2aNo74ed/hUjYMbX5RDLKI7B2zDDRKnBmF1byiRKqY+415piNhhIbPiquNJWwKKjJHIH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410771; c=relaxed/simple;
	bh=SZ6iIQiWartgOTaRV20kjPJz0KhW6LdfmYVl452V6ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHTslXhTD4V3HGQ8rvjfRcJ9V2wgo8Bxu7kFwenAHD6BeuWrH6ZBKrtE2qLF4QWh3DF5R61OfIVdHYpVtI6HZwYaOmjHnjuG3iRO/DxU/iAPZ1FDOp+VDG244l9mFpTZaeU6uKyY9abN0fvrbNRVBLM1aDD1zkkuxSX5iLBIpio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbfB1itr; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbfB1itr"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67fd8befac7so15226111a12.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 17:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779410768; x=1780015568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gR4iXkLc+1Doc0CtFipdBHFsWa2YpiIn7RpSK8c9C0=;
        b=IbfB1itryP/jJwAkaZyfsOyg1lsXqIN8YV/YzAqIJQoQ1egTsoB+b1WjuCgktr2R2e
         nzqZ+1Z3sopsWaObim5eFkG/igXccKRH2sMW7SbCwETxZl1fKfytJDDQ0MJw6egiEPVy
         P63eMubRPslGgz0DiMqdEIDpX/Zt/BfZwdzEO5YUmEI8MIqpzhXayy9aaBNq5G+HRua7
         i3pH8nyUCojtdC0d7I8ScdDsAEIsDl4uYi4+St4X9O5VWgmx1nyHwNVYpvoH5Am9jxnQ
         QAoUM0Vu0q2YFf/7HZFgB55gZSb8w05I/+RNfv+7DxkpPpsp1mkH4vRzWTS/T/2rFS46
         lrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779410768; x=1780015568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5gR4iXkLc+1Doc0CtFipdBHFsWa2YpiIn7RpSK8c9C0=;
        b=c9JIrb9WEZeWlmfELBOmOlfbJyl02C6nFKnD1YMVyvbOOSpIUVdMHdFRjnZZ1UGD0O
         BE84H0RtNOoGTDUTnfcRUn3y7qw0Z+NhwLfhcymmDjehh6tHi24i76xjXpqtyCIyUHfB
         L4QofabRhOoXZE23ySlG0KNnwrFQ/cCGlUCs3V3IN1l/VjbnwjWUyQ48s4XDbVOg7V1P
         w5DTJ7JZGSammRLB+WMg2Aq/kH6Ok8Fx9/f0R4ZKwkXSzXuSVqFSaWGSKD5bB9Lb/pR6
         xYcKcHnQLuDKc1o2SbH3OVoa6WfR28bt9X3srWusdFGKnGjy+RgcA71N1eSdu57nZsB+
         rcCQ==
X-Gm-Message-State: AOJu0Ywcq6h7iYqvUOeVyRongkCW0ZAm93tK58piM/KTb350DIlLffIt
	g8EaI4vD1TruTOslNKDCjWWdLW2+2kcqXptgjH8suAkmY5ISbZzIzwvu
X-Gm-Gg: Acq92OGKwAHKK4g/8OVtNUtMWXyxkSXZfJLfs16ERGd9pgDt8O/UYO7rks4qwIeKSIM
	hkCThrisv7MpjIvHJr74hdQ09y+YNbzZrpnwNLB0pXkFZwlCGKpUCPNyElFF6i2AzgTIuOs1Qxf
	vn7NUAvqtizukFkJAK9btBAo53qt5YD2mYn2yt45KBs/UnlHFG14uCPFRClV47zmRtkJw/vLATC
	dnFetJcGS/pIttOuugwoyDMjHCmMhHJzZR2VSZ9e9v4yW386NwVNx/1ndMNkO1zErYyUOG4vNKa
	SKpccKCua9c60l0/Vg73LqNJiDXGhzkP0uAppkigpzxB1B8uVupNLWWYxHEYMV9Qj2sGbpDx46n
	jyiullreG1IAZEMRh/GemXMKt2qdVP7IxWyPhN8c3ua9AVRQeUaO7nXYK5D8Vj4VtGYzCktYUGu
	qUXbvk7Y0b1eyEhXU0cFdEallE3sKP9VQxxsUpu1R6PWKJQ6GOgA3vV8sQFdDqk2POniZFRWazd
	ICkCFTadZaSJMQEJqM7z8S/4AL40DsFOmhMq4DjzWINO5lcb/eDGlDaM6RPvHolR2F61q7nhim2
	6XE2NwfHx+64gDnS2ZGSaYDT0WQifUQFQTD6iYw=
X-Received: by 2002:a05:6402:5256:b0:683:be46:c20c with SMTP id 4fb4d7f45d1cf-6889c475078mr499077a12.16.1779410768134;
        Thu, 21 May 2026 17:46:08 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm3535a12.0.2026.05.21.17.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:46:06 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 1/7] staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
Date: Fri, 22 May 2026 02:45:25 +0200
Message-ID: <20260522004531.1038924-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522004531.1038924-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
 <20260522004531.1038924-1-hossu.alexandru@gmail.com>
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

