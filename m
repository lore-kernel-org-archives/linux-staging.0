Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF0D3559DF
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777118481; cv=none; b=eljWaL6oMkngrZYujXMgv+g7fimMPA6cOAQJrNVlMLkS/5FfuZWD4A322xdRj+TuZ+jUpxXVD4voUFfZvf0rd43dbt7Sh6XuEsIeVECcp8pdTgmpKSFY0qN2mmkb3JqsmsIoctnqatAPgwicQMJYRpYY3Ie47fuEYY+eVupHT2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777118481; c=relaxed/simple;
	bh=xrbQ9AT5slycUVkjA/pt4aW6TgfRd0JGSLbMKmlG+kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WkPTNRbJS40/yYcqBlQuhwUnDkf3kFzXq7dlnlV6sm0znMq0gscNncz0f3viaRfC9div1RmwZPqZZa/JVacWkX2VdO5Nwu4JOdbgebTYz46jBtlNpQiOgIalCJxZpALsDJKtAyZ7NZHwWrmA0DYVYtyHxbNtioirzr3j9uB3Sgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxuAOdk3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxuAOdk3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so98634365e9.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777118478; x=1777723278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=txtj6e2ZBR5nYlra7mafZ//3vTUOo4wtUtetsDDrvH0=;
        b=OxuAOdk3VIY8bmQhvvR06A97oAht9dKkNUagQxjFQ6XfATuHrtYaVVNuIdLfvLOcQs
         kdDyxHTAB6X5ma6HhuuuZ6n428lKzUg3Vqrbztqi82teyDIUlW1CsRownysvFz2m0d2F
         6N0T+DnQZm98eckLPr6NMSsMFV5JbljTnwIdLkhkb2lAG9sUCjE7ZjW3gpq4VK7se3Sh
         BImOSugW0Kf51UhcedZZngEn1WbmOwXuFa8HlKUG9slp5sdPFzch03ScugWpJp2Y4nZj
         qCAecD9VOfwa7ceF39xPUaHxq93vq/z9t7j9B5dImfSyN4xqSlEf57qj8U+VPrx4nQ+K
         UWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777118478; x=1777723278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txtj6e2ZBR5nYlra7mafZ//3vTUOo4wtUtetsDDrvH0=;
        b=qM2vXIuF6DWtmYM+EgpzVigczzQ36XLge0So2OtH7QzCFOQtSUzZCGvObtxO1pn4av
         bvYFKs6VSqUWe75DmKv6T/mLVp08oWPEBp2I7kZZoCDRvzQDjQnkVV+ufPZ65v/qXdP+
         Qrut0OjeJ8gzkonK5YUuAkPvbbmxDegwhWYedkmR4l0kmvyVIDs4c61fuwdWBr/Q6sUy
         1RjPDtc7i9BelY79u3HHsUjL4cU/pG4+WYh25lZnU0pljL9F69VMYdpX7T9Jli+0sgDz
         +zGOZO1Oky2WCVdXrVKNa/IjcUT9O/Mxk7CTxDBhaK4J1+q1sFgG5hSYMM/aamFK3ZFh
         f0Gw==
X-Forwarded-Encrypted: i=1; AFNElJ975EzGjo5WHWd0EDEqBBuSIh2RwmrCikO7PZdDXJ4W+JxsnOWDWhvTbWuT/qlSL3gBdCzUPGX5uI/kCiLE@lists.linux.dev
X-Gm-Message-State: AOJu0YztKkEotKSAiD4C61DdsRNLbfA0rjkcBr83uXcDr/RM36fdcN4Z
	D5MGkIv9+FSiPsPGwHB6UDs/jSsnm//fJ3jUu+TfPc/7eTWIEpkjWn/tCVy9al9Q
X-Gm-Gg: AeBDievQB6bLIkS4KVasergvixa6giaBMrSBXno7jkE4Ch6Rv/WstkkwpDEZguEGi3w
	cZj2MUdnhU0SmZ3w+rDcwqkMi9BjOSDPMXco9AJdW1DeToktixWpaaDXdHmRyWnQemEUVacHgL1
	mlu6HxbnZgnjMjwQQUGKL/PKm5cbTBg4/u0UllOtVgQg7Fs2s9ALsqakdphKvnqxjlwy4a4BAgk
	DBY9GgBHTJDlx3ip7JgLZOJ2u9YmccFA5HjW6uG0wMuKnU80qK8Pt+dtLpAZP9k+eDNhh9HaN5c
	hMlOxr8d4T8KQyMVpPQD4+Dm842ZeEbO2MS2Wd8THvStEWNJ/+I95/KkgBc1enN6PA7pH5WEuzm
	kI8GsCkVqPGTXFliUCs53/aI6+G1osMslsxXR/92V8lEG4bqLCyesMc6InD4hMpbFVMOsqaU2eT
	Vk1QkI4jXvlWUbjiFUDl7O++ETfQ/9Pu61KH5KcAUGVhSyw4rTlvJLykyNxjgalIE4oU2qyhShe
	Y4URFCq97GDG27K1xTGpHVQ2+Oxspx98Owuf1YeAXfJxs3eBs9O7AugJ0rdFicIBRFSdwI=
X-Received: by 2002:a05:600c:c10e:b0:488:9439:880d with SMTP id 5b1f17b1804b1-488fb792c69mr388118225e9.29.1777118477633;
        Sat, 25 Apr 2026 05:01:17 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c01cfsm683231715e9.10.2026.04.25.05.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:01:16 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: greg@kroah.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
Date: Sat, 25 Apr 2026 13:59:36 +0200
Message-ID: <20260425115936.2899314-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v2: Replace i += (pIE->length + 2) with i += sizeof(*pIE) + pIE->length
    for consistency with the sizeof(*pIE) guards (Dan Carpenter).

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
2.53.0

