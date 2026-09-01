Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6CE35F182
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248829; cv=none; b=dFbb+LGJdcfFQfxxt13tfAczaGWQV7VW3iJf/q9HzJrJPCteSCEhTDlfQENIMYPWJeSdumH6LgGbcyj6q32lvxOAeyI9kMRzK4Dk0qw+Hbko7RNEzwMuYhxkBfsfpwxQ/gJTtswNJWmeWBt1+CJjW+SsAz0yYJaqtwlyWgXVyLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248829; c=relaxed/simple;
	bh=A9qVgctfJKa3lOPN/djwn5FdaMAcXZJbQwr/BkRW6fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ckaV5K0j3MvpzbEU6ik45c7LUnf114ZbEhkdDIhO369Qyt1OWoiy71EkVKIWINVX04dWXSPYvTwjNwyAP4JVEtplNHYNzLuz1bONjOLZzsEdu74Uhuw+IDN/60l9hTEjdHKzJ3AUxx9a7si72MWL6ROhV1Yb1WhZYueB+8Apaso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqIY3JDy; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqIY3JDy"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66f88b68518so1089684d50.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248827; x=1788853627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypWFkePANEp5wn6tG7VIKIBXZfw/6XX/4Y0Ddb9zlHA=;
        b=dqIY3JDyFhy8LmPuHaGY27K4Oy8o4InuuTBgfY3ChHYodIE6L4GAPwTTy4BmNm9P7B
         gPkYHeE52LWNphYzqTApvkLkgEpW4uxV1AhxJtECpXKMNhhRcjVvR470X060/Wmph4qx
         /wDHRTQv+e/g6cMCBtB4PXzTEO9odEMWBShLEiNjfrg/PRftYurZAfELX2Z2FcDjjbZo
         5Z3jcdSepB3S+GTlHOAPkmUAOgvGFFgN5LHugIFw5mrmJvi7cXO5G75H9S5AN+rSdhMI
         qyBIhR8+LOV17IYEBlEp7mENZ2WpyB4lDfQ/0Gzg0AWSXxpQUr8i5wA4TrCojp88KlM7
         bUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248827; x=1788853627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypWFkePANEp5wn6tG7VIKIBXZfw/6XX/4Y0Ddb9zlHA=;
        b=UQjJhku4nH+JdP/Au9DsHHVYo3vBOEmax5XBdjxqt/wJ9qdb47ab2Mf6CyahMZEiyQ
         EVjl0DqaZ8PbZjR7aH8HlfpBHdWfloS6Wpe805YaGGiU4xQJn3FKUXOrW0xQ8LyBmDVR
         a/2Whj7vxgTAs0WAjawGzwg9YrasHXYTId1dcHZGoDz0CRYhG6CruLGl9i8uKizOuPoQ
         z6/IFLM7hKCAKSpCuLL3szsheOxAfSTqDNV6eWhPnlwMiprUqYarKZXLAsvdE6QEn7w/
         xJpddnVfMk60SkcbUdtChQMdrAxEuuKNA5eftEziv7DbIzQjJaiVmSZSVSHAuyU8iVgA
         EFgw==
X-Forwarded-Encrypted: i=1; AKwUvBykV2ypY/CuTfyZXYuqpW+LVJpdx7HSQGgfBKdIhWJMYddyk1EismEtGj7N/G5MK0ctbnC0vnm3iajPoY3n@lists.linux.dev
X-Gm-Message-State: AFuF++nDXIEZUnkUnHg4wO/azEuGzc2gR/Da/oCncIL0jzMboN5UJrRS
	lfriVLvDnFWAaF9rFAJMgizuJ53jO8OLwCwZFQj2hHLmPHi2WGKtsazM
X-Gm-Gg: AYBFou1yJuvVDFA1V0mYgZyzXtwxlPdOWgSVAC6YfRMwt/JhRVPyoSOe/S+NiZ2Cirl
	eIAvdVrvnUJRpAx38V9lYqdUqFOlc1h+sUQG06rIINEP9Sr+CX6soXPmC/jtXo8C455CBYuy+Jc
	Yh3jfajU0BQ1kJHlFim8nrN4Ttq4P+Fd1ew6hqZJGGwlqftulUzZBkNPp8r85gMnzy9teGaIYjU
	nSWf6DB8PZt6MzMnug+GuTI5Wyc5/xRz6+lp4uR33sfFvOAM7v/3sBr7B5WKEvQCBxdG7zUTEoD
	lXGBtFY45IhtAq5CRNhWfCo0MTjzOW0QlK440P7oI1WFaV7V0hBIf2xrVqiUA3YmMbpBkNEk+Bc
	03GUxP5fbUW4RtoZzmM5+Iu/jQk2ChNGfU5LNaSzRURvTKKbulbtOhyzxlHwU5eXH4IU69nSUMy
	PflvpB5wdj+Pze846qaqpLVWZK9HTQaJBZc9eOCys9034glBRSxsWlTYGHS3vU2oYs1nmS
X-Received: by 2002:a53:ebcd:0:b0:667:cbb1:5f1b with SMTP id 956f58d0204a3-66f8745bd95mr1811244d50.6.1788248826877;
        Tue, 01 Sep 2026 00:47:06 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed2c78esm7782602d50.19.2026.09.01.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:47:06 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH] media: staging: ipu3: use vcalloc() instead of vzalloc() with multiply
Date: Tue,  1 Sep 2026 13:16:57 +0530
Message-ID: <20260901074657.536299-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmu->l2pts is sized as IPU3_PT_PTES * sizeof(*mmu->l2pts) by hand.
Use vcalloc() instead, which computes the size via the overflow-checked
size_mul() so a large enough count fails the allocation cleanly
instead of silently wrapping size_t into a too-small buffer.

No functional change.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index b196a5815903..ab40502c06b8 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -464,7 +464,7 @@ struct imgu_mmu_info *imgu_mmu_init(struct device *parent, void __iomem *base)
 	 * Allocate the array of L2PT CPU pointers, initialized to zero,
 	 * which means the dummy L2PT allocated above.
 	 */
-	mmu->l2pts = vzalloc(IPU3_PT_PTES * sizeof(*mmu->l2pts));
+	mmu->l2pts = vcalloc(IPU3_PT_PTES, sizeof(*mmu->l2pts));
 	if (!mmu->l2pts)
 		goto fail_l2pt;
 
