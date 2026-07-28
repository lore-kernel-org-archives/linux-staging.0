Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B1D42BC25
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243316; cv=none; b=kCmQUTTMK6suibMPwhyiUNe0TGljs0IsmbtplqrugbCHDw/sfNELqTB77SzPwMcBaqU07ey6MmbIfVbmCVweYz+DMsQVwyYmhYiFhNwvcUk4bJR+DS6HKQE4jiyNrNcNvGyBQBgq7P6X4PrDPnbvLfLqTnx8+zqIFnhccYc6owo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243316; c=relaxed/simple;
	bh=bCImW5FveOgLSFMnd3wYiHnrEIorbTiPRBOU3dDrN38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fs0rwjIlLpYuKgs6gkzEmE6koyuP32KWrFDtwO9t3DxR9MkRDo8+7uPDU9HOnDRYi42olzl1TZG92BjvghtnaUcU0YzpdVTC9H/JQSVRPW9SPlxG4lyPqNNgf2RlySIYHxmqX1RLegumWgN4A3OYFvrBlHyGW7w834u5Yu60Uic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cErvEPEi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cErvEPEi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495635a85d2so31416875e9.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 05:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785243312; x=1785848112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3K1t70zaHBwvr/zd5QGdCAYVOIE1pLnv+eQf2gzB8Y8=;
        b=cErvEPEiMnb31sVCFARfzB5sit0rfiQOJ8kIf28nPGXxpGdorLpicAKYt16SY64TnI
         nyBHNdUXlxbO7p5iY7amEB9HCMdzfli3L67P488sTM5dd11NeaWE2DwSXPkBRl/JZs18
         leplSjUGXvBKSHGJHT15hfZ1bXzn8FIZ4o/eGZrhXjFskWXlw9Dy5ldD86i+FxF/5jko
         wvjJ/22xHxcs/knTrXUpZWNOkVsrPNP5R1c2eYYNww9WbsyZLvfIzTHqqrwxdVSii3ZL
         g+o5fdKrctXYMAPyotiCVlwymFqxz3+zCZmPPun5VFTXl9GaDNiU0CiLNsJ/dtLPGH+3
         j8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243312; x=1785848112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3K1t70zaHBwvr/zd5QGdCAYVOIE1pLnv+eQf2gzB8Y8=;
        b=K3Fs75qXeP53Tuy+8a4kfYScmyCjFpQwY2UpsNgun/UyugXqtTqCqA0PAUO6Zorucs
         gCfO6Ze9lZvBiUwyy3LUFkdGmJ2ZHvYa/53kDLHLokfa1HTgDKRq4y/wBYVgw1k8CSjw
         DFU12JMdgPz0+lnGiY9vxVGlgZeNH/Tx9ckWVwE90RdrZLu/JBZjXElzRIGdFmAieCdZ
         pgbgQMYDRTIkutJUfL29je/zbZWtuyC95nJ3qt3wywCY0BBAY62wTfxOEJ1ngadRoQ//
         M9beR23tOi6Fo7I+8RNek8ygXZQOVa4719fjMmO6mqgAUsXjCdneKqIgqpW28SmLBKFV
         uMKA==
X-Gm-Message-State: AOJu0YzMX7gGrqvyjcccv4L8SA5S8uT2Ou3RzA9R/GslkiIL2n6W9FxY
	EYWdNS9LUvblektVTrI5pQikuqfGxKNQg6Q9dnWhIsOHAE20zRbTty1/NVQO1gHZ7Ds=
X-Gm-Gg: AR+sD13ylDPsYXzBFFazfeZpCqMr0plRG9MMoqh6YfdK0hhUPSZ/J8baaoN0oudu/av
	EN0CAzR1z5iz5MDAtleXLhPkpFG/HbSLLYcwpzA05NjuaqnnT86jg9r9DczHklNwdVwBy5e4C7O
	rJxgk/ml615/cqH8Fz53+XCJt9Gzdl7mQ7yWHRFwySBhMBu9cXTTvBVHivkwxl23h5yaK9Vzevk
	kCQ30TwapCVFz9rl+tNuQq2zCSjIzWCOdVoikbKuSeUspSQFVl+MYzbREhoRqypvphUEnw02VTZ
	N+iUFl15Ae3d5W4fnv6AZpJ0m4WAYblt2gEcNBmdrLQjfiAIw0d76EeAfk7FEu5MyhDZNAaClyq
	fzx9HDfzql3rdw8RLrcIb+ghzhE0YvnaVbQwepKykejZ7Snc9lKAdNLCXQ5AS9NEfJQOzeHbiYg
	bnmi6ThJV6cMAhXfmt4z7+wcRsauVEX/o/biGqmBAyIXR629AYcWQMGf9kwOtNSpDKTg==
X-Received: by 2002:a05:600c:4744:b0:495:40f0:e77 with SMTP id 5b1f17b1804b1-496c6415054mr25043505e9.5.1785243312169;
        Tue, 28 Jul 2026 05:55:12 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c444304esm74096505e9.0.2026.07.28.05.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:55:11 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: fix OOB read / stack overflow in rtw_get_wps_attr()
Date: Tue, 28 Jul 2026 17:54:54 +0500
Message-ID: <20260728125456.32359-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728125456.32359-1-meatuni001@gmail.com>
References: <20260728125456.32359-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_wps_attr() walks WPS attributes inside a WPS IE taken from
a wireless management frame. For each candidate attribute it only
checks that the fixed 4-byte attribute header (2-byte ID + 2-byte
length) fits inside the IE:

	if (attr_ptr + 4 > wps_ie + wps_ielen)
		break;
	u16 attr_id = get_unaligned_be16(attr_ptr);
	u16 attr_data_len = get_unaligned_be16(attr_ptr + 2);
	u16 attr_len = attr_data_len + 4;

attr_data_len (and therefore attr_len) is read directly from the
wire and is never checked against the remaining bytes in the IE
before being used as the size of:

	memcpy(buf_attr, attr_ptr, attr_len);

Since attr_len is fully attacker controlled (0 to 65535+4), this is
both a heap OOB read of wps_ie, and, more seriously, a stack buffer
overflow at several call sites where buf_attr is a single-byte
stack variable, e.g. rtw_get_wps_attr_content()'s callers passing
WPS_ATTR_SELECTED_REGISTRAR into a stack "u8 sr"/"u8
selected_registrar" (drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c,
drivers/staging/rtl8723bs/core/rtw_mlme_ext.c). A crafted WPS IE in a
beacon or probe response processed during scanning can therefore
smash the stack of the parsing thread.

rtw_get_wps_attr_content() itself has no independent length check
and simply trusts the attr_len it gets back from rtw_get_wps_attr(),
so fixing the bound here also fixes that caller.

The "attr_ptr + 4 > wps_ie + wps_ielen" header check above was added
by commit 1463ca3ec6601 ("staging: rtl8723bs: fix OOB reads in
rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr()"), which
bounded the fixed header but never extended the check to cover the
variable-length attribute data that follows it. Add that missing
check before attr_len is used as a memcpy() length or accepted as a
match.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 2fb5863dbeef..be374d222c55 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -733,6 +733,10 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 		u16 attr_data_len = get_unaligned_be16(attr_ptr + 2);
 		u16 attr_len = attr_data_len + 4;
 
+		/* Reject attributes whose claimed length runs past the IE */
+		if (attr_ptr + attr_len > wps_ie + wps_ielen)
+			break;
+
 		if (attr_id == target_attr_id) {
 			target_attr_ptr = attr_ptr;
 
-- 
2.55.0

