Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC37133C534
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769799448; cv=none; b=HW0InS+IyGXgOxhaj+w4Ei7Um7fL+NXJtSVbmOMagjoTQfCre/L5BBjLubF8dA1qsbgkhXsJ5TApzyqU8dJxuc0LxmimsCC5RSh3z1ziS5WppyVXLXbzYETtIceEhtGFSZBz2hAi/QlP7ONwcd6KUNgUFotzr7CBP0Kpx59D5PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769799448; c=relaxed/simple;
	bh=IMTTEerSxsNk+AR1HjASeLL/1pA1lQ10kJB22/srLI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rn1ILvc3I6N8nB97XRZ2pgOR3IDJ1+E5CT/X/jufwZVK4+dMm0Khk5ilCpX5AFh0CMa9+01YFG4k+w5p+cFVhm9hk0Po+EgzWtYf+9oPKB3sEG+XTKxgf04n1OAwT+hGrIBd30J4w8bs6fxBAPsVIhoEwwssYm1uJVCeb2jzyHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDNrrmSx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDNrrmSx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb5810d39so1836788f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769799445; x=1770404245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZOSCbttUBr+RbU5I3K3d6mh8S8QLxWKITjfausbFL0=;
        b=TDNrrmSxqOEEPcKMEvKfffiBCTxYJGsLYR3YnNPetvucPGVAlJrAKTyi1//pv0Zntm
         OGR+rD8s0h9My1/x539hNLo8SlH0CKc4YMbmrn7KvBKhNptOkHb1ht5V/OEraVejmvut
         t7F5K9pX4fU16ybDSgQO0DKAQSgsv0cD3hXJBrsXB0/bRfR/iT9YCap1acHGjgqHmIFB
         wK5IQJh692MwPi9IINmZ6xU6PevTXRYcBdVOWNItFASuDmiaFfYMPr1YgSfmpjy9rUGE
         tIesumniCdr28gP/RpCzlXWmosy7/PkozarS5VolUVERJdZl1Ezgi6u/Y6tDvviEk9C8
         lreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769799445; x=1770404245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZOSCbttUBr+RbU5I3K3d6mh8S8QLxWKITjfausbFL0=;
        b=NrFg/ZAF3nHWwf/uCLk8xByu4fgl57Ekbo8buLmrKo749zkzGt9sJASFsZqKRvjEhd
         5VgB6KxdBABSJyr/kwi6rE9i7gK52EwlwvauDZ6ZFJjpH0qe7NATAIPhhUCF2/r8R7rS
         C7eGL/wDqo+hxb4Ndcv/jjhSY1V5QFVfkY1vRCmBtYq+Btf5g8V3SKwnRqQa1luDhiRS
         ZecaBhdLQM2EGfAUQZf7467a8LAi8ZtwzUS5G+g0ojaPxMkg/PsCduLJidHvNxfSWpSc
         uFE0wkv6evS2rN2eXuKvCWAocmZ0ZdhXU3IXssgyk9GZW1K/PFNN9GTIfPkNuvVAJ/dd
         8cng==
X-Forwarded-Encrypted: i=1; AJvYcCWkuu4BgvvjcqAFxwkQ+4aUXoWTUI7okqK+4IKIozSs/ETmsbyENl13nRtyf4JtChXF53j9vLeCW5PiR5aG@lists.linux.dev
X-Gm-Message-State: AOJu0YxqLkYzSngUxnqe0BzGATOrv7MQuUb+yUDNebUL4eZYw6Fk5mrL
	DTug0LL/nBmUwHCFpGNnlI/boafKf2iThD6eVumq6NEGSqN7sfb32KFq1V+rwm8=
X-Gm-Gg: AZuq6aLDLx02GWcaaaOWIujbWOXgK/9481p3leyHVgqlS2MRYRpF6uslNtwb43VghgJ
	ElwluyJpoBX2r/7p8xnKF6xZC/TFONlpWX4xIfxl/3arNl/0CVEn/Dm+4SqUsA6QLvCwr+MJ0B5
	iu1i73fFBu1R/P61sVPDETDeNT3YJDzxfwB4Jps0LQHddp7sc4amktmc9Dg0GuSlY1kL4S4Yg/t
	Z+BABLDWp2Nk3WCjbr40G1XPDLuENxyFDft/IQDcWddQwrq8R6NOPd4GFnDVPGelx8yk+buEfm/
	loGHCyG23h/dysxAsKAISeme9Ss0Ag4oD0ThCnhV7sGx8X8U1Gl93mrLuyp79Yvk89kG/IcyZP+
	8v+8aJZiKPL5Bl3QjqwVm6wQmJWy2Q4D5+7sLjeZ1Eg7ds9tBYC2Z0JGP0WNFDSvZ6t2KfRQGqJ
	fHNep4czNwdhoZF1kSunqVqun8+K5lp0NcR8mDeLWhA52sRHU8kMVE8Op+iQ74ow==
X-Received: by 2002:a5d:5885:0:b0:431:67d:53b3 with SMTP id ffacd0b85a97d-435f3aad916mr5582484f8f.43.1769799444841;
        Fri, 30 Jan 2026 10:57:24 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm26474164f8f.13.2026.01.30.10.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:57:24 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v6 0/5] staging: rtl8723bs: Fix OOB read and perform code clean ups
Date: Fri, 30 Jan 2026 19:56:53 +0100
Message-ID: <20260130185658.207785-1-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v6:
- Fixed an issue where patch subject lines were truncated in the 
previous submission due to a local formatting error. No logical code 
changes.
Changes in v5:
- Corrected commit message line wrapping to 72 characters.
- Removed blank lines between tags in the Signed-off-by block.
- Removed "Security:" prefix from subject lines.
Changes in v4:
- IMPORTANT: Fixed a build regression in rtw_mlme.c found after 
submitting v3. v3 will not compile; please use this version instead.
- Fixed build regression in rtw_mlme.c found in v3.
- Removed unused variable 'i' from previous iteration.
Changes in v3:
- Reordered the series so the bugfix is Patch 1/5.
- Patch 1: Dropped memcmp change, kept original byte comparison style 
for clarity (requested by Greg KH).
- Patch 1: Added Cc: stable tag.
- Patch 1: Updated commit message to explain the OOB read logic.
Changes in v2:
- Split u1bTmp rename and spacing fixes into two separate patches.
- Split hex modernization and the WMM bugfix into two separate patches.
- Added a Fixes: tag to the WMM bugfix.
- Removed an unused variable and dead debugging code.

Luka Gejak (5):
  staging: rtl8723bs: fix potential out-of-bounds read in 
    rtw_restruct_wmm_ie
  staging: rtl8723bs: rename u1bTmp to val
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
  staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 +++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  9 ------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 32 +++++++++----------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 32 +++++++++----------
 4 files changed, 38 insertions(+), 45 deletions(-)

-- 
2.52.0

