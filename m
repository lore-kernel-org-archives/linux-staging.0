Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4D73F0762
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 17:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188306; cv=none; b=HpsnK07KdKf3jVMmJoFBUvRzr4K0jyjMTkkDwHNzklCzlzsOpcLv0OloY847j6+zVu2/Sia8/fYDcA6sq/D9GZptClxs/e4v6M2xHyo3swKe2jGUNR0MTOOTOGyGi2IQ1UaWS7r9MaiWlHiEw0dMbiFbeggJF2zW0Glk1aPYLMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188306; c=relaxed/simple;
	bh=P5D+VYEltAi0eYj0hJuH0khFEKlFfx+BWcXs7Ik/Lys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqMvS+tT2Yjrp5iRrALCmuvnG57dN9WvbmV3ZaNNU+vRmkf0Hzwrt/WWksciKTyvCQRa00c8ouLsiuqYxtAkSakdOEV+tin/hsAF8YbtD1LwAZijVdEf7UaJI+13WOlPTXr4e1XFPFUnkfUu/uAf6bhKS/mrRe6AJ7CyaSwbTXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTgNKKZ8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTgNKKZ8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aae146b604so42113025ad.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 10:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776188305; x=1776793105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUbnkz5utUSbA+t5wXNrKlxR/blSO0lDLQ2vGHI0oqc=;
        b=kTgNKKZ8V7ZIY2oBYnMYX59iilYKxkvx+hzhYdRQb4gCEd8xWID4Zmwd7R6K1DOL0+
         EfMWmuGDRGEDcGRwHmDv5+3rRhmAgGAsEWPU2SGWEsaSoSekhkBZ51kQbhLA1wo7+O5s
         S1fXWX70CNo+d5hh3E+z6rSzpteFoeE6yufBl+GSSiXdk/+lEIAmBFSfzAIXW2sDyokk
         c5yShzASXi2+hq3KcRIITKM9lifgyYIyGm8dCyrooHMe4yQjeepAY4twlxruDynAin+8
         LMpWr4TC7sIQHidlwrMdAnIOrkyeFr1SpESkJQWhpw95mhkGfbNp/xX2vRb59iWQ5mt8
         iQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776188305; x=1776793105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUbnkz5utUSbA+t5wXNrKlxR/blSO0lDLQ2vGHI0oqc=;
        b=lQTS2u7eQwBFawu+YSekerMu7gytOeyRrcrXJEYw9s5CcLL+AjokNf7akVhiL2V3V4
         JXmo5W5iMpmh7EGtZjuot1M7pcC7Q11xebHg8R+dVouCOjvjo01OsSW7xA3K27EbaT6W
         iumyU0Idh8Yt3xF44QkoTxtvaLzWy2ryIw/jLkGwdYjq5C0KqKfOiRWB3pbYjDaiizRI
         s87UFyE9GtYM8DHmyojbmK0FbhKYwxXqPbv/U3A2VXqNZN2VOM9QJdGyYuo9atOmYy50
         BH5ZhTR6Fi9w9vQ1ePCAse9D/XvyH70HxAravww7lYdgTFRH6FnuJH4RVbKp2KOXr8dF
         iVYw==
X-Gm-Message-State: AOJu0YzZNVzYftQZ6lAjwteb43aihlctdurof65hMf5lo+4xmhZ0pCO5
	ULP4ch+agReEPHn0BbOT/ZVhhJYsMvygY484YDKjh3u/U5781ltm9ZoJuUDDfQ==
X-Gm-Gg: AeBDies6WSSeZ0CKY9La+eTcdDIBFdoB6819wEToS6L6KRZPbA+gK8dqEWoYJFxhXe9
	HXZxH6pQEKZlxr1+WhDwbYyduzFFUj7eORfZINHW44aBh2RPIdYFubl8ByxEGqpgNRTSxkvnruz
	yJCM6Rg5SyXzC3WPYKW0b3jmu72xBBbkAoCaOwjeQ+1g7RXoEFlHOv8eGP2oLXmRm9uslH1UP+p
	nMKi9P32keQFC2oGDGgyWzJ3fUq83e1qgPHuQlkpnPGoza7p4kmKkskmrwe6ns2Cvrf30s8JvbT
	T7CFnHHsUWJfEM/IpL385YeYxTR2wR7itpsl7WTCdupmee//EvbOktMES9UkApUR+BB0u/rC5fz
	Uvm/vJ+sBNEA11w19qZA0jCzehPZVTDqHdAsX5GU4DxJI2hRaJqoyXuB76/rEGRmOdt/qKTaGKN
	oDmoXHIf9luqnnv6oZtzgoq2AVh6xMtBbymP13Vl8Gd5eYm/NGXS8olZ39/SXNkZNna7kvM0U8n
	pZHsIIu+vKEOc4jksjsltlDPevOls0RG1BGqRknBg==
X-Received: by 2002:a17:903:2ac3:b0:2b2:6b58:9317 with SMTP id d9443c01a7336-2b2d5a77878mr178400895ad.39.1776188305156;
        Tue, 14 Apr 2026 10:38:25 -0700 (PDT)
Received: from codespaces-29a85a.mimvmn1ww3huhhjmzljqefhnig.rx.internal.cloudapp.net ([4.240.39.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4e15f71sm156646585ad.34.2026.04.14.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:38:24 -0700 (PDT)
From: Souradipto Das <souradiptodas6@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	souradiptodas6@gmail.com
Subject: [PATCH v3] staging: vme_user: add blank lines to struct fake_driver
Date: Tue, 14 Apr 2026 17:37:54 +0000
Message-ID: <20260414173754.22890-1-souradiptodas6@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings regarding missing blank lines after
declarations. This improves readability by grouping related
Location Monitor variables together.

Signed-off-by: Souradipto Das <souradiptodas6@gmail.com>
---

v3:
  - Added this changelog (missing in v2).
  - No changes to code itself.
v2:
  - Fixed author name/email to use real identity.
  
 drivers/staging/vme_user/vme_fake.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index be4ad47ed526..7ec14bf15fbe 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -67,8 +67,10 @@ struct fake_driver {
 	unsigned long long lm_base;
 	u32 lm_aspace;
 	u32 lm_cycle;
+
 	void (*lm_callback[4])(void *);
 	void *lm_data[4];
+
 	struct tasklet_struct int_tasklet;
 	int int_level;
 	int int_statid;
-- 
2.52.0

