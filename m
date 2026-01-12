Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C23F3033E4
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 04:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768193734; cv=none; b=nkJ72ggdT6bVwJ51T/lds5shiFZ3aeZFoq/fvfveNC959Zp9vLaw8wTKmYs4BE6HPBto7gWqSn3+ZjYC5oy+OJ7Crl2qXQP08IfjbQoXB00ycGblcLP7qFD0gG4aDBGDNrq3SFgNOorqtgd4nJtkG5PFKlY8uzdTfzdRBG8+Cok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768193734; c=relaxed/simple;
	bh=Kz0Dg5Y+G8m4RUnBwjEUPOtnqJcpSnvxwWnHs/YZdF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dq433srd3Hb8J+vNMsNU3KF5TJjfXYZPOcGoWvHW8DNXTcwxNahqg2y4FMK18vOozhNRZFL7rZna/ZGwnSxswNR5lnjMN9QmUxOVvvzL2z14SG0FcnzD0Vt4CemDaf5KApvEASDRfRXjYEXbC9B0ZMCr4wgO43XjfwlEUfOlTIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqO1rEKc; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqO1rEKc"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c47ee987401so2077438a12.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 20:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768193732; x=1768798532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXhspVXuvzyiN/9Pu/d+CMG5fyo7EvE0y7bJfucTI0U=;
        b=fqO1rEKchGz2C1/rew8/GuqNjasMwSajpw3TcI6xPkLrZvmyJzOM2Rsrfl0+QxeH3r
         xWvg1rp2sy98UZpv18nAC0FiUbK4crMSUktmfZKO0BlDG+gif9yCuLYboGgkmVJa82lS
         OU9t0cWLt1ycLhXTJtvVQfAG3xjFvvPDazfJx6HSHX/hLf7mkBj3rkVE6H6dYbco+XWc
         DwrdiWWCzQuWIYgl3XCzbqE7djDdixKWu/cC1zGn5rh0p1ZwFBfcD8fJtaU6NPbL5ZHp
         r8Bb3GgffKG9xTD5FMuD8p2cklmF9gOpjkgSSeIzBuY8DKy5Pgj8bXXt2aKPJw2oOSpw
         CYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768193732; x=1768798532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXhspVXuvzyiN/9Pu/d+CMG5fyo7EvE0y7bJfucTI0U=;
        b=p44AHnk8vJ2Wz0c06mkZMBKV4lHdFCgWxsL35+KPdaMKplEF4fE0cosrfoUMiNcoml
         w8cjAhpFXt00EAyKBz9Ls3HtMNDVmj8DsOyqXIlIdg9YZmO/bHS7sObJFn/xfObctg25
         SwwzSrLlnurK4obPu/fqtMbBhKGa6x7C3Saerbvxl1kS0VcQow0Yv1XLhOE3h6yXzYLS
         uC8UCYowosyd7bV7wpWlBg4esuYQXax5V6KhlfOwICNi6EkufItSraWcUXBRqbrPNNAQ
         3lmLu8ZHrPijWeofHkWwUBRCg/NhyocPysmI+vUdrgBUcRAN9kB5dlhQuWW4Y522HOPS
         2SzA==
X-Forwarded-Encrypted: i=1; AJvYcCXWhvB8X1/q1JYR/0LWyFsRYRv79LIaBBeMBFiKaVC2zFYPzh1aQ4Nl7OxEul6+RlacKcKurOJLBGRWvicK@lists.linux.dev
X-Gm-Message-State: AOJu0YycJF+weFogm4q7afgtHUd/fQUpnPDc5b5byj0KGyIijt04uHo+
	rldAe5GMK2M25+MjBiTiagCyo5/nhP5NGeczupQgcjLpNr1n2tG/iYEAA7IfYA==
X-Gm-Gg: AY/fxX6O4Xqw+xappzYYFqol5BgUiL8lD1qFulncYg5Kkvp1v/5KvucK2yIrb2/XFMu
	UMZThU6O1p733hVj3UclSDGb2cOvUHEPfqkIB5+7+nDSZ2BpdU8X9IROmZR3tSWtcAVjx6BB7RM
	ld042/yj47sVPNKl8zXH1Jn6DETsLtaXp5MaiP0+1FfXM896qDgc9pFRGdkdnhMg/MPpLod2Dni
	GItP1kdm2Euw4YPtBTMZ2tFqXhKndbnOfi0YoHcXpgyAX1cpCyxsRZNFgNrGXxwHG+dBPutqLOL
	FcAR8aUPw9JLB5MGi19HZ4ZZqpmK36gyFTNB6FEY1p1Zf4R9/VeB7VeFuyQLrmWrv0rtYzIBvEb
	tD9zDf/1cIia5zlp8DZ2jXu14+cc2KLoT1sXR1KiVITWgOXvGO7HVg59nb0hSpwG9/5gmCvYuqY
	+yVSE0PcAJZlJBpic/Sl2AWvsGViVWh3w=
X-Google-Smtp-Source: AGHT+IEHJICIpth7URX/IeVlPpzfWsdKf4tSYjtNpKBWrA0dfNPW2TS7f8LbM1BMK0biZgaZQFDaPg==
X-Received: by 2002:a05:6a20:e390:b0:386:f92d:978c with SMTP id adf61e73a8af0-38982a4504cmr20756815637.8.1768193732486;
        Sun, 11 Jan 2026 20:55:32 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc95d5dbfsm15979368a12.27.2026.01.11.20.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 20:55:32 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] staging: rtl8723bs: avoid non-kernel-doc comment warning
Date: Mon, 12 Jan 2026 04:55:11 +0000
Message-ID: <20260112045511.42960-1-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace a /** comment with a regular block comment to avoid
kernel-doc parsing warnings reported by the kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601101642.PaiOTqlr-lkp@intel.com/
Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index c082a0359064..95b1d4e8e0f3 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -6,7 +6,7 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-/**
+/*
  * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
  * @return: one of RTW_STATUS_CODE
  */
-- 
2.43.0

