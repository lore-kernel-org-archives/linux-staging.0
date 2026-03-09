Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C752A3B8945
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066125; cv=none; b=rIEzlhDSklonnhc8nOi0JpZCs5seoG3wEBZTPkqrNkePOKpVb9XLl0B+mpox0f82dPnDxXY2w9RRSbnDkgdaS2PF25AQNvmqJIyk1f9vKBafxbtOwcuDVIc80aJLf1oExgmrhU1a4eUYXPdIJzitADR9E+rJ5xhRnFonLgaArXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066125; c=relaxed/simple;
	bh=KyvN/e+YfTUp48V34TkUvmCc1QjUNVuOM4Q5K1uUVk0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E+iapHdLvSDLoCyuP5BtwsmU+tGC4QbVGPRO0BPEWrBhITif1jIbH5hb+3mvYhQS/KcDVbijEuN4lj8gRYZG/OYAFANrfBkrM4M5SLUcVQqPLT8FLagnYZ5SjqTL0yaC8qyBxuWECxMjCGtyyizXG5zmf0O6ZkyxWHxb2kQPAoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjNOIHA/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjNOIHA/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ae5423b02aso54058135ad.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773066123; x=1773670923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=grQ5PtJag6F1aXMzfKTQ323qJwRBv4yawTsOGYIcvbI=;
        b=FjNOIHA/mjMxGcKbwA1MyPQpD5TNy8XVTQDLJcVsC3yeGdOvJe5dQJVHxh/OeLY86u
         2o9upxNuK+FPONULDZkze9rPTne7hir4BlmeoCFflkcvo/T1PBjx1rgu7I3oB3E5eGMc
         nOvnmIvGHHV/DnXy6Acluvw4aCnEudnGz6isx4BETgdlQxU4b91BUOc6FVKi4gIty3Fk
         KgOfhUh9ZCsJXfi5GJZp2wndZ47D/aH2BuYgttusmG0Uuo/e5rWZFLo8Q45ZTgO0bAFI
         ikT7YrLfaXQ03LHM5BAAHGQcIRgPmIbP4cr6MqgT/BLVs1gfNXWt6kDIV3Uv90jDtYd8
         kNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773066123; x=1773670923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grQ5PtJag6F1aXMzfKTQ323qJwRBv4yawTsOGYIcvbI=;
        b=LZskpRIihu9G04sSn8Ybx4e9HoMTuvZ1D0by7ALVY+TC0ew+exUjIu0w79+xVyZbuh
         FtoebRV+eHM76xdmLcYIl3Y/NvoLy2HQ7oxNWSWwuopXbaU5N7Dfo3xX/1hqCFjMvp/D
         ALojNRRPTVS0xfcQQLT57C7YglNSIeipQjKeQuJWKGgMB1OmKFI+p/C8MDRMpbq3Z/mJ
         dzVbyO0wxbtEeHy+YPpRvNS8IKTERugTUGE/TXUwAo4q2NM/CdKrA0ZVf4jUmMrTzy1j
         zGLL2R/nEPTc3+NAIQyUozA6D4cm56V4vb35mpklBseNOUxjzDbZavZsqBFgxaXfhJxG
         yfCw==
X-Gm-Message-State: AOJu0YyqaTaJTUrdO/HVXXGj173xQXfC1sIn2cNtaNvi8Jd5KpRIfUak
	fpyvA2Ro6NOIFsTLDjffwXSUkSxK561vZdpy9rmnqLDbfT/Q8mCTHBLR
X-Gm-Gg: ATEYQzwXNJSmocefYHBXeSGnloItKnHKKoWJiLt4EMpqe/PwsATNbOAaOfCeYSaQQKJ
	SyW1653Vy5zBkbaOr1QPnL+Wqt2m2260Wb6MdT4u+TRSV95JHeTsfkrU7R4rkfSX1PXenKUMW4U
	pR2uZXs6gV4HLVRVmvK3dEzCxwYaOt4+GM0WjuPdm8ays3Sl+AnwhK7scRA8LaK6N/XU0blZyvu
	8zcZVy0sY5yPssyXS43v1Nixf35NQOMVxjRfnonUdy6AgO5N99aeVuCa8m6G27/Zcm+BmBO8Nez
	mBsrpJp+XUF22rJlwzYX5evOumv3EyGVU469TRJC1bM+EzSMYb8+vcpkk5Qb15hN9oFb4zx/8ym
	4aXb/BhL4UK9WHNYffQS+HNd+25X1w/37gPCJL0BVIIHS+/aGKU2+h+/E2mPjT6oXJfL91MeNAB
	eDWnuy3fryj64o84peywgQbQ6xTO29Cl7HOGkOXOP8F6Wk1bdM7QRgkVjOK1fvoO4KSYHaD28y6
	aJpRVPEaEEcs1BDg7Efajzc9stMClTGF7USIw==
X-Received: by 2002:a17:902:f78a:b0:2ae:80b3:8401 with SMTP id d9443c01a7336-2ae82367095mr101287125ad.10.1773066123021;
        Mon, 09 Mar 2026 07:22:03 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1227-a22f-1307-6d70-e044.dynamic-ip6.hinet.net. [2001:b011:7803:1227:a22f:1307:6d70:e044])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83d85a2asm154738055ad.0.2026.03.09.07.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:22:02 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	starpt.official@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: replace kzalloc/memcpy with kmemdup
Date: Mon,  9 Mar 2026 22:21:50 +0800
Message-Id: <20260309142150.547045-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded kzalloc and memcpy combination with kmemdup()
to make the code more concise and idiomatic.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
v2:
 - Use real name in Signed-off-by line as requested by Ethan Tidmore.
 - Fix a minor whitespace issue in the error return path.
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22bf3..3db6417a7de1 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1430,14 +1430,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = kzalloc(ielen, GFP_KERNEL);
+	buf = kmemdup(pie, ielen, GFP_KERNEL);
 	if (!buf) {
-		ret =  -ENOMEM;
+		ret = -ENOMEM;
 		goto exit;
 	}
 
-	memcpy(buf, pie, ielen);
-
 	if (ielen < RSN_HEADER_LEN) {
 		ret  = -1;
 		goto exit;
-- 
2.34.1

