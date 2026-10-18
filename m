Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657B74C9001
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332974; cv=none; b=uNm4k+40lfx9cfrfL5BjfZJ7YTb2vxdTrO+RbI0lzwTFziD12Oxk2W4psfJyJzMOrZVmOhBxWPNa3sKOtcm+5XlbnQw5XYnJ+zIyQC8OpPC7eo/3haAytjWTT1BFVIAXlULSmQGxA7o5Kk4/DUjw81fZWgPcef2v+vi3wid2tXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332974; c=relaxed/simple;
	bh=+0efL/d5HgWmlvhtS1btQMAIp2DjfmYK7noKBvdE5hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2576TJYZbFSV+hpsyH7pKkfzaDjJTQTxFIu2lyYGvPV6Y227+vON4OqRr9vVLRgG4j0dRZ4hMRYXpgHMP4laxfuQ52u2JP5zhYUOd/JnyBpQ0om64fZ/c5rtT98zkruv9FB+4kCmtxO29kN1N53Goo5Zz7dh09HiEOZiAdMQT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF8DBDHl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF8DBDHl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a01933b584so9186155e9.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792332969; x=1792937769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QhsdJcCo+/WkuOVJZ+oJc7ZbMY9uosQoFaCm6vyl6e0=;
        b=gF8DBDHllnPYdd7NZ5qHzZecjz5polIEtr8hpDj0FygNTzjGIMWIWMmvarZQ1QKgVD
         VQc6BQXsn5zQkg3flyGnvVdzTY0Dvy/fUwLrpOGbc56ymRwHnAyLwYPGvOWY4nayHcjr
         QXLFtaE8uSJFglB49Zb+Wncmdj3OMuUl88nta2hhPohBWz0TMTdpLFQmdTq3S+VfmjuI
         w0Axr3liNkwhTMyLjV5dxBOKXRiEe6L9Ou7YVsozRFEcJWyekBhwt+DvH9UqHDtcgL84
         kZigtLmfd/d2n1d+ujy4QmK6xqpgZ4hcKMwR1e55H57s80f/A/QvcgVLTw7+LpplcvtO
         D8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792332969; x=1792937769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhsdJcCo+/WkuOVJZ+oJc7ZbMY9uosQoFaCm6vyl6e0=;
        b=Al/6YyepDHjXVZL8SlXHhKMlfoiMrDND8FoqS3jA5APQmvHTu+rixKvscfRyfM58jI
         sNqOvIXJAdPjj+kQFfvksNCh2tNp9GKdClXwHcx0uW6BW1K5RNNFCUbXBUzw7oaovltV
         9cuHD/Ug4SzavwSSGQqdZAYDqUfcnqNWQNJZmN+kmsxVD7n+YNp6VIu0QHusX07Jv1Hi
         iYvEqj5AMVNJk/CdhRU2dMBxk+/FRF8eortwRElxxiTU35dFhBbe6asIIQkq9iQ+MwtY
         6BRuOTGTmWfMJFyyMtSOapGkAkA9DACm4/gobCUvPgBCelJC9mFNfI35vOr+4pi1twOG
         Z5Ag==
X-Forwarded-Encrypted: i=1; AKwUvBzZI+Rp0gxHRoZ+rPRSq4KBhH1M0zEaX/GytjOd8sa3cmpGsN2VP5n5EJh9z0YYjMn9W6HKhi7pWqIer5Wa@lists.linux.dev
X-Gm-Message-State: AFq9FYIW/3m8jd32PHLwiGdA4R77MOq+nlacPQN5OGQ/dJELoOj/GPZn
	Ef8bvmPLtFoOU7M+1NGQRHIcmfsD5qee0MaBnc5azUskUlHTDH6NwZjr
X-Gm-Gg: AYBFou0qOoXcVJQ5InQT/fGbGk98dVSvT6it6ovBQuzq/EOQl86nXxLXSDHE383M+dG
	Gu2UlGNNciy8mOJsAmCt4QvsHDVojkICvdKIsYPPUQAe/hzyiJ8pnkpfBFxpiai677yYE4Lecfw
	LApQxWqLbZBZltwr8n9L73BuFHmV8q/FgHAmNCWVWuw5/7ZiOKIqkMbJzvNG4zk3ywL1zN2MNe0
	gf6/sxB9g5xEC3bxMEWSOjy/A69RkbLAvDEu+sWmLKmzytJM9REpQ9DeS1A+dsOjBol7KXe1Dcs
	d29irSi0qS38AOX3Cmi3+6Y0/w0oR6gn/4RVzJ6/FIrFVDouVdhvRSTB8ZGZ/DOdRRNxVi4R2K0
	ui3yh3kesNrMcnlr4q3pEoVYsf0wOjgQoIBR4CaHRuXXwwdn35izvhhw6B8A8cBixTfFtrrPt3F
	E1PeVk7y25zoPGTy5OJvAH72PRPPeDg0wNNHoK3optHOd/Mowk4tXSVp2gu9EDCww8AEvQARlZe
	NGf9AZz+9X8PTe7o6zloqb9iek=
X-Received: by 2002:a05:600c:858c:b0:4a1:d957:733e with SMTP id 5b1f17b1804b1-4a1d95773ccmr63893425e9.26.1792332969114;
        Sun, 18 Oct 2026 07:16:09 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([156.213.131.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ce32absm140555935e9.1.2026.10.18.07.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:16:08 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: outreachy@lists.linux.dev
Cc: Temitope obabi <obabitemitope765@gmail.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: Remove redundant zero assignments
Date: Sun, 18 Oct 2026 17:15:18 +0300
Message-ID: <20261018141519.10165-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm750_dev structure is allocated with devm_kzalloc() before
sm750fb_setup() is called, so the init_parm fields are already zero.
Remove the four assignments that set them to zero again.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..21744a5a63fb 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -833,10 +833,6 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 
 	swap = 0;
 
-	sm750_dev->init_parm.chip_clock = 0;
-	sm750_dev->init_parm.mem_clock = 0;
-	sm750_dev->init_parm.master_clock = 0;
-	sm750_dev->init_parm.power_mode = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
-- 
2.53.0

