Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF1E2571C7
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 05:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773984657; cv=none; b=jwahy8vsWgFWA7HPkRADmDCZprC/sLuC4N0UPKPO74o5LFpHJVGAwKNmuD7VHEiNlJqSoRGLC59bp7L8KEkoSy9zodOM8XKMZNyEVV8lShBxsz/+jDQnAIPUEjfrweC0tufXlPa3BBBw9j/XojOR4qfPmKcwAOeJFRO3mqu7Gy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773984657; c=relaxed/simple;
	bh=Ae22RPic1YEH5csFBH6HCV3HSnfo+KfeW0NO5YO2dJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3pQ4UR6NSP2vQ1EvCEYfH52jq05RqM88lSQQQdszhejr6Q/CqK1g+1UUIdIIEwxTy5xdz5ovIndjOAuOGVWNQAyKnmQNV5BrMRQgG7nYGql67e9dY1xBlGBMbaPtEiL2zNSh4eoHsTfc8xWvedBtVeoOEcl+62u/YjAKaYKUto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FqXM65r5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FqXM65r5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so11077135e9.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 22:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773984653; x=1774589453; darn=lists.linux.dev;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BPHK7nGCZz/oSDUy2MClP0uGtGGKcCDrTU26qey0lE0=;
        b=FqXM65r5me9iTfFxD6L3II3xMIE5s7MqdrUK1utaFRBmY47qt+2rAWPanhi6OYNztV
         vq+SvwuzGPQY/WXODKle92a8MPR5BgoyvTkC8zkZZ1lioDqKX2E1Negk2khWYWgMHaYY
         vZxPhYeFM/atDoSXTFMzMueTlj6m3CslHTzfBfHTOchafeJmJzlGsYXv9JTSkq+TQSQ7
         kuvziroRVArG1q2pLA3gE8pmLFaAicHAtWJfYAdahzlBciW49KPkWjF8V8d7DHb5ukJq
         FBQHWDKE53P9AiH10MCq+2+fOKEKBcfkgdGD5SMJMCxWn8oAEBkewOxlZdoWSujW2RlT
         Q1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773984653; x=1774589453;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPHK7nGCZz/oSDUy2MClP0uGtGGKcCDrTU26qey0lE0=;
        b=k6v/M+U+aJrrxasOOl7lOSsJVa5AnsikNN+/L3IHptWwaOcUujV2guj/aR/zp5YafX
         ndxleOVQmKMXP0dkdtWJcpPRqeSZYTIlsU+MIwAErjZRSWwF0xJ8XKUnjmxSVmpugp8I
         8PMSlm9jERL7sl42ih4ZX8I8dqRyXEHkkqtrKxNBqsBNX70CZgwcFREqK+d086/jocIQ
         MTIG8eoTahFSn3ehSC6baTgfYdNqJZ0fHUbwtivY1jRhvfqEJy4XiN18QjXkgU7N+21S
         IDdb42xTEz36qcFbLwv80yMWLXQcBEVMCh85ZOqPzV0j4twCOyXS9CG+SG3EyMdSnC/R
         qGZw==
X-Forwarded-Encrypted: i=1; AJvYcCWcf9WkPphPl4OG4Gi0NUT0sNxPceeoOXWxLUJgA1ftemHnrFqfPnUrBUlyv9L6DUmHZCnA2xAalGquYOBg@lists.linux.dev
X-Gm-Message-State: AOJu0YzNr/gyu2zalzMJPfQ3JCbesNZgLrFnwT0c7fFFu5mBbBQCMEzO
	CgONrVc5m2HulXzrKwBmImDRKIgx2k7U9CMWTX0QwlFlV3I3oZ3fx19aEHHFWteIlsU=
X-Gm-Gg: ATEYQzwlCG5A3d6fP8eaViXSSWFBO/LfKwytYXbAhmrwaMLHgKVSBbTWp2M8Ci9TcF0
	jvkfDeBkNSlawpIZGlzyW9fCPoR/FncAbnsQOcDbEW33KZOmRZVy5hR1r5ak8FQahoMegQkWBQh
	VSLZadg5Mp7SYKEGtz39Dme0jc27Umqe5wBFPtQfKUlEK4w1FDCgWbNAfrr4vAMnW5rF4GiJwfZ
	h5i75MS7rlL4OAjJLlF1U4BU/FjNqG2U/fyHsWIgWT0i9A2aGRNedhMRz1ZtPtk5foQK2NPxzvH
	lmEbEIlcelqba54abJGFCPze7kyut4TXv7FECyrgd7kw9goaBFw0ukjrIyj9n2HzadHiJSKjtMC
	9hHkTs+r+MfqHZEp8i5/iytPZY/qOA69teaX9+8eDArMGVwe+VidAZi6DMGudM8E+wuGuz5cu2i
	bfFk9zoCSnasGDzYHxPzqTv3cZgBy7osTBh0JzSu/YNiuLCPi0yA==
X-Received: by 2002:a05:600c:8b0a:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-486fee0f917mr23234565e9.16.1773984653090;
        Thu, 19 Mar 2026 22:30:53 -0700 (PDT)
Received: from r1chard (1-164-68-48.dynamic-ip.hinet.net. [1.164.68.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc612d6f3sm5118542a91.17.2026.03.19.22.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 22:30:52 -0700 (PDT)
Date: Fri, 20 Mar 2026 13:30:47 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] media: staging: ipu3: img-mmu: fix sign-to-unsigned
 conversion
Message-ID: <20260320053046.50849-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)

imgu_mmu_unmap() returns size_t (unsigned), representing the number of
bytes successfully unmapped. However, when the alignment check fails,
it currently returns -EINVAL.

On 64-bit systems, this negative error code is implicitly converted
to a very large unsigned value (18446744073709551594). The same happens
on 32-bit systems as well, although the resulting value is smaller.

Return 0 when the alignment check fails to correctly indicate that
no bytes were unmapped while resolving the following
-Wsign-conversion warning:

drivers/staging/media/ipu3/ipu3-mmu.c:393:24: warning: unsigned
conversion from 'int' to 'size_t' {aka 'long unsigned int'} changes
value from '-22' to '18446744073709551594' [-Wsign-conversion]
  393 |         return -EINVAL;

All callers ignore the return value, so this change does not affect
existing behavior.

Fixes: 26f5689592e2 ("media: staging/intel-ipu3: mmu: Implement driver")
Signed-off-by: Richard Lyu <richard.lyu@suse.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index b196a5815903..fcea125e5935 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -390,7 +390,7 @@ size_t imgu_mmu_unmap(struct imgu_mmu_info *info, unsigned long iova,
 	if (!IS_ALIGNED(iova | size, IPU3_PAGE_SIZE)) {
 		dev_err(mmu->dev, "unaligned: iova 0x%lx size 0x%zx\n",
 			iova, size);
-		return -EINVAL;
+		return 0;
 	}
 
 	dev_dbg(mmu->dev, "unmap this: iova 0x%lx size 0x%zx\n", iova, size);
-- 
2.51.0

