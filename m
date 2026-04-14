Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BCC218E91
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776177168; cv=none; b=aHJLe05msLig7ABub7c2L2OUtQHFuxdSv1BmK/WUEoC2zwBgPzBG6iyfbKjjROzTuY2uyLFziaEZIXhY1Jp3Hvf2bK8xyObgLY7tDAsJ3vUWq+Ku6q9CLPslpzwQThcVVpgl4Fh4S8eROOiUZrZXL24Pp9WCY+Y/XjN5caMkOKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776177168; c=relaxed/simple;
	bh=KYHLrW0lu05pPUE838I4aUf5DagBb7MmYXYIQKvge8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bjVDKoGCdWg4EDm08elVOn/R5yebFcOXIdYuEoA/HQNrK2u2yEoxit5gTGJZElIvQ5OHZ4elq362endSKJZcHbhdrltxwZNmNiNjOr7M3h4YUzqzkDdQ9bQpqjfx1wyFYXrztHXPwDSSqTqd5BnPljCOfKn6aTDChAEX5xBl/Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b69qc8no; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b69qc8no"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad9a9be502so34335375ad.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776177167; x=1776781967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9i/5YQxmDbD2f4erQOgtdQkoM2pvxjXgAaWtm2c1+ew=;
        b=b69qc8noCE++oaxTunVSyzp6uStZIKY3bcfs1D8rEhgM0QdkW5Od3EdHKl76qiB5jC
         ABU0OZo9e+gtpFZppvuHzCQnmKOiIg6JiN2bDqlAtN4qr25b/dqXk4hwuAzS0MSEQhGx
         9yDoy9qQ8FvPiASsoagbaWYbeHNSWz0FZfhyUKjJR9Sz3rvCLeRmM+QVNEveJ1Srgq6z
         aLJt5estJtiu+JboRHwwl3HbE8DgQNR5UXUr3gtRH2nlswHUMwmDnefk7uGDJLtIbLP0
         +O3hiHDrGMMcD8rQl1m6Qvvg8RQMl7Mqx48ihnjE9hSJTPAvW8v4tD0Hub+d1dOCcT2/
         zdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776177167; x=1776781967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i/5YQxmDbD2f4erQOgtdQkoM2pvxjXgAaWtm2c1+ew=;
        b=RYte/cHvU0iWtde9twyhP8LvGewlAt45jRvCzZjWQ6BzAx+7pmWcAXDS9twN1+Gu/9
         O7/s/3WDvZiP8tCaAlPufG4tBIS6WoK8FKXOHtYfkp+voiOxrAW3K98SL/kuWTV3gxTu
         jMNS4Rau2i0LHCN0n/zg8kwTJzQo4U343iy4c9c//Ibe3zG0KVwqMTeIKr3wzJx44sTU
         yOaxva22EYjuSiutZ0hA6FWaaQ4HRXp3RBww/YL273PRjFEwR9lSVtxa2IZ3+90p5epU
         EH2KzrCjZnpCFHW4CNA+SH3QVhBNS875Lam15DzCSK8Xh0xm63khfxR30R/wFD4bqb23
         VY5Q==
X-Gm-Message-State: AOJu0YyZpxisWRswPOV3kr5omLboIE2td5Y0P4ubZd9HfzFRKMBa05Cs
	a9uHeVaXJCSfMhfNwvUUTzn7eXsKB7ppxp6amv1iUkNJ58E7jl24B564
X-Gm-Gg: AeBDies/PJtrMKDYg3+5HCVBag418lDnKLwhSJF8dYxWgCr8kQv3XfZ8h3zDPMibggt
	xf853OeX7ai28Im56XaFThawZqu1x05QuVUQsB6xL3F3P2tjPOf0k5ReVFUoB/T2TNtwx9ahhxu
	Hy0fiXSeTMComAFmcj9mMVkmYXQ1Ar0YXSBoYPFDY+TV7T4herD1NH0wis2t/h8hCWU6TSf1fxB
	KD47cJ6e1V9mNrouT+yunVHGW57vimBdg+W4/5Zv/O7gSnQL9u4ZL7on2bBCKEHX4FbQpaciYdg
	QmExXtcjwoIOT/a7BxfYvc304LHxRm2ICu/x2hptUW1ZmgpHLAzbBAYa8Qw1l5twguk21YDeRMd
	4KBC3Ib3wmzQw6YnMguijaNovAWGTwjpljOHaPVFqQtqjCI4c7jt1OTRmrajvmSp1pMp9tsURzV
	7n7muqPhtX4g/5HIdGtkM5png4oGCzM1m7i+hE5GtAtcDG08UevulVImj33BfhqD08x0ZunSMKK
	Pw2UfKPHVRk1KsqkFop9Aqj8Ey0iNFfuh1AHxdvqQ==
X-Received: by 2002:a17:903:3848:b0:2ae:8272:deb0 with SMTP id d9443c01a7336-2b2d5994a37mr182554275ad.15.1776177166473;
        Tue, 14 Apr 2026 07:32:46 -0700 (PDT)
Received: from codespaces-29a85a.mimvmn1ww3huhhjmzljqefhnig.rx.internal.cloudapp.net ([4.240.39.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b46ceca0d3sm32775355ad.28.2026.04.14.07.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:32:45 -0700 (PDT)
From: Souradipto Das <souradiptodas6@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	kees@kernel.org,
	nadzya.info@gmail.com,
	linux-kernel@vger.kernel.org,
	Souradipto Das <souradiptodas6@gmail.com>
Subject: [PATCH v2] staging: vme_user: add blank lines to struct fake_driver
Date: Tue, 14 Apr 2026 14:32:17 +0000
Message-ID: <20260414143217.47529-1-souradiptodas6@gmail.com>
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

