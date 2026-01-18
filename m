Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC221A453
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768753216; cv=none; b=E/Par7r+6RO5aw+0iUZF5OY0/ty9gHkCk7FsegKpKOKFqEAqW7bYCs8s/3YwnYh6wRoMSHrz33jaaaAFtvs1+5bym+fiH/KJF3bVlM9TIByb5Xe0jsnNipTCFpTEVaVCXJJ+QKNIWPJgpiJZv6WugqhzdBkoLe+FBKvunUhXF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768753216; c=relaxed/simple;
	bh=SmlsIxk+CMBA6wyg26yI4eRz8nzRYEppB1jx1I37hBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/XAMte6bbR2BXQJPTSJcpPBFXiSED7dwg/AFdyrVukUS9XLp3Equ5LDOocQREinpqrhoaPK3MmPjjy7Ujl6CCr8wi5wfyvLcs6a/Jbe3PlyQZQLHQz355HOGlSprASkeuU9A9uwLmaDeBfBRsO2J96RseCpJwXSBFYQ8763rkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3nbzsbc; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3nbzsbc"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so1648623b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 08:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768753213; x=1769358013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SixKWjV2dfWfCpqy2wgP4iQJtrXPYwfsR7+08aAZII=;
        b=b3nbzsbc6Nmy6isiMlRd3A8Sa+fw33P8EiYqyIBsstRjQEvJmRkHBzUGJcy/co0TI6
         iLR7NnA16dF/J3qQSRWMEkQRjIsNtkLw5Li3kJPrHbUazDMFv42LmrQGG9Uz/4WT2l5B
         gS7+LupsHE8gHdcIug5WkXHDw5Vv5LWCGgOy2GfGKWutgs6YZgZoh262Aclc73jUaS2Y
         pWBSY4cezQFJGx4xr65sM4n6WdOCRGiMWTkbYWnh2PIvrld3UI28eCne9d08XPyFsks7
         wqYgfxKEbwio3ZdtwzpMaZKMzz3uXewLaxGaRaS78SeSXu8mpe7Mn78hkQFZXFbS2xPM
         LzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768753213; x=1769358013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SixKWjV2dfWfCpqy2wgP4iQJtrXPYwfsR7+08aAZII=;
        b=mPwFdljGX7cfexducULf4Ou5TsDsOn5SRCxDQT/WCNKcbmyBnj2JKoLgnwpHkRv5YZ
         cwrei9pxRda4+MIfa/1G0nJ3ahSipeJl9rYX+OkrSC4KzITKnNMZKFlrM/F8aFQkWO3n
         Z7x7P6Q35WPHEo06n2LGrE1Sb8pnpNISJ9s45+4s/Hj1esPsoSBvwvopuRV7hI2m/Mez
         BVqa1YltPCjKsvt7DXbKaSUwTPY64OMaGuWRmZc/G3arXptVGy9Cvdbc9vct4b7XcjzB
         zyDoN0pDkxvaOJioQ86ippNpEO7zPDqwIXyPRxTxYYhCSJGu1Xrj7MeQJiGnUVNNlKOf
         auAg==
X-Gm-Message-State: AOJu0YxOI7f36TQH8UUE4tIRc/3/Unw5lJmTxdQvxCBP5UbHNoNRwUZy
	53214DMoNJHcgMhLMTbhM/K3LSl8kpsJ1HT0bHLdZ0E/pdg+kPRy4tLB
X-Gm-Gg: AY/fxX76gIc3onMcYcWnE5j03YoekHE1W3Jx10WVL9ztmPjn45z2Urnd3X/QEK3GhGT
	jtjR8niaXupRaxSaVUqCYTrMH6tA3r9EALjP8dhV+6387nwzVrXLGXaj3VTc6T3FdOh4MyK3ShR
	kFV8Y3BwdVQzC2o6VQvgsUEz1/ZjcZrE+TgGBjnSVYApaKaK71KqQaGCjxpJ3cf6Qs/vfqITdEQ
	dxCeF45xnr6toMEMoCJlkAvPFk+f1Yd0nzGxxKbHFFqrjrENgSw/Yv0AnwdTxja66dTlifUJycb
	aYWSkROSqH09p97eHytf2b0J21OeTzyQNnluRNcGX6C2tnEE3iaZgvTInSEA4UyLYA+xYKiVYym
	Hr4Q9S4yGh2RNp91P5bK2YQVp2HI457bNe8Fxag28P2EwATRM3jp4ChOXgoOChPsWCpKIRM/bQW
	t42MJk2Tpop0Fup9WLhvN/b1t78GNa9hAX6TPcXlNbzV6WfH1d8hqSL3Y=
X-Received: by 2002:a05:6a00:896:b0:81f:99cd:faf8 with SMTP id d2e1a72fcca58-81fa1780c4dmr6550340b3a.8.1768753213460;
        Sun, 18 Jan 2026 08:20:13 -0800 (PST)
Received: from localhost.localdomain ([59.14.116.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108c275sm7001461b3a.2.2026.01.18.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 08:20:13 -0800 (PST)
From: shinsj4653@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nadzya.info@gmail.com,
	shinsj4653 <shinsj4653@gmail.com>
Subject: [PATCH] staging: vme_user: fix missing blank line after declarations
Date: Sun, 18 Jan 2026 11:19:54 -0500
Message-ID: <20260118161954.80672-1-shinsj4653@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: shinsj4653 <shinsj4653@gmail.com>

This patch fixes a coding style issue reported by checkpatch.pl:
"WARNING: Missing a blank line after declarations"

A blank line is added to separate the variable declaration from
the code logic, improving readability.

Signed-off-by: shinsj4653 <shinsj4653@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 731fbba17dfd..55c00e1d162d 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -67,6 +67,7 @@ struct fake_driver {
 	unsigned long long lm_base;
 	u32 lm_aspace;
 	u32 lm_cycle;
+
 	void (*lm_callback[4])(void *);
 	void *lm_data[4];
 	struct tasklet_struct int_tasklet;
-- 
2.47.3

