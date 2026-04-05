Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F277133D6FC
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775384258; cv=none; b=VXvAsAjds9Oa4dxItLgl8kArhWmF+9eUHP0CY/6oEjgtq9VaXqDFrpwaDEMEvOrozMXAKqir/RpXFKC7P8ZAjVMH/mCTLh/BemYz6GJjntw50K4AIEWG+1i/LCqQbMP+4sYyVd0Z11NaaNinB8Xo2wd5ihRrg4H37laGvLi+Yqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775384258; c=relaxed/simple;
	bh=19jhGrr3E8Gr1+2ReOSVSp6xKLqxyJkOz7EA+S4xiyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EU5U4GHKECr0jPmzfl/MTRihPCRiOCMIlrBbYlQtcweYNORyKsHf3n1V4jw6fLezPoVfdUSwl+AvmVEY2Lm+do9GQnQ4xI2LsGSvij4nCgt+j6+yYwAuF2Hs44y4UDIj9VXvPqB7giPFGqDm/NCjfKfYyoaYEUZbXBh3YgYWIck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4UbgATO; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4UbgATO"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5673804da95so1209709e0c.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 03:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775384256; x=1775989056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ok2bd3Ozn1hrOnl15hUH+3TlXi4iI2AZWs1/gcK7Cw=;
        b=F4UbgATO81v/WFoJCCKzoAXi+Rquga9hEzWP+xdeMB4sYMjF73oS5Bcivbc9hLKX6x
         S4BGlByMyeD3PaebdgC6Kn2fAL2h0EsWblW24mmnFxVOmqfpDUN5BcBjM2H6ETr9g3IC
         r0/YsqukR3W5eHfDysVLMb9WjQPj5G5lYpi2f4ky9C7fCrYEUV7A5FAQOpY6BjtUVH7H
         OTWgdk0Tj3n8RVl3YgiGvmTDltvB9MmsDgvjOnLZlJ0olORl4bL3/Dnho+cIgMntWJdD
         Oez2DeLSQ8WEwwL5H1h4Y/qomU/KTGxz5VyB0XJKAeb7HErJssct3yZCJSVLc4ZykDV1
         h8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775384256; x=1775989056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ok2bd3Ozn1hrOnl15hUH+3TlXi4iI2AZWs1/gcK7Cw=;
        b=aZkgunoN63OkUcYH8uOjfMRO7lP0Bhbo1DfxQyd1wFu2+3/pUrM5+elyXfEoHes0hW
         YFryYuKtzqvAR/pOrncziU3SAN8fisQrTPGv63nnyUn6IxQpCRo4R9Qnq1DiKPMCzE4M
         QWj+CR4aTVEwWHrdZ+1fVVCDPkVCQvw+FEmoyt0/gh/FN+/0ATeTSa3LThEhcyZd6m8i
         x16N2rkxhmPc9CnPp1ntHmfNln/kDCptP5VRzB8zJZ9N8qllCbiRYFJt1fT+1HE2Th/x
         GSpqBwhk6aajJf4kJkBKUjZKOHDjfp8WIYBOalivE0reCXzkwrO0YSaVAuO5Ov9wf4Ap
         L/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjOpZ65acb1xhP2cPzdsdaTBO0tWFzeJfCX48OnvAcE/kx8Q34zLD8eTJjscCLtR0rHXYqj7V4zswP2GYG@lists.linux.dev
X-Gm-Message-State: AOJu0YyuJcG11J9nrP+s9uOGWeeBoyozT9j0ZMomR8sCTSk75FiNHrGn
	Q9KJlLPUhIe2wDbIHH6sx3xyHAaZJchWvlv3Uyi6f6OPBKuFK+v1eFr2
