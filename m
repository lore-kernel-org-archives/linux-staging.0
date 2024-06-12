Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A199F1E869
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718202858; cv=none; b=R38JA6QWizhwjaoQ5FAMfpY1OYYEPRjGRgHtSTYTeqVQa2yvJkOchjfGuw/GcBiZvv9inlcETAqo4vkTvdj1cRlSsWBhdHjJbSVYnbnRZNQCf7maaXIc6HsV8EX1+Gy4zuK3qTXNzVwBX1U5IuOaM+iMrQGvCBygq169+iAEjhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718202858; c=relaxed/simple;
	bh=LFPQeU9q4FsqywsDqQ+Lwqx2MK2V0A/PxmsFBqLV0bE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uaogxuRhJTWVeD2iQbCBn85de0JVmU3uavAySHnj/eomDTpxQ2EbH/j/nZ+ffRvYPxDx2SGvlcbkucayIThdiR9twKK1dsgkFYRMQvXcWscOWM0zXZWIE8u2v+ff7mNTWG57zlnQFy4ru5fvD7PPGLIvyb0Hn0+5FGxhi2YurOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgcB2M49; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgcB2M49"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42172ed3597so6978625e9.0
        for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718202855; x=1718807655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=45hi7CYVmDt3hhlDLfSd5gueMZgniK5jw3pCKS1O/Rk=;
        b=XgcB2M497Bqi9SV1TmT4xGWkot0HcJh6D9sGT8fmddLhea1repC8HKKGIrxzmwck1/
         hChjOF31ANhUx9GHvA4EQomyJXfQdtqoxDopE8Xdsw67c4DdrifiYrMG4aRi7QFNz5Bv
         bLQoEGmMD/IOpK8Ly/+XHRVWmIWMFK9ikTjJu9pLhNzu59nzH1yTQ1OibbSbFw9cbB5a
         bQQBkMVUxhTSAypHcnbufkQMYU38daUCnfbx++D2HhTAJlKFT2ERROiVhJb9pml8M/AB
         YAMEEvN4nz2DUt5FVpmFVLYR8033Ab0Cgw3+6nmGMIcCiIrNMl4uaOEas8y0RyE+6duZ
         AVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718202855; x=1718807655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45hi7CYVmDt3hhlDLfSd5gueMZgniK5jw3pCKS1O/Rk=;
        b=j6llM8h5zPSER69aNfVd08dBGirbaWjG3DRQnBBZWPjDKBNXY/u97V31c4JyJ7Jig0
         LTet+5Z407C1XW5QEzCj89rFVJn4e9r2GVd+VA6Kk0DwDynLea8eG6YNi4p1GWsJd1E4
         gaCtTnmCOFTt40+zXapEy1q1zlNK2qPujvcdhBdkGCLviZkCS3UTnUkOaar89D1LXrrp
         7Fjcbj1YI9DkPxq4eZmBh9pvmIF8LzxwXnf9Te9hAVm1XepBtjBVumPDqHZlAKtbdeCn
         dh+jWStOtUFAFkVBCg2N9DuvF6HIIqXKjovWH37WXsaxImt9aeSysYwHD92f0NxncUOK
         jImQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFdtD9w1PSE6YYelHggrKO3cpWuSlfEwfCbwileHM3L+hhT8802j0F9SwoTu8VnaLLiZXMp0Jfo2EplPgpgH9Y4a/56HwH2vY5nLzKZQ==
X-Gm-Message-State: AOJu0Yy5aVdj6fbOyOiPHccV/YQrtmdnFhDA4jNaPL0TYW5Y5lkRg//p
	PjJbq3ul+p53ldHXZV/iPM4tiC/pXi3aaSb59W3oZccG8wSTuMPY
X-Google-Smtp-Source: AGHT+IGUbEgRbUewkZ9/hJ9J3L553IVcbn3aXC5zr5hcRQzc4weBPSkFt029esQGJZ+cg/pLyT4vJQ==
X-Received: by 2002:a05:600c:19c9:b0:421:75af:e64a with SMTP id 5b1f17b1804b1-422862aef2bmr21206525e9.6.1718202854732;
        Wed, 12 Jun 2024 07:34:14 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f304f3f80sm3581136f8f.113.2024.06.12.07.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 07:34:14 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH] staging: rtl8192e: Remove unused constant IC_VersionCut_C
Date: Wed, 12 Jun 2024 15:33:26 +0100
Message-Id: <20240612143326.6764-1-engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused constant.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index 8c85f1c866d3..2cab232bbf30 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -88,7 +88,6 @@ enum version_8190_loopback {
 	VERSION_8190_BE
 };
 
-#define IC_VersionCut_C	0x2
 #define IC_VersionCut_D	0x3
 #define IC_VersionCut_E	0x4
 
-- 
2.39.2

