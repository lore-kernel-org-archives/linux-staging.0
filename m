Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A234A3A7
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773170586; cv=none; b=EUrNg6nDftPr0YhRxJaEVVMVXMeq/wP1wCozxqVgw5MCkaKAnJk9lVwaPkMrV1nEefubW1r0mTXVYKsexa8Tv8M0UMx5rax5lxxBiG2xAvLEKKmVrEq9EwWjgG4k9pBJYm8/D5bX9I1O7m0pgNWPTaxZmT3Fs3DTAG33JACPYzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773170586; c=relaxed/simple;
	bh=rRYH4OztSMZlyRfOLFTbiZp0E9HzCGvcy7tuvFCbJ7E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MsFJQHVKYgbNBBtN5syLzjAOj7tXFl2l/gNL8yoocGJ342DA2eyIzMONM2MTxj52rGwn2BMWw0xEsg0TmN89kn25Yf+T4/h+4rpUcSFSXUTTiODLSK5VmLPf1/Qe+wmuq4CUFukjzGzFqZrSSvYghYhT2T+j7XiUMnUIyqGFvzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPszePId; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPszePId"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab077e3f32so59822885ad.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 12:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773170585; x=1773775385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXJXdfRCRsL/C7UQ0yhS32wMKeFsZT2Y0WTyNDgLP7o=;
        b=XPszePIdFe2mhExbaY29uEyBqAs1Mx3UCUaCwDmKxBTuFmi64xhGvq0lbL2SI/vD58
         ukwCd4prwHV5YLdrToTSxdYVyVRoNJMShr1IfbO9rq/YpH21kiu3ZJ+fkORnjqsgMHvz
         HLkb7FD5Z0eZ16ZQg6tmSOGiV14oRvypwvQmKm34zsJnYWSHbumOIZxJbx7lc+DwUmMG
         4TNnluV8slnP1/P4mNMvRl0NwERuDH1Ij8qF6diMpkeyQWtFdA8xxc/V7nTY7YiTfBDm
         cyF8sh0yQFy/k+nX1PD/gymdBe1x+pl8l5GZwfACCJVMndI8BGk7fI22lwGanIC16ksc
         PKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773170585; x=1773775385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXJXdfRCRsL/C7UQ0yhS32wMKeFsZT2Y0WTyNDgLP7o=;
        b=K8OIvTY4eQEroxfZUPw44TZQmipWPOndbvMOmIsgMqXG95GAE0L0f30+0YRCSNf2Mp
         JrK+YSDV48d859viyVaBUyuNgUb+1CixBIBB9u5NSD8j1Hw3WJOwlU0oxvTp5FtB58Tf
         MaSZuxCqV/mPffIsYNhoq566WCXnoaWe7r3vBmRcJBcdBhIbmXF04vjZDT22ddqkUyv8
         3FKQ9CN9JS66FnbmYAB2mllM6FF4rjbTM5KdNaZjBUl0UhGRylMgJuyFSk8AnrUdTDlb
         T2ldJL4BCxMcU7tEZbVx8nj7dULgHrGnzhS9Qoo5mfHgtcB0AnAxABAwBeGzFDgFxCRI
         EYZA==
X-Gm-Message-State: AOJu0Yxh9P9xhWmKvtBM9lZ8tihOJp/UI4MDroD2f1w0WqvHcqwR1xX5
	uepdJdBNuBqRhRUcW6fyOAmLGXr0nMIr4aSNvB+lfrDLxmt4ssDwfgus
X-Gm-Gg: ATEYQzyzjbOao3dKc6FPIzb7IKYn2HIuO/94UXd/I15sGBX1aEE0HPG3WPGL4BhL/rp
	YUf1Az3Pv1Jd/u8gpPWSySenAVRIh8/5aiW7eBgmluCQDualUcivLBxcnoPyqgrmz0t7Ss/VSCe
	TiziLvFeUZNcW37e9H6TVrrXzgs5+ZQEPFOWxDs28tFcSIasHzXeNAAE7l7At9PR2N+kXN7ILUe
	2ouglkSuADorQL0vUuDdrNayfmID1v6GJB18Vlj5yJA3kvphcEAEN6zWrLvsxV13emHBSpHP7Cd
	BqlwPbbAtEnR1GXT8Kojans4p3tQjjRt7zjVbuiDaB8Bbpw91j6oOAV/tetjseHvsU9UXpxS3xU
	WgDjR91SWm0HzwqHEtXtTwnX/XubQlucxxauxxN/SwpzccDMOo2kJhpQ8JrzPnCChzQg3FfJJTG
	ziyokRfbB9vqc7oDL+GQfh4uLMmZi4fz9X3Wp6QCUHmSApnGX399I25eIdKVoquZ9fYzIWTFlS3
	Yg6AjwwWbHuwNsSI/Z+BR2DnxW01YkI0HJneA==
X-Received: by 2002:a17:903:1986:b0:2ae:7f9b:3148 with SMTP id d9443c01a7336-2ae82442681mr148325185ad.14.1773170584625;
        Tue, 10 Mar 2026 12:23:04 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1227-1512-804c-121f-9bdb.dynamic-ip6.hinet.net. [2001:b011:7803:1227:1512:804c:121f:9bdb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34df8csm234915ad.58.2026.03.10.12.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 12:23:04 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	starpt.official@gmail.com
Subject: [PATCH v3] staging: rtl8723bs: replace kzalloc/memcpy with kmemdup
Date: Wed, 11 Mar 2026 03:22:56 +0800
Message-Id: <20260310192256.864370-1-starpt.official@gmail.com>
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
v3:
 - Revert whitespace change to keep the patch atomic as requested by Greg.
v2:
 - Use real name in Signed-off-by line as requested by Ethan Tidmore.
 - Fix a minor whitespace issue in the error return path.

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22bf3..2125606f7775 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1430,14 +1430,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = kzalloc(ielen, GFP_KERNEL);
+	buf = kmemdup(pie, ielen, GFP_KERNEL);
 	if (!buf) {
 		ret =  -ENOMEM;
 		goto exit;
 	}
 
-	memcpy(buf, pie, ielen);
-
 	if (ielen < RSN_HEADER_LEN) {
 		ret  = -1;
 		goto exit;
-- 
2.34.1