X-Gm-Gg: AeBDieu2o9J5PZYxM/rSCEyY9oFi4dceQ0qqe9d9r6+5PipsP5OgJD8t/+RbToUB3Sm
	Vwil0uVJryGuP1mGoUkccruQbd23DT90zMsb2mbvdeYJM8h9ZbcD1iusMfEyOaWawDgDUgpXRpB
	w24+CNcEoVegTdLVeDeoKkYbemfNsmJahjN1OzMPlR3u6mTq9GAn82hoWkSakvWsCHKfMiL2I7U
	TxNbabnaghPdcZd0hhhETnn6b5Dmw3P1P/jNjE79nE4SxDiueaqmhLm7FK8UhxG8C+DjqO5aztD
	fIDg6cCMEC8hW31GyCDB/dwb4uiG+KQYHig+qz7JeBZBzE1qaYjtAv+E6v2K8EsMb8ANKMA6bfn
	UEEFi0SURsNpUTyjE1swOIDRXwoPF2l52IgwNFBQeORAUCZOw64+ABjtI6GBZbPiyxXN1Ja0Mz/
	tEuaHqihlN+xg9Qz8IwQM7W+AoyYSgp68rBmOXIwiy
X-Received: by 2002:a05:6102:4486:b0:5ff:ea33:2c7 with SMTP id ada2fe7eead31-605a50f8d00mr2525553137.24.1775384255762;
        Sun, 05 Apr 2026 03:17:35 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm10473385241.7.2026.04.05.03.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 03:17:34 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Sam Daly <sam@samdaly.ie>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v3 3/5] staging: rtl8723bs: fix out-of-bounds read in portctrl()
Date: Sun,  5 Apr 2026 11:15:46 +0100
Message-ID: <20260405101548.124829-4-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405101548.124829-1-delenetchior1@gmail.com>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In portctrl(), the pointer is advanced by hdrlen + iv_len +
LLC_HEADER_LENGTH and then 2 bytes are read via memcpy() to extract
the ether_type field. There is no check that the frame is large
enough to contain these fields, so a short frame leads to an
out-of-bounds read on kernel heap memory.

This code is reachable during 802.1X authentication when the station
is in the ieee8021x_blocked state.

Add a frame length check before the pointer arithmetic and wrap the
existing ether_type extraction in the else branch so that short
frames are dropped safely.

Found by reviewing memory operations in the driver.
Not tested on hardware.

Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v3:
 - Rebased on staging-next
 - Sent as numbered series with proper Cc from get_maintainer.pl
v2:
 - Rebased on staging-next

 drivers/staging/rtl8723bs/core/rtw_recv.c | 28 +++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 11ae99e53b86a..8e38cb9791755 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -539,17 +539,25 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 
 			prtnframe = precv_frame;
 
-			/* get ether_type */
-			ptr = ptr + pfhdr->attrib.hdrlen + pfhdr->attrib.iv_len + LLC_HEADER_LENGTH;
-			memcpy(&be_tmp, ptr, 2);
-			ether_type = ntohs(be_tmp);
-
-			if (ether_type == eapol_type)
-				prtnframe = precv_frame;
-			else {
-				/* free this frame */
-				rtw_free_recvframe(precv_frame, &adapter->recvpriv.free_recv_queue);
+			/* Ensure frame has LLC header and ether_type */
+			if (pfhdr->len < pattrib->hdrlen +
+			    pattrib->iv_len + LLC_HEADER_LENGTH + 2) {
+				rtw_free_recvframe(precv_frame,
+						   &adapter->recvpriv.free_recv_queue);
 				prtnframe = NULL;
+			} else {
+				/* get ether_type */
+				ptr += pattrib->hdrlen +
+				       pattrib->iv_len +
+				       LLC_HEADER_LENGTH;
+				memcpy(&be_tmp, ptr, 2);
+				ether_type = ntohs(be_tmp);
+
+				if (ether_type != eapol_type) {
+					rtw_free_recvframe(precv_frame,
+							   &adapter->recvpriv.free_recv_queue);
+					prtnframe = NULL;
+				}
 			}
 		} else {
 			/* allowed */
-- 
2.43.0

