Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BDA246774
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772889536; cv=none; b=MMp6GqwsT3HglAWoZK9cLrjGVSIjsvNHl8kLbCNl9pftjuS/GqFxlPfAHKYGjXt5XV95/Q4gntCtm6DHn7XzOMT4Npc3ItCx0YGHcDm7kF95/Dm7gcMcr8dHjDRaOOWWSkKhvi4fB1479LaVcTjUlkcLpNqVAGR/Uwpfrf5m4LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772889536; c=relaxed/simple;
	bh=hkXX8UMVs5gOmJO/acVCBm5Mzl0wMV+WSRuqxZtzrMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/qKJgtGlMwg0gUxdi7jx/TphM25zGHTcekGZsO+/7a5dtSAsh5GIthJXCuSYvaq30BlhTw97qi3OYbF9RzB7C6JhsAnw3VrZrNajRKCMUV60pwy/lG6t/+O8yWpemJ9B8TuqxMC3fpaR0n+tLOx5GMw9arltzMb72gUW/H2xF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nADNs1F4; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nADNs1F4"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso3167110e87.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 05:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772889533; x=1773494333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GENIDdbhLqqtmXufDBxHin8/Bg743Jxvmh5sOfdPZ6s=;
        b=nADNs1F43LqeaZkAC/A3TTZEkniZJvBK1ivcI9kMgWh/RatzFhAAJ4hOb0aX1Bm+xI
         7EC/W0Pw5aasCifsvOprrhK5WDMOrWGTVm3+A6W/OmiYU20nt5GDEigvcIU/E2Gsr75Z
         J9WbSKSdGidcRZ/Uuf3johCJrwkIxJ1a5yoZDjAyb3qJfzf5yQ6ls6TIoUpITE1626RU
         MXK88P3QQnnYZPJ0PQBb9CCIkRoCMpUIU9E5YfdWxktQ1GyjDuF02VnS79wJUBYkczRy
         9j7mXiLGPaF1ZsLEuHKkwgeqhDPWSUEQlWzo3bN9Qv7uMwdihdKn92J6pPy2c9a/wK3a
         kR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772889533; x=1773494333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GENIDdbhLqqtmXufDBxHin8/Bg743Jxvmh5sOfdPZ6s=;
        b=uK78seMpPGYG+KDGZcTvluGWt6EzKsa8+i7Yx9ECC0HOCDC5QM3WO2mNnBLCnFnLPa
         lcsYFORFcoGiWJLFbS/iqerbz+TqskUbmARjxNSX5H43d6ZG7Iw16LPIklzFn18HZQO0
         dztta/JOmyCuy72OZsQRi7Q8Bzl47off1hRcs1B8mprlxOdEff2n/BhHCg0LDlYhtxYL
         6b8jUwUryS7fJGhUVeJteaIDUsByHwU8z+u/13g1BpnJUlzZ9siB8rnbZrpCLTPqWnYp
         CXYN8XoymNhG824NPWjamnld9eMPW42xFvkt+dPdfPpqaqHpF4CdjqugAsGZdPqtXJ+j
         no/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKmqlajvjowhezWjlpgg39dmrWoDaaZxzJ+bjBZsmlw0GmHX+F13WtWmYP20N833jI40B1Hgc5yISWgYAS@lists.linux.dev
X-Gm-Message-State: AOJu0YzkYsnfxUZvkiAWTJroECR9mJSSNnxZsoNurpI4n2GKeco3zWqK
	rfnaWdnf8nYq8FoVkjrZIssnMar2b+HrOHfR2KO8iXaAtM3gi7VkFKaE
X-Gm-Gg: ATEYQzylN2lwtW1Qt6rfJz7JGlYN/dWmJ7+TcWd4VCFJMmRbATeC6XjbEx3nqxT0YY/
	11rGY/za5wEkAnxtUVsLbW1zF8qBK8SodtQ5SzIU5S8hVvbwQtmPn67gpK2B6WbjPQxQM6PE1Nw
	dnIXZJKF29QuikqwlPf3Qt2bPXuND8zlGwggZTYsMH5J4mTYto54J4BKJnwAPIn3WYUqB46jBxJ
	Yu+QUy+gvmtg5BkOTHmougnKyeXFW85ZEoH1An+rShdibZsrUhepUiQY8oLa7XzvhL1ntedK18j
	bDWkLWPcA8W89rkb2SBLGxBMMk8LxO1kz7IuRW9W2BOLApSmrbJ7BCFrNnZyCX33yuImKNjCPi6
	1hgSDcYfS6m17lv+37pjm9DYnghpnYe02gV4arDWF/ua1HwUbQc+LZqtzQ/ZDebCVUl2TZprArP
	3paErQ6n90JP6CnvM6kHGmX9FcVpzhTr0Cl1rMFZNopLf7aC31OWOgPk2pFK5X/lj5N3pfhRdRn
	A==
X-Received: by 2002:a05:6512:130e:b0:5a1:3ebd:d53c with SMTP id 2adb3069b0e04-5a13ebdd9bamr1557339e87.13.1772889532769;
        Sat, 07 Mar 2026 05:18:52 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d02b860sm940707e87.29.2026.03.07.05.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 05:18:51 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: sm750fb: add missing const qualifier to char pointer array
Date: Sat,  7 Mar 2026 14:18:33 +0100
Message-ID: <20260307131833.1138-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing 'const' qualifier to g_fbmode pointer array declaration
to make both the pointers and the strings they point to immutable.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index dec1f6b88a7d..08d4979c6755 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.43.0

