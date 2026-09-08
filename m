Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FC95A0ACA
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 18:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892481; cv=none; b=Yk3nVmgr7ul4VUC1qMOhXX7dptWZ7VWNcbNXAy7qyV4REDoyWHk2QCKjoDavLCGiKCS5jYjPqZoKmvXO34wMeVo1eFB3clKxr7BhSzANVg+/ZDj+YH3zz05flmeQ4+2uP1n1paP6dePfDg1IIylL/XmpIHKGu3mRl6ijy9nlKO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892481; c=relaxed/simple;
	bh=/VPU7Rkj6vLIJ5qAiVTp1qZlJHmo5K0QLBH58A5WbIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBnnFGttNCMc9uTfeCrSwtMRhGW8Z1Kum4KfdvwYHbEmEZZR/WCqG8XyuUTsDnMHKSFT/XTYey8vHFoWMAXFrJtZdQnb+dJt03C3IyTL2UdjvzRc/DvyeXFAUMlQYUu4ba64YuIAxmKQ7SahnhP7m9ejzt30nRwwvxkNGi1DiIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSd7q+xx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSd7q+xx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so49865235e9.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892475; x=1789497275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTTrZUFmF7kfstEYKrN0Z2rLRgXViJ8Jum7mn+JytIQ=;
        b=KSd7q+xxrwu+A/L3Jwi/QZyedcAdh4VTPUxejykoIlPikkTIWQgR30e9rlXCMXRXk+
         5U/urhMwzSPASoAT5Pq2oDdI1G0BRBI/F4mxNZp36Nnp0Eq6LjO1Yomhn+TOhz6sFrHB
         HHttc0Fr7CDeWC/4DQLKi6xTeblAjnX+/UxrETpUPOcM6MF9fb+/jyvnLFqVu1j1URJN
         eV60kVfCtNExZm2kpXw8YuRV+IOtsUzv2HWrai5F62vKkERXYi5BXjv+815qgRcYTvMG
         vuY5i3O6e+VIfQnv9sE42sFN8gXZ/JGdtI6KvdqF/hXT7n59MTUz0fMTUzfcviawdi35
         li3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892475; x=1789497275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTTrZUFmF7kfstEYKrN0Z2rLRgXViJ8Jum7mn+JytIQ=;
        b=LOJOcQTIaP1BsFspCSQNl+JEfwB7dGF5Wv0X7LNyUYmp8vb9dHIaSd4k2dQAlAdxaM
         crRUOXrFRHJYaowB5+0cMUeBsz7z8lXzOrRPmuL3xe21WCkoPDbrP2kloiIi920hY18T
         j6Fwd7keY2sGb+RI0rkKd9Dg5+NMiOhouHMsy6xHKWolEtVSGE15M8s/R8KAQBwS3jRi
         /XDwntBNWOsU22YEKao//x0UHpu+qg/2rY2aSfG1GE34B8jmkbyn3AYZU7vkNu+hQpca
         LCvUchX5o968Cgr+0cCDQQFU3UHav5x1GyM+W5wYrKGrY4pP+XL0nFOmI2VaPf+/dyrC
         2NOw==
X-Gm-Message-State: AFuF++m5jwvrz5IRGDVY4DWUImtk5++HdSR/NZCGKeMQOwVS04ESh8U9
	7CsU8R6GOxvrmMEbKHoYcNflNF8Y/VGRhaLf5Md0iSHXmnm3xpeFdIZnHqf8uFqW
X-Gm-Gg: AYBFou2JvCbMntNwRjdw13rk70o4p+wZd6uGX/K+XqFktPPZkX4OlF0OyRGDnlYjrzB
	RJ2QfxlHlIXCeLDgCNNBjeYJnLP4vDmnlnq9d0ZciHU45rf0sL2ahBKqAkXqA1CGB1Dr+ZMyAuq
	5RvU39OEWsyueVQDw0Pr+/sGJC9naaIKid65EFtqXCz+Ucpmi8KRer9TDLZm6u1x55giEnvffyD
	pOFCJWm6oZ8RpV37F2p1Cip6TemYepKjbjZhUdRha+IxvaUS8fLGSciNUqlQ953ZZKy9EAln4i5
	pD5dIZUXPgfjR1C4Kd8Pw+7NMpPSArKFLIvEmnwDwkR5nqyoCfLpcGigeOEgVOISSpaTmAq14uM
	KPJRvsR7CTJauTyG3I+V5tkXK74dQ379sSazUQrYxeOySa+yc44RMSTr5yGAz5lf3tT27tdvoiO
	iC3EX2hB46rCz2vclaVZyx6+NeU0P0AuTi3Cr83dCOSdeWwD/P0or9rWyhw75x9o/1GpA=
X-Received: by 2002:a05:600c:1549:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49cf81f47e6mr325532285e9.6.1788892474368;
        Tue, 08 Sep 2026 11:34:34 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm510511745e9.4.2026.09.08.11.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:33 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: update TODO list for completed cleanups
Date: Tue,  8 Sep 2026 21:34:27 +0300
Message-ID: <20260908183430.3256-1-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
---
 drivers/staging/rtl8723bs/TODO | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/TODO b/drivers/staging/rtl8723bs/TODO
index 34c216e6d..8de062b47 100644
--- a/drivers/staging/rtl8723bs/TODO
+++ b/drivers/staging/rtl8723bs/TODO
@@ -1,7 +1,10 @@
 TODO:
-- find and remove any code for other chips that is left over
-- convert any remaining unusual variable types
-- checkpatch.pl fixes - most of the remaining ones are lines too long. Many
-  of them will require refactoring
-- merge Realtek's bugfixes and new features into the driver
-- switch to use MAC80211
+- Partial: remove remaining code for other chips that is left over. Unused
+  non-8723B AMPDU burst enum values and unused 8188E ODM fields have been
+  removed, but more legacy code remains.
+- Partial: convert unusual variable types. The channel control APIs and rate
+  helpers now use kernel fixed-width types, but more legacy types remain.
+- Partial checkpatch.pl fixes: several overlong callback and scan-list lines
+  have been wrapped, but many warnings remain and will require refactoring.
+- Merge Realtek's bugfixes and new features into the driver.
+- Switch to use MAC80211.
-- 
2.55.0

