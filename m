Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB50346791
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364501; cv=none; b=f8fNEDlGvCPIme5IbsnnZ8TKQ+uaIwZVnHjbUR5p5YBdNj1cT50Sfh7kej08bDkRrCCOXJMJJ+0/Q7yKCO5VSiH2cOm16N1nInbgh0tUO8wHuI1zji8ua0yg29j4vUPYBOKfwOBCh7RqTpnOt4w+GbPVSajjujH+5Ngq/PxY0sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364501; c=relaxed/simple;
	bh=Ny05s/gc+yVG1LmGDAqH30JecyHKc/c0Oc5NWLJGwcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4/60yXQdsIKm2FN4r7xBbMWBy39+JyxKCqYEZsKGT9EDVJk1dVuRqWc71+HMU0HKbI9cyTTKxZYp04Lmuv4qK7k8TSsooTElb3zt1vIuV6Kv5i48ior6YEKsIGaWGAMiZgU1D8FcV8nXvPa3J1+1bvkIY4mLUD7Zh4MvzbbHMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpzlWU7j; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpzlWU7j"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4359249bbacso1777658f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364500; x=1770969300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Abtb1OgYuy0S1picWhTVTgjBvUwD0Cb9oXrZEBk5Z7U=;
        b=EpzlWU7jD21OmmxqdbTJC4MJE58RgY48u71GINncNeL9sJx/LuHyL0z8rYx/NkFKHu
         rqStNlDetXjQbezPZnDXJHgt7v2FTR8Dj4K9QrS3Gxsrwd3rL4Wh65+ImLuyKIYfMrtQ
         GrFA9zdAZOI6d6ppjyc3mpOyuR1Uq+wTSBg5u61LDx5ZBsUphALuTcaVW3s5eBU5vKnQ
         D7GJJwECxZQ29H6jxKEAmoyBbGGkky6odJ8EnkpVUSXizUnzu2Cu3q4ZIXccisu2u3/I
         JBrfeM1mpU+0oZgsjczA4EJk/8IdcgbMl4TNnbfNF+M5wEraG+vaUFiFM7SljSgtcCQ9
         Dj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364500; x=1770969300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Abtb1OgYuy0S1picWhTVTgjBvUwD0Cb9oXrZEBk5Z7U=;
        b=vxk6SuYZoS1CAee7XVJPvHchRie0VMcHYuAxfpK1ENZYsdYdf8kQUrtopvmP07s57O
         uOHK2rKmw0S91hP/bpkj0uOT0A32gNXIVMSKo7wNSjLqb2GRzYDpIgo7omtGGYJ8PfcT
         2ZYFl6RKt55O2DAyM3EPJD6td8rGDIbB7BkzPZCpwXMSRtRKwkYJqSYqhQdqtk9YYC+s
         cqPKfmXESguQ6w15isaVKlnDWRAItlICAQuXqZ4EUVRLT1bynRq3c/PjRNefpFKyMNeU
         02Bye8GzOVhs4V+io3fJOR+/1nFEgeVL2mC6ekVtsehYeNGfR4ph8KoqBO78gK92dD1Z
         toPg==
X-Forwarded-Encrypted: i=1; AJvYcCWyNeiM5N/LKX+rQ3ykOqG7LXc5Anr/oErE4T7U4vWN8TrlXJBLsaQky/KtjfoLwlb6NV5NZUOgmMIAElM1@lists.linux.dev
X-Gm-Message-State: AOJu0YxnVwyGaBj9cjnO4+WjX5l3L4MxizOJIadYLTZk/lBhVBsq14D3
	yOMHU/KhaKx4aah8Fv5xM8N/OmRRLVgVWhNjVRH8i83/F1ywnTUIXQj3hJVcglc=
X-Gm-Gg: AZuq6aIpOZKtZN6D9UoBjFIrEpQyacK+CQF7+pcjb7Ugznqv5/mght3yoTMDjS3cDUk
	xnWyJuAoYpKRhbrVfA+8PWzhpt+HduwpdpyroLc07Fwjrc/4JRjgrK/8XK+zQ3//kMvVVYpylqY
	Zc3Mz8ZDoWHTC3N+He41Ph2Lzf6C4swS/qnqXC83UmAnDZB5dystYKtembfP1lQxLBk7yaKro8G
	s6FCTk5tWwSmr4tozPb9VgLBBHdzyoW7PrY/IuXl2zdAF87/QFuXUvyP3FSBRaH4sNSHbhB0Lyi
	afM02tik+C/nQLcFSKn64Nc9XDMta+BiIuKAo2OMRup6UmncVBmMFPx20IEwhj7L3OuQIiPvL2B
	0e1IhyX3sXzEFtMZCjqNDnxzwTIQDa1rCexEGfavNMyhDzoBT9V0VO+Ah0rtYwhFUGBdjlYbLSJ
	pBsMKPwkkQJBU739qLOImRZ/Qh9IX3GXy4msHObXAx+JDcCwmBxv2L66k6EZCvp8Q=
X-Received: by 2002:a05:6000:4301:b0:436:1597:7c7c with SMTP id ffacd0b85a97d-436209a0dc0mr9908471f8f.13.1770364499853;
        Thu, 05 Feb 2026 23:54:59 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:54:59 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH v2 01/26] staging: rtl8723bs: fix potential out-of-bounds read in  rtw_restruct_wmm_ie
Date: Fri,  6 Feb 2026 08:54:14 +0100
Message-ID: <20260206075439.103287-2-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

The current code checks 'i + 5 < in_len' at the end of the if statement.
However, it accesses 'in_ie[i + 5]' before that check, which can lead
to an out-of-bounds read. Move the length check to the beginning of the
conditional to ensure the index is within bounds before accessing the
array.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 8e1e1c97f0c4..0b82b1f2f1ec 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2000,7 +2000,10 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	while (i < in_len) {
 		ielength = initial_out_len;
 
-		if (in_ie[i] == 0xDD && in_ie[i + 2] == 0x00 && in_ie[i + 3] == 0x50  && in_ie[i + 4] == 0xF2 && in_ie[i + 5] == 0x02 && i + 5 < in_len) { /* WMM element ID and OUI */
+		if (i + 5 < in_len &&
+		    in_ie[i] == 0xDD && in_ie[i + 2] == 0x00 &&
+		    in_ie[i + 3] == 0x50 && in_ie[i + 4] == 0xF2 &&
+		    in_ie[i + 5] == 0x02) {
 			for (j = i; j < i + 9; j++) {
 				out_ie[ielength] = in_ie[j];
 				ielength++;
-- 
2.52.0

