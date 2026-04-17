Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348D235E944
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418420; cv=none; b=JXK2iAWcNXb/8rkEZYHcgdAbzSedD7LcR3E6B1JRdJwwdn4Y0ljlCMzN4oV6aif5KHEaPoTqFODj8sC6nlnvskjzLqx7C4sZg3G8LP0MFQ6dlLYoR1YhoWsfUI57p/V2KpDjoLw1QoVo0uIgxhwApWGSMCp+fvcn0ifx5mNuJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418420; c=relaxed/simple;
	bh=2Otf4kXRw2fvNYPA2gD8YpzlgN+/Q3fixkyMGHGZlqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTdZwqfFAH1yuWL9kIT4lyNinULflk18lwwOv963TQsBVqA4M1R64SSBlz5cTCajKTAtvoaEswTd655Dh7Y7fEsFmvYT4HVMurV7SvAh+pXm9Tc6pcA/wAyfkz/0NYu4UpLD1LJeEgLoLrYUrmr8zBIZHwrNBI25iykvMPaDk88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6sZMb2a; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6sZMb2a"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35691a231a7so290681a91.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 02:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776418418; x=1777023218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMX7hr4YVNh8uAt3LdTcIDPI1RjqIWFFZ3Ztn6YuqVw=;
        b=X6sZMb2akhwqII/6q2VSh5qeUUJSOcPq9HAjrdhY+I9HnPyC1L2puAZ4LAKQLHvo4A
         H5Xc5UM9Z14OQ6PlR2JexGa3jqKDfzfxErVRoEHARliE9XEllp82q15Qj/hyghdkthLC
         oWXMgX6IJS0C+XaL3nAvxMbLhkpt5ZxWwYFrn6v/+kNMksP4t9df4oqrZS8KQiWzqe6t
         RxXA+bMXEuPlk7rdm/Y6KqXcm4LRLNaOvGWuqwUg1yHKFAWCeEBxnulYiVgrvjaCB9XP
         pMsG8KTk6jxfvHurT2NwDr/cT4i4o3OIOV5eUd+AK80dGi5YT8f1bfEz+v6KolePpBEg
         xF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418418; x=1777023218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vMX7hr4YVNh8uAt3LdTcIDPI1RjqIWFFZ3Ztn6YuqVw=;
        b=LsZZjBDe2nZQk4YDEAraMON2rUSNdvsBp/PJfU1u+0OPz/tIKSDE2y2m2+WpstqxvJ
         ZDUmPnxBG4m48S6eR7b0kQn+xXLp3F4Yl9Ihp6+z1bPXIFgEvL17rO6urwiI/8H8mH1/
         fG1WkqMeF8iFnL7HOQ/P/lL2+RMrk982CUrcZEe8sfHlV7cycw9GJiVQIRCLUpnwwk6C
         rzZdEGuXs9nJAKj8h3jVZJlMkIhM0hw2+k+1aoCrqWJPNrlu5YLF8k//gll51RIOTwNP
         qkg6h6FaQEo45rtXsFuS6kxzd71TZSMZvl9Y6e6PmmW0JKRwursOS8f2nv4dgM8kct4N
         iSFA==
X-Forwarded-Encrypted: i=1; AFNElJ9INGlj6iq8WfmHaOIqFPBgk17lTEl78CM919Un0knr4mXvbWpUAsScmZpuYavOyD5ZRbX8QYroR4bBzT9D@lists.linux.dev
X-Gm-Message-State: AOJu0YyWzx48j9OSCz1G20G7qwi35nTXJGVer69XY23BHWdThsa6NkLZ
	IKmn0ySs2SZWvudJZKY88Xbniftu510zOV97idA1eqR3r7vfCChKzzHV
X-Gm-Gg: AeBDietxdKyz0VQiFuOpYP6CwWUvfeNRknxdONXxAfbDE7sSKcUQOmYsQ6PMsge/IZ+
	NxlCJeDZADjzdmmjR4Q5QeK7IWYAVowk7qPFtOGjPmAa6XkLVJGsb8Ft41izWmryuDSj+TyrUQ7
	LzGUROhxcBlYhSB0uMJppS/JKT9NyVyBtIrpWFRqMn4FOPnVSbO7Q25T1if+QNtzt2SfV1A2bio
	TtOc5mMgzpUNMz1cbgqTYPO/cP5tRW2qVj4L1hlU0nxRpDyGi7cqJqAKbzUXvQolmJrwqAau2my
	kIbcrp6R0G6emjdhfr3+szcgiiZnL7XlCazSafZFXzRl3p9Xm54vJCI0i/q39TzvHOYvxoJJylk
	qdlzCXCUXO7i0Fz860DYYAHQ0ws1otzcZJRfD8aHEeEBe95p1WUCY/+gEHjBmqLUE72anSEL1Di
	ZPu/oA91NaW6b0gnQHZPJnzdVmL221YUFBXagro4+ugYqy3gDzbNBVKXq1920NgxWyXzRljO9dL
	1MhQMV3w/tWLjto715Cl/NqoAzil22yfXg=
X-Received: by 2002:a17:90b:518f:b0:35e:5051:fb13 with SMTP id 98e67ed59e1d1-361404a78aemr2176490a91.26.1776418418422;
        Fri, 17 Apr 2026 02:33:38 -0700 (PDT)
Received: from lucifer-Victus-by-HP-Gaming-Laptop-15-fa1xxx.iitbhu.local ([103.151.209.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140ff2e1esm1410806a91.8.2026.04.17.02.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:33:38 -0700 (PDT)
From: Sachin Kumar <sachinkumar905846@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sachin Kumar <sachinkumar905846@gmail.com>
Subject: [PATCH v3] staging: fbtft: clarify TODO comment in fbtft-core
Date: Fri, 17 Apr 2026 15:03:03 +0530
Message-ID: <20260417093303.33670-1-sachinkumar905846@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHp75VeFZ7PDV_tT8tDibQk-VPkFFHsxiAHOAx-9Xp0N1ijvAQ@mail.gmail.com>
References: <CAHp75VeFZ7PDV_tT8tDibQk-VPkFFHsxiAHOAx-9Xp0N1ijvAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve wording of a TODO comment to better describe the
intended optimization. The comment now clearly states that
only the changed display area should be updated instead of
refreshing the entire screen.

Signed-off-by: Sachin Kumar <sachinkumar905846@gmail.com>
---
v3:
- add missing changelog for previous version
- simplify TODO comment to match kernel style

 drivers/staging/fbtft/fbtft-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f427c0914..cff838955 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -414,7 +414,7 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
+	/* TODO: update only changed area, not entire display */
 	par->fbtftops.mkdirty(info, -1, 0);
 }
 
-- 
2.43.0

