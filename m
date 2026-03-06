Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF76C37C0E5
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793852; cv=none; b=m9bK546T8dr4FW576I4KEyyKba4Sz6pUCj8YxJUFkZK2FeTY9sin8DJucCqe20CxC/8/lkHPFZbpx5D8Y+icFv99kpv8gAtNQUDguOBW+Ptex+VaiuOKpgUEPrRVFSPdkgzS01+xiZ3/ZhwDcPqJ5br1iiHuX/WIR75K4LbjGvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793852; c=relaxed/simple;
	bh=G4C6n0KMnLAbNREaFm3UQE/ADReUrPqJdWAyBHHz9As=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RBhEUCziNqOK/eLkHSNP48lAXgZwnzEPsNSDPPtbQEbOdz3r631nSZvE2HAD86DZ0KFbQaTUPRbivlKjtpVVX7gTTapSHaTSkzHvKzaE7/mhxmilmcSTtd4yQ21ZakDS2beTTKgZSOFnDQn/Rv782MbhM34xLOKmKkiZc/K0R9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ykh/M3Rb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ykh/M3Rb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-482f454be5bso92944565e9.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Mar 2026 02:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772793848; x=1773398648; darn=lists.linux.dev;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9DOpbj26ZJnxNbWf0s+w7ImwLrI/solFuJ1Hpz2a8Z0=;
        b=Ykh/M3RbB7kinKih0QOiLzRKiy/YRH3AbjZwljMc2NG/zYhnVjGm7ol3ZRkloAiCFv
         TE0gKqTt42RdvMqlM2x2zThge42/WxhvxRMy3ZiGYXETXl4WjxnPVPiDMLHFAiI27HBj
         hJEwIul073AAO7RGSSPPWrN9zUuAt0MMJ9HaZut3P2ZgFhSmBCQgfEv3NYslSoifUjoK
         YybL5/T/ub2e8JuClz2NGcbnIWjKcsb6TEvCi2Jr+bZefbEoJgSr6T2TroSSOeXcbDTY
         0nwpfQUiOo93Imca2Rh1M38yC4cF1YnKK7VtD4fZOQ9qWdPvlmQUBauU40v5FPkpHb8Q
         cMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793848; x=1773398648;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DOpbj26ZJnxNbWf0s+w7ImwLrI/solFuJ1Hpz2a8Z0=;
        b=VT/67r314NY1RMXuTLSV6xj6eciQtgkIT6Cwi3A0DcoXP/YOA5WqCggKru7TyMfCiU
         AsZ75qEuSJa3zMTQQVfUOhWDw+2t6rLVgTutKxvScM2ItIIBIB+lyioiGqIhpO1pNEH9
         UgWVUBEh2SDfORUwLc9+5HLxpyutELtPHX0/rrLXrx4AFAd67+EZ2IYR34xzshgrcsoU
         UctUoOpilY1TjDqH/U3CXHkgM+b022DMQe4QlnaORz2XD0dwH9vC9mDJIF1oTcjYEqGu
         Is+3R66p14K/hwwi3lzjl40PlWZddFkoQL0hFjBQ8kae9xEfL/gbKJV6ZTyWGYGwyTQX
         LwEg==
X-Forwarded-Encrypted: i=1; AJvYcCVfujCVIi2C1eqv4sU4+he94CEeyuhJWGbtEuIb6NWIpqzn6N/K6wD/oCaIrQG/5YNKm4ZwTJuB23V+ybm3@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo3NB71xZCF8GIIVQIN0QLG9qMV+/S2Cu8recQI2GpbjP/C7wP
	CQo66SF5qO/U+rlsLbfaAL1SOAk161+eSPgKiqRZQQCanfjeKzyAvn5GDQlCDBRrC0k=
X-Gm-Gg: ATEYQzwUNaIJ80MY2ZLm47kOLeeNNM1qJJgtqfh1BIajIJIBmzFMtku/1VU70GUKsGe
	Yh/G9nPyLcyTbXnjCKuJpqZb9kZ5IU5SU7a5kJFFlWWrHlToDIQjU6zGzad/FWEBVE6uPuA44vf
	mk+CcVHclSJN2AaZAixWW7LTvH43ODDbnnfXj0Yu8YZ3ne4xhjd3rLv9MdTs4xBFhmtcF2TSdVs
	P5fgJGyKkEbH5sC7Tj2OMdX+vOI6rSYfRwT/x5hs6ztMt1jd4iRT/P2vXw3FRuL5QlAV3RS36AK
	jslhbe/PXMbJKL44VVeMv3YkAzmtNaKYMpQuNm/LjedKJfGIZIwhT8+nVyEJWq2crya3i0j8Lw6
	tao2GWIqkY+wwIYpqApbvMVBzkBjcJBrqZ12Uh8FvVgwNrZ5YJrqhjU6I6bXv8CXpWTujY4NqzM
	KlLGLM/N0aIkud7zAgjA64h6iTeIiKeV2/u2C+4KDtAHIy4khO+FldwqJmndLs
X-Received: by 2002:a05:600c:8586:b0:47e:e0b3:2437 with SMTP id 5b1f17b1804b1-4851ee73b5dmr92071435e9.5.1772793848259;
        Fri, 06 Mar 2026 02:44:08 -0800 (PST)
Received: from r1chard (1-164-74-26.dynamic-ip.hinet.net. [1.164.74.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb29fdsm3098875f8f.16.2026.03.06.02.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:44:07 -0800 (PST)
Date: Fri, 6 Mar 2026 18:43:59 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH] media: staging: ipu3: img-mmu: fix sign-to-unsigned
 conversion
Message-ID: <20260306104352.629177-1-richard.lyu@suse.com>
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
to a very large unsigned value (18446744073709551594), incorrectly
indicating that memory was unmapped and potentially breaking the
caller's logic.

Return 0 when the alignment check fails to correctly indicate that
no bytes were unmapped while resolving the following
-Wsign-conversion warning:

drivers/staging/media/ipu3/ipu3-mmu.c:393:24: warning: unsigned
conversion from 'int' to 'size_t' {aka 'long unsigned int'} changes
value from '-22' to '18446744073709551594' [-Wsign-conversion]
  393 |         return -EINVAL;

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
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

