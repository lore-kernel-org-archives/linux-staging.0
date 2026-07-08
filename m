Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077A1C84BC
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783490676; cv=none; b=b2uLE/FIFizaIaiBlAoD336Bm8+/uLYzBwEZhPePcUqP8VIbkgfVgFgF3/rkbQEN+Gzyq/bflsidOkxSOO/4Dkg6coeV0u4LwjBQZh+JYNnR29e7f3hzVaOGNQrSfoBjNsn1Wnyj70yKm6ULpuYxfkxS1IMCT+7WuCqKRjd9Im8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783490676; c=relaxed/simple;
	bh=cVqHhZReA2fXAlrREfgN40nDiihFftFmc/keShq8z6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AGCXcRujGvrX2IXrLVPFyh2xWG1FiZM8ded/piFygdXI+Zx3Rdb4KRDiexLeVw+9c6AQRTU1Okv0BMN7Qw6GpzQa+muiVL0cnQbspIJQq4nz/M/DblnKgzqYxmZY23g1r+sumQMBZCkOr+2a26quqNEL9NToV5nLhLQCrpRiY7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ge1hlTJ3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ge1hlTJ3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847d1e9db22so288186b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 23:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783490673; x=1784095473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpzBKe/Z1YBswSZZupc0hFrJmi6kmBaWyF6zI7yuDcY=;
        b=ge1hlTJ3Ddlzu1kkHN3/cwksDYBsEDBdL8G3ZhKVVEnInhCGYca9WMl8ThcgkmQJla
         HP1k4LQKmJbg+xfCTsphojGT/nm6o81+oeXLQ1mssrfaAiAR/sKbxYJrwLF8VxbcSAX3
         kJeiQAum8MNNeWnWXzSHXPpPA+nAiBrqWTuVQrrH1lLdbCh3uc87YJf1orEsW3O6uLXc
         PEIuFrBjme58ysVNFBf+N056q9maXvXXvdYPtSlr1nqDcIqMEJeVQZwhDnQFZ2LXktPT
         QH/FIcX/IIPE6quCzKWzjBK/DR9gmwnvKWEZLhV/VgsLhArDhhCJ2aoWqAwVP2oDUMwf
         LVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783490673; x=1784095473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpzBKe/Z1YBswSZZupc0hFrJmi6kmBaWyF6zI7yuDcY=;
        b=N/Whhgb1wf2TyRlbQFMJRaWsRlA7kiLJL71q3x/a86id230k+uANxwrc+afPhnDUqb
         qYFkyRs7IqGk8pF/lAQYYTU7l405+rTatmd4j8y1iwE9SNZlZ38ukDvz/7li/djdzVBz
         TvdBbLz5kaLJo0EBM0OI5/5fk8HmZxuJIpW9+ZfNTzs3Dh3nSeg7aYKBVcpdlvW7OnIi
         nVmcwzfmV/8kGMyiVvPLohXmMibQCKn+Rzr5zdOJHVKo0Qyq+5LcwDAYRloGjzPUdVmb
         WMG9RFWXQzQJA5UKeg0qDM5MEwfFR3JjNOSqJ1L1tubsGiX0ulRB/vd99WqtsdRLA5+9
         Sdjg==
X-Forwarded-Encrypted: i=1; AHgh+Rqf7F78NzJQL1K1JlwKMO32ZwhmrEno7AOLuxjP3RJrTHTjqawJj3nHaX7P7uwyaWuo3+LQUHbAWg8mGl7o@lists.linux.dev
X-Gm-Message-State: AOJu0YxX1ZcUE/1qwavbl2xi/cdVabP3mSLiJQFDsx6VKsCeLzjxFwvL
	iSlUK99E9NZIH2SCQX0w40moG62xG2qCIdPPR2w6uK7n03d175QuWJKa
X-Gm-Gg: AfdE7cl/S6N07JrhawFen6LPBc4vUNVrlbAIrL3rcvwuCGlQaXv132/6OGDWpWx8IBc
	B4AuddFVfg6hl3mfKXPy1D2FGlaYPI4OG0HAwIhSHzsYNTjhl65LlFd0n4GYYg9qTQYxi1nIuBP
	OwEF6A/zZCe7T0W+mX7LQOXK+edugZGxk7cuh8pdEhRWTeLDReWiPvyu2oRfhDypPUw22XwbxyN
	83jBn0vEtYTtJXLkpHy6Ix5KROEcpXTNGJV5dKuf7tbzv9ukjADh1jfJ4C11kd7NaxZFzwk74I0
	zZKeGJ4nNaWWmIO/Iq1B+nOfnxKchh7W41wBkwSWmThA/CTk3u92bcdi0qW8i/R+Ko3MWNsexDn
	c/v4mntus/m5vtAzWKgto7A+k0VTIYXhQACvBgN3A8e7ez/Ifoxh0nH2Atv4oSezn7tlxrjzssC
	8kxSyHgQ==
X-Received: by 2002:a05:6a00:3e23:b0:847:8250:2b31 with SMTP id d2e1a72fcca58-8484342518dmr1118351b3a.38.1783490672638;
        Tue, 07 Jul 2026 23:04:32 -0700 (PDT)
Received: from adr.. ([149.88.23.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d76e0esm6421930b3a.41.2026.07.07.23.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:04:32 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH v6] staging: sm750fb: Remove unused variable 'setAllEngOff'
Date: Wed,  8 Jul 2026 03:03:07 -0300
Message-ID: <20260708060307.12237-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026070710-exact-unveiling-e321@gregkh>
References: <2026070710-exact-unveiling-e321@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The variable 'setAllEngOff' within the 'init_status' struct is only
set to zero during setup but its value is never read anywhere else
in the driver. Remove it entirely to clean up the code.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
v6:
  - Change patch approach from renaming CamelCase to entirely removing
    the unused 'setAllEngOff' variable, based on Greg KH's feedback.

v5:
  - Fix broken diff from v4 that was accidentally recreating the entire struct.
  - Update the variable usage inside drivers/staging/sm750fb/sm750.c to
    prevent compilation errors.

v4:
  - Drop register renames 'pvReg' to 'regs' as they were merged via another upstream patch.
  - Keep only the 'init_status' CamelCase cleanup.

v3:
  - Added changelog history to satisfy the bot.

v2:
  - Renamed 'pv_reg' to 'regs' to completely remove Hungarian notation, based on Greg KH's feedback.

 drivers/staging/sm750fb/sm750.c | 1 -
 drivers/staging/sm750fb/sm750.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c4..f676f1716cf89 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -848,7 +848,6 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
 	sm750_dev->init_parm.power_mode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26a..e7b8626cb876e 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -44,7 +44,6 @@ struct init_status {
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
 	ushort reset_memory;
 };
 
-- 
2.43.0

