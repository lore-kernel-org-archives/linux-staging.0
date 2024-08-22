Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B96C125AC
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 01:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724288703; cv=none; b=mN7cf6MSg81wyLtBWh+QtsmhD/4h/6M4zIhCak+leAX7TBAt4KHaDCdhBJJaxH0bx+MZxkOcMnTqBznQ95x/hNW/eQU9DFdyUd+K8zF8K7zZpO64SQ6WW4MVMBHAlJ7o7gW5l/N5QmBoiRJIeVTq/6Y3FKyvA75/BOiTLDt6j2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724288703; c=relaxed/simple;
	bh=KaQHJ1axYkzKzgkXEiOc4F41R+cWOtM/HmwckotLqLI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=e9PAu6WasSM8B3ZUxFokhc1TQm86XEC+BEjvEkjzGfbpwvY24kursE93pzDDmzCVxtgHIPp/rvFKU19aI9MR1B0CgKJvgawJU+831gnY64NqW9cM8ObJciTGt1OKYC9v+QiJj53+iFqhk4xii0a9qBUitQMTXXqzRMTjVATq6sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWcRGGmC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWcRGGmC"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2021537a8e6so2372165ad.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 18:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724288701; x=1724893501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/TZqZXS0paZX3JkgPfszEWkiQ2lwUxBfsVyeTkU7eUg=;
        b=UWcRGGmCqHAn/Gz3haH6QkJ/i/ByFI759FtjvK+oj1CPJaeHqXxlR6LH/3qNSAOLZj
         wFT7W31eK+8LiiK6cdM4FZY5I70G2doxQqvIJCADOdSVVw8o5UV+rn32cHB11+8+rOQf
         13qZsKBOTC0/N1JcINuJnjAb266coNI3xl+IV1MUjEbXpZ6+tzlx+37dDEXouFGjtFuw
         sP42XOhvvwI4mQuD4pFg3RPtriPK7bkhE2HvelXgGr7iPi25xvZF5E8xONXGBJlnshSI
         NGuBEevlti6Eq9hnVSHJ75ScfrSWPW5G3ti4k5v3+BJE9ia/E1Ic2GHwjR3a/8rpJ2bx
         hwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724288701; x=1724893501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TZqZXS0paZX3JkgPfszEWkiQ2lwUxBfsVyeTkU7eUg=;
        b=NF0YIZAxhgUEIqcTU/y+Uvb9bfRhhvOUgUhCHhuq/QA7M1ELkSK6fkQpzCdL3Qr2y8
         ZEqhtdcOJPYmfOoyJzwg0kUSYdqjniCMGYDrpjpzbhIHSJ3phHiYb1MehsrtyIU6CbqT
         uEL6rdiR8lCjKeXU9/+wFXizB+kAMWlBHno8YqHek8FjuueWgL2/vjNU0vx5N3pXhjew
         G57QMK9FtiAfDNjo8D+qtgA05q2ltvlEorTgCM2+H+RO95ZrDx486ukPHJ7YFdmn4/Ly
         OJzfpxXs/aVamheW9wLQvkdgffO+DCt9d8o7r27zrPluOoO8AFZIgNA4hBwSZzVmBEpz
         uJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO09EqrNtTjs+59TGFupIcX0LyWoToE+NCq4ptARPaJ9PvLOqmSyidJ3ANoi+jvtiAofmfDpwGJ2FDTaIi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0DtX8Rfw2jDKIRNu9wLl3BxuNLqnbzEBZA4qqUEc0BZWkT+sW
	v0BPpFLsEBMGsZBOMWTjGpfN32hNK3SrnFvxX1UQOCbGQEJwSdaz
X-Google-Smtp-Source: AGHT+IF98dKtfZStTTkleRcDBumduS4nsxLDmifdKnaeGzSY9zelxFTPLxwgsMdDx1kMJgrsE3u6yg==
X-Received: by 2002:a17:902:e5cd:b0:202:3430:654e with SMTP id d9443c01a7336-203681d1c1cmr45611375ad.42.1724288701017;
        Wed, 21 Aug 2024 18:05:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:868:d047:6251:8658:8c6b:1c3d:fb16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dbd96sm1948725ad.175.2024.08.21.18.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:05:00 -0700 (PDT)
From: Alien Wesley <alienwesley51@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix blank line
Date: Wed, 21 Aug 2024 22:04:56 -0300
Message-Id: <20240822010456.20186-1-alienwesley51@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed blank line in r8192E_dev.c in order to silence the
following checkpatch warning.

CHECK: Please don't use multiple blank lines

Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b3d4b3394284..8d2c388432c0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1859,7 +1859,6 @@ bool rtl92e_is_rx_stuck(struct net_device *dev)
 		rx_chk_cnt = 0;
 	}
 
-
 	slot_index = (priv->silent_reset_rx_slot_index++) % SilentResetRxSoltNum;
 
 	if (priv->rx_ctr == RegRxCounter) {
-- 
2.34.1

